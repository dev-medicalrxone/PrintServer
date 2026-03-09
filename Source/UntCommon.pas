unit UntCommon;


interface

Uses   Vcl.Controls, Windows, Messages, Classes, Graphics,  Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Grids, DBGrids, Mask, ExtCtrls,
  Buttons, WinTypes, ComCtrls, Printers, Registry, wininet, ToolWin, Shellapi,
  SysUtils, Tlhelp32, FireDac.DApt, FireDAC.Stan.Def, FireDAC.Stan.ASync,
  FireDAC.Stan.Param, FireDAC.Stan.Option, FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL, IdCoderMIME, Soap.EncdDecd, System.JSON,
  System.Net.HttpClient, REST.Types, System.DateUtils, IdSMTP, System.Threading,
  frxClass, frxDBSet, frxbarcod, frxExportPDF, frxExportBaseDialog, IdIPWatch;

Type
  TCommonRoutines = class(TObject)
    Void: Boolean;
    NoReceiptsVisaATH: Integer;
    NoReceiptsCash: Integer;
    NoReceiptsCredit: Integer;
    NoReceiptsLayaway: Integer;
    TransType: String;
    function DefineJournal(counter: Integer; Option, Token: String): String;
    procedure PrintValues(Token: String);
    procedure printSpinValues(Token: String);
    procedure parseJson(json: String);
    procedure PrintIvuLoto(Token: String);
    procedure PrintSettlement(response: String);
    procedure PrintHeading(RegisterNo, TransNo: Integer);
    function StrReplace(Str: string): String;
    function GetLocalIp: string;
    public
    private
    function DefineResponse(counter, EFMF: Integer; Token: String): String;
    function DefineEFMF(counter: Integer; Token, Option: String): String;
    function lrc(token: String): String;





  end;
Var
  CommonRoutine: TCommonRoutines;
  IvuLoto, Host, FALLBACK, SubTotal, StateTax, ReducedTax, CityTax,
  FoodStampBalance, CashBalance: String;
  paraphraseId: String;
  FSuccess: Boolean;
  FMessage: string;
  FMessageDet: string;
  FTransactionId: string;
  FApprovalCode: string;
  FResponseCode: string;
  FRawJSON: string;
  FCardNumber: string;
  FCardType: string;
  FCardHolder: string;
  FAmount: string;
  FRefNum: string;
  FBatchNum: string;
  FInvoiceNo: String;
  FTypePayment: string;
  FTransactionType: string;
  FSignature: string;
  FApplicationName: String;
  FEntryType: String;

  //Void: Boolean;
implementation

{ TCommonRoutines }

uses UntMain, untReceiptView, UntData;

function formatAmounts(Token: String): String;
Var
  amount: double;
begin
  if Trim(Token) = '' then
  result := '000000000000'
  else
  begin
    amount := StrToFloat(Token);
    amount := (amount *100);
    result := result + FormatFloat('000000000000', amount);
  end;
end;

function formatAmountsToDollars(Token: String): String;
Var
  amount: double;
begin
  if Trim(Token) = '' then
  result := '000000000000'
  else
  begin
    amount := StrToFloat(Token);
    amount := (amount / 100);
    result := Format('%m', [amount]);
  end;
end;


function headerdefine(Token: String): String;
begin
  if token = 'SALE' then result := 'Sale';
  if token = 'REFUND' then result := 'Refund';
  if token = 'IVUCASH' then result := 'Cash';
  if token = 'EBT' then result := 'EBT';
  if token = 'ADJDELETE' then
  begin
    result := 'Void';
    CommonRoutine.Void := true;
  end;
  if token = 'TIPADJUST' then result := 'Adjust';
  if token = 'LOGOFF' then result := 'Logoff';
  if token = 'SETTLEMULT' then result := 'Multihost Settle';
  if token = 'REQSIGN' then result := 'Get Signature File';
  if token = 'SIGNREQ' then result := 'Signature Capture';
  if token = 'COMTEST' then result := 'Host Communication';
  if token = 'TRXREPORT' then result := 'Transactions Report';
end;

function defineAmount(Token: String): String;
Var
  amount: double;
  amount2: string;
  len: integer;
begin
   amount := StrToFloat(Token);
   amount2 := floatToStr(amount);
   len := Length(amount2);
   amount2 := copy(amount2,1,len-2) + '.' + copy(amount2,len-2,2);
   result := amount2;
end;

function CenterString(InStr: String; StrLen: Integer): String;
Var
  Xpos, X : Integer;
begin
  InStr := Trim(InStr);
  Xpos := Trunc((StrLen - Length(InStr))/2);
  For X := 1 to Xpos do
    InStr := ' ' + InStr;
  Result := InStr;
