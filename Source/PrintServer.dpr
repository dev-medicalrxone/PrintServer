program PrintServer;

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  frxClass,
  frxDBSet,
  Vcl.StdCtrls,
  frxBarcode,
  Vcl.ExtCtrls,
  Soap.InvokeRegistry,
  Soap.Rio,
  Soap.SOAPHTTPClient,
  Registry,
  TlHelp32,
  Vcl.Menus,

  UntMain in 'UntMain.pas' {FrmMain},
  UntData in 'UntData.pas' {DM: TDataModule},
  WSAlchemy2 in 'WSAlchemy2.pas',
  ResourceLocalizer in 'ResourceLocalizer.pas',
  UntGSDD4 in 'UntGSDD4.pas',
  GSDD5Server in 'GSDD5Server.pas',
  UntGSDD5 in 'UntGSDD5.pas',
  untReceiptView in 'untReceiptView.pas' {FrmReceiptView},
  UntRptRecibo in 'UntRptRecibo.pas' {FrmRptRecibo},
  UntReceipt in 'UntReceipt.pas' {FrmReceipt},
  UntLASCL_13TL in 'UntLASCL_13TL.pas' {FrmLabels},
  UntIVULoto in 'UntIVULoto.pas',
  UntCommon in 'UntCommon.pas';

{$R *.res}
var
MyAppName   : Array[0..255] of Char;
MyClassName : Array[0..255] of Char;
NumFound    : Integer;
LastFound   : HWnd;
MyPopup     : HWnd;
AllowedInstances : Integer;//= 3;

procedure RestoreWindow(aFormName : string);
var
   Wnd,
   App : HWND;

begin
     Wnd := FindWindow(PChar(aFormName), nil);
     if (Wnd <> 0)
        then begin // Set Window to foreground
             App := GetWindowLong(Wnd, GWL_HWNDPARENT);
             if IsIconic(App)
                then ShowWindow(App, SW_RESTORE);

             SetForegroundwindow(App);
             end;
end;

{function ProcessCount(const ExeName: String): Integer;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle:= CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize:= SizeOf(FProcessEntry32);
  ContinueLoop:= Process32First(FSnapshotHandle, FProcessEntry32);
  Result:= 0;
  while Integer(ContinueLoop) <> 0 do begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeName))) then Inc(Result);
    ContinueLoop:= Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  //Prescription.InstanceNumber := Result;
  CloseHandle(FSnapshotHandle);
end;}



function CountProcessesByName(const ExeName: string): Integer;
var
  Snapshot: THandle;
  ProcessEntry: TProcessEntry32;
begin
  Result := 0;
  Snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Snapshot <> INVALID_HANDLE_VALUE then
  begin
    try
      ProcessEntry.dwSize := SizeOf(TProcessEntry32);
      if Process32First(Snapshot, ProcessEntry) then
      begin
        repeat
          if SameText(ProcessEntry.szExeFile, ExeName) then
            Inc(Result);
        until not Process32Next(Snapshot, ProcessEntry);
      end;
    finally
      CloseHandle(Snapshot);
    end;
  end;
end;

Var
  Registro: TRegistry;
  NoExecRunning: Integer;
begin
  AllowedInstances := 1;
  Application.Initialize;
  Application.Title := 'PrintServer';
  NumFound := 0;
  LastFound := 0;
  NoExecRunning := CountProcessesByName(ExtractFileName(Application.ExeName));
  //ShowMessage(IntToStr(NoExecRunning));
  if NoExecRunning > 1 then begin
    MessageDlg('Application is already running! ' + IntToStr(NoExecRunning), mtError, [mbOK], 0);
    Application.Terminate;
  end
  else
  begin
    Application.Initialize;
    Application.Initialize;
    Application.Title := 'Print Server';
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TDM, DM);
    Application.CreateForm(TFrmMain, FrmMain);
    Application.CreateForm(TFrmReceipt, FrmReceipt);
    Application.CreateForm(TFrmReceiptView, FrmReceiptView);
    Application.CreateForm(TFrmRptRecibo, FrmRptRecibo);
    Application.CreateForm(TFrmReceipt, FrmReceipt);
    Application.Run;
  end;



end.
