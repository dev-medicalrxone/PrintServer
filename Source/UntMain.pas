unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Vcl.StdCtrls,
  frxBarcode, Vcl.ExtCtrls, Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient, Registry,
  Vcl.Menus, frxbarcod, IdAttachment, IdAttachmentFile, IdIntercept, IdMessage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  frxExportPDF, FireDAC.DApt, System.Net.URLClient, frxExportBaseDialog,
  Vcl.Printers, IdContext, IdCustomTCPServer, IdTCPServer, IdGlobal, Xml.xmldom,
  Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, IdHTTP, System.Threading, Soap.XSBuiltIns,
  System.IniFiles, Math, frCoreClasses;

type
  TFrmMain = class(TForm)
    PrescriptionFull: TfrxDBDataset;
    frxBarCodeObject1: TfrxBarCodeObject;
    Setup: TfrxDBDataset;
    Inventario: TfrxDBDataset;
    Memo1: TMemo;
    TimerPrint: TTimer;
    R3X4_TERMAL_A: TfrxReport;
    HTTPRIO1: THTTPRIO;
    TheTrayIcon: TTrayIcon;
    PopupMenu1: TPopupMenu;
    Show1: TMenuItem;
    Exit1: TMenuItem;
    LAS_TW_35_XP: TfrxReport;
    R3X6_TERMAL_A: TfrxReport;
    OTC: TfrxDBDataset;
    OTC_3X4_TERMAL: TfrxReport;
    PRINT_QUERIES: TfrxDBDataset;
    OTC_3X6_TERMAL: TfrxReport;
    OTC_2_75X3_75_TERMAL: TfrxReport;
    OTC_LAS_TW_35_XP: TfrxReport;
    LAS_TW_35_XP_MUN: TfrxReport;
    Receipt: TfrxReport;
    TransactionHeader: TfrxDBDataset;
    TransactionDetail: TfrxDBDataset;
    RX3X4_TERMAL_SAVIA: TfrxReport;
    OTC3X4_TERMAL_SAVIA: TfrxReport;
    PXT_2HRI_1_tmp: TfrxReport;
    PXT_2HRI_1: TfrxReport;
    PXT_6G1A: TfrxReport;
    LASCL_S13TL: TfrxReport;
    OTC_LASCL_13TL: TfrxReport;
    LASCL_13TL: TfrxReport;
    TCPServerIP: TIdTCPServer;
    HTTPRIO2: THTTPRIO;
    XMLDocument1: TXMLDocument;
    IdHTTP1: TIdHTTP;
    Panel1: TPanel;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    RptEducation: TfrxReport;
    R3X6_TERMAL_B: TfrxReport;
    Button2: TButton;
    Button3: TButton;
    LASTW_NT37: TfrxReport;
    TL_S39_1: TfrxReport;
    LBL_MAIN_LSER: TfrxReport;
    procedure TimerPrintTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure Language;
    procedure WmUser(var _Msg: TMessage); message WM_User;
    procedure Show1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LAS_TW_35_XPBeforePrint(Sender: TfrxReportComponent);
    procedure Button1Click(Sender: TObject);
    procedure R3X4_TERMAL_ABeforePrint(Sender: TfrxReportComponent);
    procedure R3X6_TERMAL_ABeforePrint(Sender: TfrxReportComponent);
    procedure OTC_3X6_TERMALBeforePrint(Sender: TfrxReportComponent);
    procedure OTC_3X4_TERMALBeforePrint(Sender: TfrxReportComponent);
    procedure OTC_2_75X3_75_TERMALBeforePrint(Sender: TfrxReportComponent);
    procedure OTC_LAS_TW_35_XPBeforePrint(Sender: TfrxReportComponent);
    procedure LAS_TW_35_XP_MUNBeforePrint(Sender: TfrxReportComponent);
    function ValidateTextJustNumbers(Token: String): String;
    function PrescriptionFullFields: String;
    procedure RX3X4_TERMAL_SAVIABeforePrint(Sender: TfrxReportComponent);
    procedure OTC3X4_TERMAL_SAVIABeforePrint(Sender: TfrxReportComponent);
    Procedure EmailReport(NoRecibo: Integer);
    procedure PXT_2HRI_1TMPBeforePrint(Sender: TfrxReportComponent);
    procedure PXT_6G1ABeforePrint(Sender: TfrxReportComponent);
    procedure LASCL_S13TLBeforePrint(Sender: TfrxReportComponent);
    procedure OTC_LASCL_13TLBeforePrint(Sender: TfrxReportComponent);
    procedure LASCL_13TLBeforePrint(Sender: TfrxReportComponent);
    procedure SendEmailPharmatec(email, DocumentName: String);
    procedure Print_Receipt_FR;
    procedure PrintReceipt(TransNo, NoRecibos: Integer; FinalReceipt: Boolean; TransType,TripleS_previousBalance, TripleS_ApprovedAmount, TripleS_finalBalance: String);
    function CenterString(InStr: String; StrLen: Integer): String;
    procedure TCPServerIPExecute(AContext: TIdContext);
    procedure PrintKitchenReceipt(TranNo: Integer; Note: string);
    procedure PrintInvoice(trans_no: Integer; OpenDrwr, Reprint: Boolean; IVULoto, PrintType: String);
    procedure Print;
    procedure R3X6_TERMAL_BBeforePrint(Sender: TfrxReportComponent);
    function PrintPatEdu(Memo1: TfrxMemoView; ReportName: TfrxReport):Boolean;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SelectPrinter(PrnText: String);
    function LeftJString(InStr: String; StrLen: Integer): String;
    procedure LASTW_NT37BeforePrint(Sender: TfrxReportComponent);
    procedure TL_S39_1BeforePrint(Sender: TfrxReportComponent);
  private
    FPrinterOverride: string;
    procedure Configureemailserver;


    function GetTotal_lines(TransType: String; FinalReceipt: Boolean;
      DeudaLocal, DeudaLayaway: Double; NoCliente: Integer): Boolean;
    procedure PrintSavedTransaction(TransNo: String);
    procedure GetIVULoto(TransType: String);
    function MonthOftheYear(Fecha: String): String;
    procedure Print_report(LabelName, Printfrom: String);
    procedure PrintBitmap(ABitmap: TBitmap);




    { Private declarations }
  public
    { Public declarations }
    Counter_prints: Integer;
    PrinterIP: String;
    ServerName: String;
    DataBaseName: String;
    PrinterID: String;
    GoldStandardDB: String;
    KitchenPrinter: String;
    ReceiptPringer: String;
    FoodReceipt: string;
    PrintHeaderLaser, PrintHeaderZebra, PrintHeaderZebraOTC, Loop, PrintToScreen, GoldStandardActive: Boolean;
    PrintType, LabelName, DotMatrixPrinter, LaserPrinter, PatLanguage, Qty_Refills_Dispo: String;
    LanguageIndex, LanguageResOffset: Integer;
    PrinterFontSize: Integer;
    ReceiptPrinter: String;
    Restaurant: Boolean;
    RegisterNo: String;
    FinalReceipt: Boolean;
    IVULOTO_ACTIVO: Boolean;
    IVULotoControlNumber: String;
    IVULOTO_TERMINALID: String;
    txportIP: String;
    RefundPOS: Boolean;
    ShortPatEducation: Boolean;
    ZebraLeftMargin, ZebraTopMargin: Double;
    LazerLeftMargin, LazerTopMargin: Double;
    Long_PatEducation: String;
    Short_PatEducation: String;
    isPrintingActive: Boolean;
    PrintFrom: String;
    Label_Name: String;
    DoNotQPatEdu: boolean;
    pinTid: String;
    ActivePin: Boolean;
    SpinPOSactive: Boolean;
    EvertecID: String;
    Local_IP: String;
    StarPlussBarcode:String;
    StandalonePOS:Boolean;
    ServerNameRx:String;
    DataBaseNameRx: String;
    ServerNamePOS:String;
    DataBaseNamePOS:String;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}
{$R multilanguage.RES}

uses WSAlchemy2, ResourceLocalizer, UntData, UntReceipt, untReceiptView,
  UntRptRecibo, UntLASCL_13TL, UntIVULoto, UntGSDD5, UntCommon;


procedure OpenPrescription_full;
begin
  With DM do
  begin
    cdsPrescription_Full.Close;
    cdsPrescription_Full.CommandText := 'select DISTINCT  ' + FrmMain.PrescriptionFullFields + '  from prescription_full where RX_ID = ' + cdsPrintQueriesRX_ID.AsString;
    cdsPrescription_Full.Open;
  end;
end;

function TFrmMain.ValidateTextJustNumbers(Token: String): String;
Var
  Counter: Integer;
  Str: String;
begin
  Counter :=1;
  while Counter <= Length(Token) do
  begin
     Str := UpperCase(Copy(Token, Counter, 1));
     if
     (Str = '0') or
     (Str = '1') or
     (Str = '2') or
     (Str = '3') or
     (Str = '4') or
     (Str = '5') or
     (Str = '6') or
     (Str = '7') or
     (Str = '8') or
     (Str = '9')
       then Result := Result + Str;
     Str := '';
     Counter := Counter + 1;
  end;
end;


procedure TFrmMain.WmUser(var _Msg: TMessage);
begin
  Hide;
  TheTrayIcon.ShowBalloonHint;
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  Hide;
end;


procedure TFrmMain.SendEmailPharmatec(email, DocumentName: String);
Var
  Contacto, EMail_Addresses: String;
  Attachment, Attachment2: TIdAttachment;