end;

function getSpecialAccount(Token: String): String;
begin
  if Token = 'VC' then result := 'Visa';
  if Token = 'MC' then result := 'MaterCard';
  if Token = 'AT' then result := 'ATH Debit';
  if Token = 'AX' then result := 'Amex';
  if Token = 'DC' then result := 'DISCOVER';
  if Token = 'IC' then result := 'Cash';
  if Token = 'UN' then result := 'Única';
  if Token = 'EV' then result := 'EBT';
  if Token = 'FN' then result := 'Fondo';
  if Token = 'EC' then result := 'Cash (EBT)';
  if Token = 'AM' then result := 'ATH Movil';
  if Token = 'BA' then result := 'Health Card';
end;

procedure TCommonRoutines.PrintIvuLoto(Token: String);
var
  sl: TStringList;
  i: integer;
  s: String;
  loc: Integer;
  counter: integer;
  IvuLotoStr: String;
begin
  counter :=0;
  sl := TStringList.Create;
  sl.StrictDelimiter := TRUE;
  sl.Delimiter := chr(28);// chr(28);
  sl.DelimitedText := Trim(Token);
  i := sl.Count;
  with FrmReceiptView.RichEdit1 do
  begin
    IvuLotoStr := Trim(Copy(sl.Strings[22],4,100));
    if Length(trim(IvuLotoStr)) > 11 then
    begin
      IvuLotoStr := Copy(IvuLotoStr, 1, Length(IvuLotoStr)-2);
      Lines.Add(CenterString(IvuLotoStr + ' ET',33));
      Lines.Add('');
    end;
    if Trim(sl.Strings[10]) > '' then
    begin
      FrmReceiptView.LblDummy.Font.Style := [fsBold];
      SelAttributes.Assign(FrmReceiptView.LblDummy.Font);
      Lines.Add(CenterString(sl.Strings[13],33));
      Lines.Add(Format('%1s %10s',['Food Stamp Balance:',copy(sl.Strings[10], 1, Length(sl.Strings[10])-1)]));
      Lines.Add(Format('%1s %10s',['Cash Balance      :',copy(sl.Strings[11], 1, Length(sl.Strings[11])-1)]));
    end;

    Lines.add(DefineResponse(24, 23, sl.Strings[23])); //lrc

  end;
end;

Procedure TCommonRoutines.PrintValues(Token: String);
Var
  sl: TStringList;
  i: integer;
  s: String;
  loc: Integer;
  counter: integer;
  Header: String;

begin
  CommonRoutine.Void := false;
  IvuLoto := '';
  header := token;
  loc := pos('^', header);
  s := Copy(header, loc+1, Length(header));
  loc := pos('.', s);
  s := Copy(s, 1, loc-1);
  with FrmReceiptView.RichEdit1 do
  begin
    counter :=0;
    sl := TStringList.Create;
    sl.StrictDelimiter := TRUE;
    sl.Delimiter := chr(28);// chr(28);
    sl.DelimitedText := Trim(Token);
    i := sl.Count;

    loc := pos('.', header);
    header := Trim(Copy(Token, loc+1, Length(header)));
    DefineResponse(22, 3, sl.Strings[21]);
    Lines.Add(Host);
    //Lines.Add(DefineResponse(22, 3, sl.Strings[21]));
    Lines.add('Batch     Terminal ID    Merchant ID');
    Lines.add(DefineResponse(17, 0, sl.Strings[16]) + '      ****' +  copy(header,5,4)+
    '      ' + DefineResponse(21, 0, sl.Strings[20])); //batch //terminal ID // // Merchant ID
    Lines.Add('');
    FrmReceiptView.LblDummy.Font.Style := [fsBold];
    SelAttributes.Assign(FrmReceiptView.LblDummy.Font);
    Lines.Add(uppercase(CenterString(Trim(headerdefine(s)),33)));
    Lines.Add('');
    Lines.Add('PIN Verified Online');
    Lines.Add(DefineResponse(13, 0, sl.Strings[12]) + ' ************' + DefineResponse(7,0, sl.Strings[6]) +
             ' ' + FALLBACK); //DefineResponse(22, 23, sl.Strings[21])) ; //special account + PAN Card Number/FTD +
    Lines.Add('');
    Lines.add(DefineResponse(3, 0, sl.Strings[2]) + '   ' +'Invoice: ' + copy(sl.Strings[7],7,6)); //Authorization code //Invoice Number
    Lines.add(DefineResponse(18, 0, sl.Strings[17]) + '      '+ 'Reference: ' + copy(header,17,6)); //Trace Number //Reference number

    if Void = true then
    begin
      With FrmReceiptView.RichEdit1 do
      begin
        Lines.Add('------------------------------------');
        Lines.Add(Format('%24s %10s',['STATE TAX:', Format('%m',[StrToFloat(StateTax)*-1])]));
        Lines.Add(Format('%24s %10s',['REDUCED TAX:', Format('%m',[StrToFloat(ReducedTax)*-1])]));
        Lines.Add(Format('%24s %10s',['MUNICIPAL TAX:', Format('%m',[StrToFloat(CityTax)*-1])]));
        Lines.Add('------------------------------------');
        Lines.Add(Format('%24s %10s',['TOTAL:', Format('%m',[StrToFloat(SubTotal)*-1])]));
        Lines.Add('');
        Lines.Add('');
      end;
    end;
  end;
  sl.Free;
