unit untReceiptView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, RichEdit;

type
  TFrmReceiptView = class(TForm)
    Panel1: TPanel;
    btnOk: TButton;
    RichEdit1: TRichEdit;
    LblDummy: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure resetFont;
    procedure RE_SetLineSpacing(ARichEdit: TRichEdit; lineSpacing: Byte);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReceiptView: TFrmReceiptView;

implementation

{$R *.dfm}



procedure TFrmReceiptView.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  aStream : tMemoryStream;
begin
{  if Assigned(frmOpenTabs) then
  begin
    try
        aStream := TMemoryStream.Create;
        RichEdit1.Lines.SaveToStream (aStream);
        aStream.Position := 0;
        frmOpenTabs.RichEdit1.Plaintext := false;
        frmOpenTabs.RichEdit1.Lines.LoadFromStream (aStream);
    finally
        aStream.Free;
    end;
  end;}
end;

procedure TFrmReceiptView.resetFont;
var
  Para: TParaFormat2;
begin
  Para.cbSize := SizeOf(Para);
  Para.dwMask := PFM_LINESPACING;
  Para.bLineSpacingRule := 1;  // Use exact twips specified
  Para.dyLineSpacing := 50;   // Ridiculously small value
  SendMessage(RichEdit1.Handle, EM_SETPARAFORMAT, 0, LPARAM(@Para));
end;

procedure TFrmReceiptView.RE_SetLineSpacing(ARichEdit: TRichEdit; lineSpacing: Byte);
var
  pf2: ParaFormat2;
begin
  FillChar(pf2, SizeOf(pf2), 0);
  pf2.cbSize := SizeOf(PARAFORMAT2);
  pf2.dwMask := PFM_LINESPACING;
  pf2.bLineSpacingRule := lineSpacing;
  SendMessage(ARichEdit.Handle, EM_SETPARAFORMAT, 0, Longint(@pf2));
end;


end.