begin
  With DM do
  begin
    With FrmReceipt do
    begin
      RestReceipt.PrepareReport;
      frxPDFExport1.FileName:= Trim(extractfilepath(application.exename)) + '\' +  Trim(DocumentName) + '.pdf';
      frxPDFExport1.ShowDialog := False;
      RestReceipt.ShowProgress := False;
      RestReceipt.Export(frxPDFExport1);
    end;
    Configureemailserver;
    CDSPasswords.Close;
    CDSPasswords.Open;
    CDSPasswords.First;
    EMail_Addresses := email; //'axelgcarreras@gmail.com';
    IdMessage1.Recipients.EMailAddresses := EMail_Addresses;
    IdMessage1.Subject := 'Your receipt!';
    IdMessage1.Body.Text := 'Hello user '  + chr(13) + chr(13) + 'Your purchase receipt. ' + chr(13) + chr(13) +
    DM.CDSSetupSTORENAME.asString.Trim + chr(13) +
    'http://www.wescompr.com/' + chr(13) +
    'Tel. '+ CDSSetupTELEFONO.AsString.Trim  + chr(13);
    IdMessage1.AttachmentTempDirectory := Trim(extractfilepath(application.exename)) + '\';
    Attachment := TIdAttachmentFile.Create(IdMessage1.MessageParts, Trim(extractfilepath(application.exename)) + '\' + DocumentName+'.pdf'); //Rep.Name
    try
      IdSMTP1.Connect;//(1000);
      IdSMTP1.Authenticate;
      IdSMTP1.Send(IdMessage1); //MailMessage
    finally
      begin
        if IdSMTP1.Connected then
         IdSMTP1.Disconnect;
        DeleteFile(Trim(extractfilepath(application.exename)) + '\' + DocumentName+'.pdf');
      end;
    end;
  end;
end;

procedure TFrmMain.EmailReport(NoRecibo: Integer);
Var
  Attachment: TIdAttachment;
begin
  With FrmReceipt do
  begin
    Receipt.PrepareReport;
    frxPDFExport1.FileName:= Trim(extractfilepath(application.exename)) + '\' +  Trim('receipt'+IntToStr(NoRecibo)) + '.pdf';
    frxPDFExport1.ShowDialog := False;
    Receipt.ShowProgress := False;
    Receipt.Export(frxPDFExport1);
    IdMessage1.Clear;
    Configureemailserver;
    IdMessage1.Recipients.EMailAddresses := 'axelcarreras@gmail.com' + ';' + 'facturamantenimiento@gmail.com';
    IdMessage1.Subject := 'Su Recibo';
    IdMessage1.Body.Text := 'Saludos ' + chr(13) + chr(13) + 'Atachado su recibo de compra, gracias por su patrocinio. ' + chr(13) + chr(13) +
    'WesCom, Inc. P.O. Box 6464, Mayaguez PR, 00681-6464' + chr(13) +
    'http://www.wescompr.com/';
    IdMessage1.AttachmentTempDirectory := Trim(extractfilepath(application.exename)) + '\';
    Attachment := TIdAttachmentFile.Create(IdMessage1.MessageParts, Trim(extractfilepath(application.exename)) + '\' +  Trim('receipt') + IntToStr(NoRecibo) + '.pdf');
    //if CBGuardarFactura.Checked = False then
    begin
     try
       IdSMTP1.Connect;//(1000);
       IdSMTP1.Authenticate;
       IdSMTP1.Send(IdMessage1); //MailMessage
     finally
       if IdSMTP1.Connected then
        IdSMTP1.Disconnect;
      end;
    end;
  end;
end;

procedure TFrmMain.Configureemailserver;
begin
  With DM do
  begin
    IdMessage1.Clear;
    IdSMTP1.AuthType := satDefault;
    ///=======================================
    IdSMTP1.Username := 'wescom_support'; //AccountName;
    IdSMTP1.Password := 'sarerrac047*'; //EMPassword;
    IdSMTP1.Host := 'mail.smtp2go.com';
    IdSMTP1.Port := 2525;//25;
    ///  =====================================
    IdMessage1.From.Address := Trim(CDSSetupemail.Value); //'support@wescompr.com'; ////'wescompr.com';
    //IdMessage1.From.Address := 'support@wescompr.com';
  end;
end;

procedure TFrmMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // Action := caNone;
   // Hide;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
Var
  Registro: TRegistry;
  SQLStr, ServerTF: String;
  Development: Boolean;
  i: Integer;
  Ini: TIniFile;
begin
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_LOCAL_MACHINE;
  Registro.OpenKey('\SOFTWARE\WOW6432Node\FarmaTec2000', TRUE);
  StandalonePOS := Registro.ReadBool('StandalonePOS');
  Ini := TIniFile.Create('C:\Wescom_Decimal\IniFile\farmatec.ini');
  try
    ServerNameRx := Ini.ReadString('Farmatec', 'Server', '<None>');
    DataBaseNameRx := Ini.ReadString('Farmatec', 'databasename', '<None>');
    ServerNamePOS := Ini.ReadString('Farmatec', 'ServerPOS', '<None>');
    DataBaseNamePOS := Ini.ReadString('Farmatec', 'databasenamePOS', '<None>');
  finally
    Ini.Free;
  end;
  if Trim(DataBaseNameRx) = '<None>' then
  begin
    try
      begin
        ServerNameRx := Registro.ReadString('ServerNameMSSQL');
        DataBaseNameRx := Registro.ReadString('DataBaseName');
        ServerNamePOS := Registro.ReadString('ServerNamePOS');
        DataBaseNamePOS := Registro.ReadString('DataBaseNamePOS');
      end;
    except
    end;
  end;

  With dm.FDConnectionPOS.Params do
  begin
    Values['Server'] := ServerNamePOS;
    if StandalonePOS = true then
      Values['Database'] := Trim(DataBaseNamePOS)
    else
      Values['Database'] := Trim(DataBaseNameRx);
    Values['User_Name'] := 'dbo';
    Values['password'] := 'agabriel';
    dm.FDConnectionPOS.Connected := TRUE;
  end;
  With dm.FDConnectionRx.Params do
  begin
    Values['Server'] := ServerNameRx;
    Values['Database'] := Trim(DataBaseNameRx);
    Values['User_Name'] := 'dbo';
    Values['password'] := 'agabriel';
    dm.FDConnectionRx.Connected := TRUE;
  end;

  ShortPatEducation := False;
  With DM do
  begin
    cdsSetup.Active := True;
    QBorrarNonMatchedNDC.SQL.Text := 'select name from sys.procedures where name = ' + chr(39) + 'DELETE_PRINT_QUERIES' + chr(39);
    QBorrarNonMatchedNDC.Active := True;
    if (QBorrarNonMatchedNDC.FieldByName('name').Value = '') or (QBorrarNonMatchedNDC.FieldByName('name').IsNull) then
    begin
      CREATE_DELETE_PRINT_QUERIES.ExecSQL(True);
    end;
  end;
  Try
     Restaurant := Registro.ReadBool('POS_RESTAURANT');
  Except
     Restaurant := False;
  End;
  Try
  begin
    RegisterNo := Registro.ReadString('Caja#');
  end;
  except
    RegisterNo := '0';
  end;
  {try
    FoodReceipt := Registro.ReadString('Kitchen Printer');
  Except
    FoodReceipt := 'Epson';
  end;}
  GoldStandardDB := Registro.ReadString('GoldStandardDB');

  PrintToScreen := Registro.ReadBool('PrintToScreen');
  R3X4_TERMAL_A.PrintOptions.Printer := DotMatrixPrinter;
  OTC_3X4_TERMAL.PrintOptions.Printer := DotMatrixPrinter;
  R3X6_TERMAL_A.PrintOptions.Printer := DotMatrixPrinter;
  OTC_2_75X3_75_TERMAL.PrintOptions.Printer := DotMatrixPrinter;
  OTC_3X6_TERMAL.PrintOptions.Printer := DotMatrixPrinter;

  PrintHeaderLaser := Registro.ReadBool('HeadingLaser');
  PrintHeaderZebra := Registro.ReadBool('HeadingZebra');
  PrintHeaderZebraOTC := Registro.ReadBool('HeadingZebraOTC');

  ZebraLeftMargin := StrToFloat(Registro.ReadString('Zebra Left Margin'));
  ZebraTopMargin := StrToFloat(Registro.ReadString('Zebra Top Margin'));
  LazerLeftMargin := StrToFloat(Registro.ReadString('Left Margin'));
  LazerTopMargin := StrToFloat(Registro.ReadString('Top Margin'));

  DotMatrixPrinter := Registro.ReadString('Dot Matrix Printer');
  LaserPrinter := Registro.ReadString('Impresion');

  Qty_Refills_Dispo := Registro.ReadString('Qty_Refills_Dispo');

  PrinterID := Registro.ReadString('PrinterID');
  PrintType := Registro.ReadString('Print Type');
  With DM do
  begin
    DM.OpenPrinters;
    if cdsPrinters.RecordCount > 0 then
    begin
      cdsPrinters.First;
      while not cdsPrinters.eof do
      begin
        if cdsPrintersDEFAULT_NEWRX_LABEL.Value = true then
          LabelName := cdsPrintersLABEL_NAME.Value;
        cdsPrinters.Next;
      end;
    end
    else
    begin
      if PrintType <> 'Laser' then
        LabelName := Registro.ReadString('Dot Matrix Label Name')
      else
        LabelName := Registro.ReadString('Label Name');
    end;
  end;
  Registro.Free;

  TheTrayIcon.Hint := Self.Caption;
  TheTrayIcon.BalloonTitle := ('Print Server');
  TheTrayIcon.BalloonHint := ('The program is now running.'#13#10
    + 'Double click the tray icon to show the log.'#13#10
    + 'Right click the tray icon to show the menu.');
  TheTrayIcon.BalloonFlags := bfInfo;
  PostMessage(Handle, WM_USER, 0, 0);

  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_LOCAL_MACHINE;
  Registro.OpenKey('\SOFTWARE\WOW6432Node\FarmaTec2000\Opciones', True);
  try
    CommonRoutine.NoReceiptsVisaATH := Registro.ReadInteger('NUMERO_DE_RECIBOS');
  Except
    CommonRoutine.NoReceiptsVisaATH := 1;
  end;
  try
    CommonRoutine.NoReceiptsCash := Registro.ReadInteger('NUMERO_DE_RECIBOS_CASH');
  Except
    CommonRoutine.NoReceiptsCash := 1;
  end;
  try
    CommonRoutine.NoReceiptsCredit := Registro.ReadInteger('NUMERO_DE_RECIBOS_CREDIT');
  Except
    CommonRoutine.NoReceiptsCredit := 1;
  end;
  try
    CommonRoutine.NoReceiptsLayaway := Registro.ReadInteger('NUMERO_DE_RECIBOS_LAYAWAY');
  Except
    CommonRoutine.NoReceiptsLayaway := 1;
  end;


  KitchenPrinter := Registro.ReadString('Kitchen Printer');
  ReceiptPringer := Registro.ReadString('Printer Recibo');
  PrinterIP := Registro.ReadString('PrinterIP');
  if Trim(PrinterIP) = '' then
  begin
    TimerPrint.Enabled := True;
  end;
  Try
    PrinterFontSize := StrToInt(Registro.ReadString('PrinterFontSize'));
  Except
    PrinterFontSize := 8;
  end;
  try
    ReceiptPrinter := Registro.ReadString('Printer Recibo');
  Except
    ReceiptPrinter := 'Epson';
  end;
  If FrmMain.ReceiptPrinter <> '' then
    FrmMain.SelectPrinter(FrmMain.ReceiptPrinter)
  else
    FrmMain.SelectPrinter('EPSON');

  If Length(Registro.ReadString('Printer Recibo')) > 0 then
    FoodReceipt := Registro.ReadString('Kitchen Printer')
  else
    FoodReceipt := '';
  Try
    IVULOTO_ACTIVO := Registro.ReadBool('IVULOTO_ACTIVO');
  except
    IVULOTO_ACTIVO := False;
  end;
  Try
    IVULOTO_TERMINALID := Registro.ReadString('IVULOTO_TERMINALID');
  except
    IVULOTO_TERMINALID := '';
  end;
  Try
    txportIP := Registro.ReadString('txportIP');
  except
    txportIP := '';
  end;
  Try
    pinTid := Registro.ReadString('pinTid');
  Except
    pinTid := Registro.ReadString('');
  End;
  Try
    ActivePin := true;//Registro.ReadBool('ActivePin');
  Except
    ActivePin := false;
  End;
  Try
    SpinPOSactive := Registro.ReadBool('SpinPOSactive');
  Except
    SpinPOSactive := False;
  End;
  //FoodReceipt.PrintOptions.Printer := Registro.ReadString('Kitchen Printer');
  //Receipt.PrintOptions.Printer := Registro.ReadString('Printer Recibo');
  //POSFontSize := Registro.ReadString('PrinterFontSize');
  Registro.Free;
  Counter_prints := 0;
  Local_IP := CommonRoutine.GetLocalIp;
  Memo1.Lines.Add(Local_IP);
  With DM do
  begin
    FDConnectionPOS.StartTransaction;
    FDQuery1.Close;
    FDQuery1.SQL.Text := 'Delete from Print_Queries where Printer_ID = ' + Trim(FrmMain.PrinterID)
    + ' and Printer_IP = ' + chr(39) + Local_IP + chr(39);
    FDQuery1.Execute;
    FDConnectionPOS.Commit;
  end;

end;



procedure TFrmMain.OTC_LASCL_13TLBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
  if PrintHeaderZebraOTC = False then
  begin
    Memo1 := OTC_LASCL_13TL.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
    Memo1.Visible := False;
    Memo1 := OTC_LASCL_13TL.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
    Memo1.Visible := False;
    Memo1 := OTC_LASCL_13TL.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
    Memo1.Visible := False;
  end;
end;

procedure TFrmMain.OTC_LAS_TW_35_XPBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
    if PrintHeaderZebraOTC = False then
    begin
      Memo1 := OTC_LAS_TW_35_XP.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := OTC_LAS_TW_35_XP.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := OTC_LAS_TW_35_XP.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
    end;
end;

procedure TFrmMain.R3X4_TERMAL_ABeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
  BarCode : TfrxBarCodeView;
  I: Integer;
begin
    {Memo1 := R3X4_TERMAL_A.FindObject('MemoLine1a') as TfrxMemoView;
    Memo1.Text := dm.cdsPrescription_FullLABEL_LINE1.Value;
    Memo1 := R3X4_TERMAL_A.FindObject('MemoLine1b') as TfrxMemoView;
    Memo1.Text := dm.cdsPrescription_FullLABEL_LINE1b.Value;}


    if PrintHeaderZebra = False then
    begin
      Memo1 := R3X4_TERMAL_A.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := R3X4_TERMAL_A.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := R3X4_TERMAL_A.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
    end;
    if DM.cdsSetupONLY_PRINT_PHARMACYADDRESS.Value = true then
    begin
      Memo1 := R3X4_TERMAL_A.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.DataField := 'STOREADDRESSHEADING';
      Memo1.Top := 30;
      Memo1.Visible := true;
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

procedure TFrmMain.R3X6_TERMAL_ABeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
    if PrintHeaderZebra = False then
    begin
      Memo1 := R3X6_TERMAL_A.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := R3X6_TERMAL_A.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := R3X6_TERMAL_A.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := R3X6_TERMAL_A.FindObject('Memo53') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := R3X6_TERMAL_A.FindObject('Memo54') as TfrxMemoView;
      Memo1.Visible := False;

      if Length(DM.cdsPrescription_FullSIG.Value) > 108  then
      begin
        Memo1 := R3X6_TERMAL_A.FindObject('Memo40') as TfrxMemoView;
        Memo1.Font.Size := 6;
      end;
    end;
    if Length(DM.cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := R3X6_TERMAL_A.FindObject('MemoSIG') as TfrxMemoView;
      Memo1.Font.Size :=  6;
    end;
end;

procedure TFrmMain.R3X6_TERMAL_BBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
    if PrintHeaderZebra = False then
    begin
      Memo1 := R3X6_TERMAL_B.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := R3X6_TERMAL_B.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := R3X6_TERMAL_B.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      if Length(DM.cdsPrescription_FullSIG.Value) > 108  then
      begin
        Memo1 := R3X6_TERMAL_B.FindObject('Memo40') as TfrxMemoView;
        Memo1.Font.Size := 6;
      end;
    end;
    if Length(DM.cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := R3X6_TERMAL_B.FindObject('MemoSIG') as TfrxMemoView;
      Memo1.Font.Size :=  6;
    end;
end;

procedure TFrmMain.RX3X4_TERMAL_SAVIABeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
  BarCode : TfrxBarCodeView;
  I: Integer;
begin
    if PrintHeaderZebra = False then
    begin
      Memo1 := RX3X4_TERMAL_SAVIA.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := RX3X4_TERMAL_SAVIA.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := RX3X4_TERMAL_SAVIA.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      //BarCode := RX3X4_TERMAL_SAVIA.FindObject('BarCode2') as TfrxBarCodeView;
      //BarCode.BarType := bcCode39;

      if Length(DM.cdsPrescription_FullMedicamentoMixDefine.Value) > 75  then
      begin
        Memo1 := RX3X4_TERMAL_SAVIA.FindObject('Memo40') as TfrxMemoView;
        Memo1.Font.Size := 5;
        Memo1 := RX3X4_TERMAL_SAVIA.FindObject('Memo20') as TfrxMemoView;
        Memo1.Font.Size := 5;
        Memo1 := RX3X4_TERMAL_SAVIA.FindObject('Memo44') as TfrxMemoView;
        Memo1.Font.Size := 5;
      end;
    end;
    if DM.cdsSetupLABEL_PRINT_QTYAVAILABEL.Value = True then
    begin
      Memo1 := RX3X4_TERMAL_SAVIA.FindObject('MemoAvailable') as TfrxMemoView;
      Memo1.Font.Size := 6;
    end;
    if Length(DM.cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := RX3X4_TERMAL_SAVIA.FindObject('Memo1') as TfrxMemoView;
      Memo1.Font.Size :=  6;
    end;
    if DM.cdsPrescription_FullEARNING.Value < 0 then
    begin
      Memo1 := RX3X4_TERMAL_SAVIA.FindObject('MemoUnderPaid') as TfrxMemoView;
      Memo1.Visible := True;
    end;
end;

procedure TFrmMain.Show1Click(Sender: TObject);
begin
  Show;
end;

Procedure DeltePrintQ(Q_ID, option: Integer);
begin
  With DM do
  begin
    if option = 0 then
      DELETE_PRINT_QUERIES.Connection := FDConnectionPOS
    else
      DELETE_PRINT_QUERIES.Connection := FDConnectionRx;
    try
      With DELETE_PRINT_QUERIES do
      begin
        Prepare;
        ParamByName('@ID').Value := Q_ID;
        Prepare;
        ExecProc;
      end;
    except
      FDConnectionPOS.Rollback;
      raise;
    end;
  end;
end;

procedure TFrmMain.TCPServerIPExecute(AContext: TIdContext);
var
  Loc: Integer;
  i: Integer;
  ReportName, trans_no: String;
  s: string;
  ls: TStringList;
  TripleS_previousBalance, TripleS_ApprovedAmount, TripleS_finalBalance, POS_: String;

begin
  With DM do
  begin
    s := AContext.Connection.IOHandler.ReadLn;
    ls := TStringList.Create;
    ls.StrictDelimiter := True;
    ls.Delimiter := '|';
    ls.DelimitedText := s;
    for i := 0 to Ls.Count-1 do
    begin
      case i of
        0: ReportName := ls.Strings[I];
        1: trans_no := ls.Strings[I];
        2: TripleS_previousBalance := Trim(ls.Strings[I]);
        3: TripleS_ApprovedAmount := ls.Strings[I];
        4: TripleS_finalBalance := ls.Strings[I];
        5: EvertecID := ls.Strings[I];
        6: POS_ := ls.Strings[I];
      end;
    end;
    Ls.Destroy;
    if (POS_ = 'POS') then
    begin
      //if StandalonePOS = true then
      begin
        qPrintQueries.Connection := FDConnectionPOS;
        sqlTransHeader.Connection := FDConnectionPOS;
        sqlTransDetail.Connection := FDConnectionPOS;
        qOpenTabs.Connection := FDConnectionPOS;
        qInventario.Connection := FDConnectionPOS;
        FDQueryPOS.Connection := FDConnectionPOS;
        qSetup.Connection := FDConnectionPOS;
        QClientesFD.Connection := FDConnectionPOS;
        qCounters.Connection := FDConnectionPOS;   //[2025/09/01 jb]
      end;
    end
    else
    begin
        qPrintQueries.Connection := FDConnectionRX;
        sqlTransHeader.Connection := FDConnectionRX;
        sqlTransDetail.Connection := FDConnectionRX;
        qOpenTabs.Connection := FDConnectionRX;
        qInventario.Connection := FDConnectionRX;
        qSetup.Connection := FDConnectionRx;
        QClientesFD.Connection := FDConnectionRx;
        FDQueryPOS.Connection := FDConnectionRx;
    end;
    //Memo1.Lines.Add(ReportName + ' ' +trans_no);
    if (ReportName = 'receipt') or (ReportName = 'invoice') or
    (ReportName = 'RecallTransaction') then
    begin
      cdsPrintQueries.Close;
      cdsPrintQueries.CommandText := 'Select * from Print_queries where TRANSACTION_NUMBER = ' + trans_no;
      cdsPrintQueries.Open;
     // Memo1.Lines.Add('Records found: ' + IntToStr(cdsPrintQueries.RecordCount));
      if cdsPrintQueriesRX_OTC.AsString.Trim = 'PO' then
      begin
        FinalReceipt := cdsPrintQueriesFINAL_RECEIPT.Value;
        if cdsPrintQueriesLABEL_NAME.Value = 'receipt' then
        begin
          if cdsPrintQueriesPRINT_TYPE.Value = 1 then // 1 = Send by email
            Print_Receipt_FR
          else
            PrintReceipt(cdsPrintQueriesTRANSACTION_NUMBER.Value, cdsPrintQueriesCOPIES.Value, cdsPrintQueriesFINAL_RECEIPT.Value, '', TripleS_previousBalance, TripleS_ApprovedAmount, TripleS_finalBalance);
        end;
        if cdsPrintQueriesLABEL_NAME.Value = 'invoice' then
        begin
          PrintInvoice(StrToInt(trans_no), false,false,'',IntToStr(cdsPrintQueriesPRINT_TYPE.Value));
        end;
        if cdsPrintQueriesLABEL_NAME.Value = 'RecallTransaction' then
        begin
          PrintSavedTransaction(trans_no);
          if cdsPrintQueriesDELIVERY.Value = true then
          begin
            PrintReceipt(StrToInt(trans_no), 1, false, '', TripleS_previousBalance, TripleS_ApprovedAmount, TripleS_finalBalance);
          end;
        end;
      end;
      //Memo1.Lines.Add('To delete')  ;
      DeltePrintQ(cdsPrintQueriesID.Value, 0);
      //Memo1.Lines.Add('deleted');
    end;
    if ReportName = 'FoodReceipt' then
    begin
       cdsPrintQueries.Close;
       cdsPrintQueries.CommandText := 'Select * from Print_queries where TRANSACTION_NUMBER = ' + trans_no;
       cdsPrintQueries.Open;
       PrintKitchenReceipt(strToInt(trans_no), cdsPrintQueriesINDICATIONS.Value);
       DeltePrintQ(cdsPrintQueriesID.Value, 0);
    end;
    Loc := Pos('print_labels', s);//ClientsConnected
    if Loc > 0 then
    begin
      if (TimerPrint.Enabled = false) and
      (isPrintingActive = false) then
      begin
        TimerPrint.Enabled := True;
      end;
    end;
  end;
end;

procedure TFrmMain.TimerPrintTimer(Sender: TObject);
Var
  LabelStr, PayAmount: String;
  ID: Integer;
begin
  TimerPrint.Enabled := False;
  //Print_labels;
  Print;
end;





procedure TFrmMain.TL_S39_1BeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
  BarCode : TfrxBarCodeView;
  I: Integer;
begin
    if PrintHeaderZebra = False then
    begin
      Memo1 := TL_S39_1.FindObject('Heading1A') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := TL_S39_1.FindObject('Heading1B') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := TL_S39_1.FindObject('Heading1C') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := TL_S39_1.FindObject('Heading2A') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := TL_S39_1.FindObject('Heading2B') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := TL_S39_1.FindObject('Heading2C') as TfrxMemoView;
      Memo1.Visible := False;
    end;
    if Length(DM.cdsPrescription_FullMedicamentoMixDefine.Value) > 75  then
    begin
      Memo1 := TL_S39_1.FindObject('MemoMed1') as TfrxMemoView;
      Memo1.Font.Size := 7;
      Memo1 := TL_S39_1.FindObject('MemoMed2') as TfrxMemoView;
      Memo1.Font.Size := 6;
      Memo1 := TL_S39_1.FindObject('MemoMed3') as TfrxMemoView;
      Memo1.Font.Size := 6;
    end;

    if DM.cdsSetupLABEL_PRINT_QTYAVAILABEL.Value = True then
    begin
      Memo1 := TL_S39_1.FindObject('MemoAvailable') as TfrxMemoView;
      Memo1.Font.Size := 6;
    end;
    if Length(DM.cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := TL_S39_1.FindObject('frxMemoRX_SIG') as TfrxMemoView;
      Memo1.Font.Size :=  7;
    end;
    {if (DM.cdsPrescription_FullEARNING.Value < 0) then
    begin
      Memo1 := TL_S39_1.FindObject('MemoUnderPaid') as TfrxMemoView;
      Memo1.Visible := True;
    end;}

    Memo1 := TL_S39_1.FindObject('MemoPatEdu') as TfrxMemoView;
    Memo1.Font.Size :=  DM.cdsSetupEDUCATION_FONT_SIZE.Value;
end;

Procedure TFrmMain.Language;
begin

  if UpperCase(PatLanguage) = 'ENGLISH' then
  begin
    LanguageIndex := 0;
    LanguageResOffset := 1000;
  end;
  if PatLanguage = 'Spanish' then
  begin
    LanguageIndex := 1;
    LanguageResOffset := 2000;
  end;
end;

procedure TFrmMain.LASCL_13TLBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
  BarCode : TfrxBarCodeView;
  I: Integer;
begin
    if PrintHeaderZebra = False then
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
    //Memo1 := LASCL_13TL.FindObject('MemoPatEdu') as TfrxMemoView;
    //Memo1.Visible := True;
end;


procedure TFrmMain.LASCL_S13TLBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
  BarCode : TfrxBarCodeView;
  I: Integer;
begin
    if PrintHeaderZebra = False then
    begin
      Memo1 := LASCL_S13TL.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASCL_S13TL.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASCL_S13TL.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      //BarCode := R3X4_TERMAL_A.FindObject('BarCode2') as TfrxBarCodeView;
      //BarCode.BarType := bcCode39;

      if Length(DM.cdsPrescription_FullMedicamentoMixDefine.Value) > 75  then
      begin
        Memo1 := LASCL_S13TL.FindObject('Memo40') as TfrxMemoView;
        Memo1.Font.Size := 5;
        Memo1 := LASCL_S13TL.FindObject('Memo20') as TfrxMemoView;
        Memo1.Font.Size := 5;
        Memo1 := LASCL_S13TL.FindObject('Memo44') as TfrxMemoView;
        Memo1.Font.Size := 5;
      end;
    end;
    if DM.cdsSetupLABEL_PRINT_QTYAVAILABEL.Value = True then
    begin
      Memo1 := LASCL_S13TL.FindObject('MemoAvailable') as TfrxMemoView;
      Memo1.Font.Size := 6;
    end;
    if Length(DM.cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := LASCL_S13TL.FindObject('Memo1') as TfrxMemoView;
      Memo1.Font.Size :=  6;
    end;
    if DM.cdsPrescription_FullEARNING.Value < 0 then
    begin
      Memo1 := LASCL_S13TL.FindObject('MemoUnderPaid') as TfrxMemoView;
      Memo1.Visible := True;
    end;
end;

procedure TFrmMain.LASTW_NT37BeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
  With DM do
  begin
    if cdsSetupPrintPagoPlan.Value = False then
    begin
      Memo1 := LASTW_NT37.FindObject('Memo88') as TfrxMemoView;
      Memo1.DataField := 'PlanInfo2_NoShowPP';
    end;

    if cdsPrescription_FullPAT_LANGUAGE.Value = 'SPANISH' then
    begin
      LanguageIndex := 1;
      LanguageResOffset := 2000;
    end
    else
    begin
      LanguageIndex := 0;
      LanguageResOffset := 1000;
    end;
    if cdsSetupSTAR_PLUS_INTERFACE.Value = True then
    begin
      Memo1 := LASTW_NT37.FindObject('Memo90') as TfrxMemoView;
      Memo1.Left := 250.00;
      Memo1 := LASTW_NT37.FindObject('Memo91') as TfrxMemoView;
      Memo1.Left := 295.00;
      Memo1 := LASTW_NT37.FindObject('Memo117') as TfrxMemoView;
      Memo1.Left := 630.00;
      Memo1 := LASTW_NT37.FindObject('Memo118') as TfrxMemoView;
      Memo1.Left := 695.00;
      Memo1 := LASTW_NT37.FindObject('Memo185') as TfrxMemoView;
      Memo1.Font.Size := 4;
    end;

    if PrintHeaderLaser = False then
    begin
      Memo1 := LASTW_NT37.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('Memo92') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('Memo93') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('Memo94') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('Memo41') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('Memo42') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('Memo43') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('Memo106') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('Memo107') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LASTW_NT37.FindObject('Memo108') as TfrxMemoView;
      Memo1.Visible := False;

    end;
    Memo1 := LASTW_NT37.FindObject('MemoPatEdu') as TfrxMemoView;
    Memo1.Font.Size :=  DM.cdsSetupEDUCATION_FONT_SIZE.Value;

    if Length(cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := LASTW_NT37.FindObject('Memo191') as TfrxMemoView;
      Memo1.Font.Size :=  6;
    end;
    if cdsPrescription_FullHealth_plan_abbreviation.Value = 'CAS' then
    begin
      Memo1 := LASTW_NT37.FindObject('Memo118') as TfrxMemoView;
      Memo1.DataField := 'CASH_RETAIL_PRICE';
      Memo1 := LASTW_NT37.FindObject('Memo91') as TfrxMemoView;
      Memo1.DataField := 'CASH_RETAIL_PRICE';
    end;
  end;
end;


procedure TFrmMain.LAS_TW_35_XPBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
  With DM do
  begin
    if cdsSetupPrintPagoPlan.Value = False then
    begin
      Memo1 := LAS_TW_35_XP.FindObject('Memo88') as TfrxMemoView;
      Memo1.DataField := 'PlanInfo2_NoShowPP';
    end;

    if cdsPrescription_FullPAT_LANGUAGE.Value = 'SPANISH' then
    begin
      LanguageIndex := 1;
      LanguageResOffset := 2000;
    end
    else
    begin
      LanguageIndex := 0;
      LanguageResOffset := 1000;
    end;
    if cdsSetupSTAR_PLUS_INTERFACE.Value = True then
    begin
      Memo1 := LAS_TW_35_XP.FindObject('Memo90') as TfrxMemoView;
      Memo1.Left := 250.00;
      Memo1 := LAS_TW_35_XP.FindObject('Memo91') as TfrxMemoView;
      Memo1.Left := 295.00;
      Memo1 := LAS_TW_35_XP.FindObject('Memo117') as TfrxMemoView;
      Memo1.Left := 630.00;
      Memo1 := LAS_TW_35_XP.FindObject('Memo118') as TfrxMemoView;
      Memo1.Left := 695.00;
      Memo1 := LAS_TW_35_XP.FindObject('Memo185') as TfrxMemoView;
      Memo1.Font.Size := 4;
    end;

    if PrintHeaderLaser = False then
    begin
      Memo1 := LAS_TW_35_XP.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo15') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo16') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo17') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo81') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo101') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo105') as TfrxMemoView;
      Memo1.Visible := False;
    end;
    Memo1 := LAS_TW_35_XP.FindObject('MemoPatEdu') as TfrxMemoView;
    Memo1.Font.Size :=  DM.cdsSetupEDUCATION_FONT_SIZE.Value;

    if Length(cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := LAS_TW_35_XP.FindObject('Memo191') as TfrxMemoView;
      Memo1.Font.Size :=  6;
    end;


    if cdsPrescription_FullHealth_plan_abbreviation.Value = 'CAS' then
    begin
      Memo1 := LAS_TW_35_XP.FindObject('Memo118') as TfrxMemoView;
      Memo1.DataField := 'CASH_RETAIL_PRICE';
      Memo1 := LAS_TW_35_XP.FindObject('Memo91') as TfrxMemoView;
      Memo1.DataField := 'CASH_RETAIL_PRICE';
    end;


    //Memo1 := LAS_TW_35_XP.FindObject('Memo174') as TfrxMemoView;
    //Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,293);

    //Memo1 := LAS_TW_35_XP.FindObject('Memo173') as TfrxMemoView;
    //Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,576);

    Memo1 := LAS_TW_35_XP.FindObject('Memo49') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,508);

    Memo1 := LAS_TW_35_XP.FindObject('Memo24') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,018);

    Memo1 := LAS_TW_35_XP.FindObject('Memo36') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,293);

    Memo1 := LAS_TW_35_XP.FindObject('Memo30') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,576);

    Memo1 := LAS_TW_35_XP.FindObject('Memo48') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,270);

    Memo1 := LAS_TW_35_XP.FindObject('Memo228') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,579);

    Memo1 := LAS_TW_35_XP.FindObject('Memo236') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,580);

    Memo1 := LAS_TW_35_XP.FindObject('Memo237') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,253);

    Memo1 := LAS_TW_35_XP.FindObject('Memo50') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,581);

    Memo1 := LAS_TW_35_XP.FindObject('Memo54') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,293);

    Memo1 := LAS_TW_35_XP.FindObject('Memo55') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,550);

    Memo1 := LAS_TW_35_XP.FindObject('Memo57') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,576);

    Memo1 := LAS_TW_35_XP.FindObject('Memo61') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,366);

    Memo1 := LAS_TW_35_XP.FindObject('Memo80') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,499);

    Memo1 := LAS_TW_35_XP.FindObject('Memo65') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,031);

    Memo1 := LAS_TW_35_XP.FindObject('Memo78') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,578);

    Memo1 := LAS_TW_35_XP.FindObject('Memo120') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,293);

    Memo1 := LAS_TW_35_XP.FindObject('Memo20') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,293);

    Memo1 := LAS_TW_35_XP.FindObject('Memo99') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,576);
  end;
