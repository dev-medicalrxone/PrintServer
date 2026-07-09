object DM: TDM
  Height = 844
  Width = 1283
  object FDConnectionRx: TFDConnection
    Params.Strings = (
      'User_Name=dbo'
      'Server=11.0.0.24,1433'
      'OSAuthent=No'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=SERVER'
      'MARS=yes'
      'Password=agabriel'
      'Database=MedicalRxOneDev'
      'DriverID=MSSQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Transaction = FDTransactionRx
    Left = 106
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 202
    Top = 64
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 130
    Top = 104
  end
  object qPrescription_Full: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'Select '
      
        '[RX_NUMBER],[RX_ID],[RX_SERVICE_DATE],[SALES_COST] ,[PLAN_PAY_AM' +
        'OUNT],  '
      '[IOU], '
      '       [RX_STATUS],'
      '       [PAT_PAY_AMOUNT], '
      '       [RX_STATUS], '
      '       [NO_REF_DISPENSADO], '
      '       [PHARMACIST], '
      '       [DAYS_SUPPLY], '
      '       [AWP], '
      '       [AUTHORIZATION_NUMBER], '
      '       [PRICE_TABLE_ID], '
      '       [DRUG], '
      '       [NDC], '
      '       [TYPIST], '
      '       [BATCH_NUMBER], '
      '       [QTY], '
      '       [PRODUCT_ID], '
      '       [OTC_BATCH_NUMBER], '
      '       [RX_SIG], '
      '       [RX_DATE], '
      '       [RX_QTY_PRESCRIBED], '
      '       [PAT_CLIENT_NUMBER], '
      '       [RXORIGINCODE], '
      '       [PAT_NAME], '
      '       [PAT_LASTNAME], '
      '       [PAT_MAIDENNAME], '
      '       [PAT_TELEPHONE], '
      '       [PAT_CELULAR], '
      '       [PAT_SEX], '
      '       [PAT_DOB], '
      '       [PAT_LANGUAGE], '
      '       [PAT_ADDRESS1], '
      '       [PAT_ADDRESS2], '
      '       [PAT_CITY], '
      '       [PAT_STATE], '
      '       [PAT_ZIPCODE], '
      '       [PRESC_NUMBER], '
      '       [PRESC_MAIDENNAME], '
      '       [PAT_IDENTIFICATION], '
      '       [PRESC_LASTNAME], '
      '       [PRESC_NAME], '
      '       [PRESC_TEL], '
      '       [PRESC_FAX], '
      '       [PRESC_NPI], '
      '       [PRESC_EMAIL], '
      '       [PRESC_ADD1], '
      '       [PRESC_STATE], '
      '       [PRESC_ZIP], '
      '       [PRESC_ADDRESS2], '
      '       [PRESC_CITY], '
      '       [PRESC_CEL], '
      '       [DEA_FEDERAL], '
      '       [PLAN_NAME], '
      '       [PLAN_BINNUBER], '
      '       [PLAN_SUPPORT_TEL], '
      '       [RX_REF_AUTHORIZED], '
      '       [RX_QTY_AVAILABLE], '
      '       [DAW], '
      '       [RX_CONTROL], '
      '       [RX_LAST_REFILL_DATE], '
      '       [Health_plan_abbreviation], '
      '       [WF_BILLED], '
      '       [WF_PRINTED], '
      '       [WF_FILLED], '
      '       [WF_CHECKED], '
      '       [WF_DELIVERED], '
      '       [WF_TYPED], '
      '       [TOTAL],  '
      '       [CASH_RETAIL_PRICE], '
      '       [MED_CHART], '
      '       [CLAIM_STATUS], '
      '       [BILL_LATTER], '
      '       [FACILITY_ID], '
      '       [PATPLAN_NUMBER], '
      '       [COMPOUNDCODE], '
      '       [PRESCRIBERIDQUALIFIER], '
      '       [METRICDECIMALQUANTITY], '
      '       [RX_ACTIVE], '
      '       [SIG], '
      '       [RX_DISPENSING_FEE_PAID], '
      '       [MEDICAMENTOMIX], '
      '       [ADHERENCE], '
      '       [RX_OTHER_AMOUNT_PAID], '
      '       [WF_STORAGE], '
      '       [WF_CASHIER], '
      '       [WF_SIGNATURE], '
      '       [ALCHEMY_PRODUCTID], '
      '       [MARKETEDPRODUCTID], '
      '       [PA], '
      '       [WF_REVERSE], '
      '       [AUTOMATIC_REFILL], '
      '       [REFILL_NOTIFIED], '
      '       CONVERT(VARCHAR(MAX), NOTE_STR) AS NOTE,'
      '       [DRUG_EXPIRATION]'
      '  from PRESCRIPTION_FULL where RX_NUMBER = 1064828')
    Left = 72
    Top = 240
  end
  object dspPrescription_Full: TDataSetProvider
    DataSet = qPrescription_Full
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 240
  end
  object dsPrescription_Full: TDataSource
    DataSet = cdsPrescription_Full
    Left = 240
    Top = 240
  end
  object cdsPrescription_Full: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrescription_Full'
    AfterScroll = cdsPrescription_FullAfterScroll
    OnCalcFields = cdsPrescription_FullCalcFields
    Left = 352
    Top = 240
    object cdsPrescription_FullRX_SERVICE_DATE: TSQLTimeStampField
      FieldName = 'RX_SERVICE_DATE'
      Origin = 'RX_SERVICE_DATE'
    end
    object cdsPrescription_FullNO_REF_DISPENSADO: TIntegerField
      FieldName = 'NO_REF_DISPENSADO'
      Origin = 'NO_REF_DISPENSADO'
    end
    object cdsPrescription_FullPHARMACIST: TStringField
      FieldName = 'PHARMACIST'
      Origin = 'PHARMACIST'
      FixedChar = True
      Size = 3
    end
    object cdsPrescription_FullDAYS_SUPPLY: TIntegerField
      FieldName = 'DAYS_SUPPLY'
      Origin = 'DAYS_SUPPLY'
    end
    object cdsPrescription_FullAUTHORIZATION_NUMBER: TStringField
      FieldName = 'AUTHORIZATION_NUMBER'
      Origin = 'AUTHORIZATION_NUMBER'
    end
    object cdsPrescription_FullPRICE_TABLE_ID: TIntegerField
      FieldName = 'PRICE_TABLE_ID'
      Origin = 'PRICE_TABLE_ID'
    end
    object cdsPrescription_FullDRUG: TStringField
      FieldName = 'DRUG'
      Origin = 'DRUG'
      Size = 30
    end
    object cdsPrescription_FullNDC: TStringField
      FieldName = 'NDC'
      Origin = 'NDC'
      Size = 15
    end
    object cdsPrescription_FullTYPIST: TStringField
      FieldName = 'TYPIST'
      Origin = 'TYPIST'
      Size = 5
    end
    object cdsPrescription_FullBATCH_NUMBER: TStringField
      FieldName = 'BATCH_NUMBER'
      Origin = 'BATCH_NUMBER'
      Size = 12
    end
    object cdsPrescription_FullRX_NUMBER: TLargeintField
      FieldName = 'RX_NUMBER'
      Origin = 'RX_NUMBER'
    end
    object cdsPrescription_FullPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Origin = 'PRODUCT_ID'
    end
    object cdsPrescription_FullRX_SIG: TWideStringField
      FieldName = 'RX_SIG'
      Origin = 'RX_SIG'
      FixedChar = True
      Size = 296
    end
    object cdsPrescription_FullRX_DATE: TSQLTimeStampField
      FieldName = 'RX_DATE'
      Origin = 'RX_DATE'
    end
    object cdsPrescription_FullPAT_CLIENT_NUMBER: TIntegerField
      FieldName = 'PAT_CLIENT_NUMBER'
      Origin = 'PAT_CLIENT_NUMBER'
    end
    object cdsPrescription_FullRXORIGINCODE: TStringField
      FieldName = 'RXORIGINCODE'
      Origin = 'RXORIGINCODE'
      Size = 1
    end
    object cdsPrescription_FullPAT_NAME: TStringField
      FieldName = 'PAT_NAME'
      Origin = 'PAT_NAME'
      FixedChar = True
      Size = 12
    end
    object cdsPrescription_FullPAT_LASTNAME: TStringField
      FieldName = 'PAT_LASTNAME'
      Origin = 'PAT_LASTNAME'
      FixedChar = True
      Size = 15
    end
    object cdsPrescription_FullPAT_MAIDENNAME: TStringField
      FieldName = 'PAT_MAIDENNAME'
      Origin = 'PAT_MAIDENNAME'
      FixedChar = True
      Size = 15
    end
    object cdsPrescription_FullPAT_TELEPHONE: TStringField
      FieldName = 'PAT_TELEPHONE'
      Origin = 'PAT_TELEPHONE'
      FixedChar = True
      Size = 13
    end
    object cdsPrescription_FullPAT_CELULAR: TStringField
      FieldName = 'PAT_CELULAR'
      Origin = 'PAT_CELULAR'
      FixedChar = True
      Size = 13
    end
    object cdsPrescription_FullPAT_SEX: TIntegerField
      FieldName = 'PAT_SEX'
      Origin = 'PAT_SEX'
    end
    object cdsPrescription_FullPAT_DOB: TSQLTimeStampField
      FieldName = 'PAT_DOB'
      Origin = 'PAT_DOB'
    end
    object cdsPrescription_FullPRESC_NUMBER: TIntegerField
      FieldName = 'PRESC_NUMBER'
      Origin = 'PRESC_NUMBER'
      Required = True
    end
    object cdsPrescription_FullPRESC_MAIDENNAME: TStringField
      FieldName = 'PRESC_MAIDENNAME'
      Origin = 'PRESC_MAIDENNAME'
      Size = 15
    end
    object cdsPrescription_FullPRESC_LASTNAME: TStringField
      FieldName = 'PRESC_LASTNAME'
      Origin = 'PRESC_LASTNAME'
      Size = 15
    end
    object cdsPrescription_FullPRESC_NAME: TStringField
      FieldName = 'PRESC_NAME'
      Origin = 'PRESC_NAME'
      Size = 12
    end
    object cdsPrescription_FullPRESC_TEL: TStringField
      FieldName = 'PRESC_TEL'
      Origin = 'PRESC_TEL'
      FixedChar = True
      Size = 13
    end
    object cdsPrescription_FullPRESC_FAX: TStringField
      FieldName = 'PRESC_FAX'
      Origin = 'PRESC_FAX'
      FixedChar = True
      Size = 13
    end
    object cdsPrescription_FullPRESC_NPI: TStringField
      FieldName = 'PRESC_NPI'
      Origin = 'PRESC_NPI'
      Size = 15
    end
    object cdsPrescription_FullPRESC_EMAIL: TWideStringField
      FieldName = 'PRESC_EMAIL'
      Origin = 'PRESC_EMAIL'
      FixedChar = True
      Size = 80
    end
    object cdsPrescription_FullPRESC_ADD1: TStringField
      FieldName = 'PRESC_ADD1'
      Origin = 'PRESC_ADD1'
      Size = 30
    end
    object cdsPrescription_FullPRESC_STATE: TWideStringField
      FieldName = 'PRESC_STATE'
      Origin = 'PRESC_STATE'
      FixedChar = True
      Size = 2
    end
    object cdsPrescription_FullPRESC_ZIP: TWideStringField
      FieldName = 'PRESC_ZIP'
      Origin = 'PRESC_ZIP'
      FixedChar = True
      Size = 15
    end
    object cdsPrescription_FullPRESC_ADDRESS2: TWideStringField
      FieldName = 'PRESC_ADDRESS2'
      Origin = 'PRESC_ADDRESS2'
      FixedChar = True
    end
    object cdsPrescription_FullPRESC_CITY: TWideStringField
      FieldName = 'PRESC_CITY'
      Origin = 'PRESC_CITY'
      FixedChar = True
    end
    object cdsPrescription_FullPRESC_CEL: TWideStringField
      FieldName = 'PRESC_CEL'
      Origin = 'PRESC_CEL'
      FixedChar = True
      Size = 13
    end
    object cdsPrescription_FullDEA_FEDERAL: TStringField
      FieldName = 'DEA_FEDERAL'
      Origin = 'DEA_FEDERAL'
      Size = 15
    end
    object cdsPrescription_FullPLAN_BINNUBER: TStringField
      FieldName = 'PLAN_BINNUBER'
      Origin = 'PLAN_BINNUBER'
      Required = True
      Size = 6
    end
    object cdsPrescription_FullPLAN_SUPPORT_TEL: TStringField
      FieldName = 'PLAN_SUPPORT_TEL'
      Origin = 'PLAN_SUPPORT_TEL'
      FixedChar = True
      Size = 13
    end
    object cdsPrescription_FullRX_REF_AUTHORIZED: TSmallintField
      FieldName = 'RX_REF_AUTHORIZED'
      Origin = 'RX_REF_AUTHORIZED'
    end
    object cdsPrescription_FullRX_LAST_REFILL_DATE: TSQLTimeStampField
      FieldName = 'RX_LAST_REFILL_DATE'
      Origin = 'RX_LAST_REFILL_DATE'
    end
    object cdsPrescription_FullHealth_plan_abbreviation: TStringField
      FieldName = 'Health_plan_abbreviation'
      Origin = 'Health_plan_abbreviation'
      Size = 3
    end
    object cdsPrescription_FullWF_BILLED: TWideStringField
      FieldName = 'WF_BILLED'
      Origin = 'WF_BILLED'
      FixedChar = True
      Size = 30
    end
    object cdsPrescription_FullWF_PRINTED: TWideStringField
      FieldName = 'WF_PRINTED'
      Origin = 'WF_PRINTED'
      FixedChar = True
      Size = 30
    end
    object cdsPrescription_FullWF_FILLED: TWideStringField
      FieldName = 'WF_FILLED'
      Origin = 'WF_FILLED'
      FixedChar = True
      Size = 30
    end
    object cdsPrescription_FullWF_CHECKED: TWideStringField
      FieldName = 'WF_CHECKED'
      Origin = 'WF_CHECKED'
      FixedChar = True
      Size = 30
    end
    object cdsPrescription_FullWF_DELIVERED: TWideStringField
      FieldName = 'WF_DELIVERED'
      Origin = 'WF_DELIVERED'
      FixedChar = True
      Size = 30
    end
    object cdsPrescription_FullWF_TYPED: TWideStringField
      FieldName = 'WF_TYPED'
      Origin = 'WF_TYPED'
      FixedChar = True
      Size = 30
    end
    object cdsPrescription_FullRX_ID: TIntegerField
      FieldName = 'RX_ID'
      Origin = 'RX_ID'
      Required = True
    end
    object cdsPrescription_FullMED_CHART: TBooleanField
      FieldName = 'MED_CHART'
      Origin = 'MED_CHART'
    end
    object cdsPrescription_FullCLAIM_STATUS: TIntegerField
      FieldName = 'CLAIM_STATUS'
      Origin = 'CLAIM_STATUS'
    end
    object cdsPrescription_FullFACILITY_ID: TIntegerField
      FieldName = 'FACILITY_ID'
      Origin = 'FACILITY_ID'
    end
    object cdsPrescription_FullPATPLAN_NUMBER: TIntegerField
      FieldName = 'PATPLAN_NUMBER'
      Origin = 'PATPLAN_NUMBER'
    end
    object cdsPrescription_FullCOMPOUNDCODE: TIntegerField
      FieldName = 'COMPOUNDCODE'
      Origin = 'COMPOUNDCODE'
    end
    object cdsPrescription_FullPRESCRIBERIDQUALIFIER: TStringField
      FieldName = 'PRESCRIBERIDQUALIFIER'
      Origin = 'PRESCRIBERIDQUALIFIER'
      Size = 2
    end
    object cdsPrescription_FullMETRICDECIMALQUANTITY: TIntegerField
      FieldName = 'METRICDECIMALQUANTITY'
      Origin = 'METRICDECIMALQUANTITY'
    end
    object cdsPrescription_FullRX_ACTIVE: TBooleanField
      FieldName = 'RX_ACTIVE'
      Origin = 'RX_ACTIVE'
      Required = True
    end
    object cdsPrescription_FullSIG: TWideStringField
      FieldName = 'SIG'
      Origin = 'SIG'
      FixedChar = True
      Size = 296
    end
    object cdsPrescription_FullNombreCompleto: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreCompleto'
      Size = 50
      Calculated = True
    end
    object cdsPrescription_FullPresc_FullName: TStringField
      FieldKind = fkCalculated
      FieldName = 'Presc_FullName'
      Size = 50
      Calculated = True
    end
    object cdsPrescription_FullMEDICAMENTOMIX: TStringField
      FieldName = 'MEDICAMENTOMIX'
      Origin = 'MEDICAMENTOMIX'
      FixedChar = True
      Size = 120
    end
    object cdsPrescription_FullMedicamentoMixDefine: TStringField
      FieldKind = fkCalculated
      FieldName = 'MedicamentoMixDefine'
      Size = 120
      Calculated = True
    end
    object cdsPrescription_FullADHERENCE: TBooleanField
      FieldName = 'ADHERENCE'
      Origin = 'ADHERENCE'
    end
    object cdsPrescription_FullPayment_Line: TStringField
      FieldKind = fkCalculated
      FieldName = 'Payment_Line'
      Size = 100
      Calculated = True
    end
    object cdsPrescription_FullAvailableDefine: TStringField
      DisplayWidth = 75
      FieldKind = fkCalculated
      FieldName = 'AvailableDefine'
      Size = 75
      Calculated = True
    end
    object cdsPrescription_FullNO_REFILL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NO_REFILL'
      Calculated = True
    end
    object cdsPrescription_FullOTCNumber_Print: TStringField
      FieldKind = fkCalculated
      FieldName = 'OTCNumber_Print'
      Size = 14
      Calculated = True
    end
    object cdsPrescription_FullPAT_ADDRESS1: TStringField
      FieldName = 'PAT_ADDRESS1'
      Origin = 'PAT_ADDRESS1'
      FixedChar = True
      Size = 30
    end
    object cdsPrescription_FullPAT_CITY: TStringField
      FieldName = 'PAT_CITY'
      Origin = 'PAT_CITY'
      FixedChar = True
    end
    object cdsPrescription_FullPAT_STATE: TStringField
      FieldName = 'PAT_STATE'
      Origin = 'PAT_STATE'
      FixedChar = True
      Size = 2
    end
    object cdsPrescription_FullPAT_ZIPCODE: TWideStringField
      FieldName = 'PAT_ZIPCODE'
      Origin = 'PAT_ZIPCODE'
      FixedChar = True
      Size = 15
    end
    object cdsPrescription_FullPAT_FULL_ADDRESS: TStringField
      FieldKind = fkCalculated
      FieldName = 'PAT_FULL_ADDRESS'
      Size = 92
      Calculated = True
    end
    object cdsPrescription_FullCaution1: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caution1'
      Size = 1000
      Calculated = True
    end
    object cdsPrescription_FullPAT_ADDRESS2: TWideStringField
      FieldName = 'PAT_ADDRESS2'
      Origin = 'PAT_ADDRESS2'
      FixedChar = True
    end
    object cdsPrescription_FullCaution2: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caution2'
      Size = 1000
      Calculated = True
    end
    object cdsPrescription_FullCaution3: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caution3'
      Size = 1000
      Calculated = True
    end
    object cdsPrescription_FullCaution4: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caution4'
      Size = 1000
      Calculated = True
    end
    object cdsPrescription_FullCaution5: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caution5'
      Size = 1000
      Calculated = True
    end
    object cdsPrescription_FullPatEducation: TStringField
      FieldKind = fkCalculated
      FieldName = 'PatEducation'
      Size = 10000
      Calculated = True
    end
    object cdsPrescription_FullPatPayAmount: TStringField
      FieldKind = fkCalculated
      FieldName = 'PatPayAmount'
      Calculated = True
    end
    object cdsPrescription_FullPAT_IDENTIFICATION: TStringField
      FieldName = 'PAT_IDENTIFICATION'
      Origin = 'PAT_IDENTIFICATION'
      FixedChar = True
    end
    object cdsPrescription_FullBILL_LATTER: TBooleanField
      FieldName = 'BILL_LATTER'
      Origin = 'BILL_LATTER'
    end
    object cdsPrescription_FullRX_STATUS_DEFINE: TStringField
      FieldKind = fkCalculated
      FieldName = 'RX_STATUS_DEFINE'
      Size = 7
      Calculated = True
    end
    object cdsPrescription_FullRX_ORIGIN_CODE_DEFINE: TStringField
      FieldKind = fkCalculated
      FieldName = 'RX_ORIGIN_CODE_DEFINE'
      Size = 10
      Calculated = True
    end
    object cdsPrescription_FullCompound_NDC: TStringField
      FieldKind = fkCalculated
      FieldName = 'Compound_NDC'
      Size = 19
      Calculated = True
    end
    object cdsPrescription_FullCompound_Lote: TStringField
      FieldKind = fkCalculated
      FieldName = 'Compound_Lote'
      Size = 12
      Calculated = True
    end
    object cdsPrescription_FullCompound_Expi: TDateField
      FieldKind = fkCalculated
      FieldName = 'Compound_Expi'
      Calculated = True
    end
    object cdsPrescription_FullAvailableDefine2: TStringField
      FieldKind = fkCalculated
      FieldName = 'AvailableDefine2'
      Size = 100
      Calculated = True
    end
    object cdsPrescription_FullPlanInfo: TStringField
      DisplayWidth = 150
      FieldKind = fkCalculated
      FieldName = 'PlanInfo'
      Size = 150
      Calculated = True
    end
    object cdsPrescription_FullDrugInfo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DrugInfo'
      Size = 100
      Calculated = True
    end
    object cdsPrescription_FullWF_STORAGE: TWideStringField
      FieldName = 'WF_STORAGE'
      Origin = 'WF_STORAGE'
      FixedChar = True
      Size = 30
    end
    object cdsPrescription_FullWF_CASHIER: TWideStringField
      FieldName = 'WF_CASHIER'
      Origin = 'WF_CASHIER'
      FixedChar = True
      Size = 30
    end
    object cdsPrescription_FullWF_SIGNATURE: TWideStringField
      FieldName = 'WF_SIGNATURE'
      Origin = 'WF_SIGNATURE'
      FixedChar = True
      Size = 30
    end
    object cdsPrescription_FullCARDHOLDERID: TStringField
      FieldKind = fkLookup
      FieldName = 'CARDHOLDERID'
      LookupDataSet = cdsPatPlan2
      LookupKeyFields = 'NUMEROPLAN'
      LookupResultField = 'CARDHOLDERID'
      KeyFields = 'PATPLAN_NUMBER'
      Lookup = True
    end
    object cdsPrescription_FullRX_NUMBER_HEADING: TStringField
      FieldKind = fkCalculated
      FieldName = 'RX_NUMBER_HEADING'
      Size = 150
      Calculated = True
    end
    object cdsPrescription_FullPresc_FullName2: TStringField
      FieldKind = fkCalculated
      FieldName = 'Presc_FullName2'
      Size = 75
      Calculated = True
    end
    object cdsPrescription_FullPlanInfo2_NoShowPP: TStringField
      FieldKind = fkCalculated
      FieldName = 'PlanInfo2_NoShowPP'
      Size = 100
      Calculated = True
    end
    object cdsPrescription_FullRX_CONTROL: TWideStringField
      FieldName = 'RX_CONTROL'
      Origin = 'RX_CONTROL'
      FixedChar = True
      Size = 4
    end
    object cdsPrescription_FullDAW: TSmallintField
      FieldName = 'DAW'
      Origin = 'DAW'
    end
    object cdsPrescription_FullRX_QTY_AVAILABLE: TFMTBCDField
      FieldName = 'RX_QTY_AVAILABLE'
      Origin = 'RX_QTY_AVAILABLE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsPrescription_FullQTY: TFMTBCDField
      FieldName = 'QTY'
      Origin = 'QTY'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsPrescription_FullSALES_COST: TFMTBCDField
      FieldName = 'SALES_COST'
      Origin = 'SALES_COST'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsPrescription_FullPLAN_PAY_AMOUNT: TFMTBCDField
      FieldName = 'PLAN_PAY_AMOUNT'
      Origin = 'PLAN_PAY_AMOUNT'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsPrescription_FullPAT_PAY_AMOUNT: TFMTBCDField
      FieldName = 'PAT_PAY_AMOUNT'
      Origin = 'PAT_PAY_AMOUNT'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsPrescription_FullAWP: TFMTBCDField
      FieldName = 'AWP'
      Origin = 'AWP'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsPrescription_FullRX_QTY_PRESCRIBED: TFloatField
      FieldName = 'RX_QTY_PRESCRIBED'
      Origin = 'RX_QTY_PRESCRIBED'
      DisplayFormat = '#.00'
    end
    object cdsPrescription_FullTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsPrescription_FullCASH_RETAIL_PRICE: TFMTBCDField
      FieldName = 'CASH_RETAIL_PRICE'
      Origin = 'CASH_RETAIL_PRICE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsPrescription_FullRX_DISPENSING_FEE_PAID: TFMTBCDField
      FieldName = 'RX_DISPENSING_FEE_PAID'
      Origin = 'RX_DISPENSING_FEE_PAID'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsPrescription_FullRX_OTHER_AMOUNT_PAID: TFMTBCDField
      FieldName = 'RX_OTHER_AMOUNT_PAID'
      Origin = 'RX_OTHER_AMOUNT_PAID'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsPrescription_FullEarning: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Earning'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object cdsPrescription_FullAUTOMATIC_REFILL: TBooleanField
      FieldName = 'AUTOMATIC_REFILL'
      Origin = 'AUTOMATIC_REFILL'
    end
    object cdsPrescription_FullDRUG_EXPIRATION: TDateField
      FieldName = 'DRUG_EXPIRATION'
      Origin = 'DRUG_EXPIRATION'
    end
    object cdsPrescription_FullINV_INFO: TStringField
      FieldKind = fkCalculated
      FieldName = 'INV_INFO'
      Size = 100
      Calculated = True
    end
    object cdsPrescription_FullLABEL_LINE1: TStringField
      FieldKind = fkCalculated
      FieldName = 'LABEL_LINE1'
      Size = 60
      Calculated = True
    end
    object cdsPrescription_FullLABEL_LINE1b: TStringField
      FieldKind = fkCalculated
      FieldName = 'LABEL_LINE1b'
      Size = 60
      Calculated = True
    end
    object cdsPrescription_FullLABEL_LINE1c: TStringField
      FieldKind = fkCalculated
      FieldName = 'LABEL_LINE1c'
      Size = 60
      Calculated = True
    end
    object cdsPrescription_FullSIGNATURE_LINE: TStringField
      FieldKind = fkCalculated
      FieldName = 'SIGNATURE_LINE'
      Size = 70
      Calculated = True
    end
    object cdsPrescription_FullPLAN_NAME: TWideStringField
      FieldName = 'PLAN_NAME'
      Origin = 'PLAN_NAME'
      FixedChar = True
      Size = 50
    end
    object cdsPrescription_FullPAT_LANGUAGE: TWideStringField
      FieldName = 'PAT_LANGUAGE'
      Origin = 'PAT_LANGUAGE'
      FixedChar = True
      Size = 12
    end
    object cdsPrescription_FullALCHEMY_PRODUCTID: TIntegerField
      FieldName = 'ALCHEMY_PRODUCTID'
      Origin = 'ALCHEMY_PRODUCTID'
    end
    object cdsPrescription_FullMARKETEDPRODUCTID: TIntegerField
      FieldName = 'MARKETEDPRODUCTID'
      Origin = 'MARKETEDPRODUCTID'
    end
    object cdsPrescription_FullPA: TBooleanField
      FieldName = 'PA'
      Origin = 'PA'
    end
    object cdsPrescription_FullWF_REVERSE: TBooleanField
      FieldName = 'WF_REVERSE'
      Origin = 'WF_REVERSE'
    end
    object cdsPrescription_FullREFILL_NOTIFIED: TBooleanField
      FieldName = 'REFILL_NOTIFIED'
      Origin = 'REFILL_NOTIFIED'
    end
    object cdsPrescription_FullPAT_INFO: TStringField
      FieldKind = fkCalculated
      FieldName = 'PAT_INFO'
      Size = 150
      Calculated = True
    end
    object cdsPrescription_FullOTC_BATCH_NUMBER: TIntegerField
      FieldName = 'OTC_BATCH_NUMBER'
      Origin = 'OTC_BATCH_NUMBER'
    end
    object cdsPrescription_FullRX_STATUS: TStringField
      FieldName = 'RX_STATUS'
      Origin = 'RX_STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsPrescription_FullIOU: TFMTBCDField
      FieldName = 'IOU'
      Origin = 'IOU'
      Precision = 18
      Size = 2
    end
  end
  object qSetup: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'Select * from creditdebitSetup')
    Left = 72
    Top = 304
  end
  object dspSetup: TDataSetProvider
    DataSet = qSetup
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 304
  end
  object cdsSetup: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSetup'
    OnCalcFields = cdsSetupCalcFields
    Left = 328
    Top = 304
    object cdsSetupSTORENAMEHEADING: TStringField
      FieldName = 'STORENAMEHEADING'
      Origin = 'STORENAMEHEADING'
      Size = 30
    end
    object cdsSetupSTOREADDRESSHEADING: TStringField
      FieldName = 'STOREADDRESSHEADING'
      Origin = 'STOREADDRESSHEADING'
      Size = 50
    end
    object cdsSetupSTOREPHONEHEADING: TStringField
      FieldName = 'STOREPHONEHEADING'
      Origin = 'STOREPHONEHEADING'
      Size = 12
    end
    object cdsSetupLABEL_PRINT_QTYAVAILABEL: TBooleanField
      FieldName = 'LABEL_PRINT_QTYAVAILABEL'
      Origin = 'LABEL_PRINT_QTYAVAILABEL'
    end
    object cdsSetupGSDD_VERSION: TIntegerField
      FieldName = 'GSDD_VERSION'
      Origin = 'GSDD_VERSION'
      Required = True
    end
    object cdsSetupGoldStandardActive: TBooleanField
      FieldName = 'GoldStandardActive'
      Origin = 'GoldStandardActive'
      Required = True
    end
    object cdsSetupEDUCATION_FONT_SIZE: TIntegerField
      FieldName = 'EDUCATION_FONT_SIZE'
      Origin = 'EDUCATION_FONT_SIZE'
    end
    object cdsSetupCAUTIONS_FONT_SIZE: TIntegerField
      FieldName = 'CAUTIONS_FONT_SIZE'
      Origin = 'CAUTIONS_FONT_SIZE'
    end
    object cdsSetupPrintPagoPlan: TBooleanField
      FieldName = 'PrintPagoPlan'
      Origin = 'PrintPagoPlan'
      Required = True
    end
    object cdsSetupPLAN_MEDICO_ABREVIATURA: TBooleanField
      FieldName = 'PLAN_MEDICO_ABREVIATURA'
      Origin = 'PLAN_MEDICO_ABREVIATURA'
    end
    object cdsSetupSTAR_PLUS_INTERFACE: TBooleanField
      FieldName = 'STAR_PLUS_INTERFACE'
      Origin = 'STAR_PLUS_INTERFACE'
    end
    object cdsSetupRX_SHOW_NOREFDISP_FLOAT: TBooleanField
      FieldName = 'RX_SHOW_NOREFDISP_FLOAT'
      Origin = 'RX_SHOW_NOREFDISP_FLOAT'
    end
    object cdsSetupPOLEDISPLAYMESSAGE: TStringField
      FieldName = 'POLEDISPLAYMESSAGE'
      Origin = 'POLEDISPLAYMESSAGE'
      Size = 60
    end
    object cdsSetupSTOREZIPCODE: TStringField
      FieldName = 'STOREZIPCODE'
      Origin = 'STOREZIPCODE'
      Size = 5
    end
    object cdsSetupemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      FixedChar = True
      Size = 80
    end
    object cdsSetupemail_Host: TWideStringField
      FieldName = 'email_Host'
      Origin = 'email_Host'
      FixedChar = True
      Size = 60
    end
    object cdsSetupemail_Password: TWideStringField
      FieldName = 'email_Password'
      Origin = 'email_Password'
      FixedChar = True
      Size = 15
    end
    object cdsSetupemail_Username: TWideStringField
      FieldName = 'email_Username'
      Origin = 'email_Username'
      FixedChar = True
      Size = 45
    end
    object cdsSetupemail_Port: TIntegerField
      FieldName = 'email_Port'
      Origin = 'email_Port'
    end
    object cdsSetupPUEBLO: TStringField
      FieldName = 'PUEBLO'
      Origin = 'PUEBLO'
      Size = 30
    end
    object cdsSetupSTORETELEPHONE: TStringField
      FieldName = 'STORETELEPHONE'
      Origin = 'STORETELEPHONE'
      Size = 13
    end
    object cdsSetupSTOREADDRESS: TStringField
      FieldName = 'STOREADDRESS'
      Origin = 'STOREADDRESS'
      Size = 50
    end
    object cdsSetupPueblo_Zip: TStringField
      FieldKind = fkCalculated
      FieldName = 'Pueblo_Zip'
      Calculated = True
    end
    object cdsSetupLOGO: TBlobField
      FieldName = 'LOGO'
      Origin = 'LOGO'
    end
    object cdsSetupPOS_PRINT_LOGO: TBooleanField
      FieldName = 'POS_PRINT_LOGO'
      Origin = 'POS_PRINT_LOGO'
    end
    object cdsSetupROUTINGDATA: TStringField
      FieldName = 'ROUTINGDATA'
      Origin = 'ROUTINGDATA'
    end
    object cdsSetupMODEMCOMPORT: TIntegerField
      FieldName = 'MODEMCOMPORT'
      Origin = 'MODEMCOMPORT'
    end
    object cdsSetupSTORENAME: TStringField
      FieldName = 'STORENAME'
      Origin = 'STORENAME'
      Size = 30
    end
    object cdsSetupFACTURARECIBO: TStringField
      FieldName = 'FACTURARECIBO'
      Origin = 'FACTURARECIBO'
      Size = 1
    end
    object cdsSetupSETTLEMENTBANKID: TStringField
      FieldName = 'SETTLEMENTBANKID'
      Origin = 'SETTLEMENTBANKID'
      Size = 6
    end
    object cdsSetupCHEQUE: TIntegerField
      FieldName = 'CHEQUE'
      Origin = 'CHEQUE'
    end
    object cdsSetupTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Origin = 'TELEFONO'
      Size = 12
    end
    object cdsSetupDOSWINDOWS: TStringField
      FieldName = 'DOSWINDOWS'
      Origin = 'DOSWINDOWS'
      Size = 1
    end
    object cdsSetupPOLEDISPLAYCOMPORT: TIntegerField
      FieldName = 'POLEDISPLAYCOMPORT'
      Origin = 'POLEDISPLAYCOMPORT'
    end
    object cdsSetupHEADING: TStringField
      FieldName = 'HEADING'
      Origin = 'HEADING'
      Size = 1
    end
    object cdsSetupLABELLONGFORM: TStringField
      FieldName = 'LABELLONGFORM'
      Origin = 'LABELLONGFORM'
      Size = 1
    end
    object cdsSetupFARMACIA: TStringField
      FieldName = 'FARMACIA'
      Origin = 'FARMACIA'
      Size = 1
    end
    object cdsSetupSEARCHBY: TStringField
      FieldName = 'SEARCHBY'
      Origin = 'SEARCHBY'
      Size = 1
    end
    object cdsSetupNOCAJA: TIntegerField
      FieldName = 'NOCAJA'
      Origin = 'NOCAJA'
    end
    object cdsSetupRXNOCONTINUO: TStringField
      FieldName = 'RXNOCONTINUO'
      Origin = 'RXNOCONTINUO'
      Size = 1
    end
    object cdsSetupINTERACCION: TStringField
      FieldName = 'INTERACCION'
      Origin = 'INTERACCION'
      Size = 10
    end
    object cdsSetupMESSAGEID: TStringField
      FieldName = 'MESSAGEID'
      Origin = 'MESSAGEID'
      Size = 1
    end
    object cdsSetupVERSIONCOL: TStringField
      FieldName = 'VERSIONCOL'
      Origin = 'VERSIONCOL'
      Size = 2
    end
    object cdsSetupBANKID: TStringField
      FieldName = 'BANKID'
      Origin = 'BANKID'
      Size = 6
    end
    object cdsSetupMERCHANTID: TStringField
      FieldName = 'MERCHANTID'
      Origin = 'MERCHANTID'
      Size = 15
    end
    object cdsSetupTERMINALTYPE: TStringField
      FieldName = 'TERMINALTYPE'
      Origin = 'TERMINALTYPE'
      Size = 3
    end
    object cdsSetupNUMERO_TRANS: TIntegerField
      FieldName = 'NUMERO_TRANS'
      Origin = 'NUMERO_TRANS'
      Required = True
    end
    object cdsSetupESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsSetupMENSAGE: TStringField
      FieldName = 'MENSAGE'
      Origin = 'MENSAGE'
      FixedChar = True
      Size = 50
    end
    object cdsSetupNEXT_BARCODE: TStringField
      FieldName = 'NEXT_BARCODE'
      Origin = 'NEXT_BARCODE'
      Required = True
      FixedChar = True
      Size = 12
    end
    object cdsSetupDATA_COLECTOR_COLUMNS: TIntegerField
      FieldName = 'DATA_COLECTOR_COLUMNS'
      Origin = 'DATA_COLECTOR_COLUMNS'
    end
    object cdsSetupPORCIENTO_AWP: TSingleField
      FieldName = 'PORCIENTO_AWP'
      Origin = 'PORCIENTO_AWP'
      Required = True
    end
    object cdsSetupNO_FARMACIA: TIntegerField
      FieldName = 'NO_FARMACIA'
      Origin = 'NO_FARMACIA'
    end
    object cdsSetupTAX_RATE: TFloatField
      FieldName = 'TAX_RATE'
      Origin = 'TAX_RATE'
    end
    object cdsSetupTAX_RATE_FROM: TFloatField
      FieldName = 'TAX_RATE_FROM'
      Origin = 'TAX_RATE_FROM'
    end
    object cdsSetupTAX_RATE_ESTATAL: TFloatField
      FieldName = 'TAX_RATE_ESTATAL'
      Origin = 'TAX_RATE_ESTATAL'
    end
    object cdsSetupCOBRAR_OTC_TAX: TStringField
      FieldName = 'COBRAR_OTC_TAX'
      Origin = 'COBRAR_OTC_TAX'
      FixedChar = True
      Size = 1
    end
    object cdsSetupIVULOTO_MERCHANT_ID: TStringField
      FieldName = 'IVULOTO_MERCHANT_ID'
      Origin = 'IVULOTO_MERCHANT_ID'
      Size = 15
    end
    object cdsSetupIVULOTO_PASSWORD: TStringField
      FieldName = 'IVULOTO_PASSWORD'
      Origin = 'IVULOTO_PASSWORD'
      Size = 15
    end
    object cdsSetupPORCIENTO_PATROCINIO: TFloatField
      FieldName = 'PORCIENTO_PATROCINIO'
      Origin = 'PORCIENTO_PATROCINIO'
    end
    object cdsSetupNABP: TWideStringField
      FieldName = 'NABP'
      Origin = 'NABP'
      FixedChar = True
      Size = 7
    end
    object cdsSetupNPI: TWideStringField
      FieldName = 'NPI'
      Origin = 'NPI'
      FixedChar = True
      Size = 15
    end
    object cdsSetupDRUG_INTERACTION_SEVERITY: TIntegerField
      FieldName = 'DRUG_INTERACTION_SEVERITY'
      Origin = 'DRUG_INTERACTION_SEVERITY'
    end
    object cdsSetupSURESCRIPT_DIRECTORY_UPDATE: TDateField
      FieldName = 'SURESCRIPT_DIRECTORY_UPDATE'
      Origin = 'SURESCRIPT_DIRECTORY_UPDATE'
    end
    object cdsSetupSCANED_IMAGE_ADDRESS: TWideStringField
      FieldName = 'SCANED_IMAGE_ADDRESS'
      Origin = 'SCANED_IMAGE_ADDRESS'
      FixedChar = True
      Size = 100
    end
    object cdsSetupADDRESS2: TWideStringField
      FieldName = 'ADDRESS2'
      Origin = 'ADDRESS2'
      FixedChar = True
      Size = 35
    end
    object cdsSetupSURESCRIPT_IP: TWideStringField
      FieldName = 'SURESCRIPT_IP'
      Origin = 'SURESCRIPT_IP'
      FixedChar = True
      Size = 100
    end
    object cdsSetupePrescribePrinterName: TWideStringField
      FieldName = 'ePrescribePrinterName'
      Origin = 'ePrescribePrinterName'
      FixedChar = True
      Size = 100
    end
    object cdsSetupPrintRxExpirationDate: TBooleanField
      FieldName = 'PrintRxExpirationDate'
      Origin = 'PrintRxExpirationDate'
    end
    object cdsSetupPrintPatDir: TBooleanField
      FieldName = 'PrintPatDir'
      Origin = 'PrintPatDir'
    end
    object cdsSetupEnforcePrescribersNPI: TBooleanField
      FieldName = 'EnforcePrescribersNPI'
      Origin = 'EnforcePrescribersNPI'
    end
    object cdsSetupVerificarTelefonoPaciente: TBooleanField
      FieldName = 'VerificarTelefonoPaciente'
      Origin = 'VerificarTelefonoPaciente'
    end
    object cdsSetupPriceUpdate_ChangeProductName: TBooleanField
      FieldName = 'PriceUpdate_ChangeProductName'
      Origin = 'PriceUpdate_ChangeProductName'
    end
    object cdsSetupPriceUpdate_ChangeManufacturer: TBooleanField
      FieldName = 'PriceUpdate_ChangeManufacturer'
      Origin = 'PriceUpdate_ChangeManufacturer'
    end
    object cdsSetupPROCEDURE_ADD_ON: TWideStringField
      FieldName = 'PROCEDURE_ADD_ON'
      Origin = 'PROCEDURE_ADD_ON'
      FixedChar = True
    end
    object cdsSetupRX_EXPIRATION_DAYS: TIntegerField
      FieldName = 'RX_EXPIRATION_DAYS'
      Origin = 'RX_EXPIRATION_DAYS'
    end
    object cdsSetupWC_REMINDER1_NODAYS: TSmallintField
      FieldName = 'WC_REMINDER1_NODAYS'
      Origin = 'WC_REMINDER1_NODAYS'
    end
    object cdsSetupWC_REMINDER2_NODAYS: TSmallintField
      FieldName = 'WC_REMINDER2_NODAYS'
      Origin = 'WC_REMINDER2_NODAYS'
    end
    object cdsSetupWC_REMINDER3_NODAYS: TSmallintField
      FieldName = 'WC_REMINDER3_NODAYS'
      Origin = 'WC_REMINDER3_NODAYS'
    end
    object cdsSetupWC_CONTACT_HOUR1: TSQLTimeStampField
      FieldName = 'WC_CONTACT_HOUR1'
      Origin = 'WC_CONTACT_HOUR1'
    end
    object cdsSetupWC_CONTACT_HOUR2: TSQLTimeStampField
      FieldName = 'WC_CONTACT_HOUR2'
      Origin = 'WC_CONTACT_HOUR2'
    end
    object cdsSetupWC_AUTOLOGOUT: TBooleanField
      FieldName = 'WC_AUTOLOGOUT'
      Origin = 'WC_AUTOLOGOUT'
    end
    object cdsSetupWC_DAYSTO_RTS: TSmallintField
      FieldName = 'WC_DAYSTO_RTS'
      Origin = 'WC_DAYSTO_RTS'
    end
    object cdsSetupWC_REMINDER_MESSAGE_SPANISH: TWideStringField
      FieldName = 'WC_REMINDER_MESSAGE_SPANISH'
      Origin = 'WC_REMINDER_MESSAGE_SPANISH'
      FixedChar = True
      Size = 160
    end
    object cdsSetupWC_INSERT_BATCH_RX: TBooleanField
      FieldName = 'WC_INSERT_BATCH_RX'
      Origin = 'WC_INSERT_BATCH_RX'
    end
    object cdsSetupWC_SMS_USER: TWideStringField
      FieldName = 'WC_SMS_USER'
      Origin = 'WC_SMS_USER'
      FixedChar = True
      Size = 30
    end
    object cdsSetupWC_SMS_API_ID: TIntegerField
      FieldName = 'WC_SMS_API_ID'
      Origin = 'WC_SMS_API_ID'
    end
    object cdsSetupWC_REMINDER_MESSAGE_ENGLISH: TWideStringField
      FieldName = 'WC_REMINDER_MESSAGE_ENGLISH'
      Origin = 'WC_REMINDER_MESSAGE_ENGLISH'
      FixedChar = True
      Size = 160
    end
    object cdsSetupWC_SMS_TELEPHONE: TWideStringField
      FieldName = 'WC_SMS_TELEPHONE'
      Origin = 'WC_SMS_TELEPHONE'
      FixedChar = True
      Size = 11
    end
    object cdsSetupWC_LOGOUT_SECONDS: TSmallintField
      FieldName = 'WC_LOGOUT_SECONDS'
      Origin = 'WC_LOGOUT_SECONDS'
    end
    object cdsSetupWC_SEND_AMOUNT_DUE: TBooleanField
      FieldName = 'WC_SEND_AMOUNT_DUE'
      Origin = 'WC_SEND_AMOUNT_DUE'
    end
    object cdsSetupWC_BROADCASTBYPHONE: TBooleanField
      FieldName = 'WC_BROADCASTBYPHONE'
      Origin = 'WC_BROADCASTBYPHONE'
    end
    object cdsSetupEnforceCustTelUpdate: TBooleanField
      FieldName = 'EnforceCustTelUpdate'
      Origin = 'EnforceCustTelUpdate'
    end
    object cdsSetupRX_CONTROLED_EXPIRATION_DAYS: TIntegerField
      FieldName = 'RX_CONTROLED_EXPIRATION_DAYS'
      Origin = 'RX_CONTROLED_EXPIRATION_DAYS'
    end
    object cdsSetupWC_SIP_SERVER: TWideStringField
      FieldName = 'WC_SIP_SERVER'
      Origin = 'WC_SIP_SERVER'
      FixedChar = True
      Size = 30
    end
    object cdsSetupWC_SIP_USER: TWideStringField
      FieldName = 'WC_SIP_USER'
      Origin = 'WC_SIP_USER'
      FixedChar = True
      Size = 30
    end
    object cdsSetupWC_SIP_PASSWORD: TWideStringField
      FieldName = 'WC_SIP_PASSWORD'
      Origin = 'WC_SIP_PASSWORD'
      FixedChar = True
      Size = 30
    end
    object cdsSetupWC_SMS_PROVIDER: TWideStringField
      FieldName = 'WC_SMS_PROVIDER'
      Origin = 'WC_SMS_PROVIDER'
      FixedChar = True
      Size = 10
    end
    object cdsSetupWC_INTERFACE: TWideStringField
      FieldName = 'WC_INTERFACE'
      Origin = 'WC_INTERFACE'
      FixedChar = True
    end
    object cdsSetupWC_INTERFACE_HOST: TWideStringField
      FieldName = 'WC_INTERFACE_HOST'
      Origin = 'WC_INTERFACE_HOST'
      FixedChar = True
      Size = 15
    end
    object cdsSetupWC_INTERFACE_PORT: TIntegerField
      FieldName = 'WC_INTERFACE_PORT'
      Origin = 'WC_INTERFACE_PORT'
    end
    object cdsSetupNON_WESCOM_STORE: TBooleanField
      FieldName = 'NON_WESCOM_STORE'
      Origin = 'NON_WESCOM_STORE'
      Required = True
    end
    object cdsSetupWC_STOP_TAG_SEARCH_INTERVAL: TIntegerField
      FieldName = 'WC_STOP_TAG_SEARCH_INTERVAL'
      Origin = 'WC_STOP_TAG_SEARCH_INTERVAL'
      Required = True
    end
    object cdsSetupSCAN_COLOR: TBooleanField
      FieldName = 'SCAN_COLOR'
      Origin = 'SCAN_COLOR'
      Required = True
    end
    object cdsSetupDAW_DEFAULT_VALUE: TWideStringField
      FieldName = 'DAW_DEFAULT_VALUE'
      Origin = 'DAW_DEFAULT_VALUE'
      FixedChar = True
      Size = 1
    end
    object cdsSetupIVR: TBooleanField
      FieldName = 'IVR'
      Origin = 'IVR'
      Required = True
    end
    object cdsSetupDAYS_TO_REFILL_REMIND: TIntegerField
      FieldName = 'DAYS_TO_REFILL_REMIND'
      Origin = 'DAYS_TO_REFILL_REMIND'
      Required = True
    end
    object cdsSetupPOS_SHOW_RX_SIGNATURE: TBooleanField
      FieldName = 'POS_SHOW_RX_SIGNATURE'
      Origin = 'POS_SHOW_RX_SIGNATURE'
    end
    object cdsSetupPOS_SIGNATURE_PASSWORD: TBooleanField
      FieldName = 'POS_SIGNATURE_PASSWORD'
      Origin = 'POS_SIGNATURE_PASSWORD'
      Required = True
    end
    object cdsSetupRX30_CONVERTION: TBooleanField
      FieldName = 'RX30_CONVERTION'
      Origin = 'RX30_CONVERTION'
    end
    object cdsSetupCLASIC_SIG_CODES: TBooleanField
      FieldName = 'CLASIC_SIG_CODES'
      Origin = 'CLASIC_SIG_CODES'
    end
    object cdsSetupePresc_Q_Days: TIntegerField
      FieldName = 'ePresc_Q_Days'
      Origin = 'ePresc_Q_Days'
    end
    object cdsSetupePresc_Timer_Interval: TIntegerField
      FieldName = 'ePresc_Timer_Interval'
      Origin = 'ePresc_Timer_Interval'
    end
    object cdsSetupCHANGE_DRUG_REF: TBooleanField
      FieldName = 'CHANGE_DRUG_REF'
      Origin = 'CHANGE_DRUG_REF'
      Required = True
    end
    object cdsSetupAUTOMATIC_CLAIM_REVERSAL: TBooleanField
      FieldName = 'AUTOMATIC_CLAIM_REVERSAL'
      Origin = 'AUTOMATIC_CLAIM_REVERSAL'
      Required = True
    end
    object cdsSetupBATCH_REQUIRED: TBooleanField
      FieldName = 'BATCH_REQUIRED'
      Origin = 'BATCH_REQUIRED'
      Required = True
    end
    object cdsSetupTS_DOC_LIC: TBooleanField
      FieldName = 'TS_DOC_LIC'
      Origin = 'TS_DOC_LIC'
      Required = True
    end
    object cdsSetupTS_ORIGIN_CODE: TBooleanField
      FieldName = 'TS_ORIGIN_CODE'
      Origin = 'TS_ORIGIN_CODE'
      Required = True
    end
    object cdsSetupTS_SERVICE_DATE: TBooleanField
      FieldName = 'TS_SERVICE_DATE'
      Origin = 'TS_SERVICE_DATE'
      Required = True
    end
    object cdsSetupTS_RX_DATE: TBooleanField
      FieldName = 'TS_RX_DATE'
      Origin = 'TS_RX_DATE'
      Required = True
    end
    object cdsSetupTS_EXP_DATE: TBooleanField
      FieldName = 'TS_EXP_DATE'
      Origin = 'TS_EXP_DATE'
      Required = True
    end
    object cdsSetupTS_BATCH_NO: TBooleanField
      FieldName = 'TS_BATCH_NO'
      Origin = 'TS_BATCH_NO'
      Required = True
    end
    object cdsSetupTS_COST: TBooleanField
      FieldName = 'TS_COST'
      Origin = 'TS_COST'
    end
    object cdsSetupTS_AUTO_REFILL: TBooleanField
      FieldName = 'TS_AUTO_REFILL'
      Origin = 'TS_AUTO_REFILL'
      Required = True
    end
    object cdsSetupTS_DAW: TBooleanField
      FieldName = 'TS_DAW'
      Origin = 'TS_DAW'
      Required = True
    end
    object cdsSetupALLERGY_AUTHORIZATION: TBooleanField
      FieldName = 'ALLERGY_AUTHORIZATION'
      Origin = 'ALLERGY_AUTHORIZATION'
      Required = True
    end
    object cdsSetupGSDD_FOLDER: TWideStringField
      FieldName = 'GSDD_FOLDER'
      Origin = 'GSDD_FOLDER'
      FixedChar = True
      Size = 60
    end
    object cdsSetupWC_MAKE_FIRST_NOTIFICATION: TBooleanField
      FieldName = 'WC_MAKE_FIRST_NOTIFICATION'
      Origin = 'WC_MAKE_FIRST_NOTIFICATION'
    end
    object cdsSetupCOSTO_CALCULADO: TBooleanField
      FieldName = 'COSTO_CALCULADO'
      Origin = 'COSTO_CALCULADO'
    end
    object cdsSetupSAVE_CLAIM_TRANSACTIONS: TBooleanField
      FieldName = 'SAVE_CLAIM_TRANSACTIONS'
      Origin = 'SAVE_CLAIM_TRANSACTIONS'
    end
    object cdsSetupSILENT_BILLING_NEWRX: TBooleanField
      FieldName = 'SILENT_BILLING_NEWRX'
      Origin = 'SILENT_BILLING_NEWRX'
    end
    object cdsSetupROBOT: TWideStringField
      FieldName = 'ROBOT'
      Origin = 'ROBOT'
      FixedChar = True
      Size = 12
    end
    object cdsSetupGSDD_DAYS_TO_COMPARE: TIntegerField
      FieldName = 'GSDD_DAYS_TO_COMPARE'
      Origin = 'GSDD_DAYS_TO_COMPARE'
    end
    object cdsSetupWF_ENFORCE_FILL: TBooleanField
      FieldName = 'WF_ENFORCE_FILL'
      Origin = 'WF_ENFORCE_FILL'
    end
    object cdsSetupNEWRX_INTERACTIONS: TBooleanField
      FieldName = 'NEWRX_INTERACTIONS'
      Origin = 'NEWRX_INTERACTIONS'
    end
    object cdsSetupSALESTECH_STAND_ALONE: TBooleanField
      FieldName = 'SALESTECH_STAND_ALONE'
      Origin = 'SALESTECH_STAND_ALONE'
    end
    object cdsSetupDONOTBILLINACTIVE_PRODUCT: TBooleanField
      FieldName = 'DONOTBILLINACTIVE_PRODUCT'
      Origin = 'DONOTBILLINACTIVE_PRODUCT'
    end
    object cdsSetupCONFIRM_OPEN_REGISTER: TBooleanField
      FieldName = 'CONFIRM_OPEN_REGISTER'
      Origin = 'CONFIRM_OPEN_REGISTER'
    end
    object cdsSetupCD_MERCHANT_ID: TStringField
      FieldName = 'CD_MERCHANT_ID'
      Origin = 'CD_MERCHANT_ID'
      FixedChar = True
      Size = 15
    end
    object cdsSetupCD_TERMINAL_ID: TStringField
      FieldName = 'CD_TERMINAL_ID'
      Origin = 'CD_TERMINAL_ID'
      FixedChar = True
      Size = 10
    end
    object cdsSetupCD_COMUNICATION_PORT: TStringField
      FieldName = 'CD_COMUNICATION_PORT'
      Origin = 'CD_COMUNICATION_PORT'
      FixedChar = True
      Size = 2
    end
    object cdsSetupCD_SERVER_IP: TStringField
      FieldName = 'CD_SERVER_IP'
      Origin = 'CD_SERVER_IP'
      FixedChar = True
      Size = 30
    end
    object cdsSetupCD_SECUREDEVICE_EMV: TStringField
      FieldName = 'CD_SECUREDEVICE_EMV'
      Origin = 'CD_SECUREDEVICE_EMV'
      FixedChar = True
      Size = 30
    end
    object cdsSetupCD_SECURE_DEVICE: TStringField
      FieldName = 'CD_SECURE_DEVICE'
      Origin = 'CD_SECURE_DEVICE'
      FixedChar = True
      Size = 30
    end
    object cdsSetupCD_PINPAD_TYPE: TStringField
      FieldName = 'CD_PINPAD_TYPE'
      Origin = 'CD_PINPAD_TYPE'
      FixedChar = True
      Size = 30
    end
    object cdsSetupCD_LOG_ACTIVATION: TBooleanField
      FieldName = 'CD_LOG_ACTIVATION'
      Origin = 'CD_LOG_ACTIVATION'
    end
    object cdsSetupCD_ACTIVE: TBooleanField
      FieldName = 'CD_ACTIVE'
      Origin = 'CD_ACTIVE'
    end
    object cdsSetupPOS_IMPORT_SIGNATURE: TBooleanField
      FieldName = 'POS_IMPORT_SIGNATURE'
      Origin = 'POS_IMPORT_SIGNATURE'
    end
    object cdsSetupSHOW_IMAGES_NEWRX: TBooleanField
      FieldName = 'SHOW_IMAGES_NEWRX'
      Origin = 'SHOW_IMAGES_NEWRX'
    end
    object cdsSetupCLEAN_OTC: TDateField
      FieldName = 'CLEAN_OTC'
      Origin = 'CLEAN_OTC'
    end
    object cdsSetupCHECK_ALLERGIES_NEWRX: TBooleanField
      FieldName = 'CHECK_ALLERGIES_NEWRX'
      Origin = 'CHECK_ALLERGIES_NEWRX'
    end
    object cdsSetupH_LOGOUT_SECONDS: TIntegerField
      FieldName = 'H_LOGOUT_SECONDS'
      Origin = 'H_LOGOUT_SECONDS'
    end
    object cdsSetupSAVEIMAGETODATABASE: TBooleanField
      FieldName = 'SAVEIMAGETODATABASE'
      Origin = 'SAVEIMAGETODATABASE'
    end
    object cdsSetupAMAZON: TBooleanField
      FieldName = 'AMAZON'
      Origin = 'AMAZON'
    end
    object cdsSetupAMAZON_ACCOUNT_KEY: TWideStringField
      FieldName = 'AMAZON_ACCOUNT_KEY'
      Origin = 'AMAZON_ACCOUNT_KEY'
      FixedChar = True
      Size = 50
    end
    object cdsSetupAMAZON_ACCOUNT_NAME: TWideStringField
      FieldName = 'AMAZON_ACCOUNT_NAME'
      Origin = 'AMAZON_ACCOUNT_NAME'
      FixedChar = True
      Size = 50
    end
    object cdsSetupAMAZON_BUCKET_NAME: TWideStringField
      FieldName = 'AMAZON_BUCKET_NAME'
      Origin = 'AMAZON_BUCKET_NAME'
      FixedChar = True
    end
    object cdsSetupBYPASS_PAT_VERIFICATION: TBooleanField
      FieldName = 'BYPASS_PAT_VERIFICATION'
      Origin = 'BYPASS_PAT_VERIFICATION'
    end
    object cdsSetupBYPASS_PRESC_VERIFICATION: TBooleanField
      FieldName = 'BYPASS_PRESC_VERIFICATION'
      Origin = 'BYPASS_PRESC_VERIFICATION'
    end
    object cdsSetupPLUGIN_DISPILL: TBooleanField
      FieldName = 'PLUGIN_DISPILL'
      Origin = 'PLUGIN_DISPILL'
    end
    object cdsSetupPLUGIN_APPRISS: TBooleanField
      FieldName = 'PLUGIN_APPRISS'
      Origin = 'PLUGIN_APPRISS'
    end
    object cdsSetupPLUGIN_SMARTPICKUP: TBooleanField
      FieldName = 'PLUGIN_SMARTPICKUP'
      Origin = 'PLUGIN_SMARTPICKUP'
    end
    object cdsSetupPOS_INCLUDE_BATCH: TBooleanField
      FieldName = 'POS_INCLUDE_BATCH'
      Origin = 'POS_INCLUDE_BATCH'
    end
    object cdsSetupAPPRISS_USERNAME: TWideStringField
      FieldName = 'APPRISS_USERNAME'
      Origin = 'APPRISS_USERNAME'
      FixedChar = True
      Size = 40
    end
    object cdsSetupAPPRISS_PASSWORD: TWideStringField
      FieldName = 'APPRISS_PASSWORD'
      Origin = 'APPRISS_PASSWORD'
      FixedChar = True
    end
    object cdsSetupDEA: TStringField
      FieldName = 'DEA'
      Origin = 'DEA'
      Size = 15
    end
    object cdsSetupID: TAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsSetupBYPASS_FIRMA_ELECTRONICA: TBooleanField
      FieldName = 'BYPASS_FIRMA_ELECTRONICA'
      Origin = 'BYPASS_FIRMA_ELECTRONICA'
    end
    object cdsSetupCLASSIC_LOGIN: TBooleanField
      FieldName = 'CLASSIC_LOGIN'
      Origin = 'CLASSIC_LOGIN'
    end
    object cdsSetupSP_SELECTALL: TBooleanField
      FieldName = 'SP_SELECTALL'
      Origin = 'SP_SELECTALL'
    end
    object cdsSetupSURESCRIPT_VERSION: TWideStringField
      FieldName = 'SURESCRIPT_VERSION'
      Origin = 'SURESCRIPT_VERSION'
      FixedChar = True
      Size = 10
    end
    object cdsSetupPOS_USER_INDIVIDUAL_BALANCING: TBooleanField
      FieldName = 'POS_USER_INDIVIDUAL_BALANCING'
      Origin = 'POS_USER_INDIVIDUAL_BALANCING'
    end
    object cdsSetupPOS_REST_ALWAYSLOGOUT: TBooleanField
      FieldName = 'POS_REST_ALWAYSLOGOUT'
      Origin = 'POS_REST_ALWAYSLOGOUT'
    end
    object cdsSetupPOS_CLASIC_PETTYCASH: TBooleanField
      FieldName = 'POS_CLASIC_PETTYCASH'
      Origin = 'POS_CLASIC_PETTYCASH'
    end
    object cdsSetupPOS_ADD_QTY: TBooleanField
      FieldName = 'POS_ADD_QTY'
      Origin = 'POS_ADD_QTY'
    end
    object cdsSetupDELETE_ALL_ONNEWRX: TBooleanField
      FieldName = 'DELETE_ALL_ONNEWRX'
      Origin = 'DELETE_ALL_ONNEWRX'
    end
    object cdsSetupTIP_PERCENTAGE1: TFMTBCDField
      FieldName = 'TIP_PERCENTAGE1'
      Origin = 'TIP_PERCENTAGE1'
      Precision = 18
      Size = 2
    end
    object cdsSetupTIP_PERCENTAGE2: TFMTBCDField
      FieldName = 'TIP_PERCENTAGE2'
      Origin = 'TIP_PERCENTAGE2'
      Precision = 18
      Size = 2
    end
    object cdsSetupTIP_PERCENTAGE3: TFMTBCDField
      FieldName = 'TIP_PERCENTAGE3'
      Origin = 'TIP_PERCENTAGE3'
      Precision = 18
      Size = 2
    end
    object cdsSetupPOS_RESTAURANT: TBooleanField
      FieldName = 'POS_RESTAURANT'
      Origin = 'POS_RESTAURANT'
    end
    object cdsSetupPOS_INSERT_NEW_PRODUCT: TBooleanField
      FieldName = 'POS_INSERT_NEW_PRODUCT'
      Origin = 'POS_INSERT_NEW_PRODUCT'
    end
    object cdsSetupTIME_CARD: TBooleanField
      FieldName = 'TIME_CARD'
      Origin = 'TIME_CARD'
    end
    object cdsSetupPOS_ACTIVE_TIP: TBooleanField
      FieldName = 'POS_ACTIVE_TIP'
      Origin = 'POS_ACTIVE_TIP'
    end
    object cdsSetupMYREFILL_UPDATE_SMARTPICKUP: TBooleanField
      FieldName = 'MYREFILL_UPDATE_SMARTPICKUP'
      Origin = 'MYREFILL_UPDATE_SMARTPICKUP'
    end
    object cdsSetupTAX_PROCESSED_FOOD: TFMTBCDField
      FieldName = 'TAX_PROCESSED_FOOD'
      Origin = 'TAX_PROCESSED_FOOD'
      Precision = 18
      Size = 2
    end
    object cdsSetupCOMMISSION1: TFMTBCDField
      FieldName = 'COMMISSION1'
      Origin = 'COMMISSION1'
      Precision = 18
      Size = 2
    end
    object cdsSetupCOMMISSION2: TFMTBCDField
      FieldName = 'COMMISSION2'
      Origin = 'COMMISSION2'
      Precision = 18
      Size = 2
    end
    object cdsSetupCOMMISSION3: TFMTBCDField
      FieldName = 'COMMISSION3'
      Origin = 'COMMISSION3'
      Precision = 18
      Size = 2
    end
    object cdsSetupACTIVE_COMMISSIONS: TBooleanField
      FieldName = 'ACTIVE_COMMISSIONS'
      Origin = 'ACTIVE_COMMISSIONS'
    end
    object cdsSetupFAX: TWideStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      FixedChar = True
      Size = 13
    end
    object cdsSetupSTOP_NEWRX_IFSIMILAR_ING: TBooleanField
      FieldName = 'STOP_NEWRX_IFSIMILAR_ING'
      Origin = 'STOP_NEWRX_IFSIMILAR_ING'
    end
    object cdsSetupAUTOMOVIL_APP: TBooleanField
      FieldName = 'AUTOMOVIL_APP'
      Origin = 'AUTOMOVIL_APP'
    end
    object cdsSetupSSSOTC_StoreKey: TWideStringField
      FieldName = 'SSSOTC_StoreKey'
      Origin = 'SSSOTC_StoreKey'
      FixedChar = True
      Size = 50
    end
    object cdsSetupSSSOTC_APIKey: TWideStringField
      FieldName = 'SSSOTC_APIKey'
      Origin = 'SSSOTC_APIKey'
      FixedChar = True
      Size = 50
    end
    object cdsSetupWF_CANCEL_CHECKED_ONREVERSAL: TBooleanField
      FieldName = 'WF_CANCEL_CHECKED_ONREVERSAL'
      Origin = 'WF_CANCEL_CHECKED_ONREVERSAL'
    end
    object cdsSetupINVENTORY_QUERY: TIntegerField
      FieldName = 'INVENTORY_QUERY'
      Origin = 'INVENTORY_QUERY'
    end
    object cdsSetupCERTIFICATE: TBlobField
      FieldName = 'CERTIFICATE'
      Origin = 'CERTIFICATE'
      Size = 2147483647
    end
    object cdsSetupENFORCE_RX_SCAN: TBooleanField
      FieldName = 'ENFORCE_RX_SCAN'
      Origin = 'ENFORCE_RX_SCAN'
    end
    object cdsSetupOVERRIDE_CONTROLLED_RX: TBooleanField
      FieldName = 'OVERRIDE_CONTROLLED_RX'
      Origin = 'OVERRIDE_CONTROLLED_RX'
    end
    object cdsSetupENFORCE_MARKET_STAUS: TBooleanField
      FieldName = 'ENFORCE_MARKET_STAUS'
      Origin = 'ENFORCE_MARKET_STAUS'
    end
    object cdsSetupIMAGE_DATABASE_IP: TWideStringField
      FieldName = 'IMAGE_DATABASE_IP'
      Origin = 'IMAGE_DATABASE_IP'
      FixedChar = True
      Size = 30
    end
    object cdsSetupSURESCRIPTS_MAILBOX: TBooleanField
      FieldName = 'SURESCRIPTS_MAILBOX'
      Origin = 'SURESCRIPTS_MAILBOX'
    end
    object cdsSetupPOS_APP_OPEN_DRAWER: TBooleanField
      FieldName = 'POS_APP_OPEN_DRAWER'
      Origin = 'POS_APP_OPEN_DRAWER'
    end
    object cdsSetupRECEIPT_MESSAGE: TMemoField
      FieldName = 'RECEIPT_MESSAGE'
      Origin = 'RECEIPT_MESSAGE'
      BlobType = ftMemo
      Size = 2147483647
    end
    object cdsSetupSURESCRIPTS_HTTP_ADDRESS: TWideStringField
      FieldName = 'SURESCRIPTS_HTTP_ADDRESS'
      Origin = 'SURESCRIPTS_HTTP_ADDRESS'
      FixedChar = True
      Size = 40
    end
    object cdsSetupWC_SMS_PASSWORD: TWideStringField
      FieldName = 'WC_SMS_PASSWORD'
      Origin = 'WC_SMS_PASSWORD'
      FixedChar = True
      Size = 40
    end
    object cdsSetupPERMIT_ZERO_MANUALSALE: TBooleanField
      FieldName = 'PERMIT_ZERO_MANUALSALE'
      Origin = 'PERMIT_ZERO_MANUALSALE'
    end
    object cdsSetupCOMPLEX_SEARCH: TBooleanField
      FieldName = 'COMPLEX_SEARCH'
      Origin = 'COMPLEX_SEARCH'
    end
    object cdsSetupRX_ENFORCE_SIGNATURE_ONCHECKOUT: TBooleanField
      FieldName = 'RX_ENFORCE_SIGNATURE_ONCHECKOUT'
      Origin = 'RX_ENFORCE_SIGNATURE_ONCHECKOUT'
    end
    object cdsSetupBTN_PRINT_RECEIPT: TBooleanField
      FieldName = 'BTN_PRINT_RECEIPT'
      Origin = 'BTN_PRINT_RECEIPT'
    end
    object cdsSetupQR_CODE: TBlobField
      FieldName = 'QR_CODE'
      Origin = 'QR_CODE'
    end
    object cdsSetupENFORCE_LEVEL_OF_SERVICE: TBooleanField
      FieldName = 'ENFORCE_LEVEL_OF_SERVICE'
      Origin = 'ENFORCE_LEVEL_OF_SERVICE'
    end
    object cdsSetupPRINT_BARCODE_PARTNUMBER: TStringField
      FieldName = 'PRINT_BARCODE_PARTNUMBER'
      Origin = 'PRINT_BARCODE_PARTNUMBER'
      FixedChar = True
      Size = 1
    end
    object cdsSetupPRINT_PAT_EDU: TBooleanField
      FieldName = 'PRINT_PAT_EDU'
    end
    object cdsSetupPRINT_PAT_EDU_CONTROLED: TBooleanField
      FieldName = 'PRINT_PAT_EDU_CONTROLED'
    end
    object cdsSetupPATEDU_ONLYONNEWRX: TBooleanField
      FieldName = 'PATEDU_ONLYONNEWRX'
    end
    object cdsSetupONLY_PRINT_PHARMACYADDRESS: TBooleanField
      FieldName = 'ONLY_PRINT_PHARMACYADDRESS'
    end
  end
  object dsSetup: TDataSource
    DataSet = cdsSetup
    Left = 224
    Top = 304
  end
  object CDSInventario: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'DSPInventario'
    OnCalcFields = CDSInventarioCalcFields
    Left = 328
    Top = 368
    object CDSInventarioTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object CDSInventarioFECHA_EXPIRACION: TSQLTimeStampField
      FieldName = 'FECHA_EXPIRACION'
      Origin = 'FECHA_EXPIRACION'
    end
    object CDSInventarioCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      FixedChar = True
      Size = 1
    end
    object CDSInventarioDEPARTAMENTO: TSmallintField
      FieldName = 'DEPARTAMENTO'
      Origin = 'DEPARTAMENTO'
    end
    object CDSInventarioLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      FixedChar = True
      Size = 12
    end
    object CDSInventarioCOMESPECIAL: TSQLTimeStampField
      FieldName = 'COMESPECIAL'
      Origin = 'COMESPECIAL'
    end
    object CDSInventarioTERMINAESPECIAL: TSQLTimeStampField
      FieldName = 'TERMINAESPECIAL'
      Origin = 'TERMINAESPECIAL'
    end
    object CDSInventarioULTIMOCAMBIO: TStringField
      FieldName = 'ULTIMOCAMBIO'
      Origin = 'ULTIMOCAMBIO'
      FixedChar = True
      Size = 30
    end
    object CDSInventarioULTIMAVENTA: TSQLTimeStampField
      FieldName = 'ULTIMAVENTA'
      Origin = 'ULTIMAVENTA'
    end
    object CDSInventarioCODIGOBARRA: TStringField
      FieldName = 'CODIGOBARRA'
      Origin = 'CODIGOBARRA'
      Required = True
      FixedChar = True
      Size = 14
    end
    object CDSInventarioFOODITEM: TSmallintField
      FieldName = 'FOODITEM'
      Origin = 'FOODITEM'
      Required = True
    end
    object CDSInventarioNONEBC: TSmallintField
      FieldName = 'NONEBC'
      Origin = 'NONEBC'
      Required = True
    end
    object CDSInventarioNUMEROSUPLIDOR: TIntegerField
      FieldName = 'NUMEROSUPLIDOR'
      Origin = 'NUMEROSUPLIDOR'
    end
    object CDSInventarioPRODUCTNO: TAutoIncField
      FieldName = 'PRODUCTNO'
      Origin = 'PRODUCTNO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSInventarioSUB_DEPARTAMENTO: TSmallintField
      FieldName = 'SUB_DEPARTAMENTO'
      Origin = 'SUB_DEPARTAMENTO'
    end
    object CDSInventarioDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DESCRIPCION'
      FixedChar = True
      Size = 35
    end
    object CDSInventarioROUTEOFADMINISTRATION: TStringField
      FieldName = 'ROUTEOFADMINISTRATION'
      Origin = 'ROUTEOFADMINISTRATION'
      FixedChar = True
      Size = 16
    end
    object CDSInventarioCONTROLADO: TStringField
      FieldName = 'CONTROLADO'
      Origin = 'CONTROLADO'
      FixedChar = True
      Size = 4
    end
    object CDSInventarioSTRENGTH: TStringField
      FieldName = 'STRENGTH'
      Origin = 'STRENGTH'
      FixedChar = True
      Size = 25
    end
    object CDSInventarioINFOADICIONAL: TStringField
      FieldName = 'INFOADICIONAL'
      Origin = 'INFOADICIONAL'
      FixedChar = True
      Size = 25
    end
    object CDSInventarioCAUTION1: TSmallintField
      FieldName = 'CAUTION1'
      Origin = 'CAUTION1'
    end
    object CDSInventarioCAUTION2: TSmallintField
      FieldName = 'CAUTION2'
      Origin = 'CAUTION2'
    end
    object CDSInventarioCAUTION3: TSmallintField
      FieldName = 'CAUTION3'
      Origin = 'CAUTION3'
    end
    object CDSInventarioGENERICNAME: TStringField
      FieldName = 'GENERICNAME'
      Origin = 'GENERICNAME'
      FixedChar = True
      Size = 60
    end
    object CDSInventarioBRAND: TStringField
      FieldName = 'BRAND'
      Origin = 'BRAND'
      FixedChar = True
      Size = 1
    end
    object CDSInventarioRECETARIO: TStringField
      FieldName = 'RECETARIO'
      Origin = 'RECETARIO'
      FixedChar = True
      Size = 1
    end
    object CDSInventarioDESCUENTO: TStringField
      FieldName = 'DESCUENTO'
      Origin = 'DESCUENTO'
      FixedChar = True
      Size = 1
    end
    object CDSInventarioIMAGE_CODE: TStringField
      FieldName = 'IMAGE_CODE'
      Origin = 'IMAGE_CODE'
      FixedChar = True
      Size = 9
    end
    object CDSInventarioPACKAGESIZE: TIntegerField
      FieldName = 'PACKAGESIZE'
      Origin = 'PACKAGESIZE'
    end
    object CDSInventarioSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object CDSInventarioPO: TStringField
      FieldName = 'PO'
      Origin = 'PO'
      Size = 10
    end
    object CDSInventarioisbn: TStringField
      FieldName = 'isbn'
      Origin = 'ISBN'
    end
    object CDSInventarioNDC: TWideStringField
      FieldName = 'NDC'
      Origin = 'NDC'
      FixedChar = True
      Size = 19
    end
    object CDSInventarioMETRIC_UNIT: TWideStringField
      FieldName = 'METRIC_UNIT'
      Origin = 'METRIC_UNIT'
      FixedChar = True
      Size = 3
    end
    object CDSInventarioROBOT: TIntegerField
      FieldName = 'ROBOT'
      Origin = 'ROBOT'
    end
    object CDSInventarioROBOT_NDC: TWideStringField
      FieldName = 'ROBOT_NDC'
      Origin = 'ROBOT_NDC'
      FixedChar = True
      Size = 11
    end
    object CDSInventarioALCHEMY_PRODUCTID: TIntegerField
      FieldName = 'ALCHEMY_PRODUCTID'
      Origin = 'ALCHEMY_PRODUCTID'
    end
    object CDSInventarioMARKET_STATUS: TWideStringField
      FieldName = 'MARKET_STATUS'
      Origin = 'MARKET_STATUS'
      FixedChar = True
      Size = 10
    end
    object CDSInventarioOUTERPACKAGEUNIT: TWideStringField
      FieldName = 'OUTERPACKAGEUNIT'
      Origin = 'OUTERPACKAGEUNIT'
      FixedChar = True
      Size = 10
    end
    object CDSInventarioPAKAGE_ID: TIntegerField
      FieldName = 'PAKAGE_ID'
      Origin = 'PAKAGE_ID'
    end
    object CDSInventarioCOBRAR_TAX: TIntegerField
      FieldName = 'COBRAR_TAX'
      Origin = 'COBRAR_TAX'
    end
    object CDSInventarioREVENUE_CODE: TWideStringField
      FieldName = 'REVENUE_CODE'
      Origin = 'REVENUE_CODE'
      FixedChar = True
      Size = 4
    end
    object CDSInventarioHCPCS: TWideStringField
      FieldName = 'HCPCS'
      Origin = 'HCPCS'
      FixedChar = True
      Size = 5
    end
    object CDSInventarioCASA_FARMACEUTICA: TStringField
      FieldName = 'CASA_FARMACEUTICA'
      Origin = 'CASA_FARMACEUTICA'
      FixedChar = True
      Size = 150
    end
    object CDSInventarioVERSION_DESCRIPTION: TWideStringField
      FieldName = 'VERSION_DESCRIPTION'
      Origin = 'VERSION_DESCRIPTION'
      FixedChar = True
      Size = 150
    end
    object CDSInventarioPAKAGE_DESCRIPTION: TWideStringField
      FieldName = 'PAKAGE_DESCRIPTION'
      Origin = 'PAKAGE_DESCRIPTION'
      FixedChar = True
      Size = 150
    end
    object CDSInventarioAllowControledRefills: TBooleanField
      FieldName = 'AllowControledRefills'
      Origin = 'AllowControledRefills'
    end
    object CDSInventarioMedicamentoStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'MedicamentoStr'
      Size = 50
      Calculated = True
    end
    object CDSInventarioInvInfo: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvInfo'
      Size = 100
      Calculated = True
    end
    object CDSInventarioQTYINVENTARIO: TFMTBCDField
      FieldName = 'QTYINVENTARIO'
      Origin = 'QTYINVENTARIO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSInventarioCOSTO: TFMTBCDField
      FieldName = 'COSTO'
      Origin = 'COSTO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSInventarioRBP: TFMTBCDField
      FieldName = 'RBP'
      Origin = 'RBP'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSInventarioESPECIAL: TFMTBCDField
      FieldName = 'ESPECIAL'
      Origin = 'ESPECIAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSInventarioMETRICSIZE: TFMTBCDField
      FieldName = 'METRICSIZE'
      Origin = 'METRICSIZE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSInventarioPRECIO: TFMTBCDField
      FieldName = 'PRECIO'
      Origin = 'PRECIO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSInventarioCMAXINVENTARIO: TFMTBCDField
      FieldName = 'CMAXINVENTARIO'
      Origin = 'CMAXINVENTARIO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSInventarioCMININVENTARIO: TFMTBCDField
      FieldName = 'CMININVENTARIO'
      Origin = 'CMININVENTARIO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
  end
  object DSInventario: TDataSource
    AutoEdit = False
    DataSet = CDSInventario
    Left = 224
    Top = 368
  end
  object DSPInventario: TDataSetProvider
    DataSet = qInventario
    Options = [poFetchBlobsOnDemand, poFetchDetailsOnDemand, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 144
    Top = 369
  end
  object qInventario: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      
        'Select * from InventarioPiso where ndc = '#39'16729021816'#39' ORDER BY ' +
        'PRODUCTNO')
    Left = 72
    Top = 368
  end
  object qCompounds: TFDQuery
    CachedUpdates = True
    Connection = FDConnectionRx
    SQL.Strings = (
      'Select * from Mezclas where NumeroReceta = 1')
    Left = 488
    Top = 240
  end
  object dspCompounds: TDataSetProvider
    DataSet = qCompounds
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 544
    Top = 240
  end
  object dsCompounds: TDataSource
    DataSet = cdsCompounds
    Left = 600
    Top = 240
  end
  object cdsCompounds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCompounds'
    Left = 712
    Top = 240
    object cdsCompoundsMEDICAMENTO: TStringField
      FieldName = 'MEDICAMENTO'
      Origin = 'MEDICAMENTO'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsCompoundsMETRICQUANTITY: TIntegerField
      FieldName = 'METRICQUANTITY'
      Origin = 'METRICQUANTITY'
      Required = True
    end
    object cdsCompoundsPRECIOVENTA: TSingleField
      FieldName = 'PRECIOVENTA'
      Origin = 'PRECIOVENTA'
      Required = True
    end
    object cdsCompoundsAWP: TSingleField
      FieldName = 'AWP'
      Origin = 'AWP'
      Required = True
    end
    object cdsCompoundsCOSTO: TSingleField
      FieldName = 'COSTO'
      Origin = 'COSTO'
      Required = True
    end
    object cdsCompoundsPRODUCT_ID_QUALIFIER: TStringField
      FieldName = 'PRODUCT_ID_QUALIFIER'
      Origin = 'PRODUCT_ID_QUALIFIER'
      FixedChar = True
      Size = 2
    end
    object cdsCompoundsING_BASIS_OFCOST_DET: TStringField
      FieldName = 'ING_BASIS_OFCOST_DET'
      Origin = 'ING_BASIS_OFCOST_DET'
      FixedChar = True
      Size = 2
    end
    object cdsCompoundsNDC: TStringField
      FieldName = 'NDC'
      Origin = 'NDC'
      FixedChar = True
      Size = 19
    end
    object cdsCompoundsMEZCLASNO: TAutoIncField
      FieldName = 'MEZCLASNO'
      Origin = 'MEZCLASNO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsCompoundsPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Origin = 'PRODUCT_ID'
    end
    object cdsCompoundsNO_TRANS: TIntegerField
      FieldName = 'NO_TRANS'
      Origin = 'NO_TRANS'
    end
    object cdsCompoundsNUMERORECETA: TLargeintField
      FieldName = 'NUMERORECETA'
      Origin = 'NUMERORECETA'
    end
    object cdsCompoundsFECHA_MEZCLA: TSQLTimeStampField
      FieldName = 'FECHA_MEZCLA'
      Origin = 'FECHA_MEZCLA'
    end
    object cdsCompoundsCANTIDADRECETADA: TFMTBCDField
      FieldName = 'CANTIDADRECETADA'
      Origin = 'CANTIDADRECETADA'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsCompoundsCANTIDADDESPACHADA: TFMTBCDField
      FieldName = 'CANTIDADDESPACHADA'
      Origin = 'CANTIDADDESPACHADA'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsCompoundsLOTE: TWideStringField
      FieldName = 'LOTE'
      FixedChar = True
      Size = 12
    end
    object cdsCompoundsFECHA_EXPIRACION: TDateField
      FieldName = 'FECHA_EXPIRACION'
    end
  end
  object qWarningLabels: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'Select * from Warning_Label')
    Left = 488
    Top = 320
  end
  object dspWarningLabels: TDataSetProvider
    DataSet = qWarningLabels
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 544
    Top = 320
  end
  object dsWarningLabels: TDataSource
    DataSet = cdsWarningLabels
    Left = 616
    Top = 320
  end
  object cdsWarningLabels: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWarningLabels'
    Left = 712
    Top = 320
    object cdsWarningLabelsWarningLabelID: TIntegerField
      FieldName = 'WarningLabelID'
    end
    object cdsWarningLabelsLanguageCode: TStringField
      FieldName = 'LanguageCode'
      Size = 2
    end
    object cdsWarningLabelsWarningLabelGroupID: TIntegerField
      FieldName = 'WarningLabelGroupID'
    end
    object cdsWarningLabelsWarning: TStringField
      FieldName = 'Warning'
      Size = 1000
    end
  end
  object FDQuery1: TFDQuery
    Connection = FDConnectionRx
    Left = 480
    Top = 112
  end
  object qPrintQueries: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'SELECT TOP 1 * FROM dbo.PRINT_QUERIES ORDER BY ID DESC')
    Left = 72
    Top = 184
  end
  object dspPrintQueries: TDataSetProvider
    DataSet = qPrintQueries
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 184
  end
  object cdsPrintQueries: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrintQueries'
    Left = 344
    Top = 184
    object cdsPrintQueriesRX_ID: TLargeintField
      FieldName = 'RX_ID'
    end
    object cdsPrintQueriesCOPIES: TIntegerField
      FieldName = 'COPIES'
    end
    object cdsPrintQueriesID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsPrintQueriesRX_OTC: TWideStringField
      FieldName = 'RX_OTC'
      FixedChar = True
      Size = 3
    end
    object cdsPrintQueriesLABEL_NAME: TWideStringField
      FieldName = 'LABEL_NAME'
      FixedChar = True
      Size = 50
    end
    object cdsPrintQueriesTYPIST: TWideStringField
      FieldName = 'TYPIST'
      FixedChar = True
      Size = 4
    end
    object cdsPrintQueriesPRINTTOSCREEN: TBooleanField
      FieldName = 'PRINTTOSCREEN'
    end
    object cdsPrintQueriesPATIENT: TWideStringField
      FieldName = 'PATIENT'
      FixedChar = True
      Size = 45
    end
    object cdsPrintQueriesINDICATIONS: TWideStringField
      FieldName = 'INDICATIONS'
      FixedChar = True
      Size = 296
    end
    object cdsPrintQueriesPRINTER_ID: TWideStringField
      FieldName = 'PRINTER_ID'
      FixedChar = True
      Size = 1
    end
    object cdsPrintQueriesWF_PRINTED: TWideStringField
      FieldName = 'WF_PRINTED'
      FixedChar = True
      Size = 30
    end
    object cdsPrintQueriesPRINT_ID: TWideStringField
      FieldName = 'PRINT_ID'
      FixedChar = True
      Size = 1
    end
    object cdsPrintQueriesPRINTED: TBooleanField
      FieldName = 'PRINTED'
    end
    object cdsPrintQueriesTRANSACTION_NUMBER: TIntegerField
      FieldName = 'TRANSACTION_NUMBER'
    end
    object cdsPrintQueriesTRANS_TYPE: TWideStringField
      FieldName = 'TRANS_TYPE'
      FixedChar = True
      Size = 4
    end
    object cdsPrintQueriesFINAL_RECEIPT: TBooleanField
      FieldName = 'FINAL_RECEIPT'
    end
    object cdsPrintQueriesPRINT_TYPE: TIntegerField
      FieldName = 'PRINT_TYPE'
    end
    object cdsPrintQueriesEMAIL: TWideStringField
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 80
    end
    object cdsPrintQueriesMOBILE_PHONE: TWideStringField
      FieldName = 'MOBILE_PHONE'
      FixedChar = True
      Size = 10
    end
    object cdsPrintQueriesCUSTOMER_NUMBER: TIntegerField
      FieldName = 'CUSTOMER_NUMBER'
    end
    object cdsPrintQueriesDELIVERY: TBooleanField
      FieldName = 'DELIVERY'
    end
    object cdsPrintQueriesQUOTE: TBooleanField
      FieldName = 'QUOTE'
    end
    object cdsPrintQueriesPRINT_PATIENT_EDUCATION: TBooleanField
      FieldName = 'PRINT_PATIENT_EDUCATION'
    end
    object cdsPrintQueriesPRINTER_IP: TWideStringField
      FieldName = 'PRINTER_IP'
      FixedChar = True
      Size = 15
    end
  end
  object dsPrintQueries: TDataSource
    DataSet = cdsPrintQueries
    Left = 248
    Top = 184
  end
  object DSPOTC: TDataSetProvider
    DataSet = SQLDSOTC_FD
    Options = [poPropogateChanges, poAllowCommandText]
    Left = 544
    Top = 177
  end
  object DSOTC: TDataSource
    DataSet = CDSOTC
    Left = 608
    Top = 177
  end
  object CDSOTC: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    PacketRecords = 10
    Params = <>
    ProviderName = 'DSPOTC'
    AfterScroll = CDSOTCAfterScroll
    OnCalcFields = CDSOTCCalcFields
    Left = 712
    Top = 177
    object CDSOTCOTCNUMBER: TIntegerField
      FieldName = 'OTCNUMBER'
      Origin = 'OTCNUMBER'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CDSOTCNDC: TStringField
      FieldName = 'NDC'
      Origin = 'NDC'
      FixedChar = True
      Size = 11
    end
    object CDSOTCMEDICAMENTO: TStringField
      FieldName = 'MEDICAMENTO'
      Origin = 'MEDICAMENTO'
      FixedChar = True
      Size = 30
    end
    object CDSOTCATENDIDOPOR: TStringField
      FieldName = 'ATENDIDOPOR'
      LookupDataSet = ALTER_DELETE_PRINT_QUERIES
      Origin = 'ATENDIDOPOR'
      FixedChar = True
      Size = 3
    end
    object CDSOTCCOBRADO: TStringField
      FieldName = 'COBRADO'
      Origin = 'COBRADO'
      FixedChar = True
      Size = 1
    end
    object CDSOTCFECHAOTC: TSQLTimeStampField
      FieldName = 'FECHAOTC'
      Origin = 'FECHAOTC'
    end
    object CDSOTCRX: TStringField
      FieldName = 'RX'
      Origin = 'RX'
      FixedChar = True
      Size = 1
    end
    object CDSOTCNUMEROCLIENTE: TIntegerField
      FieldName = 'NUMEROCLIENTE'
      Origin = 'NUMEROCLIENTE'
    end
    object CDSOTCMEDICAMENTOMIX: TStringField
      FieldName = 'MEDICAMENTOMIX'
      Origin = 'MEDICAMENTOMIX'
      FixedChar = True
      Size = 120
    end
    object CDSOTCOTC_BARCODE: TStringField
      FieldKind = fkCalculated
      FieldName = 'OTC_BARCODE'
      Size = 12
      Calculated = True
    end
    object CDSOTCNUMEROTRANSACCION: TIntegerField
      FieldName = 'NUMEROTRANSACCION'
      Origin = 'NUMEROTRANSACCION'
    end
    object CDSOTCNUMERO_AUTORIZACION: TStringField
      FieldName = 'NUMERO_AUTORIZACION'
      Origin = 'NUMERO_AUTORIZACION'
      FixedChar = True
    end
    object CDSOTCPARTIAL_COMPLETION: TStringField
      FieldName = 'PARTIAL_COMPLETION'
      Origin = 'PARTIAL_COMPLETION'
      FixedChar = True
      Size = 1
    end
    object CDSOTCRX_STATUS: TStringField
      FieldName = 'RX_STATUS'
      Origin = 'RX_STATUS'
      FixedChar = True
      Size = 1
    end
    object CDSOTCNO_REF_DISPENSADO: TIntegerField
      FieldName = 'NO_REF_DISPENSADO'
      Origin = 'NO_REF_DISPENSADO'
    end
    object CDSOTCPHARMACIST: TStringField
      FieldName = 'PHARMACIST'
      Origin = 'PHARMACIST'
      FixedChar = True
      Size = 3
    end
    object CDSOTCDAYS_SUPPLY: TIntegerField
      FieldName = 'DAYS_SUPPLY'
      Origin = 'DAYS_SUPPLY'
    end
    object CDSOTCPAGADA: TStringField
      FieldName = 'PAGADA'
      Origin = 'PAGADA'
      FixedChar = True
      Size = 1
    end
    object CDSOTCPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Origin = 'PRODUCT_ID'
    end
    object CDSOTCPLAN_MEDICO: TStringField
      FieldName = 'PLAN_MEDICO'
      Origin = 'PLAN_MEDICO'
      FixedChar = True
      Size = 3
    end
    object CDSOTCSTATUS_CODE: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATUS_CODE'
      Size = 7
      Calculated = True
    end
    object CDSOTCTIME_RX: TSQLTimeStampField
      FieldName = 'TIME_RX'
      Origin = 'TIME_RX'
    end
    object CDSOTCNO_HORA: TIntegerField
      FieldName = 'NO_HORA'
      Origin = 'NO_HORA'
    end
    object CDSOTCNUMEROPLAN: TIntegerField
      FieldName = 'NUMEROPLAN'
      Origin = 'NUMEROPLAN'
    end
    object CDSOTCLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      FixedChar = True
      Size = 12
    end
    object CDSOTCMETRICDECIMALQUANTITY: TIntegerField
      FieldName = 'METRICDECIMALQUANTITY'
      Origin = 'METRICDECIMALQUANTITY'
    end
    object CDSOTCSIGNATURE_LINK: TIntegerField
      FieldName = 'SIGNATURE_LINK'
      Origin = 'SIGNATURE_LINK'
    end
    object CDSOTCREC_RELACION: TStringField
      FieldKind = fkCalculated
      FieldName = 'REC_RELACION'
      Calculated = True
    end
    object CDSOTCCHECKED: TIntegerField
      FieldName = 'CHECKED'
      Origin = 'CHECKED'
    end
    object CDSOTCUSUARIO_NO: TIntegerField
      FieldName = 'USUARIO_NO'
      Origin = 'USUARIO_NO'
    end
    object CDSOTCNUMERORECETA: TLargeintField
      FieldName = 'NUMERORECETA'
      Origin = 'NUMERORECETA'
    end
    object CDSOTCMEZCLA_TRAN_NO: TIntegerField
      FieldName = 'MEZCLA_TRAN_NO'
      Origin = 'MEZCLA_TRAN_NO'
    end
    object CDSOTCBATCH_NUMBER: TIntegerField
      FieldName = 'BATCH_NUMBER'
      Origin = 'BATCH_NUMBER'
    end
    object CDSOTCPRICE_TABLE_ID: TIntegerField
      FieldName = 'PRICE_TABLE_ID'
      Origin = 'PRICE_TABLE_ID'
    end
    object CDSOTCWF_BILLED: TWideStringField
      FieldName = 'WF_BILLED'
      Origin = 'WF_BILLED'
      FixedChar = True
      Size = 30
    end
    object CDSOTCWF_PRINTED: TWideStringField
      FieldName = 'WF_PRINTED'
      Origin = 'WF_PRINTED'
      FixedChar = True
      Size = 30
    end
    object CDSOTCWF_FILLED: TWideStringField
      FieldName = 'WF_FILLED'
      Origin = 'WF_FILLED'
      FixedChar = True
      Size = 30
    end
    object CDSOTCWF_CHECKED: TWideStringField
      FieldName = 'WF_CHECKED'
      Origin = 'WF_CHECKED'
      FixedChar = True
      Size = 30
    end
    object CDSOTCWF_DELIVERED: TWideStringField
      FieldName = 'WF_DELIVERED'
      Origin = 'WF_DELIVERED'
      FixedChar = True
      Size = 30
    end
    object CDSOTCWF_TYPED: TWideStringField
      FieldName = 'WF_TYPED'
      Origin = 'WF_TYPED'
      FixedChar = True
      Size = 30
    end
    object CDSOTCMED_CHART: TBooleanField
      FieldName = 'MED_CHART'
      Origin = 'MED_CHART'
    end
    object CDSOTCCLAIM_STATUS: TIntegerField
      FieldName = 'CLAIM_STATUS'
      Origin = 'CLAIM_STATUS'
    end
    object CDSOTCCLAIM_STATUS_DEFINE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CLAIM_STATUS_DEFINE'
      Size = 10
      Calculated = True
    end
    object CDSOTCADHERENCE: TBooleanField
      FieldName = 'ADHERENCE'
      Origin = 'ADHERENCE'
    end
    object CDSOTCOTC_BARCODE_DEF: TStringField
      FieldKind = fkCalculated
      FieldName = 'OTC_BARCODE_DEF'
      Size = 15
      Calculated = True
    end
    object CDSOTCBILL_LATTER: TBooleanField
      FieldName = 'BILL_LATTER'
      Origin = 'BILL_LATTER'
    end
    object CDSOTCQTY: TFMTBCDField
      FieldName = 'QTY'
      Origin = 'QTY'
      Precision = 18
      Size = 2
    end
    object CDSOTCTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object CDSOTCCOSTOVENTA: TFMTBCDField
      FieldName = 'COSTOVENTA'
      Origin = 'COSTOVENTA'
      Precision = 18
      Size = 2
    end
    object CDSOTCPAGO_PLAN: TFMTBCDField
      FieldName = 'PAGO_PLAN'
      Origin = 'PAGO_PLAN'
      Precision = 18
      Size = 2
    end
    object CDSOTCDEDUCIBLE: TFMTBCDField
      FieldName = 'DEDUCIBLE'
      Origin = 'DEDUCIBLE'
      Precision = 18
      Size = 2
    end
    object CDSOTCINCENTIVE_FEE_PAID: TFMTBCDField
      FieldName = 'INCENTIVE_FEE_PAID'
      Origin = 'INCENTIVE_FEE_PAID'
      Precision = 18
      Size = 2
    end
    object CDSOTCDISPENSING_FEE_PAID: TFMTBCDField
      FieldName = 'DISPENSING_FEE_PAID'
      Origin = 'DISPENSING_FEE_PAID'
      Precision = 18
      Size = 2
    end
    object CDSOTCOTHER_AMOUNT_PAID: TFMTBCDField
      FieldName = 'OTHER_AMOUNT_PAID'
      Origin = 'OTHER_AMOUNT_PAID'
      Precision = 18
      Size = 2
    end
    object CDSOTCAMOUNT_COPAY_COINS: TFMTBCDField
      FieldName = 'AMOUNT_COPAY_COINS'
      Origin = 'AMOUNT_COPAY_COINS'
      Precision = 18
      Size = 2
    end
    object CDSOTCGANANCIA: TFMTBCDField
      FieldName = 'GANANCIA'
      Origin = 'GANANCIA'
      Precision = 18
      Size = 2
    end
    object CDSOTCPRECIOFACTURACION: TFMTBCDField
      FieldName = 'PRECIOFACTURACION'
      Origin = 'PRECIOFACTURACION'
      Precision = 18
      Size = 2
    end
    object CDSOTCINGREDIENT_COST_PAID: TFMTBCDField
      FieldName = 'INGREDIENT_COST_PAID'
      Origin = 'INGREDIENT_COST_PAID'
      Precision = 18
      Size = 2
    end
    object CDSOTCPatEducation: TStringField
      FieldKind = fkCalculated
      FieldName = 'PatEducation'
      Size = 5000
      Calculated = True
    end
    object CDSOTCCaution1: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caution1'
      Size = 1000
      Calculated = True
    end
    object CDSOTCCaution2: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caution2'
      Size = 1000
      Calculated = True
    end
    object CDSOTCCaution3: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caution3'
      Size = 1000
      Calculated = True
    end
    object CDSOTCCaution4: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caution4'
      Size = 1000
      Calculated = True
    end
    object CDSOTCCaution5: TStringField
      FieldKind = fkCalculated
      FieldName = 'Caution5'
      Size = 1000
      Calculated = True
    end
  end
  object SQLDSOTC_FD: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'Select * from OTC where NumeroReceta =  148701')
    Left = 480
    Top = 176
  end
  object CREATE_DELETE_PRINT_QUERIES: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[DELETE_PRINT_QUERIES] @ID INTEGER'
      'AS'
      'BEGIN'
      '  DELETE FROM PRINT_QUERIES WHERE ID = @ID'
      'END')
    Left = 560
    Top = 24
  end
  object QBorrarNonMatchedNDC: TFDQuery
    Connection = FDConnectionRx
    Left = 576
    Top = 104
  end
  object DELETE_PRINT_QUERIES: TFDStoredProc
    Connection = FDConnectionRx
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.AutoCommitUpdates = True
    StoredProcName = 'DELETE_PRINT_QUERIES'
    Left = 712
    Top = 56
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
      end
      item
        Position = 2
        Name = '@ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object ALTER_DELETE_PRINT_QUERIES: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'ALTER PROCEDURE [dbo].[DELETE_PRINT_QUERIES] @ID INTEGER'
      'AS'
      'set NOCOUNT ON'
      'BEGIN'
      '  --DELETE FROM PRINT_QUERIES WHERE ID = @ID'
      '    UPDATE PRINT_QUERIES SET PRINTED = 1  WHERE ID = @ID'
      'END')
    Left = 392
    Top = 88
  end
  object FDTransactionRx: TFDTransaction
    Connection = FDConnectionRx
    Left = 264
    Top = 112
  end
  object qMaxPrintQ_ID: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'Select max(id) as ID from Print_queries')
    Left = 488
    Top = 448
  end
  object dspMaxPrintQ_ID: TDataSetProvider
    DataSet = qMaxPrintQ_ID
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 552
    Top = 448
  end
  object dsMaxPrintQ_ID: TDataSource
    DataSet = cdsMaxPrintQ_ID
    Left = 632
    Top = 448
  end
  object cdsMaxPrintQ_ID: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaxPrintQ_ID'
    Left = 720
    Top = 448
    object cdsMaxPrintQ_IDID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
  end
  object DSPMedOriginal: TDataSetProvider
    DataSet = SQLDSMedOriginal_FD
    Options = [poPropogateChanges, poAllowCommandText]
    Left = 907
    Top = 121
  end
  object DataSource2: TDataSource
    DataSet = CDSMedOriginal
    Left = 963
    Top = 121
  end
  object CDSMedOriginal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPMedOriginal'
    OnCalcFields = CDSMedOriginalCalcFields
    Left = 1056
    Top = 129
    object CDSMedOriginalMedicamentoStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'MedicamentoStr'
      Size = 50
      Calculated = True
    end
    object CDSMedOriginalDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Origin = 'Descripcion'
      FixedChar = True
      Size = 35
    end
    object CDSMedOriginalSTRENGTH: TStringField
      FieldName = 'STRENGTH'
      Origin = 'Strength'
      FixedChar = True
      Size = 25
    end
    object CDSMedOriginalTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'Tipo'
      FixedChar = True
      Size = 3
    end
    object CDSMedOriginalPRODUCTNO: TIntegerField
      FieldName = 'PRODUCTNO'
      Origin = 'PRODUCTNO'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object CDSMedOriginalALCHEMY_PRODUCTID: TIntegerField
      FieldName = 'ALCHEMY_PRODUCTID'
      Origin = 'ALCHEMY_PRODUCTID'
    end
    object CDSMedOriginalBrand: TStringField
      FieldName = 'Brand'
      Origin = 'Brand'
      FixedChar = True
      Size = 1
    end
  end
  object SQLDSMedOriginal_FD: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      
        'Select Descripcion, Strength, Tipo, PRODUCTNO, ALCHEMY_PRODUCTID' +
        ', Brand from InventarioPiso')
    Left = 816
    Top = 120
  end
  object QPatPlan2: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'select * from patplan')
    Left = 816
    Top = 200
  end
  object dspPatPlan2: TDataSetProvider
    DataSet = QPatPlan2
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 888
    Top = 200
  end
  object dsPatPlan2: TDataSource
    Left = 968
    Top = 200
  end
  object cdsPatPlan2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPatPlan2'
    Left = 1064
    Top = 216
    object cdsPatPlan2NUMEROCLIENTE: TIntegerField
      FieldName = 'NUMEROCLIENTE'
      Origin = 'NUMEROCLIENTE'
      Required = True
    end
    object cdsPatPlan2NUMEROPLAN: TAutoIncField
      FieldName = 'NUMEROPLAN'
      Origin = 'NUMEROPLAN'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsPatPlan2PLANMEDICO: TStringField
      FieldName = 'PLANMEDICO'
      Origin = 'PLANMEDICO'
      FixedChar = True
      Size = 3
    end
    object cdsPatPlan2RELACION: TSmallintField
      FieldName = 'RELACION'
      Origin = 'RELACION'
    end
    object cdsPatPlan2PERSONCODE: TStringField
      FieldName = 'PERSONCODE'
      Origin = 'PERSONCODE'
      FixedChar = True
      Size = 3
    end
    object cdsPatPlan2INACTIVE_DATE: TSQLTimeStampField
      FieldName = 'INACTIVE_DATE'
      Origin = 'INACTIVE_DATE'
    end
    object cdsPatPlan2CARDHOLDERID: TStringField
      FieldName = 'CARDHOLDERID'
      Origin = 'CARDHOLDERID'
      FixedChar = True
    end
    object cdsPatPlan2NOGRUPO: TStringField
      FieldName = 'NOGRUPO'
      Origin = 'NOGRUPO'
      FixedChar = True
      Size = 15
    end
    object cdsPatPlan2HOME_PLAN: TStringField
      FieldName = 'HOME_PLAN'
      Origin = 'HOME_PLAN'
      FixedChar = True
      Size = 3
    end
    object cdsPatPlan2PLAN_ID: TStringField
      FieldName = 'PLAN_ID'
      Origin = 'PLAN_ID'
      FixedChar = True
      Size = 8
    end
    object cdsPatPlan2ELIGIBILITY_CLARIF_CODE: TStringField
      FieldName = 'ELIGIBILITY_CLARIF_CODE'
      Origin = 'ELIGIBILITY_CLARIF_CODE'
      FixedChar = True
      Size = 1
    end
    object cdsPatPlan2FACILITY_ID: TStringField
      FieldName = 'FACILITY_ID'
      Origin = 'FACILITY_ID'
      FixedChar = True
      Size = 10
    end
    object cdsPatPlan2CH_FIRSTNAME: TStringField
      FieldName = 'CH_FIRSTNAME'
      Origin = 'CH_FIRSTNAME'
      FixedChar = True
      Size = 12
    end
    object cdsPatPlan2CH_LASTNAME: TStringField
      FieldName = 'CH_LASTNAME'
      Origin = 'CH_LASTNAME'
      FixedChar = True
      Size = 15
    end
    object cdsPatPlan2MEDIGAP_ID: TStringField
      FieldName = 'MEDIGAP_ID'
      Origin = 'MEDIGAP_ID'
      FixedChar = True
    end
    object cdsPatPlan2MEDICAID_INDICATOR: TStringField
      FieldName = 'MEDICAID_INDICATOR'
      Origin = 'MEDICAID_INDICATOR'
      FixedChar = True
      Size = 2
    end
    object cdsPatPlan2PAAI: TStringField
      FieldName = 'PAAI'
      Origin = 'PAAI'
      FixedChar = True
      Size = 2
    end
    object cdsPatPlan2PP997_G2: TStringField
      FieldName = 'PP997_G2'
      Origin = 'PP997_G2'
      FixedChar = True
      Size = 1
    end
    object cdsPatPlan2MEDICAID_ID_NUMBER: TStringField
      FieldName = 'MEDICAID_ID_NUMBER'
      Origin = 'MEDICAID_ID_NUMBER'
      FixedChar = True
    end
    object cdsPatPlan2MEDICAID_AGENCY_NUMBER: TStringField
      FieldName = 'MEDICAID_AGENCY_NUMBER'
      Origin = 'MEDICAID_AGENCY_NUMBER'
      FixedChar = True
      Size = 15
    end
    object cdsPatPlan2ACTIVO: TBooleanField
      FieldName = 'ACTIVO'
      Origin = 'ACTIVO'
      Required = True
    end
    object cdsPatPlan2PLAN_PRIMARIO: TBooleanField
      FieldName = 'PLAN_PRIMARIO'
      Origin = 'PLAN_PRIMARIO'
    end
    object cdsPatPlan2CARD_IMAGE: TIntegerField
      FieldName = 'CARD_IMAGE'
      Origin = 'CARD_IMAGE'
    end
  end
  object DSPPlanesMedicos: TDataSetProvider
    DataSet = SQLDSPlanesMedicos_FD
    Options = [poPropogateChanges, poAllowCommandText]
    Left = 170
    Top = 441
  end
  object DSPlanesMedicos: TDataSource
    DataSet = CDSPlanesMedicos
    Left = 234
    Top = 441
  end
  object CDSPlanesMedicos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPlanesMedicos'
    Left = 328
    Top = 441
    object CDSPlanesMedicosABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Origin = 'ABREVIATURA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object CDSPlanesMedicosBINNUMBER: TStringField
      FieldName = 'BINNUMBER'
      Origin = 'BINNUMBER'
      Required = True
      Size = 6
    end
    object CDSPlanesMedicosTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Origin = 'TELEFONO'
      Required = True
      Size = 14
    end
    object CDSPlanesMedicosVERSIONCOL: TStringField
      FieldName = 'VERSIONCOL'
      Origin = 'VERSIONCOL'
      Required = True
      Size = 2
    end
    object CDSPlanesMedicosTONOPULSO: TStringField
      FieldName = 'TONOPULSO'
      Origin = 'TONOPULSO'
      Required = True
      Size = 1
    end
    object CDSPlanesMedicosVELOCIDAD: TIntegerField
      FieldName = 'VELOCIDAD'
      Origin = 'VELOCIDAD'
      Required = True
    end
    object CDSPlanesMedicosBITSDATA: TIntegerField
      FieldName = 'BITSDATA'
      Origin = 'BITSDATA'
      Required = True
    end
    object CDSPlanesMedicosPARIDAD: TStringField
      FieldName = 'PARIDAD'
      Origin = 'PARIDAD'
      Required = True
      Size = 1
    end
    object CDSPlanesMedicosPROCESSORCONTROL: TStringField
      FieldName = 'PROCESSORCONTROL'
      Origin = 'PROCESSORCONTROL'
      Size = 10
    end
    object CDSPlanesMedicosTELEFONO_SERVICIO1: TStringField
      FieldName = 'TELEFONO_SERVICIO1'
      Origin = 'TELEFONO_SERVICIO1'
      FixedChar = True
      Size = 13
    end
    object CDSPlanesMedicosSOFTWARE_VENDOR_ID: TStringField
      FieldName = 'SOFTWARE_VENDOR_ID'
      Origin = 'SOFTWARE_VENDOR_ID'
      FixedChar = True
      Size = 10
    end
    object CDSPlanesMedicosDISPENSING_FEE: TSingleField
      FieldName = 'DISPENSING_FEE'
      Origin = 'DISPENSING_FEE'
    end
    object CDSPlanesMedicosTELEFONO_SERVICIO2: TStringField
      FieldName = 'TELEFONO_SERVICIO2'
      Origin = 'TELEFONO_SERVICIO2'
      FixedChar = True
      Size = 13
    end
    object CDSPlanesMedicosPRECIO_CASH_AWP: TStringField
      FieldName = 'PRECIO_CASH_AWP'
      Origin = 'PRECIO_CASH_AWP'
      FixedChar = True
      Size = 4
    end
    object CDSPlanesMedicosNUMEROFARMACIA: TStringField
      FieldName = 'NUMEROFARMACIA'
      Origin = 'NUMEROFARMACIA'
      Required = True
      Size = 15
    end
    object CDSPlanesMedicosSERVICE_PROVIDER_ID_QUAL: TStringField
      FieldName = 'SERVICE_PROVIDER_ID_QUAL'
      Origin = 'SERVICE_PROVIDER_ID_QUAL'
      FixedChar = True
      Size = 2
    end
    object CDSPlanesMedicosPROVIDERIDQUALIFIER: TStringField
      FieldName = 'PROVIDERIDQUALIFIER'
      Origin = 'PROVIDERIDQUALIFIER'
      FixedChar = True
      Size = 2
    end
    object CDSPlanesMedicosPLANESMEDICOSNO: TIntegerField
      FieldName = 'PLANESMEDICOSNO'
      Origin = 'PLANESMEDICOSNO'
      ProviderFlags = [pfInWhere]
    end
    object CDSPlanesMedicosSTOPBITS: TSmallintField
      FieldName = 'STOPBITS'
      Origin = 'STOPBITS'
    end
    object CDSPlanesMedicosCONSIDER_NON_MATCHENDC: TStringField
      FieldName = 'CONSIDER_NON_MATCHENDC'
      Origin = 'CONSIDER_NON_MATCHENDC'
      FixedChar = True
      Size = 1
    end
    object CDSPlanesMedicosENVIAR_CAMPO_ET: TIntegerField
      FieldName = 'ENVIAR_CAMPO_ET'
      Origin = 'ENVIAR_CAMPO_ET'
    end
    object CDSPlanesMedicosGROUP_BY: TIntegerField
      FieldName = 'GROUP_BY'
      Origin = 'GROUP_BY'
    end
    object CDSPlanesMedicosPRICE_TABLE_ID: TIntegerField
      FieldName = 'PRICE_TABLE_ID'
      Origin = 'PRICE_TABLE_ID'
    end
    object CDSPlanesMedicosOVERRIDE_SYSTEM_DEFAULT_PRICE: TBooleanField
      FieldName = 'OVERRIDE_SYSTEM_DEFAULT_PRICE'
      Origin = 'OVERRIDE_SYSTEM_DEFAULT_PRICE'
    end
    object CDSPlanesMedicosNOMBRE: TWideStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 50
    end
    object CDSPlanesMedicosOTHER_COVERAGE_CODE_DEFAULT: TStringField
      FieldName = 'OTHER_COVERAGE_CODE_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object CDSPlanesMedicosSCC_420_DK: TStringField
      FieldName = 'SCC_420_DK'
      FixedChar = True
      Size = 2
    end
    object CDSPlanesMedicosF340B: TBooleanField
      FieldName = 'F340B'
    end
    object CDSPlanesMedicosLTC: TBooleanField
      FieldName = 'LTC'
    end
    object CDSPlanesMedicosLTC_SERVICE_PROVIDER_ID: TWideStringField
      FieldName = 'LTC_SERVICE_PROVIDER_ID'
      FixedChar = True
      Size = 15
    end
    object CDSPlanesMedicosLTC_SERVICE_PROVIDER_QUAL: TStringField
      FieldName = 'LTC_SERVICE_PROVIDER_QUAL'
      FixedChar = True
      Size = 2
    end
    object CDSPlanesMedicosMULTIPLE_RX_CLAIMS: TBooleanField
      FieldName = 'MULTIPLE_RX_CLAIMS'
    end
    object CDSPlanesMedicosPAPER_CLAIM: TBooleanField
      FieldName = 'PAPER_CLAIM'
    end
  end
  object SQLDSPlanesMedicos_FD: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'Select * from PlanesMedicos ORDER BY ABREVIATURA')
    Left = 80
    Top = 440
  end
  object QCountTTransOTCQ: TFDQuery
    Connection = FDConnectionRx
    Transaction = FDTransactionRx
    SQL.Strings = (
      
        'Select count(*) as TTransRefill from OTC where NumeroReceta = :N' +
        'oReceta and CLAIM_STATUS = 1 and RX_STATUS = '#39'R'#39' AND PLAN_MEDICO' +
        ' <> '#39'CAS'#39' ')
    Left = 832
    Top = 296
    ParamData = <
      item
        Position = 1
        Name = 'NoReceta'
        ParamType = ptInput
      end>
  end
  object dsQCountTTransOTCQ: TDataSource
    DataSet = QCountTTransOTC
    Left = 976
    Top = 288
  end
  object QCountTTransOTC: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select count(*) as TTransRefill from OTC where NumeroReceta = :N' +
      'oReceta and CLAIM_STATUS = 1 and RX_STATUS = '#39'R'#39' AND PLAN_MEDICO' +
      ' <> '#39'CAS'#39' '
    Params = <
      item
        DataType = ftUnknown
        Name = 'NoReceta'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspQCountTTransOTCQ'
    Left = 1072
    Top = 296
    object QCountTTransOTCTTransRefill: TIntegerField
      FieldName = 'TTransRefill'
      Origin = 'TTransRefill'
      ReadOnly = True
    end
  end
  object dspQCountTTransOTCQ: TDataSetProvider
    DataSet = QCountTTransOTCQ
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 904
    Top = 288
  end
  object sqlTransHeader: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      
        'Select * from TransactionHeader_Temp  where TransactionNumber = ' +
        '3408659')
    Left = 80
    Top = 520
  end
  object sqlTransDetail: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      
        'SELECT * FROM TransactionDetail  WHERE TransactionNumber = 100  ' +
        'Order By IDNumber')
    Left = 80
    Top = 592
  end
  object dspTransHead: TDataSetProvider
    DataSet = sqlTransHeader
    Options = [poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 520
  end
  object dspTransDetail: TDataSetProvider
    DataSet = sqlTransDetail
    Options = [poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 592
  end
  object CDSTransHead: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransHead'
    AfterScroll = CDSTransHeadAfterScroll
    OnCalcFields = CDSTransHeadCalcFields
    Left = 328
    Top = 520
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
    object CDSTransHeadPAYAMOUNT1: TFMTBCDField
      FieldName = 'PAYAMOUNT1'
      Origin = 'PAYAMOUNT1'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadPAYAMOUNT2: TFMTBCDField
      FieldName = 'PAYAMOUNT2'
      Origin = 'PAYAMOUNT2'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX: TFMTBCDField
      FieldName = 'TAX'
      Origin = 'TAX'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTOTAL_TAX: TFMTBCDField
      FieldName = 'TOTAL_TAX'
      Origin = 'TOTAL_TAX'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX_ESTATAL: TFMTBCDField
      FieldName = 'TAX_ESTATAL'
      Origin = 'TAX_ESTATAL'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX_SERVICIO: TFMTBCDField
      FieldName = 'TAX_SERVICIO'
      Origin = 'TAX_SERVICIO'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadPAYAMOUNT3: TFMTBCDField
      FieldName = 'PAYAMOUNT3'
      Origin = 'PAYAMOUNT3'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadPAYAMOUNT4: TFMTBCDField
      FieldName = 'PAYAMOUNT4'
      Origin = 'PAYAMOUNT4'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadREGTOTAL: TFMTBCDField
      FieldName = 'REGTOTAL'
      Origin = 'REGTOTAL'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadCHANGE: TFMTBCDField
      FieldName = 'CHANGE'
      Origin = 'CHANGE'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadFOODTOTAL: TFMTBCDField
      FieldName = 'FOODTOTAL'
      Origin = 'FOODTOTAL'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX_FOOD_MUNICIPAL: TFMTBCDField
      FieldName = 'TAX_FOOD_MUNICIPAL'
      Origin = 'TAX_FOOD_MUNICIPAL'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX_FOOD_ESTATAL: TFMTBCDField
      FieldName = 'TAX_FOOD_ESTATAL'
      Origin = 'TAX_FOOD_ESTATAL'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTOTAL_DISCOUNT: TFMTBCDField
      FieldName = 'TOTAL_DISCOUNT'
      Origin = 'TOTAL_DISCOUNT'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTIP: TFMTBCDField
      FieldName = 'TIP'
      Origin = 'TIP'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTIP2: TFMTBCDField
      FieldName = 'TIP2'
      Origin = 'TIP2'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTOTAL_TIP: TFMTBCDField
      FieldName = 'TOTAL_TIP'
      Origin = 'TOTAL_TIP'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadAMOUNT_TENDERED1: TFMTBCDField
      FieldName = 'AMOUNT_TENDERED1'
      Origin = 'AMOUNT_TENDERED1'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadAMOUNT_TENDERED2: TFMTBCDField
      FieldName = 'AMOUNT_TENDERED2'
      Origin = 'AMOUNT_TENDERED2'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadCASHBACK: TFMTBCDField
      FieldName = 'CASHBACK'
      Origin = 'CASHBACK'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadTAX_PROCESSED_FOOD: TFMTBCDField
      FieldName = 'TAX_PROCESSED_FOOD'
      Origin = 'TAX_PROCESSED_FOOD'
      Precision = 18
      Size = 2
    end
    object CDSTransHeadSALESMAN: TWideStringField
      FieldName = 'SALESMAN'
      Origin = 'SALESMAN'
      FixedChar = True
      Size = 3
    end
    object CDSTransHeadDELIVERY_CITY: TWideStringField
      FieldName = 'DELIVERY_CITY'
      Origin = 'DELIVERY_CITY'
      FixedChar = True
    end
    object CDSTransHeadDELIVERY_ZIPCODE: TWideStringField
      FieldName = 'DELIVERY_ZIPCODE'
      Origin = 'DELIVERY_ZIPCODE'
      FixedChar = True
      Size = 15
    end
    object CDSTransHeadDELIVERY_STATE: TStringField
      FieldName = 'DELIVERY_STATE'
      Origin = 'DELIVERY_STATE'
      FixedChar = True
      Size = 2
    end
    object CDSTransHeadRecallNoTrans: TStringField
      FieldKind = fkCalculated
      FieldName = 'RecallNoTrans'
      Size = 15
      Calculated = True
    end
    object CDSTransHeadTRANS_TYPE: TWideStringField
      FieldName = 'TRANS_TYPE'
      FixedChar = True
      Size = 10
    end
  end
  object dsTransHead: TDataSource
    DataSet = CDSTransHead
    Left = 232
    Top = 520
  end
  object dsTransDetail: TDataSource
    DataSet = cdsTransDetail
    Left = 248
    Top = 592
  end
  object sqlTransDetail_Temp: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      
        'SELECT * FROM TransactionDetail_Temp WHERE TransactionNumber = 3' +
        '408745 Order By IDNumber Desc')
    Left = 480
    Top = 600
  end
  object dspTransDetail_Temp: TDataSetProvider
    DataSet = sqlTransDetail_Temp
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 568
    Top = 600
  end
  object dsTransDetail_Temp: TDataSource
    DataSet = cdsTransDetail_Temp
    Left = 656
    Top = 600
  end
  object cdsTransDetail_Temp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransDetail_Temp'
    OnCalcFields = cdsTransDetail_TempCalcFields
    Left = 728
    Top = 600
    object cdsTransDetail_TempPRODDESC_DEFINE: TStringField
      FieldKind = fkCalculated
      FieldName = 'PRODDESC_DEFINE'
      Size = 47
      Calculated = True
    end
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
    object cdsTransDetail_TempTAX_ESTATAL: TStringField
      FieldName = 'TAX_ESTATAL'
      Origin = 'TAX_ESTATAL'
      FixedChar = True
      Size = 1
    end
    object cdsTransDetail_TempTAX_MUNICIPAL: TStringField
      FieldName = 'TAX_MUNICIPAL'
      Origin = 'TAX_MUNICIPAL'
      Size = 1
    end
    object cdsTransDetail_TempQTY: TFloatField
      FieldName = 'QTY'
      Origin = 'QTY'
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
    object cdsTransDetail_TempTRANS_TIME: TSQLTimeStampField
      FieldName = 'TRANS_TIME'
      Origin = 'TRANS_TIME'
    end
    object cdsTransDetail_TempUTILIDAD: TBooleanField
      FieldName = 'UTILIDAD'
      Origin = 'UTILIDAD'
    end
    object cdsTransDetail_TempOTC_NUMBER: TIntegerField
      FieldName = 'OTC_NUMBER'
      Origin = 'OTC_NUMBER'
    end
    object cdsTransDetail_TempTAX_SERVICIO: TBooleanField
      FieldName = 'TAX_SERVICIO'
      Origin = 'TAX_SERVICIO'
    end
    object cdsTransDetail_TempTAX: TFMTBCDField
      FieldName = 'TAX'
      Origin = 'TAX'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempCOSTO: TFMTBCDField
      FieldName = 'COSTO'
      Origin = 'COSTO'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempPRICE: TFMTBCDField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempREGTOTAL: TFMTBCDField
      FieldName = 'REGTOTAL'
      Origin = 'REGTOTAL'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempREGPRICE: TFMTBCDField
      FieldName = 'REGPRICE'
      Origin = 'REGPRICE'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempAWP: TFMTBCDField
      FieldName = 'AWP'
      Origin = 'AWP'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempTOTAL_VALUE: TFMTBCDField
      FieldName = 'TOTAL_VALUE'
      Origin = 'TOTAL_VALUE'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempDISCOUNT: TFMTBCDField
      FieldName = 'DISCOUNT'
      Origin = 'DISCOUNT'
      Precision = 18
      Size = 2
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
    object cdsTransDetail_TempTERMINO: TWideStringField
      FieldName = 'TERMINO'
      Origin = 'TERMINO'
      FixedChar = True
      Size = 15
    end
    object cdsTransDetail_TempMAIN_COURSE: TBooleanField
      FieldName = 'MAIN_COURSE'
      Origin = 'MAIN_COURSE'
    end
    object cdsTransDetail_TempMAIN_COURSE_ID: TIntegerField
      FieldName = 'MAIN_COURSE_ID'
      Origin = 'MAIN_COURSE_ID'
    end
    object cdsTransDetail_TempPRINTED: TBooleanField
      FieldName = 'PRINTED'
      Origin = 'PRINTED'
    end
    object cdsTransDetail_TempINVCONTROL_RECIPE: TBooleanField
      FieldName = 'INVCONTROL_RECIPE'
      Origin = 'INVCONTROL_RECIPE'
    end
    object cdsTransDetail_TempBUTTON_QTY: TFMTBCDField
      FieldName = 'BUTTON_QTY'
      Origin = 'BUTTON_QTY'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempUPC: TStringField
      FieldName = 'UPC'
      Origin = 'UPC'
      FixedChar = True
      Size = 14
    end
    object cdsTransDetail_TempTAB_SAVED: TBooleanField
      FieldName = 'TAB_SAVED'
      Origin = 'TAB_SAVED'
    end
    object cdsTransDetail_TempCOMMISSION: TFMTBCDField
      FieldName = 'COMMISSION'
      Origin = 'COMMISSION'
      Precision = 18
      Size = 2
    end
    object cdsTransDetail_TempTAX_PROCESSED_FOOD: TBooleanField
      FieldName = 'TAX_PROCESSED_FOOD'
      Origin = 'TAX_PROCESSED_FOOD'
    end
  end
  object qPasswords: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'SELECT * FROM PASSWORDS')
    Left = 488
    Top = 528
  end
  object dspPasswords: TDataSetProvider
    DataSet = qPasswords
    Left = 552
    Top = 528
  end
  object dsPasswords: TDataSource
    DataSet = cdsPasswords
    Left = 640
    Top = 528
  end
  object cdsPasswords: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPasswords'
    Left = 720
    Top = 528
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
    object cdsPasswordsUSERNO: TAutoIncField
      FieldName = 'USERNO'
      Origin = 'USERNO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 920
    Top = 440
  end
  object IdConnectionIntercept1: TIdConnectionIntercept
    Left = 923
    Top = 496
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
    Left = 923
    Top = 544
  end
  object IdSMTP1: TIdSMTP
    AuthType = satNone
    Host = 'smtpout.secureserver.net'
    Password = 'Sarerrac047'
    SASLMechanisms = <>
    Username = 'axelcarreras@soallco.com'
    Left = 923
    Top = 600
  end
  object qOpenTabs: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'Select * from OPEN_TABS')
    Left = 72
    Top = 672
  end
  object dsOpenTabs: TDataSource
    DataSet = cdsOpenTabs
    Left = 256
    Top = 672
  end
  object cdsOpenTabs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOpenTabs'
    OnCalcFields = cdsOpenTabsCalcFields
    Left = 336
    Top = 672
    object cdsOpenTabsID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object cdsOpenTabsSERVER: TIntegerField
      FieldName = 'SERVER'
      Origin = 'SERVER'
    end
    object cdsOpenTabsTRANSACTIONNUMBER: TIntegerField
      FieldName = 'TRANSACTIONNUMBER'
      Origin = 'TRANSACTIONNUMBER'
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
    object cdsOpenTabsSERVER_DEFINE: TStringField
      FieldKind = fkLookup
      FieldName = 'SERVER_DEFINE'
      LookupDataSet = cdsPasswords
      LookupKeyFields = 'USERNO'
      LookupResultField = 'USERNAME'
      KeyFields = 'SERVER'
      Size = 35
      Lookup = True
    end
    object cdsOpenTabsTRANSACTIONNUMBER_DEFINE: TStringField
      FieldKind = fkCalculated
      FieldName = 'TRANSACTIONNUMBER_DEFINE'
      Size = 40
      Calculated = True
    end
    object cdsOpenTabsBUTTON_CAPTION: TWideStringField
      FieldName = 'BUTTON_CAPTION'
      Origin = 'BUTTON_CAPTION'
      FixedChar = True
      Size = 30
    end
    object cdsOpenTabsCUSTOMER_ID: TIntegerField
      FieldName = 'CUSTOMER_ID'
      Origin = 'CUSTOMER_ID'
    end
    object cdsOpenTabsDELIVER_BY_ID: TIntegerField
      FieldName = 'DELIVER_BY_ID'
      Origin = 'DELIVER_BY_ID'
    end
    object cdsOpenTabsDELIVER_BY_DEFINE: TStringField
      FieldKind = fkLookup
      FieldName = 'DELIVER_BY_DEFINE'
      LookupDataSet = cdsDeliverBy
      LookupKeyFields = 'USERNO'
      LookupResultField = 'USERNAME'
      KeyFields = 'DELIVER_BY_ID'
      Size = 45
      Lookup = True
    end
    object cdsOpenTabsGROUP_BALANCE: TFMTBCDField
      FieldName = 'GROUP_BALANCE'
      Origin = 'GROUP_BALANCE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsOpenTabsBALANCE: TFMTBCDField
      FieldName = 'BALANCE'
      Origin = 'BALANCE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsOpenTabsTRANS_TYPE: TWideStringField
      FieldName = 'TRANS_TYPE'
      FixedChar = True
      Size = 1
    end
    object cdsOpenTabsTRANS_TYPE_DEFINED: TStringField
      FieldKind = fkCalculated
      FieldName = 'TRANS_TYPE_DEFINED'
      Size = 25
      Calculated = True
    end
  end
  object dspOpenTabs: TDataSetProvider
    DataSet = qOpenTabs
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 672
  end
  object qDeliverBy: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'select * from passwords')
    Left = 480
    Top = 672
  end
  object dspDeliverBy: TDataSetProvider
    DataSet = qDeliverBy
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 571
    Top = 672
  end
  object dsDeliverBy: TDataSource
    DataSet = cdsDeliverBy
    Left = 667
    Top = 672
  end
  object cdsDeliverBy: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeliverBy'
    Left = 747
    Top = 672
    object cdsDeliverByUSERNAME: TStringField
      FieldName = 'USERNAME'
      Origin = 'USERNAME'
      Required = True
      Size = 35
    end
    object cdsDeliverByUSERNO: TAutoIncField
      FieldName = 'USERNO'
      Origin = 'USERNO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
  end
  object cdsTransDetail: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT * FROM TransactionDetail  WHERE TransactionNumber = 100  ' +
      'Order By IDNumber'
    Params = <>
    ProviderName = 'dspTransDetail'
    Left = 336
    Top = 592
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
    object cdsTransDetailIDNUMBER: TIntegerField
      FieldName = 'IDNUMBER'
      Origin = 'IDNUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTransDetailMAIN_COURSE: TBooleanField
      FieldName = 'MAIN_COURSE'
      Origin = 'MAIN_COURSE'
    end
    object cdsTransDetailMAIN_COURSE_ID: TIntegerField
      FieldName = 'MAIN_COURSE_ID'
      Origin = 'MAIN_COURSE_ID'
    end
    object cdsTransDetailTERMINO: TWideStringField
      FieldName = 'TERMINO'
      Origin = 'TERMINO'
      FixedChar = True
      Size = 15
    end
    object cdsTransDetailTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailTAX: TFMTBCDField
      FieldName = 'TAX'
      Origin = 'TAX'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailCOSTO: TFMTBCDField
      FieldName = 'COSTO'
      Origin = 'COSTO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailPRICE: TFMTBCDField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailREGTOTAL: TFMTBCDField
      FieldName = 'REGTOTAL'
      Origin = 'REGTOTAL'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailREGPRICE: TFMTBCDField
      FieldName = 'REGPRICE'
      Origin = 'REGPRICE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailAWP: TFMTBCDField
      FieldName = 'AWP'
      Origin = 'AWP'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailTOTAL_VALUE: TFMTBCDField
      FieldName = 'TOTAL_VALUE'
      Origin = 'TOTAL_VALUE'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailDISCOUNT: TFMTBCDField
      FieldName = 'DISCOUNT'
      Origin = 'DISCOUNT'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object cdsTransDetailBARCODEALTERNO1: TWideStringField
      FieldName = 'BARCODEALTERNO1'
      Origin = 'BARCODEALTERNO1'
      FixedChar = True
    end
  end
  object POS_UPDATE_PRINTED: TFDStoredProc
    Connection = FDConnectionRx
    SchemaName = 'dbo'
    StoredProcName = 'POS_UPDATE_PRINTED'
    Left = 915
    Top = 672
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
      end
      item
        Position = 2
        Name = '@TRANSNO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DSClientes: TDataSource
    DataSet = CDSClientes
    Left = 912
    Top = 40
  end
  object CDSClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPClientes'
    OnCalcFields = CDSClientesCalcFields
    Left = 1048
    Top = 40
    object CDSClientesNombreCompleto2: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreCompleto2'
      Size = 45
      Calculated = True
    end
    object CDSClientesMailingAddDefine: TStringField
      FieldKind = fkCalculated
      FieldName = 'MailingAddDefine'
      Size = 90
      Calculated = True
    end
    object CDSClientesNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      FixedChar = True
      Size = 12
    end
    object CDSClientesFECHANACIMIENTO: TSQLTimeStampField
      FieldName = 'FECHANACIMIENTO'
      Origin = 'FECHANACIMIENTO'
    end
    object CDSClientesSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'SEXO'
    end
    object CDSClientesDIRECCION1: TStringField
      FieldName = 'DIRECCION1'
      Origin = 'DIRECCION1'
      FixedChar = True
      Size = 30
    end
    object CDSClientesULTTRANS: TSQLTimeStampField
      FieldName = 'ULTTRANS'
      Origin = 'ULTTRANS'
    end
    object CDSClientesNUMEROCLIENTE: TAutoIncField
      FieldName = 'NUMEROCLIENTE'
      Origin = 'NUMEROCLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSClientesINTERES: TStringField
      FieldName = 'INTERES'
      Origin = 'INTERES'
      FixedChar = True
      Size = 1
    end
    object CDSClientesDIRECCIONFISICA: TStringField
      FieldName = 'DIRECCIONFISICA'
      Origin = 'DIRECCIONFISICA'
      FixedChar = True
      Size = 50
    end
    object CDSClientesAPELLIDOPATERNO: TStringField
      FieldName = 'APELLIDOPATERNO'
      Origin = 'APELLIDOPATERNO'
      FixedChar = True
      Size = 15
    end
    object CDSClientesAPELLIDOMATERNO: TStringField
      FieldName = 'APELLIDOMATERNO'
      Origin = 'APELLIDOMATERNO'
      FixedChar = True
      Size = 15
    end
    object CDSClientesTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Origin = 'TELEFONO'
      FixedChar = True
      Size = 13
    end
    object CDSClientesFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      FixedChar = True
      Size = 13
    end
    object CDSClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      FixedChar = True
      Size = 13
    end
    object CDSClientesESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object CDSClientesAUSPICIO: TFMTBCDField
      FieldName = 'AUSPICIO'
      Origin = 'AUSPICIO'
      Precision = 18
      Size = 2
    end
    object CDSClientesSOCIO: TStringField
      FieldName = 'SOCIO'
      Origin = 'SOCIO'
      Size = 12
    end
    object CDSClientesORIENTACION: TStringField
      FieldName = 'ORIENTACION'
      Origin = 'ORIENTACION'
      FixedChar = True
      Size = 5
    end
    object CDSClientesIDENTIFICACION: TStringField
      FieldName = 'IDENTIFICACION'
      Origin = 'IDENTIFICACION'
      FixedChar = True
    end
    object CDSClientesSMOKER: TStringField
      FieldName = 'SMOKER'
      Origin = 'SMOKER'
      FixedChar = True
      Size = 1
    end
    object CDSClientesLOCATION: TStringField
      FieldName = 'LOCATION'
      Origin = 'LOCATION'
      FixedChar = True
      Size = 2
    end
    object CDSClientesEMPLOYER_ID: TStringField
      FieldName = 'EMPLOYER_ID'
      Origin = 'EMPLOYER_ID'
      FixedChar = True
      Size = 15
    end
    object CDSClientesPATIENT_ID_QUAL: TStringField
      FieldName = 'PATIENT_ID_QUAL'
      Origin = 'PATIENT_ID_QUAL'
      FixedChar = True
      Size = 2
    end
    object CDSClientesPREGNANCY_IDICATOR: TStringField
      FieldName = 'PREGNANCY_IDICATOR'
      Origin = 'PREGNANCY_IDICATOR'
      FixedChar = True
      Size = 1
    end
    object CDSClientesFECHA_HIPPA: TSQLTimeStampField
      FieldName = 'FECHA_HIPPA'
      Origin = 'FECHA_HIPPA'
    end
    object CDSClientesINFOADICIONAL: TStringField
      FieldName = 'INFOADICIONAL'
      Origin = 'INFOADICIONAL'
      Size = 100
    end
    object CDSClientesCONSULTA: TStringField
      FieldName = 'CONSULTA'
      Origin = 'CONSULTA'
      Size = 100
    end
    object CDSClientesCIUDAD: TStringField
      FieldName = 'CIUDAD'
      Origin = 'CIUDAD'
      FixedChar = True
    end
    object CDSClientesMAILING_ADDRESS1: TStringField
      FieldName = 'MAILING_ADDRESS1'
      Origin = 'MAILING_ADDRESS1'
      Size = 30
    end
    object CDSClientesMAILING_ADDRESS2: TStringField
      FieldName = 'MAILING_ADDRESS2'
      Origin = 'MAILING_ADDRESS2'
      Size = 30
    end
    object CDSClientesMAILING_CITY: TStringField
      FieldName = 'MAILING_CITY'
      Origin = 'MAILING_CITY'
      Size = 15
    end
    object CDSClientesMAILING_STATE: TStringField
      FieldName = 'MAILING_STATE'
      Origin = 'MAILING_STATE'
      Size = 2
    end
    object CDSClientesMAILING_ZIPCODE: TStringField
      FieldName = 'MAILING_ZIPCODE'
      Origin = 'MAILING_ZIPCODE'
      Size = 12
    end
    object CDSClientesPATIENT_RESIDENCE: TWideStringField
      FieldName = 'PATIENT_RESIDENCE'
      Origin = 'PATIENT_RESIDENCE'
      FixedChar = True
      Size = 2
    end
    object CDSClientesPLACE_OF_SERVICE: TWideStringField
      FieldName = 'PLACE_OF_SERVICE'
      Origin = 'PLACE_OF_SERVICE'
      FixedChar = True
      Size = 2
    end
    object CDSClientesEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      FixedChar = True
      Size = 80
    end
    object CDSClientesCARDHOLDERID: TWideStringField
      FieldName = 'CARDHOLDERID'
      Origin = 'CARDHOLDERID'
      FixedChar = True
    end
    object CDSClientesCODIGOPOSTAL: TWideStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'CODIGOPOSTAL'
      FixedChar = True
      Size = 15
    end
    object CDSClientesDIRECCION2: TWideStringField
      FieldName = 'DIRECCION2'
      Origin = 'DIRECCION2'
      FixedChar = True
    end
    object CDSClientesSIGNATURE: TMemoField
      FieldName = 'SIGNATURE'
      Origin = 'SIGNATURE'
      BlobType = ftMemo
    end
    object CDSClientesOUT_DIAL_PERMISSION: TWideStringField
      FieldName = 'OUT_DIAL_PERMISSION'
      Origin = 'OUT_DIAL_PERMISSION'
      FixedChar = True
      Size = 1
    end
    object CDSClientesSSN: TWideStringField
      FieldName = 'SSN'
      Origin = 'SSN'
      FixedChar = True
      Size = 9
    end
    object CDSClientesNOTIFICATION_MODE_PHONE: TSmallintField
      FieldName = 'NOTIFICATION_MODE_PHONE'
      Origin = 'NOTIFICATION_MODE_PHONE'
    end
    object CDSClientesNOTIFICATION_MODE_CEL: TSmallintField
      FieldName = 'NOTIFICATION_MODE_CEL'
      Origin = 'NOTIFICATION_MODE_CEL'
    end
    object CDSClientesNOTIFICATION_MODE_SMS: TSmallintField
      FieldName = 'NOTIFICATION_MODE_SMS'
      Origin = 'NOTIFICATION_MODE_SMS'
    end
    object CDSClientesNOTIFICATION_MODE_EMAIL: TSmallintField
      FieldName = 'NOTIFICATION_MODE_EMAIL'
      Origin = 'NOTIFICATION_MODE_EMAIL'
    end
    object CDSClientesNIGHT_PHONE: TWideStringField
      FieldName = 'NIGHT_PHONE'
      Origin = 'NIGHT_PHONE'
      FixedChar = True
      Size = 13
    end
    object CDSClientesWC_NO_NOTIFICATION: TBooleanField
      FieldName = 'WC_NO_NOTIFICATION'
      Origin = 'WC_NO_NOTIFICATION'
    end
    object CDSClientesNOTIFICATION_MODE: TWideStringField
      FieldName = 'NOTIFICATION_MODE'
      Origin = 'NOTIFICATION_MODE'
      FixedChar = True
      Size = 1
    end
    object CDSClientesPRIMARY_TELEPHONE: TWideStringField
      FieldName = 'PRIMARY_TELEPHONE'
      Origin = 'PRIMARY_TELEPHONE'
      FixedChar = True
      Size = 7
    end
    object CDSClientesFACILITY_ID: TIntegerField
      FieldName = 'FACILITY_ID'
      Origin = 'FACILITY_ID'
      Required = True
    end
    object CDSClientesFACILITY_ADMISSION_DATE: TDateField
      FieldName = 'FACILITY_ADMISSION_DATE'
      Origin = 'FACILITY_ADMISSION_DATE'
    end
    object CDSClientesFACILITY_ROOM: TWideStringField
      FieldName = 'FACILITY_ROOM'
      Origin = 'FACILITY_ROOM'
      FixedChar = True
      Size = 10
    end
    object CDSClientesFACILITY_PRESCRIBER: TWideStringField
      FieldName = 'FACILITY_PRESCRIBER'
      Origin = 'FACILITY_PRESCRIBER'
      FixedChar = True
      Size = 50
    end
    object CDSClientesPRICE_TABLE_ID: TIntegerField
      FieldName = 'PRICE_TABLE_ID'
      Origin = 'PRICE_TABLE_ID'
    end
    object CDSClientesOVERRIDE_SYSTEM_DEFAULT_PRICE: TBooleanField
      FieldName = 'OVERRIDE_SYSTEM_DEFAULT_PRICE'
      Origin = 'OVERRIDE_SYSTEM_DEFAULT_PRICE'
      Required = True
    end
    object CDSClientesADHERENCE: TBooleanField
      FieldName = 'ADHERENCE'
      Origin = 'ADHERENCE'
    end
    object CDSClientesNUMERO_REGISTRO_COMERCIANTE: TWideStringField
      FieldName = 'NUMERO_REGISTRO_COMERCIANTE'
      Origin = 'NUMERO_REGISTRO_COMERCIANTE'
      FixedChar = True
      Size = 15
    end
    object CDSClientesALLERGY: TBooleanField
      FieldName = 'ALLERGY'
      Origin = 'ALLERGY'
      Required = True
    end
    object CDSClientesDECEASED: TBooleanField
      FieldName = 'DECEASED'
      Origin = 'DECEASED'
      Required = True
    end
    object CDSClientesMIDDLE_NAME: TStringField
      FieldName = 'MIDDLE_NAME'
      Origin = 'MIDDLE_NAME'
      Size = 12
    end
    object CDSClientesSIGNATURE_RX_LINK: TIntegerField
      FieldName = 'SIGNATURE_RX_LINK'
      Origin = 'SIGNATURE_RX_LINK'
    end
    object CDSClientesID_IMAGE: TIntegerField
      FieldName = 'ID_IMAGE'
      Origin = 'ID_IMAGE'
    end
    object CDSClientesRECORD_LOCKED: TBooleanField
      FieldName = 'RECORD_LOCKED'
      Origin = 'RECORD_LOCKED'
    end
    object CDSClientesINSTANCIA: TIntegerField
      FieldName = 'INSTANCIA'
      Origin = 'INSTANCIA'
    end
    object CDSClientesDEUDA_EXTENDIDA: TStringField
      FieldName = 'DEUDA_EXTENDIDA'
      Origin = 'DEUDA_EXTENDIDA'
      Size = 1
    end
    object CDSClientesDEUDA: TFMTBCDField
      FieldName = 'DEUDA'
      Origin = 'DEUDA'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSClientesLIMITECREDITO: TFMTBCDField
      FieldName = 'LIMITECREDITO'
      Origin = 'LIMITECREDITO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSClientesLAWAY: TFMTBCDField
      FieldName = 'LAWAY'
      Origin = 'LAWAY'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSClientesDEUDA_WEB: TFMTBCDField
      FieldName = 'DEUDA_WEB'
      Origin = 'DEUDA_WEB'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSClientesACCIONES: TFMTBCDField
      FieldName = 'ACCIONES'
      Origin = 'ACCIONES'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSClientesPATROCINIO: TFMTBCDField
      FieldName = 'PATROCINIO'
      Origin = 'PATROCINIO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSClientesVETERANO: TFMTBCDField
      FieldName = 'VETERANO'
      Origin = 'VETERANO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
    object CDSClientesTAX_EXEMPT: TBooleanField
      FieldName = 'TAX_EXEMPT'
      Origin = 'TAX_EXEMPT'
    end
    object CDSClientesRETAILPRICE_SELECTED: TStringField
      FieldName = 'RETAILPRICE_SELECTED'
      Origin = 'RETAILPRICE_SELECTED'
      FixedChar = True
      Size = 7
    end
    object CDSClientesCLASIFICATION: TWideStringField
      FieldName = 'CLASIFICATION'
      Origin = 'CLASIFICATION'
      FixedChar = True
    end
    object CDSClientesLANGUAGE: TWideStringField
      FieldName = 'LANGUAGE'
      Origin = 'LANGUAGE'
      FixedChar = True
      Size = 12
    end
  end
  object DSPClientes: TDataSetProvider
    DataSet = QClientesFD
    Options = [poPropogateChanges, poAllowCommandText]
    Left = 968
    Top = 40
  end
  object QClientesFD: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'Select * from Pacientes where NumeroCliente > 0')
    Left = 848
    Top = 40
  end
  object qryPrinters: TFDQuery
    Connection = FDConnectionRx
    SQL.Strings = (
      'Select * from Printers')
    Left = 827
    Top = 368
  end
  object dspPrinters: TDataSetProvider
    DataSet = qryPrinters
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 907
    Top = 368
  end
  object dsPrinters: TDataSource
    DataSet = cdsPrinters
    Left = 987
    Top = 368
  end
  object cdsPrinters: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrinters'
    Left = 1075
    Top = 368
    object cdsPrintersID: TAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsPrintersLABEL_NAME: TWideStringField
      FieldName = 'LABEL_NAME'
      Origin = 'LABEL_NAME'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsPrintersLEFT_MARGIN: TFloatField
      FieldName = 'LEFT_MARGIN'
      Origin = 'LEFT_MARGIN'
      Required = True
    end
    object cdsPrintersTOP_MARGIN: TFloatField
      FieldName = 'TOP_MARGIN'
      Origin = 'TOP_MARGIN'
      Required = True
    end
    object cdsPrintersPRINTER_NAME: TWideStringField
      FieldName = 'PRINTER_NAME'
      Origin = 'PRINTER_NAME'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsPrintersPAT_EDUCATION: TWideStringField
      FieldName = 'PAT_EDUCATION'
      Origin = 'PAT_EDUCATION'
      FixedChar = True
      Size = 5
    end
    object cdsPrintersPRINTER_ID: TIntegerField
      FieldName = 'PRINTER_ID'
      Origin = 'PRINTER_ID'
    end
    object cdsPrintersDEFAULT_HISTORY_LABEL: TBooleanField
      FieldName = 'DEFAULT_HISTORY_LABEL'
      Origin = 'DEFAULT_HISTORY_LABEL'
    end
    object cdsPrintersDEFAULT_OTC_LABEL: TBooleanField
      FieldName = 'DEFAULT_OTC_LABEL'
      Origin = 'DEFAULT_OTC_LABEL'
    end
    object cdsPrintersDEFAULT_NEWRX_LABEL: TBooleanField
      FieldName = 'DEFAULT_NEWRX_LABEL'
    end
  end
  object FDConnectionPOS: TFDConnection
    Params.Strings = (
      'Server=192.168.4.217,1433'
      'User_Name=dbo'
      'Password=agabriel'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=SERVER'
      'MARS=yes'
      'Database=familiar'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 240
    Top = 16
  end
  object FDTransactionPOS: TFDTransaction
    Connection = FDConnectionPOS
    Left = 352
    Top = 8
  end
  object FDQueryPOS: TFDQuery
    Connection = FDConnectionRx
    Left = 1080
    Top = 496
  end
  object qCounters: TFDQuery
    Connection = FDConnectionPOS
    SQL.Strings = (
      'Select * from counters')
    Left = 64
    Top = 736
  end
  object dspCounters: TDataSetProvider
    DataSet = qCounters
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 736
  end
  object dsCounters: TDataSource
    DataSet = cdsCounters
    Left = 232
    Top = 736
  end
  object cdsCounters: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCounters'
    OnCalcFields = cdsOpenTabsCalcFields
    Left = 328
    Top = 736
    object cdsCountersSTICKER: TLargeintField
      FieldName = 'STICKER'
      Required = True
    end
    object cdsCounterstitulo1: TStringField
      FieldName = 'titulo1'
      Size = 40
    end
    object cdsCounterstitulo2: TStringField
      FieldName = 'titulo2'
      Size = 40
    end
    object cdsCounterstitulo3: TStringField
      FieldName = 'titulo3'
      Size = 40
    end
    object cdsCounterstitulo4: TStringField
      FieldName = 'titulo4'
      Size = 40
    end
    object cdsCountersReceiptMessage: TStringField
      FieldName = 'ReceiptMessage'
      Size = 1600
    end
  end
end
