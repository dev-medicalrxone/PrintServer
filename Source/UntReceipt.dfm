object FrmReceipt: TFrmReceipt
  Left = 391
  Top = 240
  Caption = 'Receipt'
  ClientHeight = 848
  ClientWidth = 1436
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object sqlTransHeader: TFDQuery
    Connection = DM.FDConnectionPOS
    SQL.Strings = (
      'Select * from TransactionHeader_Temp ')
    Left = 232
    Top = 168
  end
  object sqlTransDetail: TFDQuery
    Connection = DM.FDConnectionPOS
    SQL.Strings = (
      'SELECT * FROM TransactionDetail_Temp')
    Left = 232
    Top = 344
  end
  object dspTransHead: TDataSetProvider
    DataSet = sqlTransHeader
    Options = [poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 320
    Top = 168
  end
  object dspTransDetail: TDataSetProvider
    DataSet = sqlTransDetail
    Options = [poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 312
    Top = 344
  end
  object CDSTransHead: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransHead'
    AfterScroll = CDSTransHeadAfterScroll
    OnCalcFields = CDSTransHeadCalcFields
    Left = 520
    Top = 168
    object CDSTransHeadPAYMENTTYPE1: TStringField
      FieldName = 'PAYMENTTYPE1'
      Origin = 'PAYMENTTYPE1'
      FixedChar = True
      Size = 4
    end
    object CDSTransHeadTRANSACTIONDATE: TSQLTimeStampField
      FieldName = 'TRANSACTIONDATE'
      Origin = 'TRANSACTIONDATE'
      Required = True
    end
    object CDSTransHeadNUMBERITEMS: TIntegerField
      FieldName = 'NUMBERITEMS'
      Origin = 'NUMBERITEMS'
      Required = True
    end
    object CDSTransHeadCREDITCARD1: TStringField
      FieldName = 'CREDITCARD1'
      Origin = 'CREDITCARD1'
      Size = 50
    end
    object CDSTransHeadOPENED: TStringField
      FieldName = 'OPENED'
      Origin = 'OPENED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDSTransHeadVOIDED: TIntegerField
      FieldName = 'VOIDED'
      Origin = 'VOIDED'
      Required = True
    end
    object CDSTransHeadCUSTOMERID: TIntegerField
      FieldName = 'CUSTOMERID'
      Origin = 'CUSTOMERID'
    end
    object CDSTransHeadTRANSACTIONTIME: TSQLTimeStampField
      FieldName = 'TRANSACTIONTIME'
      Origin = 'TRANSACTIONTIME'
    end
    object CDSTransHeadPAID: TStringField
      FieldName = 'PAID'
      Origin = 'PAID'
      FixedChar = True
      Size = 1
    end
    object CDSTransHeadPAYMENTTYPE2: TStringField
      FieldName = 'PAYMENTTYPE2'
      Origin = 'PAYMENTTYPE2'
      FixedChar = True
      Size = 4
    end
    object CDSTransHeadCREDITCARD2: TStringField
      FieldName = 'CREDITCARD2'
      Origin = 'CREDITCARD2'
      FixedChar = True
      Size = 50
    end
    object CDSTransHeadSHIFT: TSmallintField
      FieldName = 'SHIFT'
      Origin = 'SHIFT'
    end
    object CDSTransHeadREGISTER: TSmallintField
      FieldName = 'REGISTER'
      Origin = 'REGISTER'
      Required = True
    end
    object CDSTransHeadEMPLOYNUMBER: TStringField
      FieldName = 'EMPLOYNUMBER'
      Origin = 'EMPLOYNUMBER'
      Required = True
      Size = 3
    end
    object CDSTransHeadDELIVERYADDRESS1: TStringField
      FieldName = 'DELIVERYADDRESS1'
      Origin = 'DELIVERYADDRESS1'
      Size = 30
    end
    object CDSTransHeadDELIVERYADDRESS2: TStringField
      FieldName = 'DELIVERYADDRESS2'
      Origin = 'DELIVERYADDRESS2'
      Size = 30
    end
    object CDSTransHeadDELIVERYNAME: TStringField
      FieldName = 'DELIVERYNAME'
      Origin = 'DELIVERYNAME'
      Size = 30
    end
    object CDSTransHeadDELIVEREDBY: TStringField
      FieldName = 'DELIVEREDBY'
      Origin = 'DELIVEREDBY'
      Size = 30
    end
    object CDSTransHeadPONUMBER: TStringField
      FieldName = 'PONUMBER'
      Origin = 'PONUMBER'
    end
    object CDSTransHeadDELIVERYPHONE: TStringField
      FieldName = 'DELIVERYPHONE'
      Origin = 'DELIVERYPHONE'
      Size = 13
    end
    object CDSTransHeadID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object CDSTransHeadTRANSACTIONNUMBER: TAutoIncField
      FieldName = 'TRANSACTIONNUMBER'
      Origin = 'TRANSACTIONNUMBER'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSTransHeadPAYMENTTYPE3: TStringField
      FieldName = 'PAYMENTTYPE3'
      Origin = 'PAYMENTTYPE3'
      FixedChar = True
      Size = 4
    end
    object CDSTransHeadPAYMENTTYPE4: TStringField
      FieldName = 'PAYMENTTYPE4'
      Origin = 'PAYMENTTYPE4'
      FixedChar = True
      Size = 4
    end
    object CDSTransHeadCREDITCARD3: TStringField
      FieldName = 'CREDITCARD3'
      Origin = 'CREDITCARD3'
      Size = 50
    end
    object CDSTransHeadCREDITCARD4: TStringField
      FieldName = 'CREDITCARD4'
      Origin = 'CREDITCARD4'
      Size = 50
    end
    object CDSTransHeadDELIVERED: TStringField
      FieldName = 'DELIVERED'
      Origin = 'DELIVERED'
      Size = 1
    end
    object CDSTransHeadSUPERVISOR: TStringField
      FieldName = 'SUPERVISOR'
      Origin = 'SUPERVISOR'
      Size = 3
    end
    object CDSTransHeadCUSTOMER: TWideStringField
      FieldName = 'CUSTOMER'
      Origin = 'CUSTOMER'
      FixedChar = True
      Size = 30
    end
    object CDSTransHeadCUSTOMER_DEFINE: TWideStringField
      FieldKind = fkLookup
      FieldName = 'CUSTOMER_DEFINE'
      LookupDataSet = cdsOpenTabs
      LookupKeyFields = 'TRANSACTIONNUMBER'
      LookupResultField = 'CUSTOMER'
      KeyFields = 'TRANSACTIONNUMBER'
      Size = 45
      Lookup = True
    end
    object CDSTransHeadSERVER: TStringField
      FieldKind = fkLookup
      FieldName = 'SERVER'
      LookupDataSet = cdsPasswords
      LookupKeyFields = 'INICIALES'
      LookupResultField = 'USERNAME'
      KeyFields = 'EMPLOYNUMBER'
      Size = 35
      Lookup = True
    end
    object CDSTransHeadRecallNoTrans: TStringField
      FieldKind = fkCalculated
      FieldName = 'RecallNoTrans'
      Calculated = True
    end
    object CDSTransHeadPAYAMOUNT1: TFMTBCDField
      FieldName = 'PAYAMOUNT1'
      Origin = 'PAYAMOUNT1'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadPAYAMOUNT2: TFMTBCDField
      FieldName = 'PAYAMOUNT2'
      Origin = 'PAYAMOUNT2'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX: TFMTBCDField
      FieldName = 'TAX'
      Origin = 'TAX'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTOTAL_TAX: TFMTBCDField
      FieldName = 'TOTAL_TAX'
      Origin = 'TOTAL_TAX'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX_ESTATAL: TFMTBCDField
      FieldName = 'TAX_ESTATAL'
      Origin = 'TAX_ESTATAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX_SERVICIO: TFMTBCDField
      FieldName = 'TAX_SERVICIO'
      Origin = 'TAX_SERVICIO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadPAYAMOUNT3: TFMTBCDField
      FieldName = 'PAYAMOUNT3'
      Origin = 'PAYAMOUNT3'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadPAYAMOUNT4: TFMTBCDField
      FieldName = 'PAYAMOUNT4'
      Origin = 'PAYAMOUNT4'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadREGTOTAL: TFMTBCDField
      FieldName = 'REGTOTAL'
      Origin = 'REGTOTAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadCHANGE: TFMTBCDField
      FieldName = 'CHANGE'
      Origin = 'CHANGE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadFOODTOTAL: TFMTBCDField
      FieldName = 'FOODTOTAL'
      Origin = 'FOODTOTAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX_FOOD_MUNICIPAL: TFMTBCDField
      FieldName = 'TAX_FOOD_MUNICIPAL'
      Origin = 'TAX_FOOD_MUNICIPAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX_FOOD_ESTATAL: TFMTBCDField
      FieldName = 'TAX_FOOD_ESTATAL'
      Origin = 'TAX_FOOD_ESTATAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTOTAL_DISCOUNT: TFMTBCDField
      FieldName = 'TOTAL_DISCOUNT'
      Origin = 'TOTAL_DISCOUNT'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTIP: TFMTBCDField
      FieldName = 'TIP'
      Origin = 'TIP'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadGRAND_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'GRAND_TOTAL'
      Calculated = True
    end
  end
  object cdsTransDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransDetail'
    Left = 520
    Top = 344
    object cdsTransDetailIDNUMBER: TAutoIncField
      FieldName = 'IDNUMBER'
      Origin = 'IDNUMBER'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsTransDetailTRANSACTIONNUMBER: TIntegerField
      FieldName = 'TRANSACTIONNUMBER'
      Origin = 'TRANSACTIONNUMBER'
      Required = True
    end
    object cdsTransDetailUPC: TStringField
      FieldName = 'UPC'
      Origin = 'UPC'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsTransDetailVOIDED: TIntegerField
      FieldName = 'VOIDED'
      Origin = 'VOIDED'
      Required = True
    end
    object cdsTransDetailSUBDETAIL: TStringField
      FieldName = 'SUBDETAIL'
      Origin = 'SUBDETAIL'
      FixedChar = True
      Size = 10
    end
    object cdsTransDetailPRODDESCRIPTION: TStringField
      FieldName = 'PRODDESCRIPTION'
      Origin = 'PRODDESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object cdsTransDetailPRODDEPARTMENT: TStringField
      FieldName = 'PRODDEPARTMENT'
      Origin = 'PRODDEPARTMENT'
      FixedChar = True
    end
    object cdsTransDetailFOOD: TStringField
      FieldName = 'FOOD'
      Origin = 'FOOD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTransDetailMODIFIED: TSmallintField
      FieldName = 'MODIFIED'
      Origin = 'MODIFIED'
      Required = True
    end
    object cdsTransDetailFECHAVENTA: TSQLTimeStampField
      FieldName = 'FECHAVENTA'
      Origin = 'FECHAVENTA'
      Required = True
    end
    object cdsTransDetailSUPLIDOR: TIntegerField
      FieldName = 'SUPLIDOR'
      Origin = 'SUPLIDOR'
      Required = True
    end
    object cdsTransDetailID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object cdsTransDetailPRODUCTNO: TIntegerField
      FieldName = 'PRODUCTNO'
      Origin = 'PRODUCTNO'
    end
    object cdsTransDetailTAX_ESTATAL: TStringField
      FieldName = 'TAX_ESTATAL'
      Origin = 'TAX_ESTATAL'
      FixedChar = True
      Size = 1
    end
    object cdsTransDetailTAX_MUNICIPAL: TStringField
      FieldName = 'TAX_MUNICIPAL'
      Origin = 'TAX_MUNICIPAL'
      Size = 1
    end
    object cdsTransDetailQTY: TFloatField
      FieldName = 'QTY'
      Origin = 'QTY'
    end
    object cdsTransDetailOPENED: TStringField
      FieldName = 'OPENED'
      Origin = 'OPENED'
      Size = 1
    end
    object cdsTransDetailGROUP_PROD: TStringField
      FieldName = 'GROUP_PROD'
      Origin = 'GROUP_PROD'
      Size = 1
    end
    object cdsTransDetailREGISTER: TSmallintField
      FieldName = 'REGISTER'
      Origin = 'REGISTER'
    end
    object cdsTransDetailSUPERVISOR: TStringField
      FieldName = 'SUPERVISOR'
      Origin = 'SUPERVISOR'
      Size = 3
    end
    object cdsTransDetailPATROCINIO: TSmallintField
      FieldName = 'PATROCINIO'
      Origin = 'PATROCINIO'
    end
    object cdsTransDetailSUBDEPARTAMENTO: TSmallintField
      FieldName = 'SUBDEPARTAMENTO'
      Origin = 'SUBDEPARTAMENTO'
    end
    object cdsTransDetailBARCODEALTERNO1: TWideStringField
      FieldName = 'BARCODEALTERNO1'
      Origin = 'BARCODEALTERNO1'
      FixedChar = True
    end
    object cdsTransDetailBARCODEALTERNO2: TWideStringField
      FieldName = 'BARCODEALTERNO2'
      Origin = 'BARCODEALTERNO2'
      FixedChar = True
    end
    object cdsTransDetailBAG_NUMBER: TIntegerField
      FieldName = 'BAG_NUMBER'
      Origin = 'BAG_NUMBER'
    end
    object cdsTransDetailOTC_NUMBER: TIntegerField
      FieldName = 'OTC_NUMBER'
      Origin = 'OTC_NUMBER'
    end
    object cdsTransDetailUTILIDAD: TBooleanField
      FieldName = 'UTILIDAD'
      Origin = 'UTILIDAD'
    end
    object cdsTransDetailTRANS_TIME: TSQLTimeStampField
      FieldName = 'TRANS_TIME'
      Origin = 'TRANS_TIME'
    end
    object cdsTransDetailTERMINO: TWideStringField
      FieldName = 'TERMINO'
      Origin = 'TERMINO'
      FixedChar = True
      Size = 15
    end
    object cdsTransDetailPRODUCT_DONENESS: TStringField
      FieldKind = fkCalculated
      FieldName = 'PRODUCT_DONENESS'
      Size = 46
      Calculated = True
    end
    object cdsTransDetailREGTOTAL: TFMTBCDField
      FieldName = 'REGTOTAL'
      Origin = 'REGTOTAL'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailREGPRICE: TFMTBCDField
      FieldName = 'REGPRICE'
      Origin = 'REGPRICE'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailAWP: TFMTBCDField
      FieldName = 'AWP'
      Origin = 'AWP'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailTOTAL_VALUE: TFMTBCDField
      FieldName = 'TOTAL_VALUE'
      Origin = 'TOTAL_VALUE'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailDISCOUNT: TFMTBCDField
      FieldName = 'DISCOUNT'
      Origin = 'DISCOUNT'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailNOTE: TWideStringField
      FieldName = 'NOTE'
      Origin = 'NOTE'
      FixedChar = True
      Size = 30
    end
    object cdsTransDetailINVCONTROL_RECIPE: TBooleanField
      FieldName = 'INVCONTROL_RECIPE'
      Origin = 'INVCONTROL_RECIPE'
    end
    object cdsTransDetailMAIN_COURSE: TBooleanField
      FieldName = 'MAIN_COURSE'
      Origin = 'MAIN_COURSE'
    end
    object cdsTransDetailKITCHEN: TBooleanField
      FieldName = 'KITCHEN'
      Origin = 'KITCHEN'
    end
    object cdsTransDetailPRINTED: TBooleanField
      FieldName = 'PRINTED'
      Origin = 'PRINTED'
    end
    object cdsTransDetailMAIN_COURSE_ID: TIntegerField
      FieldName = 'MAIN_COURSE_ID'
      Origin = 'MAIN_COURSE_ID'
    end
    object cdsTransDetailBUTTON_QTY: TFMTBCDField
      FieldName = 'BUTTON_QTY'
      Origin = 'BUTTON_QTY'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailTAB_SAVED: TBooleanField
      FieldName = 'TAB_SAVED'
      Origin = 'TAB_SAVED'
    end
    object cdsTransDetailTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
  end
  object dsTransHead: TDataSource
    DataSet = CDSTransHead
    Left = 416
    Top = 168
  end
  object dsTransDetail: TDataSource
    DataSet = cdsTransDetail
    Left = 416
    Top = 344
  end
  object qOpenTabs: TFDQuery
    Connection = DM.FDConnectionPOS
    SQL.Strings = (
      'SELECT * FROM OPEN_TABS')
    Left = 232
    Top = 88
  end
  object dspOpenTabs: TDataSetProvider
    DataSet = qOpenTabs
    Options = [poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 328
    Top = 88
  end
  object dsOpenTabs: TDataSource
    DataSet = cdsOpenTabs
    Left = 416
    Top = 88
  end
  object cdsOpenTabs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOpenTabs'
    Left = 512
    Top = 88
    object cdsOpenTabsID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object cdsOpenTabsSERVER: TIntegerField
      FieldName = 'SERVER'
      Origin = 'SERVER'
    end
    object cdsOpenTabsCUSTOMER: TWideStringField
      FieldName = 'CUSTOMER'
      Origin = 'CUSTOMER'
      FixedChar = True
      Size = 45
    end
    object cdsOpenTabsTELEPHONE: TWideStringField
      FieldName = 'TELEPHONE'
      Origin = 'TELEPHONE'
      FixedChar = True
      Size = 13
    end
    object cdsOpenTabsCREDIT_CARD: TWideStringField
      FieldName = 'CREDIT_CARD'
      Origin = 'CREDIT_CARD'
      FixedChar = True
    end
    object cdsOpenTabsDATE: TSQLTimeStampField
      FieldName = 'DATE'
      Origin = 'DATE'
    end
    object cdsOpenTabsTRANSACTIONNUMBER: TIntegerField
      FieldName = 'TRANSACTIONNUMBER'
      Origin = 'TRANSACTIONNUMBER'
      Required = True
    end
    object cdsOpenTabsBUTTON_CAPTION: TWideStringField
      FieldName = 'BUTTON_CAPTION'
      Origin = 'BUTTON_CAPTION'
      FixedChar = True
      Size = 30
    end
    object cdsOpenTabsGROUP_BALANCE: TFMTBCDField
      FieldName = 'GROUP_BALANCE'
      Origin = 'GROUP_BALANCE'
      Precision = 18
      Size = 2
    end
    object cdsOpenTabsBALANCE: TFMTBCDField
      FieldName = 'BALANCE'
      Origin = 'BALANCE'
      Precision = 18
      Size = 2
    end
  end
  object sqlTransDetail_Temp: TFDQuery
    Connection = DM.FDConnectionPOS
    SQL.Strings = (
      'SELECT * FROM TransactionDetail_Temp')
    Left = 232
    Top = 240
  end
  object dspTransDetail_Temp: TDataSetProvider
    DataSet = sqlTransDetail_Temp
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 320
    Top = 240
  end
  object dsTransDetail_Temp: TDataSource
    DataSet = cdsTransDetail_Temp
    Left = 408
    Top = 240
  end
  object cdsTransDetail_Temp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransDetail_Temp'
    OnCalcFields = cdsTransDetail_TempCalcFields
    Left = 512
    Top = 240
    object cdsTransDetail_TempIDNUMBER: TAutoIncField
      FieldName = 'IDNUMBER'
      Origin = 'IDNUMBER'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsTransDetail_TempTRANSACTIONNUMBER: TIntegerField
      FieldName = 'TRANSACTIONNUMBER'
      Origin = 'TRANSACTIONNUMBER'
      Required = True
    end
    object cdsTransDetail_TempUPC: TStringField
      FieldName = 'UPC'
      Origin = 'UPC'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsTransDetail_TempVOIDED: TIntegerField
      FieldName = 'VOIDED'
      Origin = 'VOIDED'
      Required = True
    end
    object cdsTransDetail_TempSUBDETAIL: TStringField
      FieldName = 'SUBDETAIL'
      Origin = 'SUBDETAIL'
      FixedChar = True
      Size = 10
    end
    object cdsTransDetail_TempPRODDESCRIPTION: TStringField
      FieldName = 'PRODDESCRIPTION'
      Origin = 'PRODDESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object cdsTransDetail_TempPRODDEPARTMENT: TStringField
      FieldName = 'PRODDEPARTMENT'
      Origin = 'PRODDEPARTMENT'
      FixedChar = True
    end
    object cdsTransDetail_TempFOOD: TStringField
      FieldName = 'FOOD'
      Origin = 'FOOD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTransDetail_TempMODIFIED: TSmallintField
      FieldName = 'MODIFIED'
      Origin = 'MODIFIED'
      Required = True
    end
    object cdsTransDetail_TempFECHAVENTA: TSQLTimeStampField
      FieldName = 'FECHAVENTA'
      Origin = 'FECHAVENTA'
      Required = True
    end
    object cdsTransDetail_TempSUPLIDOR: TIntegerField
      FieldName = 'SUPLIDOR'
      Origin = 'SUPLIDOR'
      Required = True
    end
    object cdsTransDetail_TempID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object cdsTransDetail_TempPRODUCTNO: TIntegerField
      FieldName = 'PRODUCTNO'
      Origin = 'PRODUCTNO'
    end
    object cdsTransDetail_TempOPENED: TStringField
      FieldName = 'OPENED'
      Origin = 'OPENED'
      Size = 1
    end
    object cdsTransDetail_TempGROUP_PROD: TStringField
      FieldName = 'GROUP_PROD'
      Origin = 'GROUP_PROD'
      Size = 1
    end
    object cdsTransDetail_TempREGISTER: TSmallintField
      FieldName = 'REGISTER'
      Origin = 'REGISTER'
    end
    object cdsTransDetail_TempSUPERVISOR: TStringField
      FieldName = 'SUPERVISOR'
      Origin = 'SUPERVISOR'
      Size = 3
    end
    object cdsTransDetail_TempPATROCINIO: TSmallintField
      FieldName = 'PATROCINIO'
      Origin = 'PATROCINIO'
    end
    object cdsTransDetail_TempSUBDEPARTAMENTO: TSmallintField
      FieldName = 'SUBDEPARTAMENTO'
      Origin = 'SUBDEPARTAMENTO'
    end
    object cdsTransDetail_TempBARCODEALTERNO1: TWideStringField
      FieldName = 'BARCODEALTERNO1'
      Origin = 'BARCODEALTERNO1'
      FixedChar = True
    end
    object cdsTransDetail_TempBARCODEALTERNO2: TWideStringField
      FieldName = 'BARCODEALTERNO2'
      Origin = 'BARCODEALTERNO2'
      FixedChar = True
    end
    object cdsTransDetail_TempBAG_NUMBER: TIntegerField
      FieldName = 'BAG_NUMBER'
      Origin = 'BAG_NUMBER'
    end
    object cdsTransDetail_TempUTILIDAD: TBooleanField
      FieldName = 'UTILIDAD'
      Origin = 'UTILIDAD'
    end
    object cdsTransDetail_TempOTC_NUMBER: TIntegerField
      FieldName = 'OTC_NUMBER'
      Origin = 'OTC_NUMBER'
    end
    object cdsTransDetail_TempTRANS_TIME: TSQLTimeStampField
      FieldName = 'TRANS_TIME'
      Origin = 'TRANS_TIME'
    end
    object cdsTransDetail_TempTAX_SERVICIO: TBooleanField
      FieldName = 'TAX_SERVICIO'
      Origin = 'TAX_SERVICIO'
    end
    object cdsTransDetail_TempNOTE: TWideStringField
      FieldName = 'NOTE'
      Origin = 'NOTE'
      FixedChar = True
      Size = 30
    end
    object cdsTransDetail_TempKITCHEN: TBooleanField
      FieldName = 'KITCHEN'
      Origin = 'KITCHEN'
    end
    object cdsTransDetail_TempMAIN_COURSE_ID: TIntegerField
      FieldName = 'MAIN_COURSE_ID'
      Origin = 'MAIN_COURSE_ID'
    end
    object cdsTransDetail_TempMAIN_COURSE: TBooleanField
      FieldName = 'MAIN_COURSE'
      Origin = 'MAIN_COURSE'
    end
    object cdsTransDetail_TempTERMINO: TWideStringField
      FieldName = 'TERMINO'
      Origin = 'TERMINO'
      FixedChar = True
      Size = 15
    end
    object cdsTransDetail_TempPRODDESC_DEFINE: TStringField
      FieldKind = fkCalculated
      FieldName = 'PRODDESC_DEFINE'
      Size = 47
      Calculated = True
    end
    object cdsTransDetail_TempTAX: TFMTBCDField
      FieldName = 'TAX'
      Origin = 'TAX'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempCOSTO: TFMTBCDField
      FieldName = 'COSTO'
      Origin = 'COSTO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempPRICE: TFMTBCDField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempREGTOTAL: TFMTBCDField
      FieldName = 'REGTOTAL'
      Origin = 'REGTOTAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempREGPRICE: TFMTBCDField
      FieldName = 'REGPRICE'
      Origin = 'REGPRICE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempAWP: TFMTBCDField
      FieldName = 'AWP'
      Origin = 'AWP'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempTOTAL_VALUE: TFMTBCDField
      FieldName = 'TOTAL_VALUE'
      Origin = 'TOTAL_VALUE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempDISCOUNT: TFMTBCDField
      FieldName = 'DISCOUNT'
      Origin = 'DISCOUNT'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
  end
  object qPasswords: TFDQuery
    Connection = DM.FDConnectionPOS
    SQL.Strings = (
      'SELECT * FROM PASSWORDS')
    Left = 224
    Top = 440
  end
  object dspPasswords: TDataSetProvider
    DataSet = qPasswords
    Left = 320
    Top = 440
  end
  object dsPasswords: TDataSource
    DataSet = cdsPasswords
    Left = 416
    Top = 440
  end
  object cdsPasswords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPasswords'
    Left = 520
    Top = 440
    object cdsPasswordsUSERNAME: TStringField
      FieldName = 'USERNAME'
      Origin = 'USERNAME'
      Required = True
      Size = 35
    end
    object cdsPasswordsINICIALES: TStringField
      FieldName = 'INICIALES'
      Origin = 'INICIALES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
  end
  object Setup: TfrxDBDataset
    UserName = 'Setup'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ROUTINGDATA=ROUTINGDATA'
      'MODEMCOMPORT=MODEMCOMPORT'
      'STORENAME=STORENAME'
      'STORETELEPHONE=STORETELEPHONE'
      'STOREADDRESS=STOREADDRESS'
      'FACTURARECIBO=FACTURARECIBO'
      'SETTLEMENTBANKID=SETTLEMENTBANKID'
      'CHEQUE=CHEQUE'
      'TELEFONO=TELEFONO'
      'DOSWINDOWS=DOSWINDOWS'
      'POLEDISPLAYCOMPORT=POLEDISPLAYCOMPORT'
      'HEADING=HEADING'
      'STOREZIPCODE=STOREZIPCODE'
      'POLEDISPLAYMESSAGE=POLEDISPLAYMESSAGE'
      'LABELLONGFORM=LABELLONGFORM'
      'FARMACIA=FARMACIA'
      'SEARCHBY=SEARCHBY'
      'NOCAJA=NOCAJA'
      'RXNOCONTINUO=RXNOCONTINUO'
      'STORENAMEHEADING=STORENAMEHEADING'
      'STOREADDRESSHEADING=STOREADDRESSHEADING'
      'STOREPHONEHEADING=STOREPHONEHEADING'
      'PUEBLO=PUEBLO'
      'INTERACCION=INTERACCION'
      'MESSAGEID=MESSAGEID'
      'VERSIONCOL=VERSIONCOL'
      'BANKID=BANKID'
      'MERCHANTID=MERCHANTID'
      'TERMINALTYPE=TERMINALTYPE'
      'NUMERO_TRANS=NUMERO_TRANS'
      'ESTADO=ESTADO'
      'MENSAGE=MENSAGE'
      'NEXT_BARCODE=NEXT_BARCODE'
      'DATA_COLECTOR_COLUMNS=DATA_COLECTOR_COLUMNS'
      'PORCIENTO_AWP=PORCIENTO_AWP'
      'NO_FARMACIA=NO_FARMACIA'
      'TAX_RATE=TAX_RATE'
      'TAX_RATE_FROM=TAX_RATE_FROM'
      'TAX_RATE_ESTATAL=TAX_RATE_ESTATAL'
      'COBRAR_OTC_TAX=COBRAR_OTC_TAX'
      'IVULOTO_MERCHANT_ID=IVULOTO_MERCHANT_ID'
      'IVULOTO_PASSWORD=IVULOTO_PASSWORD'
      'PORCIENTO_PATROCINIO=PORCIENTO_PATROCINIO'
      'NABP=NABP'
      'EDUCATION_FONT_SIZE=EDUCATION_FONT_SIZE'
      'NPI=NPI'
      'DRUG_INTERACTION_SEVERITY=DRUG_INTERACTION_SEVERITY'
      'SURESCRIPT_DIRECTORY_UPDATE=SURESCRIPT_DIRECTORY_UPDATE'
      'SCANED_IMAGE_ADDRESS=SCANED_IMAGE_ADDRESS'
      'ADDRESS2=ADDRESS2'
      'SURESCRIPT_IP=SURESCRIPT_IP'
      'ePrescribePrinterName=ePrescribePrinterName'
      'PrintRxExpirationDate=PrintRxExpirationDate'
      'PrintPatDir=PrintPatDir'
      'CAUTIONS_FONT_SIZE=CAUTIONS_FONT_SIZE'
      'EnforcePrescribersNPI=EnforcePrescribersNPI'
      'email=email'
      'email_Host=email_Host'
      'email_Password=email_Password'
      'email_Username=email_Username'
      'email_Port=email_Port'
      'PriceUpdate_ChangeProductName=PriceUpdate_ChangeProductName'
      'PriceUpdate_ChangeManufacturer=PriceUpdate_ChangeManufacturer'
      'PrintPagoPlan=PrintPagoPlan'
      'VerificarTelefonoPaciente=VerificarTelefonoPaciente'
      'RX_EXPIRATION_DAYS=RX_EXPIRATION_DAYS'
      'RX_CONTROLED_EXPIRATION_DAYS=RX_CONTROLED_EXPIRATION_DAYS'
      'PROCEDURE_ADD_ON=PROCEDURE_ADD_ON'
      'WC_REMINDER1_NODAYS=WC_REMINDER1_NODAYS'
      'WC_REMINDER2_NODAYS=WC_REMINDER2_NODAYS'
      'WC_REMINDER3_NODAYS=WC_REMINDER3_NODAYS'
      'WC_CONTACT_HOUR1=WC_CONTACT_HOUR1'
      'WC_CONTACT_HOUR2=WC_CONTACT_HOUR2'
      'WC_AUTOLOGOUT=WC_AUTOLOGOUT'
      'WC_DAYSTO_RTS=WC_DAYSTO_RTS'
      'WC_REMINDER_MESSAGE_SPANISH=WC_REMINDER_MESSAGE_SPANISH'
      'WC_INSERT_BATCH_RX=WC_INSERT_BATCH_RX'
      'WC_SMS_USER=WC_SMS_USER'
      'WC_SMS_PASSWORD=WC_SMS_PASSWORD'
      'WC_SMS_API_ID=WC_SMS_API_ID'
      'WC_REMINDER_MESSAGE_ENGLISH=WC_REMINDER_MESSAGE_ENGLISH'
      'WC_SMS_TELEPHONE=WC_SMS_TELEPHONE'
      'WC_LOGOUT_SECONDS=WC_LOGOUT_SECONDS'
      'WC_SEND_AMOUNT_DUE=WC_SEND_AMOUNT_DUE'
      'WC_BROADCASTBYPHONE=WC_BROADCASTBYPHONE'
      'EnforceCustTelUpdate=EnforceCustTelUpdate'
      'WC_SIP_SERVER=WC_SIP_SERVER'
      'WC_SIP_USER=WC_SIP_USER'
      'WC_SIP_PASSWORD=WC_SIP_PASSWORD'
      'DAW_DEFAULT_VALUE=DAW_DEFAULT_VALUE'
      'IVR=IVR'
      'DAYS_TO_REFILL_REMIND=DAYS_TO_REFILL_REMIND'
      'POS_SHOW_RX_SIGNATURE=POS_SHOW_RX_SIGNATURE'
      'WC_STOP_TAG_SEARCH_INTERVAL=WC_STOP_TAG_SEARCH_INTERVAL'
      'SCAN_COLOR=SCAN_COLOR'
      'WC_SMS_PROVIDER=WC_SMS_PROVIDER'
      'WC_INTERFACE=WC_INTERFACE'
      'WC_INTERFACE_HOST=WC_INTERFACE_HOST'
      'WC_INTERFACE_PORT=WC_INTERFACE_PORT'
      'NON_WESCOM_STORE=NON_WESCOM_STORE'
      'POS_SIGNATURE_PASSWORD=POS_SIGNATURE_PASSWORD'
      'RX30_CONVERTION=RX30_CONVERTION'
      'LABEL_PRINT_QTYAVAILABEL=LABEL_PRINT_QTYAVAILABEL'
      'CLASIC_SIG_CODES=CLASIC_SIG_CODES'
      'ePresc_Q_Days=ePresc_Q_Days'
      'ePresc_Timer_Interval=ePresc_Timer_Interval'
      'CHANGE_DRUG_REF=CHANGE_DRUG_REF'
      'AUTOMATIC_CLAIM_REVERSAL=AUTOMATIC_CLAIM_REVERSAL'
      'BATCH_REQUIRED=BATCH_REQUIRED'
      'TS_DOC_LIC=TS_DOC_LIC'
      'TS_ORIGIN_CODE=TS_ORIGIN_CODE'
      'TS_SERVICE_DATE=TS_SERVICE_DATE'
      'TS_RX_DATE=TS_RX_DATE'
      'TS_EXP_DATE=TS_EXP_DATE'
      'TS_BATCH_NO=TS_BATCH_NO'
      'TS_COST=TS_COST'
      'TS_AUTO_REFILL=TS_AUTO_REFILL'
      'TS_DAW=TS_DAW'
      'GSDD_VERSION=GSDD_VERSION'
      'GoldStandardActive=GoldStandardActive'
      'WC_MAKE_FIRST_NOTIFICATION=WC_MAKE_FIRST_NOTIFICATION'
      'ALLERGY_AUTHORIZATION=ALLERGY_AUTHORIZATION'
      'COSTO_CALCULADO=COSTO_CALCULADO'
      'PLAN_MEDICO_ABREVIATURA=PLAN_MEDICO_ABREVIATURA'
      'GSDD_FOLDER=GSDD_FOLDER'
      'STAR_PLUS_INTERFACE=STAR_PLUS_INTERFACE'
      'SAVE_CLAIM_TRANSACTIONS=SAVE_CLAIM_TRANSACTIONS'
      'SILENT_BILLING_NEWRX=SILENT_BILLING_NEWRX'
      'RX_SHOW_NOREFDISP_FLOAT=RX_SHOW_NOREFDISP_FLOAT'
      'DONOTBILLINACTIVE_PRODUCT=DONOTBILLINACTIVE_PRODUCT'
      'SALESTECH_STAND_ALONE=SALESTECH_STAND_ALONE'
      'ROBOT=ROBOT'
      'GSDD_DAYS_TO_COMPARE=GSDD_DAYS_TO_COMPARE'
      'WF_ENFORCE_FILL=WF_ENFORCE_FILL'
      'NEWRX_INTERACTIONS=NEWRX_INTERACTIONS'
      'CONFIRM_OPEN_REGISTER=CONFIRM_OPEN_REGISTER'
      'CD_MERCHANT_ID=CD_MERCHANT_ID'
      'CD_TERMINAL_ID=CD_TERMINAL_ID'
      'CD_COMUNICATION_PORT=CD_COMUNICATION_PORT'
      'CD_SERVER_IP=CD_SERVER_IP'
      'CD_SECUREDEVICE_EMV=CD_SECUREDEVICE_EMV'
      'CD_SECURE_DEVICE=CD_SECURE_DEVICE'
      'CD_PINPAD_TYPE=CD_PINPAD_TYPE'
      'CD_LOG_ACTIVATION=CD_LOG_ACTIVATION'
      'CD_ACTIVE=CD_ACTIVE'
      'POS_IMPORT_SIGNATURE=POS_IMPORT_SIGNATURE'
      'SHOW_IMAGES_NEWRX=SHOW_IMAGES_NEWRX'
      'CLEAN_OTC=CLEAN_OTC'
      'CHECK_ALLERGIES_NEWRX=CHECK_ALLERGIES_NEWRX'
      'H_LOGOUT_SECONDS=H_LOGOUT_SECONDS'
      'SAVEIMAGETODATABASE=SAVEIMAGETODATABASE'
      'AMAZON=AMAZON'
      'AMAZON_ACCOUNT_KEY=AMAZON_ACCOUNT_KEY'
      'AMAZON_ACCOUNT_NAME=AMAZON_ACCOUNT_NAME'
      'AMAZON_BUCKET_NAME=AMAZON_BUCKET_NAME'
      'BYPASS_PAT_VERIFICATION=BYPASS_PAT_VERIFICATION'
      'BYPASS_PRESC_VERIFICATION=BYPASS_PRESC_VERIFICATION'
      'APPRISS_USERNAME=APPRISS_USERNAME'
      'APPRISS_PASSWORD=APPRISS_PASSWORD'
      'DEA=DEA'
      'ID=ID'
      'BYPASS_FIRMA_ELECTRONICA=BYPASS_FIRMA_ELECTRONICA'
      'PLUGIN_DISPILL=PLUGIN_DISPILL'
      'PLUGIN_APPRISS=PLUGIN_APPRISS'
      'PLUGIN_SMARTPICKUP=PLUGIN_SMARTPICKUP'
      'POS_INCLUDE_BATCH=POS_INCLUDE_BATCH'
      'SP_SELECTALL=SP_SELECTALL'
      'CLASSIC_LOGIN=CLASSIC_LOGIN'
      'TIME_CARD=TIME_CARD'
      'POS_RESTAURANT=POS_RESTAURANT'
      'POS_INSERT_NEW_PRODUCT=POS_INSERT_NEW_PRODUCT'
      'LOGO=LOGO')
    DataSource = DM.dsSetup
    BCDToCurrency = False
    DataSetOptions = []
    Left = 704
    Top = 88
  end
  object TransactionHeader: TfrxDBDataset
    UserName = 'TransactionHeader'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PAYMENTTYPE1=PAYMENTTYPE1'
      'TRANSACTIONDATE=TRANSACTIONDATE'
      'NUMBERITEMS=NUMBERITEMS'
      'CREDITCARD1=CREDITCARD1'
      'OPENED=OPENED'
      'VOIDED=VOIDED'
      'CUSTOMERID=CUSTOMERID'
      'TRANSACTIONTIME=TRANSACTIONTIME'
      'PAID=PAID'
      'PAYMENTTYPE2=PAYMENTTYPE2'
      'CREDITCARD2=CREDITCARD2'
      'SHIFT=SHIFT'
      'REGISTER=REGISTER'
      'EMPLOYNUMBER=EMPLOYNUMBER'
      'DELIVERYADDRESS1=DELIVERYADDRESS1'
      'DELIVERYADDRESS2=DELIVERYADDRESS2'
      'DELIVERYNAME=DELIVERYNAME'
      'DELIVEREDBY=DELIVEREDBY'
      'PONUMBER=PONUMBER'
      'DELIVERYPHONE=DELIVERYPHONE'
      'ID=ID'
      'TRANSACTIONNUMBER=TRANSACTIONNUMBER'
      'PAYMENTTYPE3=PAYMENTTYPE3'
      'PAYMENTTYPE4=PAYMENTTYPE4'
      'CREDITCARD3=CREDITCARD3'
      'CREDITCARD4=CREDITCARD4'
      'DELIVERED=DELIVERED'
      'SUPERVISOR=SUPERVISOR'
      'CUSTOMER=CUSTOMER'
      'PAYAMOUNT1=PAYAMOUNT1'
      'PAYAMOUNT2=PAYAMOUNT2'
      'TAX=TAX'
      'TOTAL_TAX=TOTAL_TAX'
      'TAX_ESTATAL=TAX_ESTATAL'
      'SUBTOTAL=SUBTOTAL'
      'TAX_SERVICIO=TAX_SERVICIO'
      'PAYAMOUNT3=PAYAMOUNT3'
      'PAYAMOUNT4=PAYAMOUNT4'
      'REGTOTAL=REGTOTAL'
      'TOTAL=TOTAL'
      'CHANGE=CHANGE'
      'FOODTOTAL=FOODTOTAL'
      'TAX_FOOD_MUNICIPAL=TAX_FOOD_MUNICIPAL'
      'TAX_FOOD_ESTATAL=TAX_FOOD_ESTATAL'
      'CUSTOMER_DEFINE=CUSTOMER_DEFINE'
      'SERVER=SERVER'
      'TOTAL_DISCOUNT=TOTAL_DISCOUNT'
      'TIP=TIP'
      'GRAND_TOTAL=GRAND_TOTAL'
      'RecallNoTrans=RecallNoTrans')
    DataSource = dsTransHead
    BCDToCurrency = False
    DataSetOptions = []
    Left = 712
    Top = 168
  end
  object TransactionDetail: TfrxDBDataset
    UserName = 'TransactionDetail'
    CloseDataSource = False
    DataSource = dsTransDetail
    BCDToCurrency = False
    DataSetOptions = []
    Left = 712
    Top = 248
  end
  object RestReceipt: TfrxReport
    Version = '2023.3.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Collate = False
    PrintOptions.Printer = 'LR200'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42900.798136620400000000
    ReportOptions.LastChange = 43354.600398935200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    ShowProgress = False
    OnBeforePrint = RestReceiptBeforePrint
    OnPrintPage = RestReceiptPrintPage
    OnProgress = RestReceiptProgress
    Left = 888
    Top = 232
    Datasets = <
      item
        DataSet = OpenTabs
        DataSetName = 'OpenTabs'
      end
      item
        DataSet = Setup
        DataSetName = 'Setup'
      end
      item
        DataSet = TransactionDetail
        DataSetName = 'TransactionDetail'
      end
      item
        DataSet = TransactionHeader
        DataSetName = 'TransactionHeader'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 76.200000000000000000
      PaperHeight = 1000.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 0.500000000000000000
      Columns = 1
      ColumnWidth = 66.200000000000000000
      ColumnPositions.Strings = (
        '0')
      Bin = 15
      BinOtherPages = 15
      Frame.Typ = []
      EndlessHeight = True
      MirrorMode = []
      TitleBeforeHeader = False
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 74.370130000000000000
        Top = 113.385900000000000000
        Width = 250.204886000000000000
        object setupSTORETELEPHONE: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 23.866110000000000000
          Width = 245.669450000000000000
          Height = 15.118120000000000000
          DataField = 'STOREADDRESS'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."STOREADDRESS"]')
          ParentFont = False
        end
        object setupSTORENAME: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 0.629870000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DataField = 'STORENAME'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."STORENAME"]')
          ParentFont = False
        end
        object setupSTOREADDRESS: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 38.984230000000000000
          Width = 245.669450000000000000
          Height = 15.118120000000000000
          DataField = 'ADDRESS2'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."ADDRESS2"]')
          ParentFont = False
        end
        object setupSTOREZIPCODE: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 54.102350000000000000
          Width = 241.889920000000000000
          Height = 15.118120000000000000
          DataField = 'TELEFONO'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."TELEFONO"]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = -2.779530000000000000
          Top = 72.000000000000000000
          Width = 245.669310870000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 21.307050000000000000
          Width = 245.669310870000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Height = 151.181200000000000000
        ParentFont = False
        Top = 249.448980000000000000
        Width = 250.204886000000000000
        DataSet = TransactionHeader
        DataSetName = 'TransactionHeader'
        RowCount = 0
        object frxMemoView1: TfrxMemoView
          AllowVectorExport = True
          Top = 52.472480000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cashier')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 84.370130000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Register')
          ParentFont = False
        end
        object Line19: TfrxLineView
          AllowVectorExport = True
          Top = 120.267780000000000000
          Width = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object TransactionHeaderEMPLOYNUMBER: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740157480000000000
          Top = 52.472480000000000000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataField = 'EMPLOYNUMBER'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."EMPLOYNUMBER"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 25.897650000000000000
          Top = 124.826840000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Top = 144.724490000000000000
          Width = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 1.606370000000000000
          Top = 124.834645670000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Qty')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 123.834645670000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Sale Receipt')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Trans. No.')
          ParentFont = False
        end
        object TransactionHeaderTRANSACTIONNUMBER: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740157480000000000
          Top = 22.677180000000000000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataField = 'TRANSACTIONNUMBER'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."TRANSACTIONNUMBER"]')
          ParentFont = False
        end
        object TransactionDetailREGISTER: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740157480315000000
          Top = 84.370130000000000000
          Width = 83.149606299212600000
          Height = 15.118120000000000000
          DataField = 'REGISTER'
          DataSet = TransactionDetail
          DataSetName = 'TransactionDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionDetail."REGISTER"]')
          ParentFont = False
        end
        object TransactionDetailCUSTOMER_DEFINED: TfrxMemoView
          AllowVectorExport = True
          Top = 101.267780000000000000
          Width = 241.889797950000000000
          Height = 15.118120000000000000
          DataField = 'CUSTOMER_DEFINE'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[TransactionHeader."CUSTOMER_DEFINE"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 37.574830000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Date')
          ParentFont = False
        end
        object TransactionHeaderTRANSACTIONDATE: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740157480000000000
          Top = 37.574830000000000000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataField = 'TRANSACTIONDATE'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."TRANSACTIONDATE"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 68.252010000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Server')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740157480000000000
          Top = 68.031540000000000000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataField = 'SERVER'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."SERVER"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 423.307360000000000000
        Width = 250.204886000000000000
        DataSet = TransactionDetail
        DataSetName = 'TransactionDetail'
        RowCount = 0
        object TransactionDetailPRODDESCRIPTION: TfrxMemoView
          AllowVectorExport = True
          Left = 22.456710000000000000
          Top = 1.000000000000000000
          Width = 137.574783620000000000
          Height = 15.118120000000000000
          DataField = 'PRODDESCRIPTION'
          DataSet = TransactionDetail
          DataSetName = 'TransactionDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[TransactionDetail."PRODDESCRIPTION"]')
          ParentFont = False
        end
        object TransactionDetailCOSTO: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519790000000000000
          Top = 1.133858267716540000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataField = 'TOTAL'
          DataSet = TransactionDetail
          DataSetName = 'TransactionDetail'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionDetail."TOTAL"]')
          ParentFont = False
        end
        object TransactionDetailQTY1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 1.133858270000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          DataField = 'QTY'
          DataSet = TransactionDetail
          DataSetName = 'TransactionDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[TransactionDetail."QTY"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 914.646260000000000000
        Width = 250.204886000000000000
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 245.669310870000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 250.204886000000000000
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 1.338590000000000000
          Width = 241.889920000000000000
          Height = 64.252010000000000000
          Center = True
          DataField = 'LOGO'
          DataSet = Setup
          DataSetName = 'Setup'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 389.834880000000000000
        Top = 464.882190000000000000
        Width = 250.204886000000000000
        KeepChild = True
        Stretched = True
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858267716540000
          Top = 24.456710000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Local Tax:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858267716540000
          Top = 47.133890000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'State Tax:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858267716540000
          Top = 71.590600000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Check:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858267716540000
          Top = 182.519790000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 91.086611730000000000
          Top = 208.976500000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Change:')
          ParentFont = False
        end
        object TransactionHeaderTAX: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519687480000000000
          Top = 24.456710000000000000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."TAX"]')
          ParentFont = False
        end
        object TransactionHeaderTAX_ESTATAL: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519687480000000000
          Top = 47.133890000000000000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."TAX_ESTATAL"]')
          ParentFont = False
        end
        object TransactionHeaderTOTAL: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519687480000000000
          Top = 71.590600000000000000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."TOTAL"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858267716540000
          Top = 2.220470000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Sub Total:')
          ParentFont = False
        end
        object TransactionHeaderCHANGE1: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519687480000000000
          Top = 208.944879450000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."CHANGE"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 158.236240000000000000
          Top = 174.063080000000000000
          Width = 86.929136300000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 158.220474880000000000
          Top = 200.299320000000000000
          Width = 86.929136300000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SetupPOLEDISPLAYMESSAGE1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 315.464750000000000000
          Width = 245.669327950000000000
          Height = 18.897650000000000000
          DataField = 'POLEDISPLAYMESSAGE'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."POLEDISPLAYMESSAGE"]')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Left = 86.031540000000000000
          Top = 340.700990000000000000
          Width = 80.000000000000000000
          Height = 37.795300000000000000
          BarType = bcCode128
          DataField = 'TRANSACTIONNUMBER'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Frame.Typ = []
          Rotation = 0
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          ColorBar = clBlack
          BarcodeText.TextSettings.BarTextPos = btpBottom
          BarcodeText.SupSettings.BarTextPos = btpTop
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858267716540000
          Top = 152.842610000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Tip:')
          ParentFont = False
        end
        object MemoPaymentType1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858267716540000
          Top = 94.488250000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'PAYMENTTYPE1'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[TransactionHeader."PAYMENTTYPE1"]')
          ParentFont = False
        end
        object MemoPaymentType2: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858267716540000
          Top = 117.165430000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'PAYMENTTYPE2'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[TransactionHeader."PAYMENTTYPE2"]')
          ParentFont = False
        end
        object MemoPayAmount1: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519687480000000000
          Top = 94.488250000000000000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataField = 'PAYAMOUNT1'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."PAYAMOUNT1"]')
          ParentFont = False
        end
        object MemoPayAmount2: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519687480000000000
          Top = 117.165430000000000000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataField = 'PAYAMOUNT2'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."PAYAMOUNT2"]')
          ParentFont = False
        end
        object MemoSugTip1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 246.669450000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'STIP')
          ParentFont = False
        end
        object MemoSugTip2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 265.567100000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'STIP')
          ParentFont = False
        end
        object MemoSugTip3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 285.685220000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'STIP')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 162.519687480000000000
          Top = 2.267714090000000000
          Width = 83.149606300000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TransactionDetail."TOTAL">,DetailData1)]')
          ParentFont = False
        end
        object TransactionHeaderTIP: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519687480000000000
          Top = 152.960730000000000000
          Width = 83.149606300000000000
          Height = 18.897650000000000000
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."TIP"]')
          ParentFont = False
        end
        object TransHeadGRAND_TOTAL: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519687480000000000
          Top = 182.551178660000000000
          Width = 83.149606300000000000
          Height = 15.118110240000000000
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."GRAND_TOTAL"]')
          ParentFont = False
        end
      end
    end
  end
  object FoodReceipt: TfrxReport
    Version = '2023.3.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'LR200'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 42900.798136620400000000
    ReportOptions.LastChange = 42900.798136620400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    ShowProgress = False
    OnBeforePrint = FoodReceiptBeforePrint
    Left = 888
    Top = 328
    Datasets = <
      item
        DataSet = OpenTabs
        DataSetName = 'OpenTabs'
      end
      item
        DataSet = Setup
        DataSetName = 'Setup'
      end
      item
        DataSet = TransactionHeader
        DataSetName = 'TransactionHeader'
      end
      item
        DataSet = TransDetail_Temp
        DataSetName = 'TransDetail_Temp'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 76.200000000000000000
      PaperHeight = 279.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 212.409586000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 0.220470000000000000
          Top = 29.015770000000000000
          Width = 219.212740000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object TransactionHeaderCUSTOMER: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 1.220470000000000000
          Width = 207.874052360000000000
          Height = 18.897650000000000000
          DataField = 'CUSTOMER'
          DataSet = OpenTabs
          DataSetName = 'OpenTabs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[OpenTabs."CUSTOMER"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 260.787570000000000000
        Width = 212.409586000000000000
        Condition = 'TransDetail_Temp."MAIN_COURSE_ID"'
        KeepTogether = True
        object Line19: TfrxLineView
          AllowVectorExport = True
          Left = 1.559060000000000000
          Top = 18.677180000000000000
          Width = 211.653680000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 0.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Main Course')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 306.141930000000000000
        Width = 212.409586000000000000
        DataSet = TransDetail_Temp
        DataSetName = 'TransDetail_Temp'
        RowCount = 0
        object TransactionDetailPRODDESCRIPTION: TfrxMemoView
          AllowVectorExport = True
          Top = 0.779530000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = 'PRODDESC_DEFINE'
          DataSet = TransDetail_Temp
          DataSetName = 'TransDetail_Temp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[TransDetail_Temp."PRODDESC_DEFINE"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 124.724490000000000000
        Top = 113.385900000000000000
        Width = 212.409586000000000000
        object frxMemoView1: TfrxMemoView
          AllowVectorExport = True
          Top = 52.913420000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Server')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 102.047310000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '# Of Items')
          ParentFont = False
        end
        object TransactionDetailQTY: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 102.047310000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'NUMBERITEMS'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."NUMBERITEMS"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 79.370130000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Terminal ID')
          ParentFont = False
        end
        object TransactionHeaderEMPLOYNUMBER: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Top = 52.913420000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'SERVER'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."SERVER"]')
          ParentFont = False
        end
        object TransactionDetailREGISTER: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 79.370130000000000000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          DataField = 'REGISTER'
          DataSet = TransDetail_Temp
          DataSetName = 'TransDetail_Temp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransDetail_Temp."REGISTER"]')
          ParentFont = False
        end
        object TransactionHeaderTRANSACTIONNUMBER: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'TRANSACTIONNUMBER'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."TRANSACTIONNUMBER"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'No. Trans')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Top = 26.456710000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Hour')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 117.165430000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 102.047310000000000000
        Top = 389.291590000000000000
        Width = 212.409586000000000000
        object MemoExtraInfo: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 10.779530000000000000
          Width = 192.756030000000000000
          Height = 83.149660000000000000
          StretchMode = smActualHeight
          Frame.Typ = []
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 1.559060000000000000
          Top = 3.000000000000000000
          Width = 211.653680000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 98.267780000000000000
          Width = 211.653680000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object TransDetail_Temp: TfrxDBDataset
    UserName = 'TransDetail_Temp'
    CloseDataSource = False
    DataSource = dsTransDetail_Temp
    BCDToCurrency = False
    DataSetOptions = []
    Left = 712
    Top = 344
  end
  object OpenTabs: TfrxDBDataset
    UserName = 'OpenTabs'
    CloseDataSource = False
    DataSource = dsOpenTabs
    BCDToCurrency = False
    DataSetOptions = []
    Left = 712
    Top = 440
  end
  object FDQuery1: TFDQuery
    Left = 864
    Top = 96
  end
  object RecallTransaction: TfrxReport
    Version = '2023.3.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'LR200'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 42900.798136620400000000
    ReportOptions.LastChange = 43354.600398935190000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    ShowProgress = False
    Left = 896
    Top = 432
    Datasets = <
      item
        DataSet = OpenTabs
        DataSetName = 'OpenTabs'
      end
      item
        DataSet = Setup
        DataSetName = 'Setup'
      end
      item
        DataSet = TransactionDetail
        DataSetName = 'TransactionDetail'
      end
      item
        DataSet = TransactionHeader
        DataSetName = 'TransactionHeader'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 76.200000000000000000
      PaperHeight = 260.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 0.500000000000000000
      Columns = 1
      ColumnWidth = 66.200000000000000000
      ColumnPositions.Strings = (
        '0')
      Duplex = dmVertical
      Frame.Typ = []
      EndlessHeight = True
      MirrorMode = []
      TitleBeforeHeader = False
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 115.944960000000000000
        Top = 113.385900000000000000
        Width = 250.204886000000000000
        object setupSTORETELEPHONE: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 23.866110000000000000
          Width = 245.669450000000000000
          Height = 15.118120000000000000
          DataField = 'STOREADDRESS'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."STOREADDRESS"]')
          ParentFont = False
        end
        object setupSTORENAME: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 0.629870000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DataField = 'STORENAME'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."STORENAME"]')
          ParentFont = False
        end
        object setupSTOREADDRESS: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 38.984230000000000000
          Width = 245.669450000000000000
          Height = 15.118120000000000000
          DataField = 'ADDRESS2'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."ADDRESS2"]')
          ParentFont = False
        end
        object setupSTOREZIPCODE: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 54.102350000000000000
          Width = 241.889920000000000000
          Height = 15.118120000000000000
          DataField = 'TELEFONO'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."TELEFONO"]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = -2.779530000000000000
          Top = 72.000000000000000000
          Width = 245.669310870000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 21.307050000000000000
          Width = 245.669310870000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 75.590600000000000000
          Width = 80.000000000000000000
          Height = 37.795300000000000000
          BarType = bcCode128
          DataField = 'RecallNoTrans'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Frame.Typ = []
          Rotation = 0
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          ColorBar = clBlack
          BarcodeText.TextSettings.BarTextPos = btpBottom
          BarcodeText.SupSettings.BarTextPos = btpTop
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Height = 177.637910000000000000
        ParentFont = False
        Top = 291.023810000000000000
        Width = 250.204886000000000000
        DataSet = TransactionHeader
        DataSetName = 'TransactionHeader'
        RowCount = 0
        object frxMemoView1: TfrxMemoView
          AllowVectorExport = True
          Top = 52.472480000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cashier')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 84.370130000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Terminal ID')
          ParentFont = False
        end
        object Line19: TfrxLineView
          AllowVectorExport = True
          Top = 120.267780000000000000
          Width = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object TransactionHeaderEMPLOYNUMBER: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740157480315000000
          Top = 52.472480000000000000
          Width = 83.149606299212600000
          Height = 15.118120000000000000
          DataField = 'EMPLOYNUMBER'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."EMPLOYNUMBER"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Top = 140.944960000000000000
          Width = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 123.834645670000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."TOTAL"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Saved Transaction'
            '')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Trans. No.')
          ParentFont = False
        end
        object TransactionHeaderTRANSACTIONNUMBER: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740157480315000000
          Top = 22.677180000000000000
          Width = 83.149606299212600000
          Height = 15.118120000000000000
          DataField = 'TRANSACTIONNUMBER'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."TRANSACTIONNUMBER"]')
          ParentFont = False
        end
        object TransactionDetailREGISTER: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740157480315000000
          Top = 84.370130000000000000
          Width = 83.149606299212600000
          Height = 15.118120000000000000
          DataField = 'REGISTER'
          DataSet = TransactionDetail
          DataSetName = 'TransactionDetail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionDetail."REGISTER"]')
          ParentFont = False
        end
        object TransactionDetailCUSTOMER_DEFINED: TfrxMemoView
          AllowVectorExport = True
          Top = 101.267780000000000000
          Width = 241.889797950000000000
          Height = 15.118120000000000000
          DataField = 'CUSTOMER_DEFINE'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[TransactionHeader."CUSTOMER_DEFINE"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 37.574830000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Date')
          ParentFont = False
        end
        object TransactionHeaderTRANSACTIONDATE: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740157480315000000
          Top = 37.574830000000000000
          Width = 83.149606299212600000
          Height = 15.118120000000000000
          DataField = 'TRANSACTIONDATE'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."TRANSACTIONDATE"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Top = 68.252010000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Server')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740157480000000000
          Top = 68.031540000000000000
          Width = 83.149606300000000000
          Height = 15.118120000000000000
          DataField = 'SERVER'
          DataSet = TransactionHeader
          DataSetName = 'TransactionHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TransactionHeader."SERVER"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Top = 122.944960000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 529.134200000000000000
        Width = 250.204886000000000000
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 245.669310870000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 250.204886000000000000
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 1.338590000000000000
          Width = 241.889920000000000000
          Height = 64.252010000000000000
          Center = True
          DataField = 'LOGO'
          DataSet = Setup
          DataSetName = 'Setup'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 1064
    Top = 296
  end
  object IdConnectionIntercept1: TIdConnectionIntercept
    Left = 1040
    Top = 80
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 1040
    Top = 144
  end
  object IdSMTP1: TIdSMTP
    AuthType = satNone
    Host = 'smtpout.secureserver.net'
    Password = 'Sarerrac047'
    SASLMechanisms = <>
    Username = 'axelcarreras@soallco.com'
    Left = 1040
    Top = 216
  end
end