end;

procedure TFrmMain.LAS_TW_35_XP_MUNBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
  With DM do
  begin
    if cdsPrescription_FullPAT_LANGUAGE.Value = 'SPANISH' then
    begin
      LanguageIndex := 1;
      LanguageResOffset := 2000;
    end
    else
    begin
      LanguageIndex := 0;
      LanguageResOffset := 1000;
    end;
    if PrintHeaderLaser = False then
    begin
      Memo1 := LAS_TW_35_XP_MUN.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP_MUN.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP_MUN.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP_MUN.FindObject('Memo15') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP_MUN.FindObject('Memo16') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP_MUN.FindObject('Memo17') as TfrxMemoView;
      Memo1.Visible := False;
      //Memo1 := LAS_TW_35_XP_MUN.FindObject('Memo81') as TfrxMemoView;
      //Memo1.Visible := False;
      //Memo1 := LAS_TW_35_XP_MUN.FindObject('Memo101') as TfrxMemoView;
      //Memo1.Visible := False;
      //Memo1 := LAS_TW_35_XP_MUN.FindObject('Memo105') as TfrxMemoView;
      //Memo1.Visible := False;
    end;
    Memo1 := LAS_TW_35_XP_MUN.FindObject('MemoPatEdu') as TfrxMemoView;
    Memo1.Font.Size :=  DM.cdsSetupEDUCATION_FONT_SIZE.Value;

    if cdsPrescription_FullHealth_plan_abbreviation.Value = 'CAS' then
    begin
      Memo1 := LAS_TW_35_XP_MUN.FindObject('Memo118') as TfrxMemoView;
      Memo1.DataField := 'CASH_RETAIL_PRICE';
      Memo1 := LAS_TW_35_XP_MUN.FindObject('Memo91') as TfrxMemoView;
      Memo1.DataField := 'CASH_RETAIL_PRICE';
    end;
    if Length(cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := LAS_TW_35_XP_MUN.FindObject('Memo191') as TfrxMemoView;
      Memo1.Font.Size :=  6;
    end;
  end;

end;

procedure TFrmMain.OTC3X4_TERMAL_SAVIABeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
    if PrintHeaderZebraOTC = False then
    begin
      Memo1 := OTC3X4_TERMAL_SAVIA.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := OTC3X4_TERMAL_SAVIA.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := OTC3X4_TERMAL_SAVIA.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
    end;
    if Length(DM.cdsPrintQueriesINDICATIONS.Value) > 108 then
    begin
      Memo1 := OTC3X4_TERMAL_SAVIA.FindObject('PRINT_QUERIESINDICATIONS') as TfrxMemoView;
      Memo1.Font.Size := 6;
    end;
end;

procedure TFrmMain.OTC_2_75X3_75_TERMALBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
  if PrintHeaderZebraOTC = False then
  begin
    Memo1 := OTC_2_75X3_75_TERMAL.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
    Memo1.Visible := False;
    Memo1 := OTC_2_75X3_75_TERMAL.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
    Memo1.Visible := False;
    Memo1 := OTC_2_75X3_75_TERMAL.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
    Memo1.Visible := False;
  end;
end;


procedure TFrmMain.OTC_3X4_TERMALBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
    if PrintHeaderZebraOTC = False then
    begin
      Memo1 := OTC_3X4_TERMAL.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := OTC_3X4_TERMAL.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := OTC_3X4_TERMAL.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
    end;

end;

procedure TFrmMain.OTC_3X6_TERMALBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
    if PrintHeaderZebraOTC = False then
    begin
      Memo1 := OTC_3X6_TERMAL.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := OTC_3X6_TERMAL.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := OTC_3X6_TERMAL.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
    end;
    if Length(DM.cdsPrintQueriesINDICATIONS.Value) > 108 then
    begin
      Memo1 := OTC_3X6_TERMAL.FindObject('PRINT_QUERIESINDICATIONS') as TfrxMemoView;
      Memo1.Font.Size := 6;
    end;
end;

function TFrmMain.PrescriptionFullFields: String;
begin
  //Result := ' * ';
  Result := '[RX_NUMBER],[RX_ID],[RX_SERVICE_DATE],[SALES_COST] ,[PLAN_PAY_AMOUNT] '+
      ',[PAT_PAY_AMOUNT]'+
      ',[RX_STATUS]'+
      ',[NO_REF_DISPENSADO]'+
      ',[PHARMACIST]'+
      ',[DAYS_SUPPLY]'+
      ',[AWP]'+
      ',[AUTHORIZATION_NUMBER]'+
      ',[PRICE_TABLE_ID]'+
      ',[DRUG]'+
      ',[NDC]'+
      ',[TYPIST]'+
      ',[BATCH_NUMBER]'+
      ',[QTY]'+
      ',[PRODUCT_ID]'+
      ',[OTC_BATCH_NUMBER]'+
      ',[RX_SIG]'+
      ',[RX_DATE]'+
      ',[RX_QTY_PRESCRIBED]'+
      ',[PAT_CLIENT_NUMBER]'+
      ',[RXORIGINCODE]'+
      ',[PAT_NAME]'+
      ',[PAT_LASTNAME]'+
      ',[PAT_MAIDENNAME]'+
      ',[PAT_TELEPHONE]'+
      ',[PAT_CELULAR]'+
      ',[PAT_SEX]'+
      ',[PAT_DOB]'+
      ',[PAT_LANGUAGE]'+
      ',[PAT_ADDRESS1]'+
      ',[PAT_ADDRESS2]'+
      ',[PAT_CITY]'+
      ',[PAT_STATE]'+
      ',[PAT_ZIPCODE]'+
      ',[PRESC_NUMBER]'+
      ',[PRESC_MAIDENNAME]'+
      ',[PAT_IDENTIFICATION]'+
      ',[PRESC_LASTNAME]'+
      ',[PRESC_NAME]'+
      ',[PRESC_TEL]'+
      ',[PRESC_FAX]'+
      ',[PRESC_NPI]'+
      ',[PRESC_EMAIL]'+
      ',[PRESC_ADD1]'+
      ',[PRESC_STATE]'+
      ',[PRESC_ZIP]'+
      ',[PRESC_ADDRESS2]'+
      ',[PRESC_CITY]'+
      ',[PRESC_CEL]'+
      ',[DEA_FEDERAL]'+
      ',[PLAN_NAME]'+
      ',[PLAN_BINNUBER]'+
      ',[PLAN_SUPPORT_TEL]'+
      ',[RX_REF_AUTHORIZED]'+
      ',[RX_QTY_AVAILABLE]'+
      ',[DAW]'+
      ',[RX_CONTROL]'+
      ',[RX_LAST_REFILL_DATE]'+
      ',[Health_plan_abbreviation]'+
      ',[WF_BILLED]'+
      ',[WF_PRINTED]'+
      ',[WF_FILLED]'+
      ',[WF_CHECKED]'+
      ',[WF_DELIVERED]'+
      ',[WF_TYPED]'+
      ',[TOTAL]'+
      //',[OTCNUMBER]'+
      ',[CASH_RETAIL_PRICE]'+
      ',[MED_CHART]'+
      ',[CLAIM_STATUS]'+
      ',[BILL_LATTER]'+
      ',[FACILITY_ID]'+
      ',[PATPLAN_NUMBER]'+
      ',[COMPOUNDCODE]'+
      ',[PRESCRIBERIDQUALIFIER]'+
      //',[RX_TRANSACTION_NUMBER]'+
      ',[METRICDECIMALQUANTITY]'+
      ',[RX_ACTIVE]'+
      ',[SIG]'+
      ',[RX_DISPENSING_FEE_PAID]'+
      ',[MEDICAMENTOMIX]'+
      ',[ADHERENCE]'+
      ',[RX_OTHER_AMOUNT_PAID]'+
      ',[WF_STORAGE]'+
      ',[WF_CASHIER]'+
      ',[WF_SIGNATURE]'+
      ',[ALCHEMY_PRODUCTID]'+
      ',[MARKETEDPRODUCTID]'+
      ',[PA]'+
      ',[WF_REVERSE]'+
      ',[AUTOMATIC_REFILL]'+
      ',[REFILL_NOTIFIED]'+
      ',CONVERT(VARCHAR(MAX), NOTE_STR) AS NOTE'+
      ',[IOU] ' +
      ',[DRUG_EXPIRATION]';
end;

procedure TFrmMain.PXT_2HRI_1TMPBeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
  With DM do
  begin
    if cdsSetupPrintPagoPlan.Value = False then
    begin
      Memo1 := PXT_2HRI_1.FindObject('Memo88') as TfrxMemoView;
      Memo1.DataField := 'PlanInfo2_NoShowPP';
    end;

    if cdsPrescription_FullPAT_LANGUAGE.Value = 'SPANISH' then
    begin
      LanguageIndex := 1;
      LanguageResOffset := 2000;
    end
    else
    begin
      LanguageIndex := 0;
      LanguageResOffset := 1000;
    end;
    if PrintHeaderLaser = False then
    begin
      Memo1 := PXT_2HRI_1.FindObject('Memo17') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo18') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo19') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo95') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo96') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo97') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo126') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo127') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo128') as TfrxMemoView;
      Memo1.Visible := False;

      {
      Memo1 := PXT_2HRI_1.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo15') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo16') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo81') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo101') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := PXT_2HRI_1.FindObject('Memo105') as TfrxMemoView;
      Memo1.Visible := False;
      }
    end;
    Memo1 := PXT_2HRI_1.FindObject('MemoPatEdu') as TfrxMemoView;
    Memo1.Font.Size :=  DM.cdsSetupEDUCATION_FONT_SIZE.Value;

    if Length(cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := PXT_2HRI_1.FindObject('Memo191') as TfrxMemoView;
      Memo1.Font.Size :=  6;
    end;


    if cdsPrescription_FullHealth_plan_abbreviation.Value = 'CAS' then
    begin
      Memo1 := PXT_2HRI_1.FindObject('Memo118') as TfrxMemoView;
      Memo1.DataField := 'CASH_RETAIL_PRICE';
      Memo1 := PXT_2HRI_1.FindObject('Memo91') as TfrxMemoView;
      Memo1.DataField := 'CASH_RETAIL_PRICE';
    end;


    //if cdsPrescription_FullCOMPOUNDCODE.Value = 1 then
    //begin
    //  Memo1 := PXT_2HRI_1.FindObject('Memo186') as TfrxMemoView;
    //  Memo1.DataField := 'Compound_Expi';
    //end;



    {Memo1 := PXT_2HRI_1.FindObject('Memo174') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,293);

    Memo1 := PXT_2HRI_1.FindObject('Memo173') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,576);

    Memo1 := PXT_2HRI_1.FindObject('Memo49') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,508);

    Memo1 := PXT_2HRI_1.FindObject('Memo24') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,018);

    Memo1 := PXT_2HRI_1.FindObject('Memo36') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,293);

    Memo1 := PXT_2HRI_1.FindObject('Memo30') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,576);

    Memo1 := PXT_2HRI_1.FindObject('Memo48') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,270);

    Memo1 := PXT_2HRI_1.FindObject('Memo228') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,579);

    Memo1 := PXT_2HRI_1.FindObject('Memo236') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,580);

    Memo1 := PXT_2HRI_1.FindObject('Memo237') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,253);

    Memo1 := PXT_2HRI_1.FindObject('Memo50') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,581);

    Memo1 := PXT_2HRI_1.FindObject('Memo54') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,293);

    Memo1 := PXT_2HRI_1.FindObject('Memo55') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,550);

    Memo1 := PXT_2HRI_1.FindObject('Memo57') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,576);

    Memo1 := PXT_2HRI_1.FindObject('Memo61') as TfrxMemoView;
    Memo1.Memo.Text := TResourceLocalizer.GetString(LanguageResOffset,366);
    }

  end;
