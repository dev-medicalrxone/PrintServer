unit UntLASCL_13TL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, frxBarcode;

type
  TFrmLabels = class(TForm)
    Inventario: TfrxDBDataset;
    PrescriptionFull: TfrxDBDataset;
    Setup: TfrxDBDataset;
    LASCL_13TL: TfrxReport;
    frxBarCodeObject1: TfrxBarCodeObject;
    R3X4_TERMAL_A: TfrxReport;
    procedure LASCL_13TLBeforePrint(Sender: TfrxReportComponent);
    procedure R3X4_TERMAL_ABeforePrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLabels: TFrmLabels;

implementation

{$R *.dfm}

uses UntMain, UntData;

procedure TFrmLabels.LASCL_13TLBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
  BarCode : TfrxBarCodeView;
  I: Integer;
begin
    if FrmMain.PrintHeaderZebra = False then
    begin
      Memo1 := LASCL_13TL.FindObject('Heading1A') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASCL_13TL.FindObject('Heading1B') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASCL_13TL.FindObject('Heading1C') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASCL_13TL.FindObject('Heading2A') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASCL_13TL.FindObject('Heading2B') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASCL_13TL.FindObject('Heading2C') as TfrxMemoView;
      Memo1.Visible := False;
    end;
    if Length(DM.cdsPrescription_FullMedicamentoMixDefine.Value) > 75  then
    begin
      Memo1 := LASCL_13TL.FindObject('MemoMed1') as TfrxMemoView;
      Memo1.Font.Size := 7;
      Memo1 := LASCL_13TL.FindObject('MemoMed2') as TfrxMemoView;
      Memo1.Font.Size := 6;
      Memo1 := LASCL_13TL.FindObject('MemoMed3') as TfrxMemoView;
      Memo1.Font.Size := 6;
    end;

    if DM.cdsSetupLABEL_PRINT_QTYAVAILABEL.Value = True then
    begin
      Memo1 := LASCL_13TL.FindObject('MemoAvailable') as TfrxMemoView;
      Memo1.Font.Size := 6;
    end;
    if Length(DM.cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := LASCL_13TL.FindObject('frxMemoRX_SIG') as TfrxMemoView;
      Memo1.Font.Size :=  7;
    end;
    if DM.cdsPrescription_FullEARNING.Value < 0 then
    begin
      Memo1 := LASCL_13TL.FindObject('MemoUnderPaid') as TfrxMemoView;
      Memo1.Visible := True;
    end;
    Memo1 := LASCL_13TL.FindObject('MemoPatEducation') as TfrxMemoView;
    Memo1.Visible := True;
end;


procedure TFrmLabels.R3X4_TERMAL_ABeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
  BarCode : TfrxBarCodeView;
  I: Integer;
begin
    if FrmMain.PrintHeaderZebra = False then
    begin
      Memo1 := R3X4_TERMAL_A.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := R3X4_TERMAL_A.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := R3X4_TERMAL_A.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
    end;
    if Length(DM.cdsPrescription_FullMedicamentoMixDefine.Value) > 75  then
    begin
      Memo1 := R3X4_TERMAL_A.FindObject('Memo40') as TfrxMemoView;
      Memo1.Font.Size := 5;
      Memo1 := R3X4_TERMAL_A.FindObject('Memo20') as TfrxMemoView;
      Memo1.Font.Size := 5;
      Memo1 := R3X4_TERMAL_A.FindObject('Memo44') as TfrxMemoView;
      Memo1.Font.Size := 5;
    end;

    if DM.cdsSetupLABEL_PRINT_QTYAVAILABEL.Value = True then
    begin
      Memo1 := R3X4_TERMAL_A.FindObject('MemoAvailable') as TfrxMemoView;
      Memo1.Font.Size := 6;
    end;
    if Length(DM.cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := R3X4_TERMAL_A.FindObject('Memo1') as TfrxMemoView;
      Memo1.Font.Size :=  6;
    end;
    if DM.cdsPrescription_FullEARNING.Value < 0 then
    begin
      Memo1 := R3X4_TERMAL_A.FindObject('MemoUnderPaid') as TfrxMemoView;
      Memo1.Visible := True;
    end;
end;

end.
