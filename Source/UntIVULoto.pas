// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://txportws.txhubpr.com:9000/txserver/2?wsdl
// Encoding : UTF-8
// Version  : 1.0
// (05/06/2011 01:13:33 PM - 1.33.2.5)
// ************************************************************************ //

unit UntIVULoto;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"

  txPosRequest         = class;                 { "http://txserver.sut.softekpr.com/2" }
  txPosResponse        = class;                 { "http://txserver.sut.softekpr.com/2" }

  { "http://txserver.sut.softekpr.com/2" }
  tenderType = (CASH, CREDIT, DEBIT, EBT, ATH, UNSPECIFIED_CARD, UNKNOWN);

  { "http://txserver.sut.softekpr.com/2" }
  txType = (SALE, REFUND);

  { "http://txserver.sut.softekpr.com/2" }
  txPosResponseStatus = (SUCCESS, AUTHENTICATION_ERROR, MISSING_PARAMETER_ERROR, INVALID_PARAMETER_ERROR, SERVER_ERROR);



  // ************************************************************************ //
  // Namespace : http://txserver.sut.softekpr.com/2
  // ************************************************************************ //
  txPosRequest = class(TRemotable)
  private
    FmerchantId: WideString;
    FmunicipalTax: TXSDecimal;
    FstateTax: TXSDecimal;
    FsubTotal: TXSDecimal;
    FtenderType: tenderType;
    FterminalId: WideString;
    FterminalPassword: WideString;
    Ftotal: TXSDecimal;
    FtransactionDate: TXSDateTime;
    FtransactionType: txType;
  public
    destructor Destroy; override;
  published
    property merchantId: WideString read FmerchantId write FmerchantId;
    property municipalTax: TXSDecimal read FmunicipalTax write FmunicipalTax;
    property stateTax: TXSDecimal read FstateTax write FstateTax;
    property subTotal: TXSDecimal read FsubTotal write FsubTotal;
    property tenderType: tenderType read FtenderType write FtenderType;
    property terminalId: WideString read FterminalId write FterminalId;
    property terminalPassword: WideString read FterminalPassword write FterminalPassword;
    property total: TXSDecimal read Ftotal write Ftotal;
    property transactionDate: TXSDateTime read FtransactionDate write FtransactionDate;
    property transactionType: txType read FtransactionType write FtransactionType;
  end;



  // ************************************************************************ //
  // Namespace : http://txserver.sut.softekpr.com/2
  // ************************************************************************ //
  txPosResponse = class(TRemotable)
  private
    FcontrolNumber: WideString;
    FdrawDate: TXSDateTime;
    FdrawNumber: WideString;
    FerrorDetail: WideString;
    FivuLoto: WideString;
    Fstatus: txPosResponseStatus;
    FterminalId: WideString;
    FtransactionDate: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property controlNumber: WideString read FcontrolNumber write FcontrolNumber;
    property drawDate: TXSDateTime read FdrawDate write FdrawDate;
    property drawNumber: WideString read FdrawNumber write FdrawNumber;
    property errorDetail: WideString read FerrorDetail write FerrorDetail;
    property ivuLoto: WideString read FivuLoto write FivuLoto;
    property status: txPosResponseStatus read Fstatus write Fstatus;
    property terminalId: WideString read FterminalId write FterminalId;
    property transactionDate: TXSDateTime read FtransactionDate write FtransactionDate;
  end;


  // ************************************************************************ //
  // Namespace : http://txserver.sut.softekpr.com/2
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : TxServerServiceSoapBinding
  // service   : TxServerService
  // port      : TxServerPort
  // URL       : http://txportws.txhubpr.com:9000/txserver/2
  // ************************************************************************ //
  TxServer = interface(IInvokable)
  ['{00F602C8-12F3-DCEE-13A2-8FEFB2EC7051}']
    function  requestIVULoto(const request: txPosRequest): txPosResponse; stdcall;
  end;

function GetTxServer(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): TxServer;


implementation

uses UntMain;



function GetTxServer(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): TxServer;
const
  //defWSDL = 'http://txportws.txhubpr.com:9000/txserver/2?wsdl';
  defWSDL = 'http://txportwst.txhubpr.com:8443/txserver/2?wsdl';
  //defURL  = 'https://txportwst.txhubpr.com:8443/txserver/2';//CommonPOS.txportIP;// 'http://txportws.txhubpr.com:9000/txserver/2';
  defSvc  = 'TxServerService';
  defPrt  = 'TxServerPort';
var
  RIO: THTTPRIO;
  defURL: String;
begin
  //defURL  := 'https://txportws.txhubpr.com/txserver/2';//CommonPOS.txportIP;
  defURL  := frmMain.txportIP;
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as TxServer);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor txPosRequest.Destroy;
begin
  if Assigned(FmunicipalTax) then
    FmunicipalTax.Free;
  if Assigned(FstateTax) then
    FstateTax.Free;
  if Assigned(FsubTotal) then
    FsubTotal.Free;
  if Assigned(Ftotal) then
    Ftotal.Free;
  if Assigned(FtransactionDate) then
    FtransactionDate.Free;
  inherited Destroy;
end;

destructor txPosResponse.Destroy;
begin
  if Assigned(FdrawDate) then
    FdrawDate.Free;
  if Assigned(FtransactionDate) then
    FtransactionDate.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(TxServer), 'http://txserver.sut.softekpr.com/2', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(TxServer), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(TxServer), ioDocument);
  RemClassRegistry.RegisterXSInfo(TypeInfo(tenderType), 'http://txserver.sut.softekpr.com/2', 'tenderType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(txType), 'http://txserver.sut.softekpr.com/2', 'txType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(txPosResponseStatus), 'http://txserver.sut.softekpr.com/2', 'txPosResponseStatus');
  RemClassRegistry.RegisterXSClass(txPosRequest, 'http://txserver.sut.softekpr.com/2', 'txPosRequest');
  RemClassRegistry.RegisterXSClass(txPosResponse, 'http://txserver.sut.softekpr.com/2', 'txPosResponse');

end.