end;

procedure TFrmMain.PXT_6G1ABeforePrint(Sender: TfrxReportComponent);
Var
  Memo1: TfrxMemoView;
begin
  With DM do
  begin
    if cdsSetupPrintPagoPlan.Value = False then
    begin
      Memo1 := LAS_TW_35_XP.FindObject('Memo88') as TfrxMemoView;
      Memo1.DataField := 'PlanInfo2_NoShowPP';
    end;

    if cdsPrescription_FullPAT_LANGUAGE.Value = 'SPANISH' then
    begin
      LanguageIndex := 1;
      LanguageResOffset := 2000;
    end
    else
    begin
      LanguageIndex := 0;
      LanguageResOffset := 1000;
    end;
    if cdsSetupSTAR_PLUS_INTERFACE.Value = True then
    begin
      Memo1 := LAS_TW_35_XP.FindObject('Memo90') as TfrxMemoView;
      Memo1.Left := 250.00;
      Memo1 := LAS_TW_35_XP.FindObject('Memo91') as TfrxMemoView;
      Memo1.Left := 295.00;
      Memo1 := LAS_TW_35_XP.FindObject('Memo117') as TfrxMemoView;
      Memo1.Left := 630.00;
      Memo1 := LAS_TW_35_XP.FindObject('Memo118') as TfrxMemoView;
      Memo1.Left := 695.00;
      Memo1 := LAS_TW_35_XP.FindObject('Memo185') as TfrxMemoView;
      Memo1.Font.Size := 4;
    end;

    if PrintHeaderLaser = False then
    begin
      Memo1 := LAS_TW_35_XP.FindObject('frxDBDataset2STORENAMEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('frxDBDataset2STOREADDRESSHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('frxDBDataset2STOREPHONEHEADING') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo15') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo16') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo17') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo81') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo101') as TfrxMemoView;
      Memo1.Visible := False;
      Memo1 := LAS_TW_35_XP.FindObject('Memo105') as TfrxMemoView;
      Memo1.Visible := False;
    end;
    Memo1 := LAS_TW_35_XP.FindObject('MemoPatEdu') as TfrxMemoView;
    Memo1.Font.Size :=  DM.cdsSetupEDUCATION_FONT_SIZE.Value;

    if Length(cdsPrescription_FullSIG.Value) > 85 then
    begin
      Memo1 := LAS_TW_35_XP.FindObject('Memo191') as TfrxMemoView;
      Memo1.Font.Size :=  6;
    end;
    if cdsPrescription_FullHealth_plan_abbreviation.Value = 'CAS' then
    begin
      Memo1 := LAS_TW_35_XP.FindObject('Memo118') as TfrxMemoView;
      Memo1.DataField := 'CASH_RETAIL_PRICE';
      Memo1 := LAS_TW_35_XP.FindObject('Memo91') as TfrxMemoView;
      Memo1.DataField := 'CASH_RETAIL_PRICE';
    end;
  end;
end;


