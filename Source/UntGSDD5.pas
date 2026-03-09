unit UntGSDD5;

interface

uses
  System.Classes, Vcl.Imaging.jpeg, IdHTTP, System.SysUtils,
  Vcl.Forms, Vcl.Dialogs, XSBuiltIns, DB,
  Windows, Messages, Graphics, Controls;



Type
  TGDDS5Routines = class(TObject)
    function PatientEducation(APID, NDC, LanguageStr, Option: String; CreateForm: Boolean): String;
    function Generic(Alchemy_ProductID, ProductNo: Integer): String;
  end;

Var
  GDDS5Routines: TGDDS5Routines;


Implementation

uses UntMain, GSDD5Server, UntData;

function TGDDS5Routines.Generic(Alchemy_ProductID, ProductNo: Integer): String;
Var
  request: ListPharmEquivalentProductsRequest;
  response: ListPharmEquivalentProducts;
  alc: ProductIdentifierType;
  Serv: GSDDServiceSoap;
  counter, I: Integer;
  ProductID: Array_Of_int;
  sqlTxt: String;
begin
  alc := ProductIdentifierType.Create;
  alc.IdentifierType := ProductIdentifierEnum.ProductID;
  alc.Identifier := IntToStr(Alchemy_ProductID);
  request := ListPharmEquivalentProductsRequest.Create;
  request.ProductIdentifier := alc;
  With ListPharmEquivalentProductsRequest do
  begin
    Serv := GetGSDDServiceSoap(False, '', FrmMain.HTTPRIO2);
    response := Serv.ListPharmEquivalentProducts
      (ListPharmEquivalentProductsRequest(request));
    counter := Length(response.Product);
    SetLength(ProductID, counter);
    sqlTxt := '';
    // sqlTxt + ' OR  (PRODUCTNO = ' +  IntToStr(DM.CDSMedOriginalPRODUCTNO.Value)+ ')';
    for I := 0 to counter - 1 do
    begin
      if response.Product[I].BrandGenericStatus = 'Brand' then
      begin
        sqlTxt := sqlTxt + ' OR (ALCHEMY_PRODUCTID = ' +
          IntToStr(response.Product[I].ProductID) + ')';
      end;
    end;
    With DM do
    begin
      sqlTxt := Trim(Copy(sqlTxt, 5, 1000));
      if Trim(sqlTxt) > '' then
      begin
        CDSMedOriginal.close;
        CDSMedOriginal.commandtext :=
          'Select * from dbo.InventarioPiso where (' + sqlTxt +
          ') and (OUTERPACKAGEUNIT = ' + chr(39) + Trim(CDSInventarioOUTERPACKAGEUNIT.Value) + chr(39) + ')' +
          ' order by BRAND, DESCRIPCION';
        CDSMedOriginal.open;
        // ShowMessage(CDSMedOriginal.CommandText);
        if Trim(CDSMedOriginalMedicamentoStr.Value) > '' then
          Result := Trim(CDSMedOriginalMedicamentoStr.Value)
        else
          Result := '';
      end
      else
        Result := '';
    end;
    // FrmMain.idHTTP1.Free;
  end;
  alc.Free;
end;