end;

function TCommonRoutines.DefineResponse(counter, EFMF: Integer; Token: String): String;
Var
  loc, loc2, len: integer;
  s: String;
  amount: double;
  amount2: String;
begin
  case counter of
  1: begin
       loc := pos('^', token);
       s := Copy(Token, loc+1, Length(Token));
       loc := pos('.', s);
       s := Copy(s, 1, loc-1);
       with FrmReceiptView.RichEdit1 do
       begin
         Lines.Add(headerdefine(s));
         loc := pos('.', Token);
         Token := Trim(Copy(Token, loc+1, Length(Token)));
         Lines.add('Terminal ID: ' + copy(Token,1,8));
         Lines.add('Cash register number: ' + copy(Token,9,4));
         Lines.add('Cashier ID: ' + copy(Token,13,4));
         Lines.add('Reference Number: ' + copy(Token,17,6));
       end;
     end;
  2: begin
       loc := pos('/', Token);
       token := trim(copy(token, loc+1, length(token)));
       loc := pos('/', Token);
       token := trim(copy(token, 1, loc-1));
       result := 'Response Code string: ' + Token;
     end;
  3: begin
       result := 'Auth. Code: ' + Token;
     end;
  4: begin
       result := 'Processing Code: ' + Token;
     end;
  5: begin
       result := 'Transaction Amount: ' + defineAmount(Token);
     end;
  6: begin
       result := 'Additional Amount: ' + Token;
     end;
  7: begin
       //result := 'PAN Card Number/FTD: ' + Token;
       result := Token;
     end;
  9: begin
        result := 'Reference Number: ' + Token;
     end;
  10: begin
        result := 'Transaction Time: ' + Token;
     end;
  11: begin
        result := 'EBT Food Stamp Balance / GIFT CARD Balance: ' + Token;
      end;
  12: begin
        result := 'EBT Cash: ' + Token;
      end;
  13: begin
        //result := 'Special Account: ' + getSpecialAccount(Token);
        result := getSpecialAccount(Token);
      end;
  14: begin
        result := 'Host Text1: ' + Token;
      end;
  15: begin
        result := 'Host Text2: ' + Token;
      end;
  16: begin
        result := 'Trans ID (SDT): ' + Token;
      end;
  17: begin
        //result := 'Batch Number: ' + Token;
        result := Token;
      end;
  18: begin
        result := 'Trace: ' + Token;
      end;
  19: begin
        result := 'Reserved Future: ' + Token;
      end;
  20: begin
        if
          Token = '1' then Token := 'Manual entry mode'
        else
          Token := 'Not manual entry mode';
        result := 'Manual Entry Indicator: ' + Token;
      end;
  21: begin
        result := 'Merchant ID: ******' + copy(trim(Token),Length(trim(token))-3,4);
        result := '******' + copy(trim(Token),Length(trim(token))-3,4);
      end;
  22: begin
        DefineEFMF(1, Token, '');
        {if EFMF = 3 then result := DefineEFMF(3, Token, '');
        if EFMF = 23 then result := DefineEFMF(23, Token, '');}
      end;
  23: begin
        result := 'IVU Lotto Information: ' + Token;
      end;
  24: begin
        lrc(Token);
      end;
  end;
end;




function TCommonRoutines.DefineEFMF(counter: Integer; Token, Option: String): String;// EXTENDED FIELD MULTIPLE FUNCTIONS
Var
  sl2: TStringList;
  i: integer;
  s: String;