Procedure TFrmMain.Print_Receipt_FR;
begin
  With DM do
  begin
    //FrmReceipt := TFrmReceipt.Create(self);
    With FrmReceipt do
    begin
      CDSTransHead.Close;
      CDSTransHead.CommandText := 'Select * from TRANSACTIONHEADER where TRANSACTIONNUMBER = ' + cdsPrintQueriesTRANSACTION_NUMBER.AsString;
      CDSTransHead.Open;
      if CDSTransHeadTRANSACTIONNUMBER.Value > 0 then
      begin
        if (cdsPrintQueriesPRINT_TYPE.Value = 0) then //0 Print
        begin
          //if (Trim(cdsPrintQueriesLABEL_NAME.Value) = 'RestReceipt') then
          if (Trim(cdsPrintQueriesLABEL_NAME.Value) = 'receipt') then
          begin
            if PrintToScreen = True then
            begin
              RestReceipt.PrepareReport;
              RestReceipt.ShowReport;
            end
            else
            begin
              RestReceipt.PrepareReport;
              RestReceipt.Print;
            end;
          end;
          if Trim(cdsPrintQueriesLABEL_NAME.Value) = 'FoodReceipt' then
          begin
            if PrintToScreen = True then
            begin
              FoodReceipt.PrepareReport;
              FoodReceipt.ShowReport;
            end
            else
            begin
              FoodReceipt.PrepareReport;
              FoodReceipt.Print;
            end;
          end;
        end;
        if (cdsPrintQueriesPRINT_TYPE.Value = 1) then //email
        begin
          //SendEmailPharmatec('axelcarreras@gmail.com', IntToStr(FrmReceipt.CDSTransHeadTRANSACTIONNUMBER.Value) + '.pdf');
          SendEmailPharmatec(Trim(cdsPrintQueriesEMAIL.Value), IntToStr(FrmReceipt.CDSTransHeadTRANSACTIONNUMBER.Value) + '.pdf');
        end;
        //Receipt.PrepareReport;
        //Receipt.ShowReport;
      end;
      //FrmReceipt := nil;
      //FrmReceipt.Free;
    end;
  end;
end;

procedure TFrmMain.PrintReceipt(TransNo, NoRecibos: Integer; FinalReceipt: Boolean; TransType, TripleS_previousBalance, TripleS_ApprovedAmount, TripleS_finalBalance: String);
Var
  loops, Cnt: Integer;
  Cred, LWay: Boolean;
  DeudaLocal, DeudaLayaway: Double;
  Taxable: String;
  {
  cm: txPosRequest;
  Response: txPosResponse;
  //Response: ivuLotoData;
  D: TXSDateTime;
  MTax, STax, TotalV, SubTotalV: TXSDecimal;
  TenderTypeS: tenderType;
  MyTxServer: TxServer;
  }
  SubTotalF: Double;
  IVULotoDate: String;
  Counter: Integer;
  loop: Boolean;
  lStringList: TStringList;
  I,J, NoOf: Integer;
  Receipt: String;
  Page1: TfrxReportPage;
  Note: String;
  customerId: Integer;
  customerStr, GetResult, response: String;
  bm: TBitmap;
  PT1, PT2: String;
  AbonoCredito, AbonoLayaway: Boolean;
  iNumItems: Integer;
  sTitle1, sTitle2, sTitle3, sTitle4, sMessage: String;
begin
  With DM do
  begin
      //Memo1.Lines.Add('Printing process');
      if Trim(CommonRoutine.TransType) = '' then CommonRoutine.TransType := Trim(cdsPrintQueriesTRANS_TYPE.Value);

      response := '';
      loops := 0;
      //While loops <> NoRecibos do
      begin
        loops := loops + 1;
        if FinalReceipt = True then
        begin
          //OpenDrawer;
        end;
        {if (CommonPos.Customer > 0) or (CommonPOS.Trans_AbonoCredito > 0) then
        begin
          DeudaLocal := DM.CDSClientesDEUDA.asFloat; //Queries.DeudaCliente(CommonPos.Customer);
          DeudaLayaway := DM.CDSClientesLAWAY.asFloat;//Queries.DeudaClienteLayaway(CommonPos.Customer);
        end;}
        Cred := False;
        LWay := False;
        if (Restaurant = True) and (FinalReceipt = True) then
        begin
          With DM do
          begin
            cdsOpenTabs.Close;
            cdsOpenTabs.CommandText := 'Select * from OPEN_TABS where TRANSACTIONNUMBER = ' + IntToStr(TransNo);
            cdsOpenTabs.Open;
          end;
        end;
        With DM.CDSTransHead do
        Begin
          Active := False;
          if FinalReceipt = True then
            CommandText := 'select * from transactionheader where transactionnumber = ' + IntToStr(TransNo)
          else
            CommandText := 'select * from transactionheader_temp where transactionnumber = ' + IntToStr(TransNo);
          Active := True;
          PT1 := CDSTransHeadPAYMENTTYPE1.Value;
          PT2 := CDSTransHeadPAYMENTTYPE2.Value;
          if (CDSTransHeadCUSTOMERID.Value > 0) and (Trim(CDSTransHeadTRANS_TYPE.Value) = 'CR') then
            AbonoCredito := true
          else
            AbonoCredito := false;
          if (CDSTransHeadCUSTOMERID.Value > 0) and (Trim(CDSTransHeadTRANS_TYPE.Value) = 'LA') then
            AbonoLayaway := true
          else
            AbonoLayaway := false;


          If (FieldByName('PaymentType1').asString = 'CRED') OR (FieldByName('PaymentType2').asString = 'CRED') then
            Cred := True;
          If (FieldByName('PaymentType1').asString = 'LWAY') OR (FieldByName('PaymentType2').asString = 'LWAY') then
            LWay := True;
          //================================IVULOTO=====================================
          Try
            if (loops = 1) and (FinalReceipt = True) and (IVULOTO_ACTIVO = True) then
            begin
              GetIVULoto(Trim(FieldByName('PaymentType1').asString));
            end;
          except
            //
          end;

          //===============================================================================

          //If ReceiptPrinter <> '' then
          //  SelectPrinter(ReceiptPrinter)
          //else
          //  SelectPrinter('EPSON');
          //============= Print logo image =====================================

          {if PrintToScreen = false then
          begin
            try
              bm := TBitmap.Create;
              bm.LoadFromFile('C:\Wescom_Decimal\SalesTech2017\images\PayPalST.bmp');
              PrintBitmap(bm);
            finally
              bm.Free;
            end;
          end;}
          //=====================================================================

          With FrmReceiptView do        //FrmMain
          begin
            With RichEdit1 do
            begin
              //CommonRoutine.PrintHeading(StrToInt(RegisterNo), TransNo);
              CommonRoutine.PrintHeading(CDSTransHeadREGISTER.Value, TransNo);
              //--------------- Active Pinpad ---------------------------------- }
              if (ActivePin = True) then
              begin
                if IsNumeric(EvertecID) = true then
                begin
                  if StrToInt(EvertecID) > 0 then
                    FDQueryPOS.SQL.Text := 'Select RESPONSE from Evertec where id = ' + EvertecID
                  else
                    FDQueryPOS.SQL.Text := 'Select RESPONSE from Evertec where TRANSACTIONNUMBER = ' + IntToStr(TransNo);
                end
                else
                  FDQueryPOS.SQL.Text := 'Select RESPONSE from Evertec where TRANSACTIONNUMBER = ' + IntToStr(TransNo);
                FDQueryPOS.Open();
                //Memo1.Lines.Add('record count: ' + FDQueryPOS.RecordCount.ToString);
                if FDQueryPOS.RecordCount > 0 then
                begin
                  FDQueryPOS.Last;
                  response := FDQueryPOS.fieldbyName('RESPONSE').Value;
                  if Pos('SETTLE', response) > 0 then
                  begin
                    CommonRoutine.PrintSettlement(response);
                    exit;
                  end
                  else
                  begin
                    Lines.Add('------------------------------------');
                    CommonRoutine.PrintValues(response);
                    Lines.Add('------------------------------------');
                  end;
                end
                else
                  response := '';
              end
              else if SpinPOSactive = true then
              begin
                FDQueryPOS.Close;
                FDQueryPOS.SQL.Text := 'Select RESPONSE from SPINPOS where TRANSACTIONNUMBER = ' + IntToStr(TransNo);
                FDQueryPOS.Open;
                if FDQueryPOS.RecordCount > 0 then
                begin
                  FDQueryPOS.Last;
                  Lines.Add('------------------------------------');
                  CommonRoutine.printSpinValues(FDQueryPOS.FieldByName('response').Value);
                  Lines.Add('------------------------------------');
                end;
              end;
              if CommonRoutine.Void = false then
              begin
                if Restaurant = True then
                begin
                  Lines.Add('# OF ITEMS: ' + CDSTransHead.FieldByName('NumberItems').asString);
                  if cdsOpenTabs.RecordCount > 0 then
                  begin
                    Lines.Add('Server: ' + Trim(cdsOpenTabsSERVER_DEFINE.Value));
                    LblDummy.Font.Style := [fsBold];
                    SelAttributes.Assign(LblDummy.Font);
                    Lines.Add('Customer: ' + Trim(cdsOpenTabsCUSTOMER.Value));
                  end;
                end
                else
                begin
                  Lines.Add('User: ' + CDSTransHeadEMPLOYNUMBER.Value + '  # OF ITEMS: ' + CDSTransHead.FieldByName('NumberItems').asString);
                end;
                iNumItems := StrToInt(CDSTransHead.FieldByName('NumberItems').Value);
                Lines.Add('------------------------------------');
                if CommonRoutine.TransType <> 'BALANCE' then
                begin
                  With cdsTransDetail do
                  Begin
                    //Memo1.Lines.Add('Trans detail');
                    Active := False;
                    if FinalReceipt = True then
                    begin
                      CommandText := 'Select [IDNUMBER] ,[TRANSACTIONNUMBER],[UPC] ,[TOTAL] ,[VOIDED] ' +
                      ',[SUBDETAIL] ,[PRODDESCRIPTION] ,[PRODDEPARTMENT],[REGTOTAL] ,[FOOD] ,[PRICE],[REGPRICE] '+
                      ',[MODIFIED] ,[DISCOUNT],[COSTO],[FECHAVENTA],[SUPLIDOR],[TOTAL_VALUE],[AWP],[ID],[TAX]'+
                      ',[PRODUCTNO],[TAX_ESTATAL],[TAX_MUNICIPAL],[QTY],[OPENED],[GROUP_PROD],[REGISTER],[SUPERVISOR]'+
                      ',[PATROCINIO],[SUBDEPARTAMENTO], [MAIN_COURSE], [MAIN_COURSE_ID], [TERMINO], [BARCODEALTERNO1]  FROM TransactionDetail WHERE TransactionNumber = ' + IntToStr(TransNo) + ' Order By IDNumber';
                    end
                    else
                    begin
                      CommandText := 'Select [IDNUMBER] ,[TRANSACTIONNUMBER],[UPC] ,[TOTAL] ,[VOIDED] ' +
                      ',[SUBDETAIL] ,[PRODDESCRIPTION] ,[PRODDEPARTMENT],[REGTOTAL] ,[FOOD] ,[PRICE],[REGPRICE] '+
                      ',[MODIFIED] ,[DISCOUNT],[COSTO],[FECHAVENTA],[SUPLIDOR],[TOTAL_VALUE],[AWP],[ID],[TAX]'+
                      ',[PRODUCTNO],[TAX_ESTATAL],[TAX_MUNICIPAL],[QTY],[OPENED],[GROUP_PROD],[REGISTER],[SUPERVISOR]'+
                      ',[PATROCINIO],[SUBDEPARTAMENTO], [MAIN_COURSE], [MAIN_COURSE_ID], [TERMINO], [BARCODEALTERNO1] FROM TransactionDetail_TEMP WHERE TransactionNumber = ' + IntToStr(TransNo) + ' Order By IDNumber';
                    end;
                    Active := True;
                    First;
                    While Not EOF do
                    Begin
                      if (FieldByName('Tax_Estatal').asString = 'T') or (FieldByName('Tax_Municipal').asString = 'T') then Taxable := 'T' else Taxable := 'F';
                      Lines.Add(Format('%26s %8s%1s',[
                      Copy(LeftJString(FieldByName('ProdDescription').asString + ' '
                      + FieldByName('SubDetail').asString,26),1,26),
                      Format('%m',[FieldByName('Total').asFloat]),
                      Taxable]));
                      IF (FieldByName('Qty').asInteger > 1) Or (FieldByName('Qty').asInteger < -1) then
                      begin
                        Lines.Add('          ' + FieldByName('Qty').asString + ' @ ' +
                                Format('%m',[FieldByName('Price').asFloat]));
                      end;
                      Next;
                    end;
                    Close;
                  end;
                end;

                With DM.CDSTransHead do
                Begin
                  //Memo1.Lines.Add('Trans head');
                  LblDummy.Font.Size := FrmMain.PrinterFontSize;//6;
                  GetTotal_lines(TransType, FinalReceipt, DeudaLocal, DeudaLayaway, CDSTransHeadCUSTOMERID.Value);
                  Active := False;
                end;
                Lines.Add('');
                Lines.Add('');
                Lines.Add('');
                //============================Triple S OTC ===================
                if (TripleS_previousBalance <> '0') and (TripleS_previousBalance <> '') then
                begin
                      Lines.Add('');
                      Lines.Add('------------------------------------');
                      Lines.Add(' TRIPLE-S ADVANTAGE OTC BALANCE: ');
                      Lines.Add('------------------------------------');
                      Lines.Add(' PREVIOUS BALANCE: ' +  TripleS_previousBalance);
                      Lines.Add(' APPROVED AMOUNT: ' + TripleS_ApprovedAmount);
                      Lines.Add(' NEW BALANCE: '+ TripleS_finalBalance);
                      Lines.Add('------------------------------------');
                      Lines.Add('');
                      Lines.Add('');
                end;
                //============================ Titles =======================     //[2025/09/01 jb] added
                if (iNumItems>0) then
                begin
                  qCounters.SQL.Text := 'Select * from counters' ;
                  qCounters.Open();
                  if qCounters.RecordCount > 0 then
                  begin
                    if (qCounters.FieldByName('titulo1').Value > '') or (qCounters.FieldByName('titulo2').Value > '')
                    or (qCounters.FieldByName('titulo3').Value > '') or (qCounters.FieldByName('titulo4').Value > '')
                    or (qCounters.FieldByName('ReceiptMessage').Value > '') then
                    begin
                      qCounters.Last;
                      Lines.Add('');
                      Lines.Add('');
                      Lines.Add(CenterString(qCounters.fieldbyName('titulo1').Value,36));
                      Lines.Add(CenterString(qCounters.fieldbyName('titulo2').Value,36));
                      Lines.Add(CenterString(qCounters.fieldbyName('titulo3').Value,36));
                      Lines.Add('');
                      Lines.Add('');
                      Lines.Add(qCounters.fieldbyName('ReceiptMessage').Value);
                      Lines.Add('');
                    end;
                  end;
                end;
                //----------------------------------------------------------------
                //============================IVULoto===========================
                if (ActivePin = true) and (Trim(response) > '') then
                begin
                  CommonRoutine.PrintIvuLoto(response);
                end
                else
                if (IVULOTO_ACTIVO = True) and (FinalReceipt = True) then
                begin
                  Try
                    begin
                      Lines.Add('');
                      Lines.Add('---------------------------');
                      Lines.Add('------------------------------------');
                      Lines.Add(' CONTROL    : ' + IVULotoControlNumber);
                      Lines.Add(' ST');
                      Lines.Add('----Processed by Softek---');
                      Lines.Add('');
                      Lines.Add('');
                      Lines.Add('');
                    end;
                  except
                  end;
                end;
                //----------------------------------------------------------------
                Lines.Add('');
                cdsSetup.Close;
                cdsSetup.Open;
                Lines.Add(CenterString(CDSSetupRECEIPT_MESSAGE.Value,36));
              end;
              if TransType = 'DLVR' then
              begin
                Lines.Add(Note);
              end;
              if PrintToScreen = False then
              begin
                for I := 0 to cdsPrintQueriesCOPIES.Value-1 do
                begin
                  if (Trim(response) > '')
                  and (I > 0) then
                  begin
                      Lines.Add('');
                      Lines.Add(CenterString('*** MERCHANT COPY ***',36));
                      Lines.Add('');
                      Lines.Add('');
                  end;
                  //Memo1.Lines.Add('Printing');
                  Print('');
                  //Memo1.Lines.Add('Printed');
                end;
              end
              else
              begin
                //ShowMessage('Print to screen...');
                FrmReceiptView.Show;
              end;
            end;
            CommonRoutine.Void := false;
            response := '';
            CommonRoutine.TransType := '';
          end;
        end;
      end;
  end;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
