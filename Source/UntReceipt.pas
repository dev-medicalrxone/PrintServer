unit UntReceipt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxExportBaseDialog, frxExportPDF, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdMessage, IdBaseComponent, IdIntercept, frCoreClasses;

type
  TFrmReceipt = class(TForm)
    sqlTransHeader: TFDQuery;
    sqlTransDetail: TFDQuery;
    dspTransHead: TDataSetProvider;
    dspTransDetail: TDataSetProvider;
    CDSTransHead: TClientDataSet;
    CDSTransHeadPAYMENTTYPE1: TStringField;
    CDSTransHeadTRANSACTIONDATE: TSQLTimeStampField;
    CDSTransHeadNUMBERITEMS: TIntegerField;
    CDSTransHeadCREDITCARD1: TStringField;
    CDSTransHeadOPENED: TStringField;
    CDSTransHeadVOIDED: TIntegerField;
    CDSTransHeadCUSTOMERID: TIntegerField;
    CDSTransHeadTRANSACTIONTIME: TSQLTimeStampField;
    CDSTransHeadPAID: TStringField;
    CDSTransHeadPAYMENTTYPE2: TStringField;
    CDSTransHeadCREDITCARD2: TStringField;
    CDSTransHeadSHIFT: TSmallintField;
    CDSTransHeadREGISTER: TSmallintField;
    CDSTransHeadEMPLOYNUMBER: TStringField;
    CDSTransHeadDELIVERYADDRESS1: TStringField;
    CDSTransHeadDELIVERYADDRESS2: TStringField;
    CDSTransHeadDELIVERYNAME: TStringField;
    CDSTransHeadDELIVEREDBY: TStringField;
    CDSTransHeadPONUMBER: TStringField;
    CDSTransHeadDELIVERYPHONE: TStringField;
    CDSTransHeadID: TIntegerField;
    CDSTransHeadTRANSACTIONNUMBER: TAutoIncField;
    CDSTransHeadPAYMENTTYPE3: TStringField;
    CDSTransHeadPAYMENTTYPE4: TStringField;
    CDSTransHeadCREDITCARD3: TStringField;
    CDSTransHeadCREDITCARD4: TStringField;
    CDSTransHeadDELIVERED: TStringField;
    CDSTransHeadSUPERVISOR: TStringField;
    CDSTransHeadCUSTOMER: TWideStringField;
    CDSTransHeadCUSTOMER_DEFINE: TWideStringField;
    CDSTransHeadSERVER: TStringField;
    cdsTransDetail: TClientDataSet;
    cdsTransDetailIDNUMBER: TAutoIncField;
    cdsTransDetailTRANSACTIONNUMBER: TIntegerField;
    cdsTransDetailUPC: TStringField;
    cdsTransDetailVOIDED: TIntegerField;
    cdsTransDetailSUBDETAIL: TStringField;
    cdsTransDetailPRODDESCRIPTION: TStringField;
    cdsTransDetailPRODDEPARTMENT: TStringField;
    cdsTransDetailFOOD: TStringField;
    cdsTransDetailMODIFIED: TSmallintField;
    cdsTransDetailFECHAVENTA: TSQLTimeStampField;
    cdsTransDetailSUPLIDOR: TIntegerField;
    cdsTransDetailID: TIntegerField;
    cdsTransDetailPRODUCTNO: TIntegerField;
    cdsTransDetailTAX_ESTATAL: TStringField;
    cdsTransDetailTAX_MUNICIPAL: TStringField;
    cdsTransDetailQTY: TFloatField;
    cdsTransDetailOPENED: TStringField;
    cdsTransDetailGROUP_PROD: TStringField;
    cdsTransDetailREGISTER: TSmallintField;
    cdsTransDetailSUPERVISOR: TStringField;
    cdsTransDetailPATROCINIO: TSmallintField;
    cdsTransDetailSUBDEPARTAMENTO: TSmallintField;
    cdsTransDetailBARCODEALTERNO1: TWideStringField;
    cdsTransDetailBARCODEALTERNO2: TWideStringField;
    cdsTransDetailBAG_NUMBER: TIntegerField;
    cdsTransDetailOTC_NUMBER: TIntegerField;
    cdsTransDetailUTILIDAD: TBooleanField;
    cdsTransDetailTRANS_TIME: TSQLTimeStampField;
    cdsTransDetailTERMINO: TWideStringField;
    cdsTransDetailPRODUCT_DONENESS: TStringField;
    dsTransHead: TDataSource;
    dsTransDetail: TDataSource;
    qOpenTabs: TFDQuery;
    dspOpenTabs: TDataSetProvider;
    dsOpenTabs: TDataSource;
    cdsOpenTabs: TClientDataSet;
    cdsOpenTabsID: TIntegerField;
    cdsOpenTabsSERVER: TIntegerField;
    cdsOpenTabsCUSTOMER: TWideStringField;
    cdsOpenTabsTELEPHONE: TWideStringField;
    cdsOpenTabsCREDIT_CARD: TWideStringField;
    cdsOpenTabsDATE: TSQLTimeStampField;
    cdsOpenTabsTRANSACTIONNUMBER: TIntegerField;
    cdsOpenTabsBUTTON_CAPTION: TWideStringField;
    sqlTransDetail_Temp: TFDQuery;
    dspTransDetail_Temp: TDataSetProvider;
    dsTransDetail_Temp: TDataSource;
    cdsTransDetail_Temp: TClientDataSet;
    cdsTransDetail_TempIDNUMBER: TAutoIncField;
    cdsTransDetail_TempTRANSACTIONNUMBER: TIntegerField;
    cdsTransDetail_TempUPC: TStringField;
    cdsTransDetail_TempVOIDED: TIntegerField;
    cdsTransDetail_TempSUBDETAIL: TStringField;
    cdsTransDetail_TempPRODDESCRIPTION: TStringField;
    cdsTransDetail_TempPRODDEPARTMENT: TStringField;
    cdsTransDetail_TempFOOD: TStringField;
    cdsTransDetail_TempMODIFIED: TSmallintField;
    cdsTransDetail_TempFECHAVENTA: TSQLTimeStampField;
    cdsTransDetail_TempSUPLIDOR: TIntegerField;
    cdsTransDetail_TempID: TIntegerField;
    cdsTransDetail_TempPRODUCTNO: TIntegerField;
    cdsTransDetail_TempOPENED: TStringField;
    cdsTransDetail_TempGROUP_PROD: TStringField;
    cdsTransDetail_TempREGISTER: TSmallintField;
    cdsTransDetail_TempSUPERVISOR: TStringField;
    cdsTransDetail_TempPATROCINIO: TSmallintField;
    cdsTransDetail_TempSUBDEPARTAMENTO: TSmallintField;
    cdsTransDetail_TempBARCODEALTERNO1: TWideStringField;
    cdsTransDetail_TempBARCODEALTERNO2: TWideStringField;
    cdsTransDetail_TempBAG_NUMBER: TIntegerField;
    cdsTransDetail_TempUTILIDAD: TBooleanField;
    cdsTransDetail_TempOTC_NUMBER: TIntegerField;
    cdsTransDetail_TempTRANS_TIME: TSQLTimeStampField;
    cdsTransDetail_TempTAX_SERVICIO: TBooleanField;
    cdsTransDetail_TempNOTE: TWideStringField;
    cdsTransDetail_TempKITCHEN: TBooleanField;
    cdsTransDetail_TempMAIN_COURSE_ID: TIntegerField;
    cdsTransDetail_TempMAIN_COURSE: TBooleanField;
    cdsTransDetail_TempTERMINO: TWideStringField;
    cdsTransDetail_TempPRODDESC_DEFINE: TStringField;
    qPasswords: TFDQuery;
    dspPasswords: TDataSetProvider;
    dsPasswords: TDataSource;
    cdsPasswords: TClientDataSet;
    cdsPasswordsUSERNAME: TStringField;
    cdsPasswordsINICIALES: TStringField;
    Setup: TfrxDBDataset;
    TransactionHeader: TfrxDBDataset;
    TransactionDetail: TfrxDBDataset;
    RestReceipt: TfrxReport;
    FoodReceipt: TfrxReport;
    TransDetail_Temp: TfrxDBDataset;
    OpenTabs: TfrxDBDataset;
    FDQuery1: TFDQuery;
    RecallTransaction: TfrxReport;
    CDSTransHeadRecallNoTrans: TStringField;
    CDSTransHeadPAYAMOUNT1: TFMTBCDField;
    CDSTransHeadPAYAMOUNT2: TFMTBCDField;
    CDSTransHeadTAX: TFMTBCDField;
    CDSTransHeadTOTAL_TAX: TFMTBCDField;
    CDSTransHeadTAX_ESTATAL: TFMTBCDField;
    CDSTransHeadSUBTOTAL: TFMTBCDField;
    CDSTransHeadTAX_SERVICIO: TFMTBCDField;
    CDSTransHeadPAYAMOUNT3: TFMTBCDField;
    CDSTransHeadPAYAMOUNT4: TFMTBCDField;
    CDSTransHeadREGTOTAL: TFMTBCDField;
    CDSTransHeadTOTAL: TFMTBCDField;
    CDSTransHeadCHANGE: TFMTBCDField;
    CDSTransHeadFOODTOTAL: TFMTBCDField;
    CDSTransHeadTAX_FOOD_MUNICIPAL: TFMTBCDField;
    CDSTransHeadTAX_FOOD_ESTATAL: TFMTBCDField;
    CDSTransHeadTOTAL_DISCOUNT: TFMTBCDField;
    cdsOpenTabsGROUP_BALANCE: TFMTBCDField;
    cdsOpenTabsBALANCE: TFMTBCDField;
    CDSTransHeadTIP: TFMTBCDField;
    cdsTransDetail_TempTAX: TFMTBCDField;
    cdsTransDetail_TempCOSTO: TFMTBCDField;
    cdsTransDetail_TempPRICE: TFMTBCDField;
    cdsTransDetail_TempTOTAL: TFMTBCDField;
    cdsTransDetail_TempREGTOTAL: TFMTBCDField;
    cdsTransDetail_TempREGPRICE: TFMTBCDField;
    cdsTransDetail_TempAWP: TFMTBCDField;
    cdsTransDetail_TempTOTAL_VALUE: TFMTBCDField;
    cdsTransDetail_TempDISCOUNT: TFMTBCDField;
    cdsTransDetailREGTOTAL: TFMTBCDField;
    cdsTransDetailREGPRICE: TFMTBCDField;
    cdsTransDetailAWP: TFMTBCDField;
    cdsTransDetailTOTAL_VALUE: TFMTBCDField;
    cdsTransDetailDISCOUNT: TFMTBCDField;
    cdsTransDetailNOTE: TWideStringField;
    cdsTransDetailINVCONTROL_RECIPE: TBooleanField;
    cdsTransDetailMAIN_COURSE: TBooleanField;
    cdsTransDetailKITCHEN: TBooleanField;
    cdsTransDetailPRINTED: TBooleanField;
    cdsTransDetailMAIN_COURSE_ID: TIntegerField;
    cdsTransDetailBUTTON_QTY: TFMTBCDField;
    cdsTransDetailTAB_SAVED: TBooleanField;
    CDSTransHeadGRAND_TOTAL: TCurrencyField;
    cdsTransDetailTOTAL: TFMTBCDField;
    frxPDFExport1: TfrxPDFExport;
    IdConnectionIntercept1: TIdConnectionIntercept;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    procedure cdsTransDetail_TempCalcFields(DataSet: TDataSet);
    procedure CDSTransHeadAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure RestReceiptBeforePrint(Sender: TfrxReportComponent);
    procedure CDSTransHeadCalcFields(DataSet: TDataSet);
    procedure FoodReceiptBeforePrint(Sender: TfrxReportComponent);
    procedure RestReceiptPrintPage(Page: TfrxReportPage; CopyNo: Integer);
    procedure RestReceiptProgress(Sender: TfrxReport;
      ProgressType: TfrxProgressType; Progress: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
    MemoExtraInfo: String;
  end;

var
  FrmReceipt: TFrmReceipt;

implementation

uses untMain,  UntData;

{$R *.dfm}

procedure TFrmReceipt.cdsTransDetail_TempCalcFields(DataSet: TDataSet);
begin
  cdsTransDetail_TempPRODDESC_DEFINE.Value := Trim(Trim(cdsTransDetail_TempPRODDESCRIPTION.Value) + ' ' + Trim(cdsTransDetail_TempTERMINO.Value));
end;

procedure TFrmReceipt.CDSTransHeadAfterScroll(DataSet: TDataSet);
begin
  if cdsTransHeadTRANSACTIONNUMBER.Value > 0 then
  begin
    CDSTransDetail.Close;
    CDSTransDetail.CommandText := 'SELECT * FROM TransactionDetail_Temp WHERE TransactionNumber = '+ cdsTransHeadTRANSACTIONNUMBER.asString + ' and Total > 0 Order By IDNumber Desc';
    CDSTransDetail.Open;
    if cdsTransDetail.RecordCount = 0 then
    begin
      CDSTransDetail.Close;
      CDSTransDetail.CommandText := 'SELECT * FROM TransactionDetail WHERE TransactionNumber = '+ cdsTransHeadTRANSACTIONNUMBER.asString + ' and Total > 0 Order By IDNumber Desc';
      CDSTransDetail.Open;
    end;
    cdsTransDetail_Temp.Close;
    cdsTransDetail_Temp.CommandText := 'SELECT * FROM TransactionDetail_Temp WHERE TransactionNumber = '+ cdsTransHeadTRANSACTIONNUMBER.asString +' AND KITCHEN = 1 and PRINTED <> 1 Order By MAIN_COURSE_ID, IDNumber';
    cdsTransDetail_Temp.Open;
    cdsOpenTabs.Close;
    cdsOpenTabs.CommandText := 'Select * from Open_Tabs where  TransactionNumber = '+ cdsTransHeadTRANSACTIONNUMBER.asString;
    cdsOpenTabs.Open;
  //FDQuery1.SQL.Text := 'Update TransactionDetail_Temp set PRINTED = 1 where TransactionNumber = '+ cdsTransHeadTRANSACTIONNUMBER.asString +' AND KITCHEN = 1';
  //FDQuery1.ExecSQL;
  end;
end;

procedure TFrmReceipt.CDSTransHeadCalcFields(DataSet: TDataSet);
begin
  CDSTransHeadRecallNoTrans.Value := 'HK' + IntToStr(CDSTransHeadTRANSACTIONNUMBER.Value);
  CDSTransHeadGRAND_TOTAL.asFloat := CDSTransHeadTOTAL.asFloat + CDSTransHeadTIP.asFloat
end;


procedure TFrmReceipt.FoodReceiptBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
  Memo1 := FoodReceipt.FindObject('MemoExtraInfo') as TfrxMemoView;
  Memo1.Memo.Text :=  MemoExtraInfo;
end;

procedure TFrmReceipt.FormCreate(Sender: TObject);
begin
  RestReceipt.PrintOptions.Printer := FrmMain.ReceiptPrinter;
  FoodReceipt.PrintOptions.Printer := FrmMain.FoodReceipt;
end;

procedure TFrmReceipt.RestReceiptBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
  Image2: TfrxPictureView;
  PageHeader: TfrxPageHeader;
  Page1: TfrxReportPage;
begin
  //RestReceipt.Page.Report.Pages[0]. Height
  Page1 := TfrxReportPage(RestReceipt.Pages[1]);
  //Page1.PaperSize := DMPAPER_A2;
  Page1.EndlessHeight := true;
  if DM.CDSSetupPOS_PRINT_LOGO.Value = False then
  begin
    PageHeader := RestReceipt.FindObject('PageHeader1') as TfrxPageHeader;
    PageHeader.Visible := False;
    Image2 := RestReceipt.FindObject('Picture1') as TfrxPictureView;
    Image2.Visible := False;
  end;
  if FrmReceipt.Tag = 0 then
  begin
     Memo1 := RestReceipt.FindObject('TransHeadGRAND_TOTAL') as TfrxMemoView;
     Memo1.Visible := False;
  end
  else
  begin
     Memo1 := RestReceipt.FindObject('TransHeadGRAND_TOTAL') as TfrxMemoView;
     Memo1.Visible := True;
  end;
  if CDSTransHeadPAYAMOUNT1.asFloat > 0 then
  begin
    Memo1 := RestReceipt.FindObject('MemoPayAmount1') as TfrxMemoView;
    Memo1.Visible := True;
  end
  else
  begin
    Memo1 := RestReceipt.FindObject('MemoPayAmount1') as TfrxMemoView;
    Memo1.Visible := False;
  end;

  if CDSTransHeadPAYAMOUNT2.asFloat > 0 then
  begin
    Memo1 := RestReceipt.FindObject('MemoPaymentType2') as TfrxMemoView;
    Memo1.Visible  := True;
    Memo1 := RestReceipt.FindObject('MemoPayAmount2') as TfrxMemoView;
    Memo1.Visible  := True;
  end
  else
   begin
    Memo1 := RestReceipt.FindObject('MemoPaymentType2') as TfrxMemoView;
    Memo1.Visible  := False;
    Memo1 := RestReceipt.FindObject('MemoPayAmount2') as TfrxMemoView;
    Memo1.Visible  := False;
    end;

  if CDSTransHeadTIP.asFloat > 0 then
  begin
    Memo1 := RestReceipt.FindObject('TransactionHeaderTIP') as TfrxMemoView;
    Memo1.Visible := True;
  end

  else
  begin
    Memo1 := RestReceipt.FindObject('TransactionHeaderTIP') as TfrxMemoView;
    Memo1.Visible := False;
  end;

  Memo1 := RestReceipt.FindObject('MemoSTL') as TfrxMemoView;
  Memo1 := RestReceipt.FindObject('MemoSugTip1') as TfrxMemoView;
  Memo1.Memo.Text := 'Suggested Tip: ' + Format('%f', [DM.CDSSetupTIP_PERCENTAGE1.asFloat]) + '%  - ' + Format('%m', [CDSTransHeadTOTAL.asFloat * DM.CDSSetupTIP_PERCENTAGE1.asFloat]);
  Memo1 := RestReceipt.FindObject('MemoSugTip2') as TfrxMemoView;
  Memo1.Memo.Text := 'Suggested Tip: ' + Format('%f', [DM.CDSSetupTIP_PERCENTAGE2.asFloat]) + '%  - ' + Format('%m', [CDSTransHeadTOTAL.asFloat * DM.CDSSetupTIP_PERCENTAGE2.asFloat]);
  Memo1 := RestReceipt.FindObject('MemoSugTip3') as TfrxMemoView;
  Memo1.Memo.Text := 'Suggested Tip: ' + Format('%f', [DM.CDSSetupTIP_PERCENTAGE3.asFloat]) + '%  - ' + Format('%m', [CDSTransHeadTOTAL.asFloat * DM.CDSSetupTIP_PERCENTAGE3.asFloat]);

end;

procedure TFrmReceipt.RestReceiptPrintPage(Page: TfrxReportPage;
  CopyNo: Integer);
Var
  Page1: TfrxReportPage;
begin
{  Page1 := TfrxReportPage(RestReceipt.Pages[CopyNo]);
  Page1.PaperSize := 40;
  Page1.PaperHeight := 16.90;
  Page1.PaperWidth := 7.20;
 }
end;

procedure TFrmReceipt.RestReceiptProgress(Sender: TfrxReport;
  ProgressType: TfrxProgressType; Progress: Integer);
begin
  //ShowMessage(IntToStr(Progress));
end;

end.
