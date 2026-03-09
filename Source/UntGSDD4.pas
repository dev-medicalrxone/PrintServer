unit UntGSDD4;

interface

uses
  System.Classes, Vcl.Imaging.jpeg, IdHTTP, System.SysUtils,
  Vcl.Forms, Vcl.Dialogs, XSBuiltIns, db,
  Windows, Messages, Graphics, Controls;



Type
  TGDDS4Routines = class(TObject)
    Function ShowImage(Alchemy_ID: Integer): Boolean;
    function PatientEducation(APID, NDC, LanguageStr, Option: String; CreateForm: Boolean): String;
    function Generic(Alchemy_ProductID, ProductNo: Integer): String;

  end;

Var
  GDDS4Routines: TGDDS4Routines;


Implementation

uses UntMain, WSAlchemy2, UntData;



Function TGDDS4Routines.ShowImage(Alchemy_ID: Integer): Boolean;
Var
  request: ListProductImagesRequest;
  response: ListProductImages;
  alc: AlchemyIdentifierType;
  Serv: AlchemyServiceSoap;
  Resp: String;
  Counter, I: Integer;
  F:string;
  //Fs:TFileStream;
  FS2: TMemoryStream;
  J : TJPEGImage;
begin
  //With WSAlchemy2 do
{  begin
    if Prescription.GoldStandardActive = True then
    begin
      Try
        FrmMain.idHTTP1 := TIdHTTP.Create();
        if Alchemy_ID > 0 then
        begin
          alc := AlchemyIdentifierType.Create;
          alc.Identifier := Alchemy_ID;//DM.CDSInventarioALCHEMY_PRODUCTID.Value;
          request := ListProductImagesRequest.Create;
          request.AlchemyProductId := alc.Identifier;
          With ListProductImagesRequest do
          begin
            Serv  :=  GetAlchemyServiceSoap(False,'', FrmMain.HTTPRIO1);
            Response := Serv.ListProductImages(ListProductImagesRequest(request));
          end;
          Try
            if response[0].ImageType =  ProductImageTypeEnum.drug_item then
              //Image1.Picture.LoadFromFile(Copy(DM.GSDB, 1, 26) + 'getimage?alchemyid=' + IntToStr(response[0].ImageId) + '&imagetype=drug_item')
              //WebBrowser1.Navigate(Copy(DM.GSDB, 1, 26) + 'getimage?alchemyid=' + IntToStr(response[0].ImageId) + '&imagetype=drug_item')
              F := Copy(Prescription.GoldStandardDB, 1, 26) + 'getimage?alchemyid=' + IntToStr(response[0].ImageId) + '&imagetype=drug_item'
            else
              F := Copy(Prescription.GoldStandardDB, 1, 26) + 'getimage?alchemyid=' + IntToStr(response[0].ImageId) + '&imagetype=package';
              //WebBrowser1.Navigate(Copy(DM.GSDB, 1, 26) + 'getimage?alchemyid=' + IntToStr(response[0].ImageId) + '&imagetype=package');
          Except
             F := ''; //Copy(DM.GSDB, 1, 26) + 'getimage?alchemyid=' + IntToStr(1000000) + '&imagetype=package';
            //WebBrowser1.Navigate(Copy(DM.GSDB, 1, 26) + 'getimage?alchemyid=' + IntToStr(1000000) + '&imagetype=package');
          End;
        end;
         if F > '' then
         begin
           Result := True;
           Try
             J := TJPEGImage.Create;
             FS2 := TMemoryStream.Create;
             FrmMain.idHTTP1.Get(F,Fs2);
             FS2.Position := 0;
             j.LoadFromStream(FS2);
             //if Assigned(FrmInventory) then FrmInventory.Image1.Picture.Assign(J);
             if Assigned(FrmSearchMed) then FrmSearchMed.Image1.Picture.Assign(J);
             if Assigned(FAnadirRecetas) then FAnadirRecetas.cxImage1.Picture.Assign(J);
             if Assigned(FrmWorkflow) then FrmWorkflow.Image1.Picture.Assign(J);
             FrmMain.idHTTP1.Free;
           finally
             FS2.Free;
             J.Free;
           End;
         end
         else
          Result := False;

         request.Free;
         alc.Free;
      Except
        Result := False;
      End;
    end;
  end; }