begin
  result:='';
  //counter := 0;
  sl2 := TStringList.Create;
  sl2.StrictDelimiter := TRUE;
  sl2.Delimiter := '/';//chr(30);// chr(28);
  sl2.DelimitedText := Trim(Token);
  i := sl2.Count;
  //memoDefine.Lines.Add('======EXTENDED FIELD MULTIPLE FUNCTIONS======');
  for i := 0 to i - 1 do
  begin
    //counter := counter + 1;
    if sl2.Strings[i] > '' then
    begin
      case i of
      0: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'Card Type: ' + sl2.Strings[i];
         end;
      1: begin
            CommonRoutine.TransType := sl2.Strings[i];
            {if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'Transaction Type: ' + sl2.Strings[i];}
         end;
      2: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
            begin
              result := 'Host: ' + sl2.Strings[i];
              Host := 'Host: ' + sl2.Strings[i];
            end;
         end;
      3: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'Payment Version: ' + sl2.Strings[i];
         end;
      4: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'Barcode Data/Token: ' + sl2.Strings[i];
         end;
      5: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
            begin
              StateTax := defineAmount(sl2.Strings[i]);
              //result := 'State Tax: ' + defineAmount(sl2.Strings[i]));
            end;
         end;
      6: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
            begin
              CityTax := defineAmount(sl2.Strings[i]);
            end;
         end;
      7: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
            begin
              SubTotal := DefineAmount(sl2.Strings[i]);   // 'Adjust Data: total'
            end;

         end;
      8: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
            begin
              ReducedTax := DefineAmount(sl2.Strings[i]); //'Reduced State Tax:
            end;
          end;
      9: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              //result := 'Base amount for Reduced State Tax: ' + defineAmount(result+sl2.Strings[i]));
          end;
      10: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'ATH Trans ID Number: ' + result+sl2.Strings[i];
          end;
      11: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'Vivienda Balance: ' + result+sl2.Strings[i];
          end;
      12: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'Farmer Balance: ' + result+sl2.Strings[i];
          end;
      13: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'R1 Balance: ' + result+sl2.Strings[i];
          end;
      14: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'R2 Balance: ' + result+sl2.Strings[i];
          end;
      15: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'Card bin type: ' + result+sl2.Strings[i];
          end;
      16: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
            begin
              s := UpperCase(result+sl2.Strings[i]);
              if s = 'ONLINE' then s := 'PIN Online';
              if s = 'OFFLINE' then s := 'PIN Offline';
              if s = 'NONE' then s := 'No se ingresó PIN';
              result := 'Card Acceptor ID: ' + s;
              s:='';
            end;
          end;
      17: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'Base amount for Tip: ' + result+sl2.Strings[i];
          end;
      18: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
              result := 'Reserved Future: ' + result+sl2.Strings[i];
          end;
      19: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
            begin
              s := UpperCase(result+sl2.Strings[i]);
              if s = 'SIGN' then s := 'Signature Required';
              if s = 'NOSIGN' then s := 'No Signature Required';
              result := 'Signature Indicator: ' + s;
              s:='';
            end;
          end;
      20: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
            begin
              s := UpperCase(result+sl2.Strings[i]);
              if s = 'C' then s := 'Cashback';
              if s = 'T' then s := 'Tip';
              if s = ' ' then s := 'None';
              result := 'Extended amount type: ' + s;
              s:='';
            end;
          end;
      21: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
            begin
              s := UpperCase(result+sl2.Strings[i]);
              if s = 'C' then s := 'Credit';
              if s = 'D' then s := 'Debit';
              if s = 'I' then s := 'Ivu';
              result := 'Transaction type Indicator: ' + s;
              s:='';
            end;
          end;
      22: begin
            if Option = 'void' then result := result+sl2.Strings[i] + '/'
            else
            begin
              s := UpperCase(sl2.Strings[i-1]);
              if s = 'F' then s := 'FALLBACK';
              if s = 'S' then s := 'SWIPE';
              if s = 'L' then s := 'CONTACTLESS';
              if s = 'C' then s := 'DEFAULT CHIP';
              //result := 'EMV FALLBACK: ' + s;
              result := s;
              FALLBACK := s;
            end;
          end;
      end;
    end;
  end;
end;

function TCommonRoutines.lrc(token: String): String;
Var
  sl3: TStringList;
  i: integer;
  s: String;
  loc: Integer;
  counter: integer;
  str: String;
begin
  counter :=0;
  sl3 := TStringList.Create;
  sl3.StrictDelimiter := TRUE;
  sl3.Delimiter := '/';// chr(28);
  sl3.DelimitedText := Trim(token);
  i := sl3.Count;
  //memoDefine.Lines.Add('======APPROVAL OR DENIED BY CARD SECOND GEN CERTIFICATE======');
  for I := 0 to i - 1 do
  begin
    counter := counter + 1;
    case counter of
    1: result := sl3.Strings[I]; //'Application Label: ' +
    2: result := sl3.Strings[I];
    3: result := sl3.Strings[I]; //'Application Cryptogram: ' +
    4: result := sl3.Strings[I]; //'Unpredictable Number: ' +
    5: result := sl3.Strings[I];
    6: result := sl3.Strings[I];
    end;
    str := str + result + chr(13);
  end;
  sl3.Free;
  With FrmReceiptView.RichEdit1 do
  begin
    Lines.Add(str);
  end;
