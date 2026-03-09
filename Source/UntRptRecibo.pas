unit UntRptRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxBarcode;

type
  TFrmRptRecibo = class(TForm)
    dsSetup: TfrxDBDataset;
    Receipt: TfrxReport;
    dsDetail: TfrxDBDataset;
    dsTransHead: TfrxDBDataset;
    dsClientes: TfrxDBDataset;
    frxBarCodeObject1: TfrxBarCodeObject;
    procedure RptFacturaBeforePrint(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ReceiptBeforePrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    CustomerName1: String;
    PO: String;
    { Public declarations }
  end;

var
  FrmRptRecibo: TFrmRptRecibo;

implementation

uses untReceiptView, UntData, UntMain;

{$R *.dfm}

procedure TFrmRptRecibo.ppReport1BeforePrint(Sender: TObject);
begin
//  ShowMessage(DMMidas.CDSDetailPRODDESCRIPTION.Value);
end;

procedure TFrmRptRecibo.ReceiptBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
  MemoTotales: String;
begin
{  With DM do
  begin
    if UpperCase(CDSSetupPRINT_BARCODE_PARTNUMBER.Value) = 'P' then
    begin
       Memo1 := Receipt.FindObject('Memo21') as TfrxMemoView;
       Memo1.Memo.Text := 'DEA #';

       Memo1 := Receipt.FindObject('DetailUPC') as TfrxMemoView;
       Memo1.DataField := 'BARCODEALTERNO1';
    end;
  end;
  Memo1 := Receipt.FindObject('MemoNoCaja') as TfrxMemoView;
  Memo1.Memo.Text := FrmMain.RegisterNo;

  if CommonPOS.Customer > 0  then
  begin
    Memo1 := Receipt.FindObject('memoCustName') as TfrxMemoView;
    Memo1.Visible := True;
    Memo1.Memo.Text := DM.CDSClientesNombreCompleto2.Value;

    Memo1 := Receipt.FindObject('MemoCustAddress') as TfrxMemoView;
    Memo1.Visible := True;
    Memo1.Memo.Text := Trim(CDSClientesMailingAddDefine.Value);

    Memo1 := Receipt.FindObject('MemoCustTelephone') as TfrxMemoView;
    Memo1.Visible := True;
    Memo1.Memo.Text := ' Tel. ' + DMMidas.CDSClientesCELULAR.Value;

    Memo1 := Receipt.FindObject('MemoPatExtraInfo') as TfrxMemoView;
    Memo1.Visible := True;
    Memo1.Memo.Text := DMMidas.CDSClientesINFOADICIONAL.Value;
  end;
  {
  if CommonPOS.IVULOTO_ACTIVO = False then
  begin
    Memo1 := Receipt.FindObject('MemoControlNumber') as TfrxMemoView;
    Memo1.Visible := False;
    Memo1 := Receipt.FindObject('Memo17') as TfrxMemoView;
    Memo1.Visible := False;
    Memo1 := Receipt.FindObject('Memo18') as TfrxMemoView;
    Memo1.Visible := False;
    Memo1 := Receipt.FindObject('Memo19') as TfrxMemoView;
    Memo1.Visible := False;
  end
  else
  begin
    Memo1 := Receipt.FindObject('MemoControlNumber') as TfrxMemoView;
    Memo1.Memo.Text := CommonPOS.IVULotoControlNumber;
  end;
  if Trim(CommonPOS.MemoStr) > '' then
  begin
    Memo1 := Receipt.FindObject('MemoSpecialNote') as TfrxMemoView;
    Memo1.Memo.Text := CommonPOS.MemoStr;
  end;
  }
  {With DMMidas do
  begin
    MemoTotales := 'SUB TOTAL:                    ' + Format('%m',[CDSTransHeadSUB_TOTAL.asFloat]) + chr(13);
    MemoTotales := MemoTotales + 'TAX ESTATAL:                    ' + chr(13);
    MemoTotales := MemoTotales + 'TAX MUNICIPAL:                    ' + chr(13);
    MemoTotales := MemoTotales + 'TOTAL:                        ' + Format('%m',[CDSTransHeadTOTAL.asFloat]) + chr(13);
  end;}

  //Memo1 := Receipt.FindObject('MemoTotal') as TfrxMemoView;
  //Memo1.Memo.Text := FrmReceiptView.RichEdit1.Text;



end;

procedure TFrmRptRecibo.RptFacturaBeforePrint(Sender: TObject);
begin
  //ppLabelCN.Caption := 'CONTROL: ' + CommonPOS.IVULotoControlNumber;
end;

end.