{function TGDDS5Routines.Generic(Alchemy_ProductID, ProductNo: Integer): String;
Var
  request: ListPharmEquivalentProductsRequest;
  response: ListPharmEquivalentProducts;
  alc: ProductIdentifierType;
  Serv: GSDDServiceSoap;
  Counter, I: Integer;
  ProductID: Array_Of_int;
  sqlTxt, sqlTxt2, sqlTxt3, sqlTxt4: String;
  StrLen: Integer;
begin
  sqlTxt := '';
  sqlTxt2 := '';
  sqlTxt3 := '';
  sqlTxt4 := '';
      alc := ProductIdentifierType.Create;
      alc.IdentifierType := ProductIdentifierEnum.ProductID;
      alc.Identifier := IntToStr(Alchemy_ProductID);
      request := ListPharmEquivalentProductsRequest.Create;
      request.ProductIdentifier := alc;
        With ListPharmEquivalentProductsRequest do
        begin
          Serv  :=  GetGSDDServiceSoap(False,'', FrmMain.HTTPRIO2);
          Response := Serv.ListPharmEquivalentProducts(ListPharmEquivalentProductsRequest(request));
          Counter := Length(response.Product);
          SetLength(ProductID, Counter) ;
          sqlTxt := '' ;//sqlTxt + ' OR  (PRODUCTNO = ' +  IntToStr(DM.CDSMedOriginalPRODUCTNO.Value)+ ')';
          for I := 0 to Counter - 1 do
          begin
            if Length(sqlTxt) <= 220 then
            begin
              if response.Product[I].BrandGenericStatus = 'Brand' then
                 sqlTxt := sqlTxt + ' OR (ALCHEMY_PRODUCTID = ' + IntToStr(response.Product[I].ProductID) + ')';
            end
            else
            begin
              if Length(sqlTxt2) <= 220 then
              begin
                if response.Product[I].BrandGenericStatus = 'Brand' then
                 sqlTxt2 := sqlTxt2 + ' OR (ALCHEMY_PRODUCTID = ' + IntToStr(response.Product[I].ProductID) + ')' ;
              end
              else
              begin
                if Length(sqlTxt3) <= 220 then
                begin
                  if response.Product[I].BrandGenericStatus = 'Brand' then
                   sqlTxt3 := sqlTxt3 + ' OR (ALCHEMY_PRODUCTID = ' + IntToStr(response.Product[I].ProductID) + ')' ;
                end
                else
                begin
                  if Length(sqlTxt4) <= 220 then
                  begin
                    if response.Product[I].BrandGenericStatus = 'Brand' then
                     sqlTxt4 := sqlTxt4 + ' OR (ALCHEMY_PRODUCTID = ' + IntToStr(response.Product[I].ProductID) + ')' ;
                  end
                end;
              end;
            end;
          end;
          With DM do
          begin
            sqlTxt := Trim(copy(sqlTxt, 5, 1000));
            sqlTxt2 := Trim(sqlTxt2);
            sqlTxt3 := Trim(sqlTxt3);
            sqlTxt4 := Trim(sqlTxt4);
            if Trim(sqlTxt) > '' then
            begin
              CDSMedOriginal.Close;
              CDSMedOriginal.CommandText := 'Select * from InventarioPiso where ' + sqlTxt + ' ' + sqlTxt2 + ' ' + sqlTxt3 + ' ' + sqlTxt4 + ' order by BRAND, DESCRIPCION';
              CDSMedOriginal.Open;
              //ShowMessage(CDSMedOriginal.CommandText);
              if Trim(CDSMedOriginalMedicamentoStr.Value) > '' then
                Result := Trim(CDSMedOriginalMedicamentoStr.Value)
              else
                Result := '';
            end
            else
              Result := '';
          end;
         // FrmMain.idHTTP1.Free;
  end;
end; }
{
function TGDDS5Routines.Generic(Alchemy_ProductID, ProductNo: Integer): String;
Var
  request: ListPharmEquivalentProductsRequest;
  response: ListPharmEquivalentProducts;
  alc: ProductIdentifierType;
  Serv: GSDDServiceSoap;
  Counter, I: Integer;
  ProductID: Array_Of_int;
  sqlTxt: String;
begin
  alc := ProductIdentifierType.Create;
  alc.IdentifierType := ProductIdentifierEnum.ProductID;
  alc.Identifier := IntToStr(Alchemy_ProductID);
  request := ListPharmEquivalentProductsRequest.Create;
  request.ProductIdentifier := alc;
  With ListPharmEquivalentProductsRequest do
  begin
    Serv  :=  GetGSDDServiceSoap(False,'', FrmMain.HTTPRIO2);
    Response := Serv.ListPharmEquivalentProducts(ListPharmEquivalentProductsRequest(request));
    Counter := Length(response.Product);
    SetLength(ProductID, Counter) ;
    Result := '';
    for I := 0 to Counter - 1 do
    begin
      if Trim(Result) = '' then Result := response.Product[I].ProductNameShort;
    end;
  end;
end;
 }