end;


procedure TCommonRoutines.parseJson(json: String);
var
  JSONValue: TJSONValue;
  JSONObj: TJSONObject;
  Fsucess: string;
begin
  JSONValue := nil;
  try
    JSONValue := TJSONObject.ParseJSONValue(json);
    if Assigned(JSONValue) and (JSONValue is TJSONObject) then
    begin
      JSONObj := JSONValue as TJSONObject;
      if JSONObj.TryGetValue<string>('GeneralResponse.ResultCode', Fsucess) then
      begin
        JSONObj.TryGetValue<string>('GeneralResponse.Message', FMessage);
        JSONObj.TryGetValue<string>('GeneralResponse.DetailedMessage', FMessageDet);
        JSONObj.TryGetValue<string>('TransactionNumber', FTransactionId);
        JSONObj.TryGetValue<string>('AuthCode', FApprovalCode);
        JSONObj.TryGetValue<string>('GeneralResponse.HostResponseCode', FResponseCode);
        JSONObj.TryGetValue<string>('CardData.Last4', FCardNumber);
        JSONObj.TryGetValue<string>('CardData.CardType', FCardType);
        JSONObj.TryGetValue<string>('CardData.Name', FCardHolder);
        JSONObj.TryGetValue<string>('CardData.CardType', FCardType);
        JSONObj.TryGetValue<string>('CardData.EntryType', FEntryType);
        JSONObj.TryGetValue<String>('Amounts.TotalAmount', FAmount);
        JSONObj.TryGetValue<String>('ReferenceId', FRefNum);
        JSONObj.TryGetValue<String>('BatchNumber', FBatchNum);
        JSONObj.TryGetValue<String>('InvoiceNumber', FInvoiceNo);
        JSONObj.TryGetValue<String>('PaymentType', FTypePayment);
        JSONObj.TryGetValue<String>('TransactionType', FTransactionType);
        JSONObj.TryGetValue<String>('Signature', FSignature);
        JSONObj.TryGetValue<String>('EMVData.ApplicationName', FApplicationName);
      end;
    end;
  finally

  end;
end;

function TCommonRoutines.DefineJournal(counter: Integer; Option,
  Token: String): String;
Var
  loc, loc2, len: integer;
  s: String;
  amount: double;
  amount2: String;
