object FrmLabels: TFrmLabels
  Left = 0
  Top = 0
  Caption = 'FrmLabels'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object Inventario: TfrxDBDataset
    UserName = 'Inventario'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TIPO=TIPO'
      'FECHA_EXPIRACION=FECHA_EXPIRACION'
      'CODIGO=CODIGO'
      'DEPARTAMENTO=DEPARTAMENTO'
      'LOTE=LOTE'
      'COMESPECIAL=COMESPECIAL'
      'TERMINAESPECIAL=TERMINAESPECIAL'
      'PORCIENTODESCUENTO=PORCIENTODESCUENTO'
      'ULTIMOCAMBIO=ULTIMOCAMBIO'
      'ULTIMAVENTA=ULTIMAVENTA'
      'CODIGOBARRA=CODIGOBARRA'
      'FOODITEM=FOODITEM'
      'NONEBC=NONEBC'
      'NUMEROSUPLIDOR=NUMEROSUPLIDOR'
      'PRODUCTNO=PRODUCTNO'
      'SUB_DEPARTAMENTO=SUB_DEPARTAMENTO'
      'DESCRIPCION=DESCRIPCION'
      'ROUTEOFADMINISTRATION=ROUTEOFADMINISTRATION'
      'CONTROLADO=CONTROLADO'
      'STRENGTH=STRENGTH'
      'INFOADICIONAL=INFOADICIONAL'
      'CAUTION1=CAUTION1'
      'CAUTION2=CAUTION2'
      'CAUTION3=CAUTION3'
      'GENERICNAME=GENERICNAME'
      'TXR=TXR'
      'BRAND=BRAND'
      'GROUP_PRODUCTNO=GROUP_PRODUCTNO'
      'RECETARIO=RECETARIO'
      'GROUP_QTY=GROUP_QTY'
      'DESCUENTO=DESCUENTO'
      'IMAGE_CODE=IMAGE_CODE'
      'PACKAGESIZE=PACKAGESIZE'
      'TXR_EXTENSION=TXR_EXTENSION'
      'STATUS=STATUS'
      'TAXABLE=TAXABLE'
      'TAXABLE_ESTATAL=TAXABLE_ESTATAL'
      'PO=PO'
      'isbn=isbn'
      'NDC=NDC'
      'PATROCINIO=PATROCINIO'
      'METRIC_UNIT=METRIC_UNIT'
      'ROBOT=ROBOT'
      'ROBOT_NDC=ROBOT_NDC'
      'ALCHEMY_PRODUCTID=ALCHEMY_PRODUCTID'
      'MARKET_STATUS=MARKET_STATUS'
      'OUTERPACKAGEUNIT=OUTERPACKAGEUNIT'
      'PAKAGE_ID=PAKAGE_ID'
      'COBRAR_TAX=COBRAR_TAX'
      'REVENUE_CODE=REVENUE_CODE'
      'HCPCS=HCPCS'
      'CASA_FARMACEUTICA=CASA_FARMACEUTICA'
      'VERSION_DESCRIPTION=VERSION_DESCRIPTION'
      'PAKAGE_DESCRIPTION=PAKAGE_DESCRIPTION'
      'AllowControledRefills=AllowControledRefills'
      'ESCANEAR_BARCODEALTERNO=ESCANEAR_BARCODEALTERNO'
      'MedicamentoStr=MedicamentoStr'
      'InvInfo=InvInfo'
      'QTYINVENTARIO=QTYINVENTARIO'
      'COSTO=COSTO'
      'RBP=RBP'
      'ESPECIAL=ESPECIAL'
      'PRECIO2=PRECIO2'
      'METRICSIZE=METRICSIZE'
      'PRECIO=PRECIO'
      'CMAXINVENTARIO=CMAXINVENTARIO'
      'CMININVENTARIO=CMININVENTARIO'
      'PRECIOVENTA2=PRECIOVENTA2')
    DataSource = DM.DSInventario
    BCDToCurrency = False
    Left = 288
    Top = 16
  end
  object PrescriptionFull: TfrxDBDataset
    UserName = 'PrescriptionFull'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RX_SERVICE_DATE=RX_SERVICE_DATE'
      'RX_STATUS=RX_STATUS'
      'NO_REF_DISPENSADO=NO_REF_DISPENSADO'
      'PHARMACIST=PHARMACIST'
      'DAYS_SUPPLY=DAYS_SUPPLY'
      'AUTHORIZATION_NUMBER=AUTHORIZATION_NUMBER'
      'PRICE_TABLE_ID=PRICE_TABLE_ID'
      'DRUG=DRUG'
      'NDC=NDC'
      'TYPIST=TYPIST'
      'BATCH_NUMBER=BATCH_NUMBER'
      'RX_NUMBER=RX_NUMBER'
      'PRODUCT_ID=PRODUCT_ID'
      'OTC_BATCH_NUMBER=OTC_BATCH_NUMBER'
      'RX_SIG=RX_SIG'
      'RX_DATE=RX_DATE'
      'PAT_CLIENT_NUMBER=PAT_CLIENT_NUMBER'
      'RXORIGINCODE=RXORIGINCODE'
      'PAT_NAME=PAT_NAME'
      'PAT_LASTNAME=PAT_LASTNAME'
      'PAT_MAIDENNAME=PAT_MAIDENNAME'
      'PAT_TELEPHONE=PAT_TELEPHONE'
      'PAT_CELULAR=PAT_CELULAR'
      'PAT_SEX=PAT_SEX'
      'PAT_DOB=PAT_DOB'
      'PRESC_NUMBER=PRESC_NUMBER'
      'PRESC_MAIDENNAME=PRESC_MAIDENNAME'
      'PRESC_LASTNAME=PRESC_LASTNAME'
      'PRESC_NAME=PRESC_NAME'
      'PRESC_TEL=PRESC_TEL'
      'PRESC_FAX=PRESC_FAX'
      'PRESC_NPI=PRESC_NPI'
      'PRESC_EMAIL=PRESC_EMAIL'
      'PRESC_ADD1=PRESC_ADD1'
      'PRESC_STATE=PRESC_STATE'
      'PRESC_ZIP=PRESC_ZIP'
      'PRESC_ADDRESS2=PRESC_ADDRESS2'
      'PRESC_CITY=PRESC_CITY'
      'PRESC_CEL=PRESC_CEL'
      'DEA_FEDERAL=DEA_FEDERAL'
      'PLAN_NAME=PLAN_NAME'
      'PLAN_BINNUBER=PLAN_BINNUBER'
      'PLAN_SUPPORT_TEL=PLAN_SUPPORT_TEL'
      'RX_REF_AUTHORIZED=RX_REF_AUTHORIZED'
      'RX_LAST_REFILL_DATE=RX_LAST_REFILL_DATE'
      'Health_plan_abbreviation=Health_plan_abbreviation'
      'WF_BILLED=WF_BILLED'
      'WF_PRINTED=WF_PRINTED'
      'WF_FILLED=WF_FILLED'
      'WF_CHECKED=WF_CHECKED'
      'WF_DELIVERED=WF_DELIVERED'
      'WF_TYPED=WF_TYPED'
      'OTCNUMBER=OTCNUMBER'
      'RX_ID=RX_ID'
      'MED_CHART=MED_CHART'
      'CLAIM_STATUS=CLAIM_STATUS'
      'FACILITY_ID=FACILITY_ID'
      'PATPLAN_NUMBER=PATPLAN_NUMBER'
      'COMPOUNDCODE=COMPOUNDCODE'
      'PRESCRIBERIDQUALIFIER=PRESCRIBERIDQUALIFIER'
      'METRICDECIMALQUANTITY=METRICDECIMALQUANTITY'
      'RX_ACTIVE=RX_ACTIVE'
      'SIG=SIG'
      'NombreCompleto=NombreCompleto'
      'Presc_FullName=Presc_FullName'
      'MEDICAMENTOMIX=MEDICAMENTOMIX'
      'PAT_LANGUAGE=PAT_LANGUAGE'
      'MedicamentoMixDefine=MedicamentoMixDefine'
      'ADHERENCE=ADHERENCE'
      'Payment_Line=Payment_Line'
      'AvailableDefine=AvailableDefine'
      'NO_REFILL=NO_REFILL'
      'OTCNumber_Print=OTCNumber_Print'
      'PAT_ADDRESS1=PAT_ADDRESS1'
      'PAT_CITY=PAT_CITY'
      'PAT_STATE=PAT_STATE'
      'PAT_ZIPCODE=PAT_ZIPCODE'
      'PAT_FULL_ADDRESS=PAT_FULL_ADDRESS'
      'Caution1=Caution1'
      'PAT_ADDRESS2=PAT_ADDRESS2'
      'Caution2=Caution2'
      'Caution3=Caution3'
      'Caution4=Caution4'
      'Caution5=Caution5'
      'PatEducation=PatEducation'
      'PatPayAmount=PatPayAmount'
      'PAT_IDENTIFICATION=PAT_IDENTIFICATION'
      'BILL_LATTER=BILL_LATTER'
      'RX_STATUS_DEFINE=RX_STATUS_DEFINE'
      'RX_ORIGIN_CODE_DEFINE=RX_ORIGIN_CODE_DEFINE'
      'Compound_NDC=Compound_NDC'
      'Compound_Lote=Compound_Lote'
      'Compound_Expi=Compound_Expi'
      'AvailableDefine2=AvailableDefine2'
      'PlanInfo=PlanInfo'
      'DrugInfo=DrugInfo'
      'WF_STORAGE=WF_STORAGE'
      'WF_CASHIER=WF_CASHIER'
      'WF_SIGNATURE=WF_SIGNATURE'
      'CARDHOLDERID=CARDHOLDERID'
      'RX_NUMBER_HEADING=RX_NUMBER_HEADING'
      'Presc_FullName2=Presc_FullName2'
      'PlanInfo2_NoShowPP=PlanInfo2_NoShowPP'
      'RX_CONTROL=RX_CONTROL'
      'DAW=DAW'
      'LABEL_LINE1=LABEL_LINE1'
      'RX_QTY_AVAILABLE=RX_QTY_AVAILABLE'
      'QTY=QTY'
      'SALES_COST=SALES_COST'
      'PLAN_PAY_AMOUNT=PLAN_PAY_AMOUNT'
      'PAT_PAY_AMOUNT=PAT_PAY_AMOUNT'
      'AWP=AWP'
      'RX_QTY_PRESCRIBED=RX_QTY_PRESCRIBED'
      'TOTAL=TOTAL'
      'CASH_RETAIL_PRICE=CASH_RETAIL_PRICE'
      'RX_DISPENSING_FEE_PAID=RX_DISPENSING_FEE_PAID'
      'RX_OTHER_AMOUNT_PAID=RX_OTHER_AMOUNT_PAID'
      'Earning=Earning'
      'IOU=IOU')
    DataSource = DM.dsPrescription_Full
    BCDToCurrency = False
    Left = 328
    Top = 88
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
    Left = 416
    Top = 45
  end
  object LASCL_13TL: TfrxReport
    Version = '2021.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42257.882286817100000000
    ReportOptions.LastChange = 42257.882286817100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = LASCL_13TLBeforePrint
    Left = 80
    Top = 133
    Datasets = <
      item
        DataSet = PrescriptionFull
        DataSetName = 'PrescriptionFull'
      end
      item
        DataSet = Setup
        DataSetName = 'Setup'
      end
      item
        DataSet = Inventario
        DataSetName = 'Inventario'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 209.600000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 1.000000000000000000
      BackPicturePrintable = False
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 792.188976380000000000
        Top = 18.897650000000000000
        Width = 321.260050000000000000
        DataSet = PrescriptionFull
        DataSetName = 'PrescriptionFull'
        RowCount = 0
        object MemoDuplicate: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858270000000000
          Top = 30.387832500000000000
          Width = 32.125984250000000000
          Height = 9.448818900000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Duplicate')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 256.228510000000000000
          Top = 393.448831100000000000
          Width = 22.534013640000000000
          Height = 13.228348900000000000
          DataField = 'TYPIST'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."TYPIST"]')
          ParentFont = False
        end
        object MemoMed2: TfrxMemoView
          AllowVectorExport = True
          Left = 4.338590000000000000
          Top = 375.590646380000000000
          Width = 280.440944880000000000
          Height = 24.566934020000000000
          DataField = 'MedicamentoMixDefine'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."MedicamentoMixDefine"]')
          ParentFont = False
        end
        object InventarioNDC: TfrxMemoView
          AllowVectorExport = True
          Left = 1.937012760000000000
          Top = 366.468770000000000000
          Width = 280.440944880000000000
          Height = 11.338585120000000000
          DataField = 'InvInfo'
          DataSet = Inventario
          DataSetName = 'Inventario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Inventario."InvInfo"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 37.059059990000000000
          Top = 37.685051570000000000
          Width = 76.252010000000000000
          Height = 14.397650000000000000
          DataField = 'RX_NUMBER'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_NUMBER"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858267716540000
          Top = 37.635822510000000000
          Width = 34.192950000000000000
          Height = 13.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Rx #:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 50.756570840000000000
          Width = 241.889778430000000000
          Height = 13.118120000000000000
          DataField = 'NombreCompleto'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."NombreCompleto"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 113.639146660000000000
          Top = 37.635822510000000000
          Width = 38.967223330000000000
          Height = 10.618120000000000000
          DataField = 'TYPIST'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."TYPIST"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 190.944960000000000000
          Top = 37.574815350000000000
          Width = 48.708720000000000000
          Height = 10.618120000000000000
          DataField = 'RX_SERVICE_DATE'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_SERVICE_DATE"]')
          ParentFont = False
        end
        object BarCode2: TfrxBarCodeView
          AllowVectorExport = True
          Left = 247.777056660000000000
          Top = 21.543290000000000000
          Width = 37.425170000000000000
          Height = 147.400000000000000000
          Restrictions = [rfDontSize]
          BarType = bcCode128
          DataField = 'OTCNumber_Print'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Frame.Typ = []
          Rotation = 90
          TestLine = False
          Text = 'RX1234567'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ColorBar = clBlack
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 109.816326670000000000
          Width = 241.889778430000000000
          Height = 13.618120000000000000
          DataField = 'Presc_FullName'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."Presc_FullName"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 135.532776660000000000
          Top = 37.574815350000000000
          Width = 51.531540000000000000
          Height = 10.618120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Fecha:')
          ParentFont = False
        end
        object PrescriptionFullPAT_FULL_ADDRESS: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 62.640383340000000000
          Width = 241.889778430000000000
          Height = 7.559055120000000000
          DataField = 'PAT_FULL_ADDRESS'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."PAT_FULL_ADDRESS"]')
          ParentFont = False
        end
        object PrescriptionFullPRESC_TEL1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 119.640383340000000000
          Width = 241.889778430000000000
          Height = 7.897650000000000000
          DataField = 'PRESC_TEL'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."PRESC_TEL"]')
          ParentFont = False
        end
        object frxMemoRX_SIG: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 69.153370590000000000
          Width = 241.889778430000000000
          Height = 44.461966670000000000
          DataField = 'RX_SIG'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_SIG"]')
          ParentFont = False
        end
        object MemoMed1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.755905510000000000
          Top = 146.681200000000000000
          Width = 280.329623330000000000
          Height = 45.305813330000000000
          DataField = 'MedicamentoMixDefine'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."MedicamentoMixDefine"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 138.370090940000000000
          Width = 241.889778430000000000
          Height = 10.118120000000000000
          DataField = 'InvInfo'
          DataSet = Inventario
          DataSetName = 'Inventario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Inventario."InvInfo"]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Left = 1.871366660000000000
          Top = 348.826866850000000000
          Width = 280.440944880000000000
          Height = 11.338585120000000000
          DataField = 'PlanInfo'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."PlanInfo"]')
          ParentFont = False
        end
        object MemoAvailable: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 126.619975450000000000
          Width = 241.889778430000000000
          Height = 11.338590000000000000
          DataField = 'AvailableDefine'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."AvailableDefine"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Top = 338.378170000000000000
          Width = 280.440944880000000000
          Height = 12.094488190000000000
          DataField = 'AvailableDefine2'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."AvailableDefine2"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 1.863407830000000000
          Top = 355.417063480000000000
          Width = 280.440944880000000000
          Height = 11.338585120000000000
          DataField = 'Presc_FullName2'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."Presc_FullName2"]')
          ParentFont = False
        end
        object MemoPatEducation: TfrxMemoView
          AllowVectorExport = True
          Left = 3.338590000000000000
          Top = 549.268090000000000000
          Width = 283.464603540000000000
          Height = 196.535437950000000000
          DataField = 'PatEducation'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          LineSpacing = 1.000000000000000000
          Memo.UTF8W = (
            '[PrescriptionFull."PatEducation"]')
          ParentFont = False
          WordBreak = True
        end
        object MemoCaution1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.913388270000000000
          Top = 199.247990000000000000
          Width = 135.093909530000000000
          Height = 41.802539210000000000
          DataField = 'Caution1'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."Caution1"]')
          ParentFont = False
        end
        object MemoCaution2: TfrxMemoView
          AllowVectorExport = True
          Left = 147.504020000000000000
          Top = 199.535560000000000000
          Width = 138.873439530000000000
          Height = 41.802539210000000000
          DataField = 'Caution2'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."Caution2"]')
          ParentFont = False
        end
        object MemoCaution3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.913388270000000000
          Top = 248.669450000000000000
          Width = 135.093909530000000000
          Height = 41.802539210000000000
          DataField = 'Caution3'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."Caution3"]')
          ParentFont = False
        end
        object MemoCaution4: TfrxMemoView
          AllowVectorExport = True
          Left = 147.504020000000000000
          Top = 248.669450000000000000
          Width = 138.873439530000000000
          Height = 41.802539210000000000
          DataField = 'Caution4'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."Caution4"]')
          ParentFont = False
        end
        object BarCode3: TfrxBarCodeView
          AllowVectorExport = True
          Left = 150.401670000000000000
          Top = 488.441250000000000000
          Width = 124.000000000000000000
          Height = 22.677180000000000000
          BarType = bcCode128
          DataField = 'OTCNumber_Print'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Frame.Typ = []
          Rotation = 0
          ShowText = False
          TestLine = False
          Text = 'RX1234567'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ColorBar = clBlack
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 6.118120000000000000
          Top = 475.220780000000000000
          Width = 268.346630000000000000
          Height = 11.338590000000000000
          DataField = 'RX_NUMBER_HEADING'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_NUMBER_HEADING"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 6.047244090000000000
          Top = 495.677490000000000000
          Width = 138.444960000000000000
          Height = 11.338585120000000000
          DataField = 'InvInfo'
          DataSet = Inventario
          DataSetName = 'Inventario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Inventario."InvInfo"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 6.047244090000000000
          Top = 504.559370000000000000
          Width = 139.842468430000000000
          Height = 11.338590000000000000
          DataField = 'AvailableDefine'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."AvailableDefine"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 6.047244090000000000
          Top = 487.236550000000000000
          Width = 139.842441570000000000
          Height = 9.448814020000000000
          DataField = 'MedicamentoMixDefine'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."MedicamentoMixDefine"]')
          ParentFont = False
        end
        object MemoMed3: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 460.858426380000000000
          Width = 280.440944880000000000
          Height = 13.228344020000000000
          DataField = 'MedicamentoMixDefine'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."MedicamentoMixDefine"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559055120000000000
          Top = 454.279840000000000000
          Width = 280.440944880000000000
          Height = 7.559055120000000000
          DataField = 'InvInfo'
          DataSet = Inventario
          DataSetName = 'Inventario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Inventario."InvInfo"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559055120000000000
          Top = 439.094646850000000000
          Width = 280.440944880000000000
          Height = 11.338585120000000000
          DataField = 'PlanInfo'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."PlanInfo"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559055120000000000
          Top = 431.645950000000000000
          Width = 280.440944880000000000
          Height = 11.338585120000000000
          DataField = 'AvailableDefine2'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."AvailableDefine2"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559055120000000000
          Top = 446.684843480000000000
          Width = 280.440944880000000000
          Height = 11.338585120000000000
          DataField = 'Presc_FullName2'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."Presc_FullName2"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 16.338590000000000000
          Top = 395.291590000000000000
          Width = 37.795300000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Firma:')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 55.133890000000000000
          Top = 407.630180000000000000
          Width = 170.078850000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Top = 319.260050000000000000
          Width = 279.685220000000000000
          Height = 22.677180000000000000
          DataField = 'RX_NUMBER_HEADING'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_NUMBER_HEADING"]')
          ParentFont = False
        end
        object Heading1A: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 259.925170000000000000
          Height = 12.118120000000000000
          DataField = 'STORENAMEHEADING'
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
            '[Setup."STORENAMEHEADING"]')
          ParentFont = False
        end
        object Heading1B: TfrxMemoView
          AllowVectorExport = True
          Left = 5.068027270000000000
          Top = 14.007885000000000000
          Width = 259.925170000000000000
          Height = 9.838590000000000000
          DataField = 'STOREADDRESSHEADING'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."STOREADDRESSHEADING"]')
          ParentFont = False
        end
        object Heading1C: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 25.015770000000000000
          Width = 259.925170000000000000
          Height = 10.618120000000000000
          DataField = 'STOREPHONEHEADING'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."STOREPHONEHEADING"]')
          ParentFont = False
        end
        object Heading2A: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 291.023810000000000000
          Width = 259.925170000000000000
          Height = 12.118120000000000000
          DataField = 'STORENAMEHEADING'
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
            '[Setup."STORENAMEHEADING"]')
          ParentFont = False
        end
        object Heading2B: TfrxMemoView
          AllowVectorExport = True
          Left = 12.627087270000000000
          Top = 302.031695000000000000
          Width = 259.925170000000000000
          Height = 9.838590000000000000
          DataField = 'STOREADDRESSHEADING'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."STOREADDRESSHEADING"]')
          ParentFont = False
        end
        object Heading2C: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 311.039580000000000000
          Width = 259.925170000000000000
          Height = 10.618120000000000000
          DataField = 'STOREPHONEHEADING'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."STOREPHONEHEADING"]')
          ParentFont = False
        end
        object MemoUnderPaid: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 397.071120000000000000
          Width = 11.338590000000000000
          Height = 7.559060000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'X')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 423.929146062992100000
          Width = 279.685220000000000000
          Height = 11.338590000000000000
          DataField = 'RX_NUMBER_HEADING'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_NUMBER_HEADING"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 47.133890000000000000
          Top = 409.322895670000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Visible = False
          DataField = 'CARDHOLDERID'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."CARDHOLDERID"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 11.118120000000000000
          Top = 409.189240000000000000
          Width = 37.795300000000000000
          Height = 7.559060000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cardholder ID:')
          ParentFont = False
        end
      end
    end
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 348
    Top = 245
  end
  object R3X4_TERMAL_A: TfrxReport
    Version = '2021.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42257.882286817090000000
    ReportOptions.LastChange = 42257.882286817090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = R3X4_TERMAL_ABeforePrint
    Left = 80
    Top = 32
    Datasets = <
      item
        DataSet = Inventario
        DataSetName = 'Inventario'
      end
      item
        DataSet = PrescriptionFull
        DataSetName = 'PrescriptionFull'
      end
      item
        DataSet = Setup
        DataSetName = 'Setup'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 86.200000000000000000
      PaperHeight = 101.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 1.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 333.921460000000000000
        Top = 18.897650000000000000
        Width = 269.102536000000000000
        DataSet = PrescriptionFull
        DataSetName = 'PrescriptionFull'
        RowCount = 0
        object frxDBDataset2STORENAMEHEADING: TfrxMemoView
          AllowVectorExport = True
          Left = -0.279530000000000000
          Width = 259.925170000000000000
          Height = 12.118120000000000000
          DataField = 'STORENAMEHEADING'
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
            '[Setup."STORENAMEHEADING"]')
          ParentFont = False
        end
        object frxDBDataset2STOREADDRESSHEADING: TfrxMemoView
          AllowVectorExport = True
          Left = 1.008967270000000000
          Top = 14.007885000000000000
          Width = 259.925170000000000000
          Height = 9.838590000000000000
          DataField = 'STOREADDRESSHEADING'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."STOREADDRESSHEADING"]')
          ParentFont = False
        end
        object frxDBDataset2STOREPHONEHEADING: TfrxMemoView
          AllowVectorExport = True
          Left = -0.279530000000000000
          Top = 25.015770000000000000
          Width = 259.925170000000000000
          Height = 10.618120000000000000
          DataField = 'STOREPHONEHEADING'
          DataSet = Setup
          DataSetName = 'Setup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Setup."STOREPHONEHEADING"]')
          ParentFont = False
        end
        object MemoDuplicate: TfrxMemoView
          AllowVectorExport = True
          Left = -0.440940000000000000
          Top = 33.490182500000000000
          Width = 32.125984250000000000
          Height = 9.448818900000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Duplicate')
          ParentFont = False
        end
        object PrescriptionFullRX_NUMBER: TfrxMemoView
          AllowVectorExport = True
          Left = 20.177180000000000000
          Top = 178.771653540000000000
          Width = 43.464566930000000000
          Height = 9.448818900000000000
          DataField = 'RX_NUMBER'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_NUMBER"]')
          ParentFont = False
        end
        object PrescriptionFullRX_SERVICE_DATE: TfrxMemoView
          AllowVectorExport = True
          Left = 77.811070000000000000
          Top = 179.476500000000000000
          Width = 37.795275590000000000
          Height = 9.448818900000000000
          DataField = 'RX_SERVICE_DATE'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_SERVICE_DATE"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 243.330860000000000000
          Top = 179.476500000000000000
          Width = 18.754483640000000000
          Height = 9.448818900000000000
          DataField = 'TYPIST'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."TYPIST"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 115.504020000000000000
          Top = 179.527559060000000000
          Width = 123.432347730000000000
          Height = 9.448818900000000000
          DataField = 'NombreCompleto'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."NombreCompleto"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Top = 216.188976380000000000
          Width = 260.787401570000000000
          Height = 17.007874020000000000
          DataField = 'MedicamentoMixDefine'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."MedicamentoMixDefine"]')
          ParentFont = False
        end
        object InventarioNDC: TfrxMemoView
          AllowVectorExport = True
          Left = 0.377952760000000000
          Top = 202.051330000000000000
          Width = 263.169450000000000000
          Height = 7.559055120000000000
          DataField = 'InvInfo'
          DataSet = Inventario
          DataSetName = 'Inventario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Inventario."InvInfo"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 63.787406460000000000
          Top = 179.476500000000000000
          Width = 16.629923700000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Fe:')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = -0.279530000000000000
          Top = 261.523810000000000000
          Width = 261.629870000000000000
          Height = 18.618120000000000000
          DataField = 'MedicamentoMixDefine'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."MedicamentoMixDefine"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = -0.279530000000000000
          Top = 179.476500000000000000
          Width = 20.456692910000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Rx #:')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = -0.279530000000000000
          Top = 319.803340000000000000
          Width = 260.350532830000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Signature: ___________________________________________________')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = -0.279530000000000000
          Top = 252.346630000000000000
          Width = 151.551330000000000000
          Height = 9.448818900000000000
          DataField = 'Presc_FullName'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."Presc_FullName"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 30.279529990000000000
          Top = 43.738172510000000000
          Width = 61.133890000000000000
          Height = 14.397650000000000000
          DataField = 'RX_NUMBER'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_NUMBER"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Top = 46.738172510000000000
          Width = 30.413420000000000000
          Height = 10.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Rx #:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 0.755905510000000000
          Top = 57.858920840000000000
          Width = 218.896413320000000000
          Height = 13.118120000000000000
          DataField = 'NombreCompleto'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."NombreCompleto"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 110.639146660000000000
          Top = 46.738172510000000000
          Width = 20.069573330000000000
          Height = 10.618120000000000000
          DataField = 'TYPIST'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."TYPIST"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 165.267780000000000000
          Top = 47.238172510000000000
          Width = 52.488250000000000000
          Height = 10.618120000000000000
          DataField = 'RX_SERVICE_DATE'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_SERVICE_DATE"]')
          ParentFont = False
        end
        object BarCode2: TfrxBarCodeView
          AllowVectorExport = True
          Left = 221.761286660000000000
          Top = 36.661410000000000000
          Width = 37.425170000000000000
          Height = 147.400000000000000000
          Restrictions = [rfDontSize]
          BarType = bcCode128
          DataField = 'OTCNumber_Print'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Frame.Typ = []
          Rotation = 90
          TestLine = False
          Text = 'RX1234567'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ColorBar = clBlack
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 0.321122900000000000
          Top = 114.918676670000000000
          Width = 218.917439990000000000
          Height = 13.618120000000000000
          DataField = 'Presc_FullName'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."Presc_FullName"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 94.032776660000000000
          Top = 46.742733340000000000
          Width = 18.854360000000000000
          Height = 10.618120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Por:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 132.532776660000000000
          Top = 47.242733340000000000
          Width = 32.633890000000000000
          Height = 10.618120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Fecha:')
          ParentFont = False
        end
        object PrescriptionFullPAT_FULL_ADDRESS: TfrxMemoView
          AllowVectorExport = True
          Left = 1.658936360000000000
          Top = 69.742733340000000000
          Width = 217.620594240000000000
          Height = 7.559055120000000000
          DataField = 'PAT_FULL_ADDRESS'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."PAT_FULL_ADDRESS"]')
          ParentFont = False
        end
        object PrescriptionFullPRESC_TEL1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.753246660000000000
          Top = 124.742733340000000000
          Width = 156.854360000000000000
          Height = 7.897650000000000000
          DataField = 'PRESC_TEL'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."PRESC_TEL"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 0.629560910000000000
          Top = 77.255720590000000000
          Width = 220.040816660000000000
          Height = 36.902906670000000000
          DataField = 'RX_SIG'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_SIG"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 0.118120000000000000
          Top = 309.315090000000000000
          Width = 51.698206670000000000
          Height = 11.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Fecha Receta:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 52.375386670000000000
          Top = 309.315090000000000000
          Width = 39.187693330000000000
          Height = 11.118120000000000000
          DataField = 'RX_DATE'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_DATE"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 0.755905510000000000
          Top = 153.783550000000000000
          Width = 219.857143330000000000
          Height = 22.628633330000000000
          DataField = 'MedicamentoMixDefine'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."MedicamentoMixDefine"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 0.573593330000000000
          Top = 143.472440940000000000
          Width = 219.108843650000000000
          Height = 10.118120000000000000
          DataField = 'InvInfo'
          DataSet = Inventario
          DataSetName = 'Inventario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Inventario."InvInfo"]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Left = 0.312306660000000000
          Top = 194.425196850000000000
          Width = 267.222729130000000000
          Height = 7.559055120000000000
          DataField = 'PlanInfo'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."PlanInfo"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 18.177180000000000000
          Top = 231.661410000000000000
          Width = 49.133890000000000000
          Height = 13.228348900000000000
          DataField = 'RX_NUMBER'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_NUMBER"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 79.252010000000000000
          Top = 232.661410000000000000
          Width = 41.574805590000000000
          Height = 9.448818900000000000
          DataField = 'RX_SERVICE_DATE'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."RX_SERVICE_DATE"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 134.622140000000000000
          Top = 232.661410000000000000
          Width = 18.897650000000000000
          Height = 9.448818900000000000
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."QTY"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 121.106370000000000000
          Top = 232.661410000000000000
          Width = 15.118110240000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Qty:')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 170.578850000000000000
          Top = 232.661410000000000000
          Width = 18.897650000000000000
          Height = 9.448818900000000000
          DataField = 'TYPIST'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PrescriptionFull."TYPIST"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 67.854360000000000000
          Top = 232.661410000000000000
          Width = 13.578732830000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Fe:')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = -0.279530000000000000
          Top = 232.661410000000000000
          Width = 20.456692910000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Rx #:')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 156.220470000000000000
          Top = 232.846320000000000000
          Width = 16.118110240000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Por:')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = -0.279530000000000000
          Top = 242.661410000000000000
          Width = 151.460730000000000000
          Height = 9.448818900000000000
          DataField = 'NombreCompleto'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."NombreCompleto"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 152.960730000000000000
          Top = 252.161410000000000000
          Width = 19.066934020000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'NPI:')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 172.696970000000000000
          Top = 252.161410000000000000
          Width = 83.055118110000000000
          Height = 9.448818900000000000
          DataField = 'PRESC_NPI'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."PRESC_NPI"]')
          ParentFont = False
        end
        object PrescriptionFullDAYS_SUPPLY1: TfrxMemoView
          AllowVectorExport = True
          Left = 0.377952760000000000
          Top = 299.096192610000000000
          Width = 261.260050000000000000
          Height = 9.397650000000000000
          DataField = 'AvailableDefine2'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."AvailableDefine2"]')
          ParentFont = False
        end
        object MemoAvailable: TfrxMemoView
          AllowVectorExport = True
          Left = 0.909090900000000000
          Top = 131.722325450000000000
          Width = 219.212617950000000000
          Height = 11.338590000000000000
          DataField = 'AvailableDefine'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."AvailableDefine"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 280.440944880000000000
          Width = 266.353163910000000000
          Height = 9.397650000000000000
          DataField = 'PlanInfo'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."PlanInfo"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 290.023810000000000000
          Width = 262.677165350000000000
          Height = 9.070866140000000000
          DataField = 'InvInfo'
          DataSet = Inventario
          DataSetName = 'Inventario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Inventario."InvInfo"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 186.976500000000000000
          Width = 261.260050000000000000
          Height = 7.559055120000000000
          DataField = 'AvailableDefine2'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."AvailableDefine2"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 190.476500000000000000
          Top = 242.889920000000000000
          Width = 66.141732280000000000
          Height = 7.559055120000000000
          DataField = 'CARDHOLDERID'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."CARDHOLDERID"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 152.960730000000000000
          Top = 243.068446500000000000
          Width = 37.795300000000000000
          Height = 7.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cardholder ID:')
          ParentFont = False
        end
        object PrescriptionFullPAT_IDENTIFICATION: TfrxMemoView
          AllowVectorExport = True
          Left = 108.130434780000000000
          Top = 309.165354330000000000
          Width = 73.957651300000000000
          Height = 10.960629920000000000
          DataField = 'PAT_IDENTIFICATION'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."PAT_IDENTIFICATION"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 94.347826090000000000
          Top = 309.165354330000000000
          Width = 13.002554500000000000
          Height = 11.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ID:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 0.304347830000000000
          Top = 209.015393480000000000
          Width = 261.505108970000000000
          Height = 7.559055120000000000
          DataField = 'Presc_FullName2'
          DataSet = PrescriptionFull
          DataSetName = 'PrescriptionFull'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -5
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[PrescriptionFull."Presc_FullName2"]')
          ParentFont = False
        end
        object MemoUnderPaid: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Top = 306.141930000000000000
          Width = 11.338590000000000000
          Height = 7.559060000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'X')
          ParentFont = False
        end
      end
      object MemoPatEducation: TfrxMemoView
        AllowVectorExport = True
        Left = -3.779530000000000000
        Top = 497.677490000000000000
        Width = 750.157299530000000000
        Height = 505.905199210000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'PatEducation')
        ParentFont = False
      end
    end
  end
end