var
 r: TRect;
 i: Integer;
 begin
   with Printer do
   begin
     r := Rect(200,200,(Pagewidth - 200),(PageHeight - 200));
     BeginDoc;
     Canvas.Brush.Style := bsClear;
     for i := 0 to Memo1.Lines.Count do
       Canvas.TextOut(200,200 + (i * Canvas.TextHeight(Memo1.Lines.Strings[i])), Memo1.Lines.Strings[i]);
     Canvas.Brush.Color := clBlack;
     Canvas.FrameRect(r);
     EndDoc;
   end;
 end;

procedure TFrmMain.Button3Click(Sender: TObject);
begin
  //CommonRoutine.PrintSettlement(0)
end;

function TFrmMain.CenterString(InStr: String; StrLen: Integer): String;
Var
  Xpos, X : Integer;
begin
  InStr := Trim(InStr);
  Xpos := Trunc((StrLen - Length(InStr))/2);
  For X := 1 to Xpos do
    InStr := ' ' + InStr;
  Result := InStr;
end;

function TFrmMain.LeftJString(InStr: String; StrLen: Integer): String;
Var
  Xpos, X : Integer;
begin
  InStr := Trim(InStr);
  Xpos := (StrLen - Length(InStr));
  For X := 1 to Xpos do
    InStr := InStr + ' ';
  Result := InStr;
end;

procedure TFrmMain.SelectPrinter(PrnText: String);
Var
  I: Integer;
Begin
  For I := 0 To Printer.Printers.Count - 1 do
  Begin
    If Pos (PrnText,Printer.Printers[I]) <> 0 then
    Begin
      Printer.PrinterIndex := I;
    end;
  end;
end;


function TFrmMain.GetTotal_lines(TransType: String; FinalReceipt: Boolean; DeudaLocal, DeudaLayaway: Double; NoCliente: Integer): Boolean;
Var
  PrintPaymentType, PrintPaymentType2: String;
begin
  With DM do
  Begin
    With FrmReceiptView.RichEdit1 do
    begin
      Lines.Add('------------------------------------');
      Lines.Add(Format('%24s %10s',['SUB TOTAL:', Format('%m',[CDSTransHeadSUBTOTAL.asFloat])]));
      Lines.Add('------------------------------------');
      Lines.Add(Format('%24s %10s',['STATE TAX:', Format('%m',[CDSTransHeadTAX_ESTATAL.asFloat])]));
      //if CDSTransHeadTAX_PROCESSED_FOOD.asFloat <> 0 then
      Lines.Add(Format('%24s %10s',['REDUCED TAX:', Format('%m',[CDSTransHeadTAX_PROCESSED_FOOD.asFloat])]));
      Lines.Add(Format('%24s %10s',['MUNICIPAL TAX:', Format('%m',[CDSTransHeadTAX.asFloat])]));
      if Restaurant = False then
      begin
        if CDSTransHeadTAX_SERVICIO.asFloat > 0 then
        Lines.Add(Format('%24s %10s',['SERVICE TAX:', Format('%m',[CDSTransHeadTAX_SERVICIO.asFloat])]));
      end;
      Lines.Add('------------------------------------');
      if FinalReceipt = False then
        Lines.Add(Format('%24s %10s',['CHECK:', Format('%m',[CDSTransHeadTOTAL.asFloat])]));

      if (Restaurant = True) and (FinalReceipt = False) then
      begin
        Lines.Add('');
        Lines.Add(Format('%24s %8s',['GRATUITY:', '___________']));
        Lines.Add('');
        Lines.Add(Format('%24s %8s',['TOTAL:', '___________']));
      end
      else
      begin
        if Restaurant = True then
          Lines.Add(Format('%24s %10s',['GRATUITY:', Format('%m',[CDSTransHeadTOTAL_TIP.asFloat])]));
      end;
      if FinalReceipt = True then
      begin
        Lines.Add(Format('%24s %10s',['TOTAL:', Format('%m',[CDSTransHeadTOTAL.asFloat + CDSTransHeadTOTAL_TIP.asFloat])]));
      end;

      if Copy(CDSTransHeadPaymentType1.asString,1,4) = 'TFAM'  then
        PrintPaymentType := 'EBT'
      else
        PrintPaymentType := Copy(CDSTransHeadPaymentType1.asString,1,4);

      if Copy(CDSTransHeadPaymentType2.asString,1,4) = 'TFAM'  then
        PrintPaymentType2 := 'EBT'
      else
        PrintPaymentType2 := Copy(CDSTransHeadPaymentType2.asString,1,4);

      If CDSTransHeadPayAmount1.asFloat > 0 then
      begin
        Lines.Add(Format('%24s %10s',
                [UpperCase(Copy(PrintPaymentType,1,4)+':'),
                Format('%m',[CDSTransHeadPayAmount1.asFloat])]));
        If CDSTransHeadPayAmount2.asFloat > 0 then
        begin
          Lines.Add(Format('%24s %10s',
                  [UpperCase(Copy(PrintPaymentType2,1,4)+':'),
                  Format('%m',[CDSTransHeadPayAmount2.asFloat])]));
        end;
      end;

      IF FinalReceipt = True then Lines.Add(Format('%24s %10s',['CHANGE:', Format('%m',[CDSTransHeadChange.asFloat])]));

      If (CDSTransHeadRegTotal.asFloat - CDSTransHeadTotal.asFloat > 0) AND
         (CDSTransHeadPaymentType1.asString <> 'POUT') then
      begin
        Lines.Add(Format('%24s %10s',['SU AHORRO:',Format('%m',[CDSTransHeadRegTotal.asFloat - CDSTransHeadTotal.asFloat])]));
      end;

      If (NoCliente > 0) then
      begin
        dm.CDSClientes.Close;
        DM.CDSClientes.CommandText := 'Select * from Pacientes where NumeroCliente = ' + IntToStr(NoCliente);
        DM.CDSClientes.Open;

        //if (TransType = 'CRED') or (CommonPOS.Trans_AbonoCredito > 0) or
        //(DeudaLocal > 0) then
        //if (TransType = 'CRED') or (Trim(CDSTransHeadTRANS_TYPE.Value) = 'CR') then
        if (Trim(CDSTransHeadPAYMENTTYPE1.Value) = 'CRED') or
           (Trim(CDSTransHeadPAYMENTTYPE2.Value) = 'CRED') or
           (Trim(CDSTransHeadTRANS_TYPE.Value) = 'CR')then
        begin
          Lines.Add('');
          Lines.Add(dm.CDSClientesNombreCompleto2.Value);
          //If FrmMain.PrintBalance then
          begin
            Lines.Add('BALANCE CREDITO: ' + Format('%m', [CDSClientesDEUDA.asFloat]));//Format('%m', [CDSClientesDEUDA.asFloat + FieldByName('Total').asFloat]));
          end;
          Lines.Add('');
          Lines.Add('Firma: __________________________ ');
          Lines.Add('');
        end;

        if (TransType = 'LWAY') or (DM.CDSTransHeadTRANS_TYPE.Value = 'ALWAY') then //(AbonoLayawayCR = True) then
        begin
          Lines.Add('');
          Lines.Add(dm.CDSClientesNombreCompleto2.Value);
          //If FrmMain.PrintBalance then
          Lines.Add('BALANCE LAY AWAY: ' + Format('%m', [DeudaLayaway]));
          Lines.Add('');
          Lines.Add('Firma: __________________________ ');
          Lines.Add('');
        end;

        //if (PatrocinioActivo = True) or (RedimirPatrocinioActivo = True) then
        if Trim(CDSTransHeadTRANS_TYPE.Value) = 'PC' then
        begin
          Lines.Add('');
          Lines.Add(dm.CDSClientesNombreCompleto2.Value);
          Lines.Add('Patrocinio: ' + Format('%m', [dm.CDSClientesPATROCINIO.asFloat]));
          Lines.Add('');
          Lines.Add('Firma: __________________________ ');
          Lines.Add('');
        end;
      end;


      {
      if CommonPOS.MemoStr > '' then
      begin
         Lines.Add(CommonPOS.MemoStr);
      end;
       }
      //CommonPOS.MemoStr := '';

      //--------------------------- Suggested Tip -----------------------
      if (Restaurant = True) and (FinalReceipt = False) then
      begin
        Lines.Add('');
        Lines.Add(CenterString('Suggested Tip: ' + Format('%f', [dm.CDSSetupTIP_PERCENTAGE1.asFloat]) + '%  - ' + Format('%m', [dm.CDSTransHead.FieldByName('TOTAL').asFloat * dm.CDSSetupTIP_PERCENTAGE1.asFloat]),35));
        Lines.Add(CenterString('Suggested Tip: ' + Format('%f', [dm.CDSSetupTIP_PERCENTAGE2.asFloat]) + '%  - ' + Format('%m', [dm.CDSTransHead.FieldByName('TOTAL').asFloat * dm.CDSSetupTIP_PERCENTAGE2.asFloat]), 35));
        Lines.Add(CenterString('Suggested Tip: ' + Format('%f', [dm.CDSSetupTIP_PERCENTAGE3.asFloat]) + '%  - ' + Format('%m', [dm.CDSTransHead.FieldByName('TOTAL').asFloat * dm.CDSSetupTIP_PERCENTAGE3.asFloat]), 35));
      end;
      //Active := False;
    end;
  end;
end;



procedure TFrmMain.Print_report(LabelName, Printfrom: String);
var
  ReportName: TfrxReport;
  Page: TfrxReportPage;
  MemoObj: TfrxMemoView;
  DoPrintPatEdu: Boolean;
  L: string;

  function PickReportForOTC(const ALabel: string): TfrxReport;
  begin
    Result := nil;

    if SameText(ALabel, 'RX3X4_TERMAL_SAVIA') then Exit(OTC3X4_TERMAL_SAVIA);

    if SameText(ALabel, '3X4_TERMAL_A') or SameText(ALabel, '3X4_TERMAL') then
      Exit(OTC_3X4_TERMAL);

    if SameText(ALabel, 'R3X6_TERMAL_A') or SameText(ALabel, 'R3X6_TERMAL_B') then
      Exit(OTC_3X6_TERMAL);

    if SameText(ALabel, 'DOT_MATRIX_3X3.5') or SameText(ALabel, '2.75X3.75_TERMAL') then
      Exit(OTC_2_75X3_75_TERMAL);

    if SameText(ALabel, 'LAS-TW#35-XP') then Exit(OTC_LAS_TW_35_XP);
    if SameText(ALabel, 'LASCL_13TL') then Exit(OTC_LASCL_13TL);

    // ✅ Step-1(A): NEW LASER LABEL (OTC too if it ever comes as OTC)
    if SameText(ALabel, 'LBL_MAIN_LSER') then Exit(LBL_MAIN_LSER);

    if SameText(ALabel, 'LASTW_NT37') then Exit(LASTW_NT37);
  end;

  function PickReportForRX(const ALabel: string; out APrintPatEdu: Boolean): TfrxReport;
  begin
    Result := nil;
    APrintPatEdu := False;

    if SameText(ALabel, 'LASCL_13TL') then
    begin
      APrintPatEdu := True;
      Exit(LASCL_13TL);
    end;

    if SameText(ALabel, 'LASCL-S13TL') then
    begin
      APrintPatEdu := False;
      Exit(LASCL_S13TL);
    end;

    if SameText(ALabel, 'LASTW_NT37') then
    begin
      APrintPatEdu := False;
      Exit(LASTW_NT37);
    end;

    if SameText(ALabel, 'PXT-6G1A-FS') then
    begin
      APrintPatEdu := False;
      Exit(PXT_6G1A);
    end;

    if SameText(ALabel, 'PXT-2HRI-1') then
    begin
      APrintPatEdu := False;
      Exit(PXT_2HRI_1);
    end;

    if SameText(ALabel, 'LAS-TW#35-XP') then
    begin
      APrintPatEdu := False;
      Exit(LAS_TW_35_XP);
    end;

    if SameText(ALabel, 'LAS-TW#35-XP-MUN') then
    begin
      APrintPatEdu := False;
      Exit(LAS_TW_35_XP_MUN);
    end;

    if SameText(ALabel, '3X4_TERMAL_A') or SameText(ALabel, '3X4_TERMAL') then
    begin
      APrintPatEdu := False;
      Exit(R3X4_TERMAL_A);
    end;

    if SameText(ALabel, 'R3X6_TERMAL_A') then
    begin
      APrintPatEdu := False;
      Exit(R3X6_TERMAL_A);
    end;

    if SameText(ALabel, 'R3X6_TERMAL_B') then
    begin
      APrintPatEdu := False;
      Exit(R3X6_TERMAL_B);
    end;

    if SameText(ALabel, 'TL_S39_1') then
    begin
      APrintPatEdu := True;
      Exit(TL_S39_1);
    end;

    // ✅ Step-1(B): NEW LASER LABEL (main goal)
    if SameText(ALabel, 'LBL_MAIN_LSER') then
    begin
      APrintPatEdu := False;
      Exit(LBL_MAIN_LSER);
    end;
  end;