begin
  result := '';
  case counter of
  0: begin
       //result := 'Authorization Code: ' + Token);
     end;
  1: begin
       if option = 'view' then result := 'ID Database Index: ' + Token;
     end;
  2: begin
       if option = 'extended' then result := Token + '/';
       if option = 'view' then result := 'Card Type: ' + Token;
     end;
  3: begin
       if option = 'view' then result := 'Transaction Type: ' + Token;
     end;
  4: begin
       if option = 'view' then result := 'Payment Type: ' + Token;
     end;
  5: begin
       if option = 'view' then result := 'Host Type: ' + Token;
     end;
  6: begin
       if option = 'view' then result := 'Host Version: ' + Token;
     end;
  7: begin
       if option = 'view' then result := 'IPE Terminal ID: ' + Token;
     end;
  8: begin
       if option = 'view' then result := 'Station Number: ' + Token;
     end;
  9: begin
       if option = 'view' then result := 'Cashier ID: ' + Token;
     end;
  10: begin
        if option = 'view' then result := 'Reference Number: ' + Token;
      end;
  11: begin
        if option = 'void' then result := result + chr(28);
        //if option = 'view' then result := 'Response Code string: ' + responseCode(Token);
      end;
  12: begin
        if option = 'void' then result := result + Token + chr(28);
        if option = 'view' then result := 'Authorization Code: ' + Token;
      end;
  13: begin
        if option = 'void' then result := result + '220000' + chr(28);
        if option = 'view' then result := 'Processing Code: ' + Token;
      end;
  14: begin
        if option = 'extended' then result := formatAmounts(Token)  + '/'
        else
         if option = 'void' then result := formatAmounts(Token) + chr(28)
        else
         if option = 'view' then result := 'Transaction Amount: ' + Token;
      end;
  15: begin
        if option = 'extended' then result := formatAmounts(Token)  + '/';
        if option = 'view' then result := 'State Tax: ' + Token;
      end;
  16: begin
        if option = 'extended' then result := formatAmounts(Token)  + '/';
        if option = 'view' then result := 'City Tax: ' + Token;
      end;
  17: begin
        if option = 'extended' then result := formatAmounts(Token)  + '/'
        else
        if option = 'void' then result :=  formatAmounts(Token) + chr(28)
        else
          if option = 'view' then result := 'Additional Amount: ' + Token;
      end;
  18: begin
        if option = 'view' then result := 'Tip Amount: ' + Token;
      end;
  19: begin
        if option = 'void' then result := result + Token + chr(28);
        //if option = 'view' then result := 'PAN Card Number/FTD: ' + Token;
        if option = 'view' then result := Token;
      end;
  20: begin
        if option = 'void' then result := Token + chr(28);
        if option = 'view' then result := 'Invoice Number: ' + Token;
      end;
  21: begin
        if option = 'void' then result := result  + chr(28);
        if option = 'view' then result := 'Transaction Time: ' + Token;
      end;
  22: begin
        if option = 'void' then result := result + chr(28);
        if option = 'view' then result := 'Transaction Date: ' + Token;
      end;
  23: begin
        if option = 'void' then result := result + chr(28);
        if option = 'view' then result := 'EBT Food Stamp Balance / GIFT CARD Balance: ' + Token;
      end;
  24: begin
        if option = 'void' then result := result + chr(28);
        if option = 'view' then result := 'EBT Cash Balance: ' + Token;
      end;
  25: begin
        if option = 'void' then result := result + Token + chr(28);
        if option = 'view' then
        result := 'Special Account: ' + Token;
      end;
  26: begin
        if option = 'void' then result := result + chr(28);
        if option = 'view' then
        result := 'Host Text1: ' + Token;
      end;
  27: begin
        if option = 'void' then result := result + chr(28);
        if option = 'view' then
        result := 'Host Text2: ' + Token;
      end;
  28: begin
        if option = 'void' then result := result + Token + chr(28);
        if option = 'view' then
          result := 'Trans ID (SDT): ' + Token;
      end;
  29: begin
        if option = 'void' then result := result + chr(28);
        if option = 'view' then
          result := 'Batch Number: ' + Token;
      end;
  30: begin
        if option = 'void' then result := result + chr(28);
        if option = 'view' then
          result := 'Trace Number: ' + Token;
      end;
  31: begin
        if option = 'void' then result := result + chr(28);
        if option = 'view' then
        result := 'Reserved Future: ' + Token;
      end;
  32: begin
        if option = 'void' then result := result + Token + chr(28);
        if option = 'view' then
          result := 'Manual Entry Indicator: ' + Token;
      end;
  33: begin
        if option = 'void' then result := result + chr(28);
        if option = 'view' then
          result := 'POS Retailer: ' + Token;
      end;
  34: begin
        //if option = 'view' then DefineEFMF(Token, Option);
      end;
  35: begin
        if option = 'view' then result := 'Service Account: ' + Token;
      end;
  36: begin
        if option = 'view' then result := 'Capture Date: ' + Token;
      end;
  37: begin
        if option = 'extended' then result := formatAmounts(Token)  + '/';
        if option = 'view' then
          result := 'Reduced State Tax: ' + Token;
      end;
  38: begin
        if option = 'extended' then result := formatAmounts(Token)  + '/';
        if option = 'view' then
          result := 'Base amount for Reduced State Tax: ' + Token;
      end;
  39: begin
        if option = 'view' then result := 'Reserved Future: ' + Token;
      end;
  40: begin
        if option = 'view' then result := 'Ivu Lotto control Data: ' + Token;
      end;
  41: begin
        if option = 'view' then result := 'Transaction Host Id: ' + Token;
      end;
  42: begin
        if option = 'view' then result := 'EMV Transaction: ' + Token;
      end;
  43: begin
        if option = 'view' then result := 'Reserved Future: ' + Token;
      end;
  end;
end;

Procedure TCommonRoutines.PrintSettlement(response: String);
Var
  sl2, sl3: TStringList;
  i, i2: integer;
  s, Token: String;
  CreditAmount, CreditRefund: String;
  DebitAmount, DebitRefund: String;
  CashAmount, CashRefund: String;
  TerminalID, MerchantID, CashRegister,
  CashierID, Status: String;
  Loc: Integer;
