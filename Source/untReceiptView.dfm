object FrmReceiptView: TFrmReceiptView
  Left = 0
  Top = 0
  Caption = 'Receipt'
  ClientHeight = 587
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LblDummy: TLabel
    Left = 48
    Top = 296
    Width = 48
    Height = 13
    Caption = 'LblDummy'
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 546
    Width = 286
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnOk: TButton
      AlignWithMargins = True
      Left = 207
      Top = 4
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
  end
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 286
    Height = 546
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 1
    WantTabs = True
  end
end