begin
  ReportName := nil;
  MemoObj := nil;
  DoPrintPatEdu := False;

  L := Trim(LabelName);

  with DM do
  begin
    ShortPatEducation := False;

    OpenPrescription_full;

    // 1) Pick the correct report
    if cdsPrintQueriesRX_OTC.Value = 'OT' then
    begin
      OpenOTC;
      DoPrintPatEdu := True; // keep your original OTC behavior
      ReportName := PickReportForOTC(L);
    end
    else
    begin
      ReportName := PickReportForRX(L, DoPrintPatEdu);
    end;

    if not Assigned(ReportName) then
    begin
      Memo1.Lines.Add('ERROR: Label not mapped in PrintServer: ' + L);
      Exit;
    end;

    // 2) Patient education (safe)
    if (cdsPrintQueriesRX_OTC.Value <> 'OT') then
    begin
      // your old code calls PrintPatEdu for RX flow
      FrmMain.PrintPatEdu(MemoObj, ReportName);
    end;

    // 3) Print options
    ReportName.PrintOptions.ShowDialog := False;
    ReportName.PrintOptions.Copies := cdsPrintQueriesCOPIES.Value;
    ReportName.PrintOptions.Printer := cdsPrintersPRINTER_NAME.Value;

    // 4) Apply margins
    case RadioGroup1.ItemIndex of
      0:
      begin
        Page := TfrxReportPage(ReportName.FindObject('Page1'));
        if Assigned(Page) then
        begin
          Page.LeftMargin := cdsPrintersLEFT_MARGIN.Value;
          Page.TopMargin := cdsPrintersTOP_MARGIN.Value;
          Page.BottomMargin := 0.10;
        end;
      end;

      1:
      begin
        if ReportName.PagesCount > 1 then
        begin
          TfrxReportPage(ReportName.Pages[0]).TopMargin := cdsPrintersTOP_MARGIN.Value;
          TfrxReportPage(ReportName.Pages[1]).TopMargin := cdsPrintersTOP_MARGIN.Value;
          TfrxReportPage(ReportName.Pages[0]).LeftMargin := cdsPrintersLEFT_MARGIN.Value;
          TfrxReportPage(ReportName.Pages[1]).LeftMargin := cdsPrintersLEFT_MARGIN.Value;
        end;
      end;

      2:
      begin
        Page := TfrxReportPage(ReportName.FindObject('Page1'));
        if Assigned(Page) then
        begin
          Page.LeftMargin := cdsPrintersLEFT_MARGIN.Value;
          Page.TopMargin := cdsPrintersTOP_MARGIN.Value;
        end;
      end;

      3:
      begin
        ReportName.Left := cdsPrintersLEFT_MARGIN.Value;
        ReportName.Top := cdsPrintersTOP_MARGIN.Value;
      end;
    end;

    // 5) Render/Print
    if ReportName.PrepareReport() then
    begin
      if PrintToScreen = True then
        ReportName.ShowReport
      else
      begin
        ReportName.Print;
        Application.ProcessMessages;
      end;
    end;

    // 6) Patient Education printing block (your original logic)
    if (Trim(FrmMain.Short_PatEducation) > '') or (Trim(FrmMain.Long_PatEducation) > '') then
    begin
      ReportName := RptEducation;

      with ReportName do
      begin
        cdsPrinters.Close;
        cdsPrinters.CommandText :=
          'Select * from Printers where LABEL_NAME = ' + Chr(39) + Trim('RptEducation') + Chr(39) +
          ' and PAT_EDUCATION_ONLY = 1 and printer_id = ' + Trim(PrinterID);
        cdsPrinters.Open;

        if cdsPrinters.RecordCount > 0 then
        begin
          PrintOptions.ShowDialog := False;
          PrintOptions.Printer := cdsPrintersPRINTER_NAME.Value;

          MemoObj := FindObject('MemoPatEdu') as TfrxMemoView;
          if Assigned(MemoObj) then
          begin
            if Trim(cdsPrintersPAT_EDUCATION.Value) = 'LONG' then
              MemoObj.Memo.Text := cdsPrescription_FullNombreCompleto.Value + Chr(13) + Long_PatEducation
            else
              MemoObj.Memo.Text := cdsPrescription_FullNombreCompleto.Value + Chr(13) + Short_PatEducation;
          end;

          PrepareReport;

          if (cdssetupPATEDU_ONLYONNEWRX.Value = True) then
          begin
            if PrintToScreen = True then ShowReport else Print;
          end
          else if cdsSetupPRINT_PAT_EDU.Value = True then
          begin
            if PrintToScreen = True then ShowReport else Print;
          end
          else if (cdsSetupPRINT_PAT_EDU_CONTROLED.Value = True) or (cdsPrescription_FullRX_CONTROL.Value <> 'RX') then
          begin
            if PrintToScreen = True then ShowReport else Print;
          end;
        end;
      end;
    end;

    // 7) Logging (your existing)
    with FrmMain do
    begin
      Memo1.Lines.Add('Date / Time: ' + DateTimeToStr(Now));
      Memo1.Lines.Add('Rx. ID.: ' + cdsPrintQueriesRX_ID.AsString);
      Memo1.Lines.Add('Label Name: ' + LabelName);
      Memo1.Lines.Add('Left Margin: ' + FloatToStr(cdsPrintersLEFT_MARGIN.Value));
      Memo1.Lines.Add('Top Margin: ' + FloatToStr(cdsPrintersTOP_MARGIN.Value));
      Memo1.Lines.Add('Printer: ' + cdsPrintersPRINTER_NAME.Value);
      Memo1.Lines.Add('Patient Education: ' + cdsPrintersPAT_EDUCATION.Value);
      Memo1.Lines.Add('Default Rx Printer: ' + cdsPrintersDEFAULT_NEWRX_LABEL.AsString);
      Memo1.Lines.Add('Default OTC Printer: ' + cdsPrintersDEFAULT_OTC_LABEL.AsString);
      Memo1.Lines.Add('Copies: ' + IntToStr(cdsPrintQueriesCOPIES.Value));

      if Printfrom = '0' then Memo1.Lines.Add('Printed from:' + 'OTC');
      if Printfrom = 'N' then Memo1.Lines.Add('Printed from:' + 'New Rx');
      if Printfrom = 'H' then Memo1.Lines.Add('Printed from:' + 'History or Workflow');

      Memo1.Lines.Add('Counter: ' + IntToStr(Counter_prints));
      Memo1.Lines.Add('==================================');
    end;
  end;
end;



procedure TFrmMain.PrintKitchenReceipt(TranNo: Integer; Note: string);
Var
  NumberOfItems: Integer;
  Taxable: String;
begin
  With DM do
  begin
    cdsOpenTabs.Close;
    cdsOpenTabs.CommandText := 'select * from OPEN_TABS where TRANSACTIONNUMBER = ' + IntToStr(TranNo);
    cdsOpenTabs.Open;
    With CDSTransHead do
    Begin
      Active := False;
      CommandText := 'select * from transactionheader_temp where transactionnumber = ' + IntToStr(TranNo);
      Active := True;
    end;
    With CDStransDetail do
    Begin
      Active := False;
      CommandText := 'Select [IDNUMBER] ,[TRANSACTIONNUMBER],[UPC] ,[TOTAL] ,[VOIDED] ' +
                  ',[SUBDETAIL] ,[PRODDESCRIPTION] ,[PRODDEPARTMENT],[REGTOTAL] ,[FOOD] ,[PRICE],[REGPRICE] '+
                  ',[MODIFIED] ,[DISCOUNT],[COSTO],[FECHAVENTA],[SUPLIDOR],[TOTAL_VALUE],[AWP],[ID],[TAX]'+
                  ',[PRODUCTNO],[TAX_ESTATAL],[TAX_MUNICIPAL],[QTY],[OPENED],[GROUP_PROD],[REGISTER],[SUPERVISOR]'+
                  ',[PATROCINIO],[SUBDEPARTAMENTO], [MAIN_COURSE], [MAIN_COURSE_ID], [TERMINO], [BARCODEALTERNO1] ' +
                  'FROM TransactionDetail_TEMP WHERE TransactionNumber = ' + IntToStr(TranNo) +
                  ' AND KITCHEN = 1 and PRINTED <> 1 Order By MAIN_COURSE_ID, IDNumber';
      {CommandText := 'Select [IDNUMBER] ,[TRANSACTIONNUMBER],[UPC] ,[TOTAL] ,[VOIDED] ' +
          ',[SUBDETAIL] ,[PRODDESCRIPTION] ,[PRODDEPARTMENT],[REGTOTAL] ,[FOOD] ,[PRICE],[REGPRICE] '+
          ',[MODIFIED] ,[DISCOUNT],[COSTO],[FECHAVENTA],[SUPLIDOR],[TOTAL_VALUE],[AWP],[ID],[TAX]'+
          ',[PRODUCTNO],[TAX_ESTATAL],[TAX_MUNICIPAL],[QTY],[OPENED],[GROUP_PROD],[REGISTER],[SUPERVISOR]'+
          ',[PATROCINIO],[SUBDEPARTAMENTO], [MAIN_COURSE], [MAIN_COURSE_ID], [TERMINO] ' +
          'FROM TransactionDetail_TEMP WHERE TransactionNumber = ' + IntToStr(TranNo) +
          ' AND KITCHEN = 1 and PRINTED <> 1 Order By MAIN_COURSE_ID, IDNumber'; }
      Active := True;
    End;
    if CDStransDetail.RecordCount > 0 then
    begin
      //If FoodReceipt <> '' then
      SelectPrinter(FoodReceipt);
      //else
      //  SelectPrinter('EPSON');
      //With FrmMain do
      //FrmReceiptView := TFrmReceiptView.Create(Application);
      With FrmReceiptView do        //FrmMain
      begin
        With RichEdit1 do
        begin
          Font.Name := 'Lucida Console';
          Font.Size := 10;
          Font.Style := [];
          Lines.Clear;
          font.Style := [fsBold];
          Lines.Add('Customer: ');
          Lines.Add(Trim(DM.cdsOpenTabsCUSTOMER.Value));
          Lines.Add('---------------------------');
          Lines.Add(Format('%0s %18s%',['Register: '+ intToStr(CDSTransHeadREGISTER.Value), 'ID: ' +IntToStr(TranNo)]));
          Lines.Add(Format('%22s%',[DateTimetoStr(Now)]));
          Lines.Add('# OF ITEMS: ' + IntToStr(CDSTransDetail.RecordCount));
          if DM.cdsOpenTabs.RecordCount > 0 then
          begin
            Lines.Add('Server: ' + Trim(DM.cdsOpenTabsSERVER_DEFINE.Value));
          end;
          Lines.Add('---------------------------');
          With DM.CDStransDetail do
          Begin
            First;
            While Not EOF do
            Begin
              if (FieldByName('MAIN_COURSE').Value = True) then
              begin
                Lines.Add('-------Main Course---------');
              end;
              Lines.Add(Trim(FieldByName('ProdDescription').asString) + ' ' +Trim(FieldByName('TERMINO').asString));
              Next;
            end;
            Close;
            Lines.Add('----------NOTE-------------');
            if Trim(Note) > '' then
            begin
              Lines.Add(Note);
              Lines.Add('---------------------------');
            end;
          end;
          if PrintToScreen = False then
          begin
            Print('');
          end
          else
          begin
            FrmReceiptView.ShowModal;
          end;
        end;
        With POS_UPDATE_PRINTED do
        begin
          Prepare;
          ParamByName('@TRANSNO').Value := TranNo;
          ExecProc;
        end;
        //FrmReceiptView := Nil;
        //FrmReceiptView.Free;
      end;
    end;
  end;
end;



procedure TFrmMain.PrintInvoice(trans_no: Integer; OpenDrwr, Reprint: Boolean; IVULoto, PrintType: String);
Var
  Customer, Cnt: Integer;
  Contacto: String;
  Attachment: TIdAttachment;
  Token1, Token2, Token3: String;
  NCust: Integer;
  Memo20, memoCustName: TfrxMemoView;
  Cred, LWay: Boolean;

begin
  Token1 := '';
  Token2 := '';
  Token3 := '';
  //if (CommonPos.Customer > 0) then Queries.OpenPatient(Token1, Token2, Token3, Customer);
  With DM do
  begin
    FrmReceiptView := TFrmReceiptView.Create(Application);
    With FrmReceiptView do
    begin
      RichEdit1.Clear;
      With DM.CDSTransHead do
      Begin
        Active := False;
        if RePrint = True then
          CommandText := 'select * from transactionheader where transactionnumber = ' + IntToStr(trans_no)
        else
          CommandText := 'select * from transactionheader_temp where transactionnumber = ' + IntToStr(trans_no);
        Active := True;
        If (FieldByName('PaymentType1').asString = 'CRED') OR (FieldByName('PaymentType2').asString = 'CRED') then
          Cred := True;
        If (FieldByName('PaymentType1').asString = 'LWAY') OR (FieldByName('PaymentType2').asString = 'LWAY') then
          LWay := True;
        if dm.CDSSetup.Active = False then DM.CDSSetup.Active := true;
      end;
      With DM.CDSTRANSDetail do
      begin
        Active := False;
        if RePrint = True then
          CommandText := 'select * from transactiondetail where transactionnumber = ' + IntToStr(trans_no)
        else
          CommandText := 'select * from transactiondetail_temp where transactionnumber = ' + IntToStr(trans_no);
        Active := True;
      end;
      //GetTotal_lines(TransType, FinalReceipt, DeudaLocal, DeudaLayaway);
      GetTotal_lines('CAS', FinalReceipt, 0, 0, CDSTransHeadCUSTOMERID.Value);
      Customer := dm.CDSTransHeadCUSTOMERID.Value;
      {GetIVULoto(TransType);
      PrintLargeReceipt(THead, TRUE, true, 'ivuloto');
      DMMidas.CDSTransHead.Active := False;
      DMMidas.CDSTransShow.Active := False;
      DMMidas.cdsOpenTabs.Close;
      }



      FrmRptRecibo := TFrmRptRecibo.Create(Application);
      With FrmRptRecibo do
      begin
        if Reprint = True then
        begin
          dsTransHead.DataSource := dm.dsTransHead;
          dsDetail.DataSource := dm.dsTransDetail;
        end;
        cdsOpenTabs.Close;
        cdsOpenTabs.CommandText := 'Select * from OPEN_TABS where TRANSACTIONNUMBER = ' + IntToStr(trans_no);
        cdsOpenTabs.Open;
        With DM.CDSTransHead do
        Begin
          Active := False;
          if cdsPrintQueriesFINAL_RECEIPT.Value = True then
            CommandText := 'select * from transactionheader where transactionnumber = ' + IntToStr(trans_no)
          else
            CommandText := 'select * from transactionheader_temp where transactionnumber = ' + IntToStr(trans_no);
          Active := True;
        End;
        if cdsPrintQueriesQUOTE.Value = True  then   //Search and determine si es factura o cotizacion
        begin
          Memo20 := Receipt.FindObject('Memo20') as TfrxMemoView;
          Memo20.Memo.Text := 'Cotización';
          memoCustName := Receipt.FindObject('memoCustName') as TfrxMemoView;
          memoCustName.Memo.Text := dm.cdsOpenTabsCUSTOMER.Value;
        end
        else if cdsPrintQueriesDELIVERY.Value = true then
        begin
          Memo20 := Receipt.FindObject('Memo20') as TfrxMemoView;
          Memo20.Memo.Text := 'Delivery';
          memoCustName := Receipt.FindObject('memoCustName') as TfrxMemoView;
          memoCustName.Memo.Text := dm.cdsOpenTabsCUSTOMER.Value;
        end
        else
        begin
          Memo20 := Receipt.FindObject('Memo20') as TfrxMemoView;
          Memo20.Memo.Text := 'Factura';
          memoCustName := Receipt.FindObject('memoCustName') as TfrxMemoView;
          memoCustName.Memo.Text := dm.CDSClientesNombreCompleto2.Value;
        end;
        Receipt.PrintOptions.Copies := 1;//CommonPOS.NUMERO_DE_RECIBOS;
        if FrmMain.PrintToScreen = true then
        begin
          Receipt.PrepareReport;
          Receipt.ShowReport;
        end
        else
        begin
          Receipt.PrepareReport;
          Receipt.Print;
        end;
        Free;
        FrmRptRecibo := nil;
      end;
    end;
  end;