begin
  With DM do
  begin
    Token := response;
    sl2 := TStringList.Create;
    sl2.StrictDelimiter := TRUE;
    sl2.Delimiter := chr(28);
    sl2.DelimitedText := Trim(Token);
    i := sl2.Count;
    With FrmReceiptView do
    begin
      With FrmReceiptView.RichEdit1 do
      begin
        for i := 0 to i - 1 do
        begin
          //counter := counter + 1;
          if sl2.Strings[i] > '' then
          begin
            case i of
            0: begin
                 loc := Pos('.', sl2.Strings[i]);
                 TerminalID := Copy(sl2.Strings[i], loc+1, 8);
                 CashRegister := Copy(sl2.Strings[i], loc+9, 4);
                 CashierID := Copy(sl2.Strings[i], loc+13, 4);
                 MerchantID := '';
                 Lines.Add('');
                 Lines.Add('Terminal ID: ' + TerminalID);
                 Lines.Add('Cash Register: ' + CashRegister);
                 Lines.Add('Cashier ID: ' + CashierID);
                 Lines.Add('');
               end;
            1: begin
                 Status := Copy(Trim(sl2.Strings[i]), 4, 50);
                 Status := Trim(Copy(Status,1, Length(status) -3));
                 Lines.Add(Status);
                 Lines.Add('');
               end;
            2: begin
                 sl3 := TStringList.Create;
                 sl3.StrictDelimiter := true;
                 sl3.Delimiter := '/';
                 sl3.DelimitedText := Trim(sl2.Strings[i]);
                 i2 := sl3.Count;
                 for i2 := 0 to i2 - 1 do
                 begin
                   case i2 of
                     0: CreditAmount := sl3.Strings[i2];
                     1: begin
                          Lines.Add('CREDIT');
                          Lines.Add(Format('%26s %8s%1s',[
                          Copy(FrmMain.LeftJString('Sale' + ' '
                          + '(' + CreditAmount + ')',26),1,26),
                          formatAmountsToDollars(sl3.Strings[i2]),
                          '']));

                        end;
                     2: CreditRefund := sl3.Strings[i2];
                     3: begin
                          Lines.Add(Format('%26s %8s%1s',[
                          Copy(FrmMain.LeftJString('Refund' + ' '
                          + '(' + CreditRefund + ')',26),1,26),
                          formatAmountsToDollars(sl3.Strings[i2]),
                          '']));
                          Lines.Add('');
                        end;

                     4: DebitAmount := sl3.Strings[i2];
                     5: begin
                          Lines.Add('DEBIT');
                          Lines.Add(Format('%26s %8s%1s',[
                          Copy(FrmMain.LeftJString('Sale' + ' '
                          + '(' + DebitAmount + ')',26),1,26),
                          formatAmountsToDollars(sl3.Strings[i2]),
                          '']));
                        end;
                     6: DebitRefund := sl3.Strings[i2];
                     7: begin
                          Lines.Add(Format('%26s %8s%1s',[
                          Copy(FrmMain.LeftJString('Refund' + ' '
                          + '(' + DebitRefund + ')',26),1,26),
                          formatAmountsToDollars(sl3.Strings[i2]),
                          '']));
                          Lines.Add('');
                        end;

                     8: CashAmount := sl3.Strings[i2];
                     9: begin
                          Lines.Add('CASH');
                          Lines.Add(Format('%26s %8s%1s',[
                          Copy(FrmMain.LeftJString('Sale' + ' '
                          + '(' + CashAmount + ')',26),1,26),
                          formatAmountsToDollars(sl3.Strings[i2]),
                          '']));
                        end;
                     10: CashRefund := sl3.Strings[i2];
                     11: begin
                           Lines.Add(Format('%26s %8s%1s',[
                           Copy(FrmMain.LeftJString('Refund' + ' '
                           + '(' + CashRefund + ')',26),1,26),
                           formatAmountsToDollars(sl3.Strings[i2]),
                           '']));
                           Lines.Add('.');
                         end;

                   end;
                 end;

               end;
            end;
          end;
        end;
        Lines.Add('');
        Lines.Add('');
        Lines.Add('');
        Lines.Add('.');
        Print('');
      end;
      //ShowModal;
    end;
  end;
  sl2.Free;
  sl3.Free;
end;