end;


function TGDDS4Routines.PatientEducation(APID, NDC, LanguageStr, Option: String; CreateForm: Boolean): String;
Var
  request: ContentLanguageType;
  response: PatientEducationType;
  IdentifierAxel: IdentifierChoiceType;//  IdentifierChoiceType;
  alc: ProductIdentifierType; //AlchemyIdentifierType;
  Serv: AlchemyServiceSoap;
  Info: String;
begin
  With DM do
  begin
    NDC := Copy(NDC,1,9);
    //if Trim(Prescription.GoldStandardDB) > '' then
    begin
      Try
        IdentifierAxel := IdentifierChoiceType.Create;
        IdentifierAxel.Product := ProductIdentifierType.Create;
        IdentifierAxel.Product.IdentifierType := ProductIdentifierTypeEnum.NDC9;
        IdentifierAxel.Product.Identifier := Trim(NDC);

        request := ContentLanguageType.Create;// request.Create;
        request.Identifier := IdentifierAxel;
        if UpperCase(LanguageStr) = 'ENGLISH' then
          request.LanguageCode := 'en-US'
        else
          request.LanguageCode := 'es-ES';

        With ContentPatientEducation do
        begin
          Serv  :=  GetAlchemyServiceSoap(False,'', FrmMain.HTTPRIO1);
          Response := Serv.ContentPatientEducation(ContentPatientEducationRequest(request));
        end;
        Result := Trim(DM.CDSInventarioDescripcion.Value) + ' / ' + Response.SheetName
            +  Trim(Response.DescriptionHeader)
            +  Trim(Response.Description) + chr(13)
            +  Trim(Response.DescriptionFooter) + ' '
            //+  Trim(Response.ContraindicationsHeader) + ' '
            //+  Trim(Response.Contraindications)  + ' '
            //+  Trim(Response.ContraindicationsFooter) + chr(13)
            +  Trim(Response.AdministrationHeader) + ' '
            +  Trim(Response.Administration) + ' '
            +  Trim(Response.AdministrationFooter) + chr(13)
            +  Trim(Response.MissedDoseHeader) + ' '
            +  Trim(Response.MissedDose) + ' '
            +  Trim(Response.MissedDoseFooter) + chr(13)
            +  Trim(Response.MonitoringHeader) + ' '
            +  Trim(Response.Monitoring) + ' '
            +  Trim(Response.MonitoringFooter) + chr(13)
            +  Trim(Response.SideEffectsHeader) + ' '
            +  Trim(Response.SideEffects) + ' '
            +  Trim(Response.SideEffectsFooter) + chr(13)
            +  Trim(Response.StorageHeader) + ' '
            +  Trim(Response.Storage) +  ' '
            +  Trim(Response.StorageFooter);
      Except
        //
      End;
    end;
  end;
end;


function TGDDS4Routines.Generic(Alchemy_ProductID, ProductNo: Integer): String;
Var
  request: ListPharmEquivalentProductsRequest;
  response: ListPharmEquivalentProducts;
  alc: ProductAlternateType;
  Serv: AlchemyServiceSoap;
  Counter, I: Integer;
  ProductID: Array_Of_int;
  sqlTxt: String;
begin
  alc := ProductAlternateType.Create;
  alc.AlchemyProductID := Alchemy_ProductID;
  request := ListPharmEquivalentProductsRequest.Create;
  request.AlchemyProductID := alc.AlchemyProductID;
  With ListPharmEquivalentProductsRequest do
  begin
    Serv  :=  GetAlchemyServiceSoap(False,'', FrmMain.HTTPRIO1);
    Response := Serv.ListPharmEquivalentProducts(ListPharmEquivalentProductsRequest(request));
    Counter := Length(response);
    SetLength(ProductID, Counter);
    Result := '';
    for I := 0 to Counter - 1 do
    begin
      if Trim(Result) = '' then Result := response[i].ProductNameShort;
    end;
  end;
end;









end.