end;

procedure TFrmMain.PrintSavedTransaction(TransNo: String);
begin
  //With DMMidas do
  begin
    if Restaurant = False then
    begin
      FrmReceipt := TFrmReceipt.Create(nil);
      with FrmReceipt do
      begin
        FrmReceipt.CDSTransHead.Close;
        FrmReceipt.CDSTransHead.CommandText := 'Select * from TRANSACTIONHEADER_TEMP where TRANSACTIONNUMBER = ' + Trim(TransNo);
        FrmReceipt.CDSTransHead.Open;
        if PrintToScreen = True then
        begin
          RecallTransaction.PrepareReport;
          RecallTransaction.ShowReport;
        end
        else
        begin
          RecallTransaction.PrintOptions.Printer := FrmMain.ReceiptPrinter;
          RecallTransaction.PrepareReport;
          RecallTransaction.Print;
        end;
        FrmReceipt := Nil;
        Free;
      end;
    end;
  end;
end;

procedure TFrmMain.GetIVULoto(TransType: String);
Var
  loops, Cnt: Integer;
  Cred, LWay: Boolean;
  DeudaLocal, DeudaLayaway: Double;
  Taxable: String;
  cm: txPosRequest;
  Response: txPosResponse;
  //Response: ivuLotoData;
  D: TXSDateTime;
  MTax, STax, TotalV, SubTotalV: TXSDecimal;
  TenderTypeS: tenderType;
  MyTxServer: TxServer;
  SubTotalF: Double;
  IVULotoDate: String;
  Counter: Integer;
  loop: Boolean;
begin

  With DM.CDSTransHead do
  Begin
    If (FieldByName('PaymentType1').asString = 'CRED') OR (FieldByName('PaymentType2').asString = 'CRED') then
      Cred := True;
    If (FieldByName('PaymentType1').asString = 'LWAY') OR (FieldByName('PaymentType2').asString = 'LWAY') then
      LWay := True;
    //================================IVULOTO=====================================
    Try
      //if loops = 1 then
      //TransType := Trim(FieldByName('PaymentType1').asString);
      begin
        if IVULOTO_ACTIVO then
        begin
          if (TransType = 'CASH') or (TransType = 'ATH') or (TransType = 'CHK') or (TransType = 'TFAM') or (TransType = 'VISA') then
          begin
            if DM.CDSSetup.Active = False then DM.CDSSetup.Active := True;
            //if CommonPOS.InternetActive = True then
            begin
              MTax := TXSDecimal.Create;
              STax := TXSDecimal.Create;
              SubTotalV := TXSDecimal.Create;
              TotalV := TXSDecimal.Create;
              D := TXSDateTime.Create;
              D.AsDateTime := Now;
              MTax.AsBcd := FieldByName('TAX').AsBcd;
              STax.AsBcd := FieldByName('TAX_ESTATAL').AsBCD;
              SubTotalV.XSToNative(FormatFloat('0.00',(FieldByName('TOTAL').Value - FieldByName('TOTAL_TAX').Value)));
              TotalV.AsBcd := FieldByName('TOTAL').AsBCD;
              cm := txPosRequest.Create();
              cm.merchantId := trim(DM.CDSSetupIVULOTO_MERCHANT_ID.Value); //'00000000000';
              cm.municipalTax := MTax;
              cm.stateTax := STax;
              cm.subTotal := SubTotalV;
              if TransType = 'CASH' then cm.tenderType := CASH;
              if (TransType = 'ATH') OR (TransType = 'TFAM') then cm.tenderType := ATH;
              if TransType = 'VISA' then cm.tenderType := CREDIT;
              if TransType = 'CHK' then cm.tenderType := EBT;
              cm.terminalId := Trim(IVULOTO_TERMINALID); //'POS02';
              cm.terminalPassword := trim(DM.CDSSetupIVULOTO_PASSWORD.Value);
              cm.total := TotalV;
              cm.transactionDate := D;
              if RefundPOS = true then
                cm.transactionType := REFUND
              else
                cm.transactionType := SALE;
              MyTxServer := GetTxServer(False,'', nil);
              Response := MyTxServer.requestIVULoto(cm);
              //ShowMessageStr(Response.ivuLoto);
              IVULotoDate := '';
              Counter := 1;
              loop := True;
              While loop = True do
              begin
                If copy(Response.drawDate.NativeToXS, counter, 1) = 'T' then
                  Loop := False
                else
                  IVULotoDate := IVULotoDate + copy(Response.drawDate.NativeToXS, counter, 1);
                Counter := Counter + 1;
              end;
              IVULotoDate := copy(IVULotoDate, 6,2) + '/' + copy(IVULotoDate, 9,2) + '/' + copy(IVULotoDate, 1,4);
              IVULotoDate := MonthOftheYear(IVULotoDate) + '/' + copy(IVULotoDate, 4,8);
              IVULotoControlNumber := Response.ivuLoto;
            end;
          end;
        end;
      end;
    except
      //
    end;
  End;
end;

function TFrmMain.MonthOftheYear(Fecha: String): String;
Var
  Mes, dia, ano: Word;
begin
  DecodeDate(StrToDate(fecha),ano, mes, dia);
  Case Mes of
   1: Result := 'Enero';
   2: Result := 'Febrero';
   3: Result := 'Marzo';
   4: Result := 'Abril';
   5: Result := 'Mayo';
   6: Result := 'Junio';
   7: Result := 'Julio';
   8: Result := 'Agosto';
   9: Result := 'Septiembre';
   10: Result := 'Octubre';
   11: Result := 'Noviembre';
   12: Result := 'Diciembre';
  end;
end;



function TFrmMain.PrintPatEdu(Memo1: TfrxMemoView; ReportName: TfrxReport): Boolean;
var
  ReportPatEdu: Boolean;
  Obj: TObject;
begin
  Result := False;
  ReportPatEdu := False;

  Long_PatEducation := '';
  Short_PatEducation := '';

  with DM do
  begin
    cdsSetup.Refresh;

    // --- Should we even fetch PatEdu?
    if (CDSSetupPRINT_PAT_EDU_CONTROLED.Value = True) and
       (Trim(cdsPrescription_FullRX_CONTROL.Value) <> 'RX') then
      Result := True
    else if CDSSetupPRINT_PAT_EDU.Value = True then
      Result := True
    else if PrintFrom = 'N' then
      if CDSSetupPATEDU_ONLYONNEWRX.Value = True then
        Result := True;

    // --- Reports that SUPPORT embedding PatEdu (GoldStandard)
    if (ReportName = LASCL_13TL) or (ReportName = PXT_2HRI_1) or
       (ReportName = LAS_TW_35_XP) or (ReportName = LAS_TW_35_XP_MUN) or
       (ReportName = PXT_6G1A) or (ReportName = LASTW_NT37) or
       (ReportName = TL_S39_1) or
       (ReportName = LBL_MAIN_LSER) then   // ✅ add your new label
    begin
      if CDSSetupGoldStandardActive.Value = True then
        ReportPatEdu := True;
    end;

    if (Result = True) or (ReportPatEdu = True) then
      GDDS5Routines.PatientEducation('', DM.CDSInventarioNDC.Value,
        Trim(cdsPrescription_FullPAT_LANGUAGE.Value), 'Education', False);

    // --- If we want to write PatEdu into the report, do it SAFELY
    if ReportPatEdu = True then
    begin
      Long_PatEducation := CommonRoutine.StrReplace(Long_PatEducation);
      Short_PatEducation := CommonRoutine.StrReplace(Short_PatEducation);

      Obj := ReportName.FindObject('MemoPatEdu');
      if (Obj <> nil) and (Obj is TfrxMemoView) then
      begin
        Memo1 := TfrxMemoView(Obj);

        if Trim(cdsPrintersPAT_EDUCATION.Value) = 'LONG' then
          Memo1.Memo.Text := cdsPrescription_FullNombreCompleto.Value + Chr(13) + Long_PatEducation
        else
          Memo1.Memo.Text := cdsPrescription_FullNombreCompleto.Value + Chr(13) + Short_PatEducation;
      end
      else
      begin
        // MemoPatEdu not present in this label -> don't crash
        Long_PatEducation := '';
        Short_PatEducation := '';
      end;
    end;

    if Result = False then
    begin
      Long_PatEducation := '';
      Short_PatEducation := '';
    end;
  end;
end;

procedure TFrmMain.PrintBitmap(ABitmap: TBitmap);
begin
  // TODO: implement if needed later
end;



procedure TFrmMain.Print;
var
  loop: Boolean;
begin
  isPrintingActive := True;
  FPrinterOverride := '';
  try
    loop := True;

    with DM do
    begin
      while loop = True do
      begin
        cdsPrintQueries.Close;
        cdsPrintQueries.CommandText :=
          'Select * from Print_queries where Printer_ID = ' + Trim(PrinterID) +
          ' and printed = 0 and PRINTER_IP = ' + Chr(39) + Local_IP + Chr(39) +
          ' order by ID';
        cdsPrintQueries.Open;

        if cdsPrintQueries.RecordCount = 0 then
          loop := False
        else
        begin
          while not cdsPrintQueries.Eof do
          begin
            cdsPrinters.Close;

            // RX vs OTC label selection
            if cdsPrintQueriesRX_OTC.Value = 'RX' then
            begin
              PrintFrom := Copy(cdsPrintQueriesLABEL_NAME.Value,
                                Length(cdsPrintQueriesLABEL_NAME.Value), 1);

              if Trim(cdsPrintQueriesLABEL_NAME.Value) = 'DEFAULT' then
                Label_Name := Trim(cdsPrintQueriesLABEL_NAME.Value)
              else
                Label_Name := Copy(cdsPrintQueriesLABEL_NAME.Value, 1,
                                   Length(cdsPrintQueriesLABEL_NAME.Value) - 1);

              if UpperCase(Label_Name) = 'DEFAULT' then
                cdsPrinters.CommandText :=
                  'Select * from Printers where DEFAULT_NEWRX_LABEL = 1 and printer_id = ' + Trim(PrinterID)
              else
              begin
                if PrintFrom = 'N' then
                  cdsPrinters.CommandText :=
                    'Select * from Printers where LABEL_NAME = ' + Chr(39) + Trim(Label_Name) + Chr(39) +
                    ' and printer_id = ' + Trim(PrinterID) + ' and DEFAULT_NEWRX_LABEL = 1'
                else
                  cdsPrinters.CommandText :=
                    'Select * from Printers where LABEL_NAME = ' + Chr(39) + Trim(Label_Name) + Chr(39) +
                    ' and printer_id = ' + Trim(PrinterID) + ' and DEFAULT_NEWRX_LABEL = 0 and DEFAULT_OTC_LABEL = 0';
              end;
            end
            else
            begin
              Label_Name := Trim(cdsPrintQueriesLABEL_NAME.Value);

              if UpperCase(Label_Name) = 'DEFAULT' then
                cdsPrinters.CommandText :=
                  'Select * from Printers where DEFAULT_OTC_LABEL = 1 and printer_id = ' + Trim(PrinterID)
              else
                cdsPrinters.CommandText :=
                  'Select * from Printers where LABEL_NAME = ' + Chr(39) + Trim(Label_Name) + Chr(39) +
                  ' and DEFAULT_OTC_LABEL = 1 and printer_id = ' + Trim(PrinterID);
            end;

            cdsPrinters.Open;

            if (cdsPrinters.RecordCount > 0) or (cdsPrintQueriesRX_OTC.AsString.Trim = 'PO') then
            begin
              Counter_prints := Counter_prints + 1;
              if Counter_prints >= 1000 then
              begin
                Counter_prints := 0;
                Memo1.Lines.Clear;
              end;

              // Purchase Order printing
              if cdsPrintQueriesRX_OTC.AsString.Trim = 'PO' then
              begin
                FinalReceipt := cdsPrintQueriesFINAL_RECEIPT.Value;
                if cdsPrintQueriesPRINT_TYPE.Value = 1 then
                  Print_Receipt_FR
                else
                  PrintReceipt(cdsPrintQueriesTRANSACTION_NUMBER.Value,
                               cdsPrintQueriesCOPIES.Value, True, '', '', '', '');
              end
              else
              begin
                // Read override printer from PRINT_QUERIES.PRINTER_NAME (NO persistent field needed)
                FPrinterOverride := '';
                try
                  if cdsPrintQueries.FindField('PRINTER_NAME') <> nil then
                    FPrinterOverride := Trim(cdsPrintQueries.FieldByName('PRINTER_NAME').AsString);
                except
                  FPrinterOverride := '';
                end;

                // Print label
                if Trim(cdsPrintersLABEL_NAME.Value) = 'DEFAULT' then
                  Print_report(Trim(Label_Name), '0')
                else
                  Print_report(Trim(Label_Name), PrintFrom);

                // clear override for next row
                FPrinterOverride := '';
              end;
            end;

            DeltePrintQ(cdsPrintQueriesID.Value, 1);
            cdsPrintQueries.Next;
          end;
        end;
      end;
    end;

  finally
    isPrintingActive := False;
    FPrinterOverride := '';
  end;
end;







end.