procedure TCommonRoutines.printSpinValues(Token: String);
begin
  with FrmReceiptView.RichEdit1 do
  begin
    parseJson(token);
    //Lines.Add(Host);
    //Lines.Add(DefineResponse(22, 3, sl.Strings[21]));
    Lines.add('Batch     Trans. ID    Trans. Type');
    Lines.add(FBatchNum + '        ****' +  FTransactionId +
    '           ' + FTransactionType); //batch //terminal ID // // Merchant ID
    Lines.Add('');
    FrmReceiptView.LblDummy.Font.Style := [fsBold];
    SelAttributes.Assign(FrmReceiptView.LblDummy.Font);
    Lines.Add(uppercase(CenterString(Trim(FApplicationName),33)));
    Lines.Add('');
    Lines.Add(FEntryType);
    Lines.Add(FCardType + ' ************' + FCardNumber +
             ' ' + FALLBACK); //DefineResponse(22, 23, sl.Strings[21])) ; //special account + PAN Card Number/FTD +
    Lines.Add('');
    Lines.add('Auth. Code: ' + FApprovalCode + '   ' +'Invoice: ' + FInvoiceNo); //Authorization code //Invoice Number
    Lines.add('Trace: ' + '      '+ 'Reference: ' + FRefNum); //Trace Number //Reference number

    if Void = true then
    begin
      With FrmReceiptView.RichEdit1 do
      begin
        Lines.Add('------------------------------------');
        Lines.Add(Format('%24s %10s',['STATE TAX:', Format('%m',[StrToFloat(StateTax)*-1])]));
        Lines.Add(Format('%24s %10s',['REDUCED TAX:', Format('%m',[StrToFloat(ReducedTax)*-1])]));
        Lines.Add(Format('%24s %10s',['MUNICIPAL TAX:', Format('%m',[StrToFloat(CityTax)*-1])]));
        Lines.Add('------------------------------------');
        Lines.Add(Format('%24s %10s',['TOTAL:', Format('%m',[StrToFloat(SubTotal)*-1])]));
        Lines.Add('');
        Lines.Add('');
      end;
    end;
  end;
end;

Procedure TCommonRoutines.PrintHeading(RegisterNo, TransNo: Integer);
begin

  With FrmReceiptView.RichEdit1 do
  begin
    Lines.Clear;
    //lines.LoadFromFile('C:\Wescom_Decimal\SalesTech2017\images\PayPal.rtf');
    //RichEdit1.ReadOnly := True;
    //FrmReceiptView.RE_SetLineSpacing(RichEdit1, 1);
    ParentFont := false;
    Font.Style := [];
    Font.Name := 'Lucida Console';
    Font.Size := FrmMain.PrinterFontSize; //6;

    Lines.Add('------------------------------------');
    FrmReceiptView.LblDummy.Font.Name := 'Lucida Console';
    FrmReceiptView.LblDummy.Font.Size := FrmMain.PrinterFontSize + 2;//10;
    FrmReceiptView.LblDummy.Font.Style := [fsBold];
    SelAttributes.Assign(FrmReceiptView.LblDummy.Font);
    Lines.Add(CenterString(Trim(dm.CDSSetupSTORENAME.Value),33));
    FrmReceiptView.LblDummy.Font.Size := FrmMain.PrinterFontSize;//6;
    FrmReceiptView.LblDummy.Font.Style := [fsBold];
    SelAttributes.Assign(FrmReceiptView.lblDummy.Font);
    Lines.Add(CenterString(Trim(DM.CDSSetupSTOREADDRESS.Value),33));
    FrmReceiptView.LblDummy.Font.Size := FrmMain.PrinterFontSize;//6;
    FrmReceiptView.LblDummy.Font.Style := [fsBold];
    SelAttributes.Assign(FrmReceiptView.LblDummy.Font);
    Lines.Add(CenterString(dm.CDSSetupSTORETELEPHONE.Value,33));

    FrmReceiptView.LblDummy.Font.Style := [];
    SelAttributes.Assign(FrmReceiptView.LblDummy.Font);
    Lines.Add('PS----------------------------------');
    //Lines.Add('Terminal ID: ' + CommonPOS.IVULOTO_TERMINALID);
    Lines.Add(Format('%0s %24s%',['Register: '+ IntToStr(RegisterNo), 'ID: ' +IntToStr(TransNo)]));
    Lines.Add(Format('%22s%',[DateTimetoStr(Now)]));
    //--------------- Active Pinpad ----------------------------------
  end;
end;


function TCommonRoutines.StrReplace(Str: string): String;
begin
  Str := stringReplace(Str, ']', ')', [rfReplaceAll, rfIgnoreCase]);
  Str := stringReplace(Str, '[', '(', [rfReplaceAll, rfIgnoreCase]);
  Str := stringReplace(Str, '{', ' ', [rfReplaceAll, rfIgnoreCase]);
  Str := stringReplace(Str, '}', ' ', [rfReplaceAll, rfIgnoreCase]);
  Str := stringReplace(Str, '''', '', [rfReplaceAll, rfIgnoreCase]);
  Str := stringReplace(Str, '"', '', [rfReplaceAll, rfIgnoreCase]);
  Result := Str;
end;

function TCommonRoutines.GetLocalIp: string;
var
  IPW: TIdIPWatch;
begin
  IPW := TIdIPWatch.Create(nil);
  try
    ipw.HistoryEnabled := False;
    if IPW.LocalIP <> '' then
      Result := IPW.LocalIP;
  finally
    IPW.Free;
  end;
end;




Initialization
CommonRoutine:= TCommonRoutines.Create;


end.