function TGDDS5Routines.PatientEducation(APID, NDC, LanguageStr, Option: String; CreateForm: Boolean): String;
Var
  request: DrugIdentifierLanguageType; ///CONTENT ContentPatientEducationRequest;// ContentLanguageType;
  response: ContentPatientEducation; //PatientEducationType;
  alc: ContentPatientEducationRequest;// IdentifierChoiceType;
  Serv: GSDDServiceSoap;
  Info: String;

begin
  With DM do
  begin
    Try
       alc := ContentPatientEducationRequest.Create;
       alc.SheetIdentifier := DrugIdentifierLanguageType.Create;
       alc.SheetIdentifier.DrugIdentifier := PackageProductConceptGpcType.Create;
       alc.SheetIdentifier.DrugIdentifier.Package_ := PackageIdentifierType.Create;
       alc.SheetIdentifier.DrugIdentifier.Package_.Identifier := NDC;
       alc.SheetIdentifier.DrugIdentifier.Package_.IdentifierType := PackageIdentifierEnum.NDC11;
       if UpperCase(LanguageStr) = 'ENGLISH' then
         alc.SheetIdentifier.LanguageCode := 'en-US'
       else
         alc.SheetIdentifier.LanguageCode := 'es-ES';

        With ContentPatientEducation do
        begin
          Serv  :=  GetGSDDServiceSoap(False,'', FrmMain.HTTPRIO2);
          Response := Serv.ContentPatientEducation(ContentPatientEducationRequest(alc));
        end;
        if Trim(Response.PatientEducationSheet.Description) > '' then
        begin
          FrmMain.Short_PatEducation := Response.PatientEducationSheet.SheetName + ' ' +
                    Trim(Response.PatientEducationSheet.DescriptionHeader) +
                    Trim(Response.PatientEducationSheet.Description) + chr(13) +
                    Trim(Response.PatientEducationSheet.SideEffectsHeader) + ' ' +
                    Trim(Response.PatientEducationSheet.SideEffects) + chr(13) +
                    Trim(response.PatientEducationSheet.ContraindicationsHeader) +
                    Trim(response.PatientEducationSheet.Contraindications);

          FrmMain.Long_PatEducation := Trim(DM.CDSInventarioDescripcion.Value) + ' / ' + Response.PatientEducationSheet.SheetName
              +  Trim(Response.PatientEducationSheet.DescriptionHeader)
              +  Trim(Response.PatientEducationSheet.Description) + chr(13)
              +  Trim(Response.PatientEducationSheet.DescriptionFooter) + ' '
              +  Trim(Response.PatientEducationSheet.AdministrationHeader) + ' '
              +  Trim(Response.PatientEducationSheet.Administration) + ' '
              +  Trim(Response.PatientEducationSheet.AdministrationFooter) + chr(13)
              +  Trim(Response.PatientEducationSheet.MissedDoseHeader) + ' '
              +  Trim(Response.PatientEducationSheet.MissedDose) + ' '
              +  Trim(Response.PatientEducationSheet.MissedDoseFooter) + chr(13)
              +  Trim(Response.PatientEducationSheet.MonitoringHeader) + ' '
              +  Trim(Response.PatientEducationSheet.Monitoring) + ' '
              +  Trim(Response.PatientEducationSheet.MonitoringFooter) + chr(13)
              +  Trim(Response.PatientEducationSheet.SideEffectsHeader) + ' '
              +  Trim(Response.PatientEducationSheet.SideEffects) + ' '
              +  Trim(Response.PatientEducationSheet.SideEffectsFooter) + chr(13)
              +  Trim(Response.PatientEducationSheet.StorageHeader) + ' '
              +  Trim(Response.PatientEducationSheet.Storage) +  ' '
              +  Trim(Response.PatientEducationSheet.StorageFooter);
          if FrmMain.ShortPatEducation = true then
            Result := FrmMain.Short_PatEducation
          else
            Result := FrmMain.Long_PatEducation;
        end
        else
        begin
          FrmMain.Long_PatEducation := '';
          FrmMain.Short_PatEducation := '';
        end;
    Except
      begin
        FrmMain.Short_PatEducation := '';
        FrmMain.Long_PatEducation := '';
      end;
    End;
  end;
end;


end.

