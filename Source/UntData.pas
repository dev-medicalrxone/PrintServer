unit UntData;

interface

uses
  System.SysUtils, System.Classes, Registry, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet, midasLib, Midas,
  Soap.InvokeRegistry, System.Net.URLClient, Soap.Rio, Soap.SOAPHTTPClient,
  frxBarcode, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage,
  IdBaseComponent, IdIntercept, System.IniFiles, Winapi.Windows;

type
  TDM = class(TDataModule)
    FDConnectionRx: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    qPrescription_Full: TFDQuery;
    dspPrescription_Full: TDataSetProvider;
    dsPrescription_Full: TDataSource;
    cdsPrescription_Full: TClientDataSet;
    cdsPrescription_FullRX_SERVICE_DATE: TSQLTimeStampField;
    cdsPrescription_FullNO_REF_DISPENSADO: TIntegerField;
    cdsPrescription_FullPHARMACIST: TStringField;
    cdsPrescription_FullDAYS_SUPPLY: TIntegerField;
    cdsPrescription_FullAUTHORIZATION_NUMBER: TStringField;
    cdsPrescription_FullPRICE_TABLE_ID: TIntegerField;
    cdsPrescription_FullDRUG: TStringField;
    cdsPrescription_FullNDC: TStringField;
    cdsPrescription_FullTYPIST: TStringField;
    cdsPrescription_FullBATCH_NUMBER: TStringField;
    cdsPrescription_FullRX_NUMBER: TLargeintField;
    cdsPrescription_FullPRODUCT_ID: TIntegerField;
    cdsPrescription_FullRX_SIG: TWideStringField;
    cdsPrescription_FullRX_DATE: TSQLTimeStampField;
    cdsPrescription_FullPAT_CLIENT_NUMBER: TIntegerField;
    cdsPrescription_FullRXORIGINCODE: TStringField;
    cdsPrescription_FullPAT_NAME: TStringField;
    cdsPrescription_FullPAT_LASTNAME: TStringField;
    cdsPrescription_FullPAT_MAIDENNAME: TStringField;
    cdsPrescription_FullPAT_TELEPHONE: TStringField;
    cdsPrescription_FullPAT_CELULAR: TStringField;
    cdsPrescription_FullPAT_SEX: TIntegerField;
    cdsPrescription_FullPAT_DOB: TSQLTimeStampField;
    cdsPrescription_FullPRESC_NUMBER: TIntegerField;
    cdsPrescription_FullPRESC_MAIDENNAME: TStringField;
    cdsPrescription_FullPRESC_LASTNAME: TStringField;
    cdsPrescription_FullPRESC_NAME: TStringField;
    cdsPrescription_FullPRESC_TEL: TStringField;
    cdsPrescription_FullPRESC_FAX: TStringField;
    cdsPrescription_FullPRESC_NPI: TStringField;
    cdsPrescription_FullPRESC_EMAIL: TWideStringField;
    cdsPrescription_FullPRESC_ADD1: TStringField;
    cdsPrescription_FullPRESC_STATE: TWideStringField;
    cdsPrescription_FullPRESC_ZIP: TWideStringField;
    cdsPrescription_FullPRESC_ADDRESS2: TWideStringField;
    cdsPrescription_FullPRESC_CITY: TWideStringField;
    cdsPrescription_FullPRESC_CEL: TWideStringField;
    cdsPrescription_FullDEA_FEDERAL: TStringField;
    cdsPrescription_FullPLAN_BINNUBER: TStringField;
    cdsPrescription_FullPLAN_SUPPORT_TEL: TStringField;
    cdsPrescription_FullRX_REF_AUTHORIZED: TSmallintField;
    cdsPrescription_FullRX_LAST_REFILL_DATE: TSQLTimeStampField;
    cdsPrescription_FullHealth_plan_abbreviation: TStringField;
    cdsPrescription_FullWF_BILLED: TWideStringField;
    cdsPrescription_FullWF_PRINTED: TWideStringField;
    cdsPrescription_FullWF_FILLED: TWideStringField;
    cdsPrescription_FullWF_CHECKED: TWideStringField;
    cdsPrescription_FullWF_DELIVERED: TWideStringField;
    cdsPrescription_FullWF_TYPED: TWideStringField;
    cdsPrescription_FullRX_ID: TIntegerField;
    cdsPrescription_FullMED_CHART: TBooleanField;
    cdsPrescription_FullCLAIM_STATUS: TIntegerField;
    cdsPrescription_FullFACILITY_ID: TIntegerField;
    cdsPrescription_FullPATPLAN_NUMBER: TIntegerField;
    cdsPrescription_FullCOMPOUNDCODE: TIntegerField;
    cdsPrescription_FullPRESCRIBERIDQUALIFIER: TStringField;
    cdsPrescription_FullMETRICDECIMALQUANTITY: TIntegerField;
    cdsPrescription_FullRX_ACTIVE: TBooleanField;
    cdsPrescription_FullSIG: TWideStringField;
    cdsPrescription_FullNombreCompleto: TStringField;
    cdsPrescription_FullPresc_FullName: TStringField;
    qSetup: TFDQuery;
    dspSetup: TDataSetProvider;
    cdsSetup: TClientDataSet;
    dsSetup: TDataSource;
    cdsSetupSTORENAMEHEADING: TStringField;
    cdsSetupSTOREADDRESSHEADING: TStringField;
    cdsSetupSTOREPHONEHEADING: TStringField;
    cdsPrescription_FullMEDICAMENTOMIX: TStringField;
    CDSInventario: TClientDataSet;
    CDSInventarioTIPO: TStringField;
    CDSInventarioFECHA_EXPIRACION: TSQLTimeStampField;
    CDSInventarioCODIGO: TStringField;
    CDSInventarioDEPARTAMENTO: TSmallintField;
    CDSInventarioLOTE: TStringField;
    CDSInventarioCOMESPECIAL: TSQLTimeStampField;
    CDSInventarioTERMINAESPECIAL: TSQLTimeStampField;
    CDSInventarioULTIMOCAMBIO: TStringField;
    CDSInventarioULTIMAVENTA: TSQLTimeStampField;
    CDSInventarioCODIGOBARRA: TStringField;
    CDSInventarioFOODITEM: TSmallintField;
    CDSInventarioNONEBC: TSmallintField;
    CDSInventarioNUMEROSUPLIDOR: TIntegerField;
    CDSInventarioPRODUCTNO: TAutoIncField;
    CDSInventarioSUB_DEPARTAMENTO: TSmallintField;
    CDSInventarioDESCRIPCION: TStringField;
    CDSInventarioROUTEOFADMINISTRATION: TStringField;
    CDSInventarioCONTROLADO: TStringField;
    CDSInventarioSTRENGTH: TStringField;
    CDSInventarioINFOADICIONAL: TStringField;
    CDSInventarioCAUTION1: TSmallintField;
    CDSInventarioCAUTION2: TSmallintField;
    CDSInventarioCAUTION3: TSmallintField;
    CDSInventarioGENERICNAME: TStringField;
    CDSInventarioBRAND: TStringField;
    CDSInventarioRECETARIO: TStringField;
    CDSInventarioDESCUENTO: TStringField;
    CDSInventarioIMAGE_CODE: TStringField;
    CDSInventarioPACKAGESIZE: TIntegerField;
    CDSInventarioSTATUS: TStringField;
    CDSInventarioPO: TStringField;
    CDSInventarioisbn: TStringField;
    CDSInventarioNDC: TWideStringField;
    CDSInventarioMETRIC_UNIT: TWideStringField;
    CDSInventarioROBOT: TIntegerField;
    CDSInventarioROBOT_NDC: TWideStringField;
    CDSInventarioALCHEMY_PRODUCTID: TIntegerField;
    CDSInventarioMARKET_STATUS: TWideStringField;
    CDSInventarioOUTERPACKAGEUNIT: TWideStringField;
    CDSInventarioPAKAGE_ID: TIntegerField;
    CDSInventarioCOBRAR_TAX: TIntegerField;
    CDSInventarioREVENUE_CODE: TWideStringField;
    CDSInventarioHCPCS: TWideStringField;
    CDSInventarioCASA_FARMACEUTICA: TStringField;
    CDSInventarioVERSION_DESCRIPTION: TWideStringField;
    CDSInventarioPAKAGE_DESCRIPTION: TWideStringField;
    CDSInventarioAllowControledRefills: TBooleanField;
    CDSInventarioMedicamentoStr: TStringField;
    DSInventario: TDataSource;
    DSPInventario: TDataSetProvider;
    qInventario: TFDQuery;
    qCompounds: TFDQuery;
    dspCompounds: TDataSetProvider;
    dsCompounds: TDataSource;
    cdsCompounds: TClientDataSet;
    cdsCompoundsMEDICAMENTO: TStringField;
    cdsCompoundsMETRICQUANTITY: TIntegerField;
    cdsCompoundsPRECIOVENTA: TSingleField;
    cdsCompoundsAWP: TSingleField;
    cdsCompoundsCOSTO: TSingleField;
    cdsCompoundsPRODUCT_ID_QUALIFIER: TStringField;
    cdsCompoundsING_BASIS_OFCOST_DET: TStringField;
    cdsCompoundsNDC: TStringField;
    cdsCompoundsMEZCLASNO: TAutoIncField;
    cdsCompoundsPRODUCT_ID: TIntegerField;
    cdsCompoundsNO_TRANS: TIntegerField;
    cdsCompoundsNUMERORECETA: TLargeintField;
    cdsCompoundsFECHA_MEZCLA: TSQLTimeStampField;
    qWarningLabels: TFDQuery;
    dspWarningLabels: TDataSetProvider;
    dsWarningLabels: TDataSource;
    cdsWarningLabels: TClientDataSet;
    cdsWarningLabelsWarningLabelID: TIntegerField;
    cdsWarningLabelsLanguageCode: TStringField;
    cdsWarningLabelsWarningLabelGroupID: TIntegerField;
    cdsWarningLabelsWarning: TStringField;
    FDQuery1: TFDQuery;
    qPrintQueries: TFDQuery;
    dspPrintQueries: TDataSetProvider;
    cdsPrintQueries: TClientDataSet;
    dsPrintQueries: TDataSource;
    cdsPrescription_FullMedicamentoMixDefine: TStringField;
    cdsPrescription_FullADHERENCE: TBooleanField;
    cdsPrescription_FullPayment_Line: TStringField;
    cdsPrescription_FullAvailableDefine: TStringField;
    cdsPrescription_FullNO_REFILL: TFloatField;
    cdsPrescription_FullOTCNumber_Print: TStringField;
    cdsPrescription_FullPAT_ADDRESS1: TStringField;
    cdsPrescription_FullPAT_ADDRESS2: TWideStringField;
    cdsPrescription_FullPAT_CITY: TStringField;
    cdsPrescription_FullPAT_STATE: TStringField;
    cdsPrescription_FullPAT_ZIPCODE: TWideStringField;
    cdsPrescription_FullPAT_FULL_ADDRESS: TStringField;
    cdsPrescription_FullCaution1: TStringField;
    cdsPrescription_FullCaution2: TStringField;
    cdsPrescription_FullCaution3: TStringField;
    cdsPrescription_FullCaution4: TStringField;
    cdsPrescription_FullPatEducation: TStringField;
    cdsPrescription_FullCaution5: TStringField;
    cdsPrescription_FullPatPayAmount: TStringField;
    cdsPrescription_FullPAT_IDENTIFICATION: TStringField;
    cdsPrescription_FullBILL_LATTER: TBooleanField;
    cdsPrescription_FullRX_STATUS_DEFINE: TStringField;
    cdsPrescription_FullRX_ORIGIN_CODE_DEFINE: TStringField;
    DSPOTC: TDataSetProvider;
    DSOTC: TDataSource;
    CDSOTC: TClientDataSet;
    CDSOTCOTCNUMBER: TIntegerField;
    CDSOTCNDC: TStringField;
    CDSOTCMEDICAMENTO: TStringField;
    CDSOTCATENDIDOPOR: TStringField;
    CDSOTCCOBRADO: TStringField;
    CDSOTCFECHAOTC: TSQLTimeStampField;
    CDSOTCRX: TStringField;
    CDSOTCNUMEROCLIENTE: TIntegerField;
    CDSOTCMEDICAMENTOMIX: TStringField;
    CDSOTCOTC_BARCODE: TStringField;
    CDSOTCNUMEROTRANSACCION: TIntegerField;
    CDSOTCNUMERO_AUTORIZACION: TStringField;
    CDSOTCPARTIAL_COMPLETION: TStringField;
    CDSOTCRX_STATUS: TStringField;
    CDSOTCNO_REF_DISPENSADO: TIntegerField;
    CDSOTCPHARMACIST: TStringField;
    CDSOTCDAYS_SUPPLY: TIntegerField;
    CDSOTCPAGADA: TStringField;
    CDSOTCPRODUCT_ID: TIntegerField;
    CDSOTCPLAN_MEDICO: TStringField;
    CDSOTCSTATUS_CODE: TStringField;
    CDSOTCTIME_RX: TSQLTimeStampField;
    CDSOTCNO_HORA: TIntegerField;
    CDSOTCNUMEROPLAN: TIntegerField;
    CDSOTCLOTE: TStringField;
    CDSOTCMETRICDECIMALQUANTITY: TIntegerField;
    CDSOTCSIGNATURE_LINK: TIntegerField;
    CDSOTCREC_RELACION: TStringField;
    CDSOTCCHECKED: TIntegerField;
    CDSOTCUSUARIO_NO: TIntegerField;
    CDSOTCNUMERORECETA: TLargeintField;
    CDSOTCMEZCLA_TRAN_NO: TIntegerField;
    CDSOTCBATCH_NUMBER: TIntegerField;
    CDSOTCPRICE_TABLE_ID: TIntegerField;
    CDSOTCWF_BILLED: TWideStringField;
    CDSOTCWF_PRINTED: TWideStringField;
    CDSOTCWF_FILLED: TWideStringField;
    CDSOTCWF_CHECKED: TWideStringField;
    CDSOTCWF_DELIVERED: TWideStringField;
    CDSOTCWF_TYPED: TWideStringField;
    CDSOTCMED_CHART: TBooleanField;
    CDSOTCCLAIM_STATUS: TIntegerField;
    CDSOTCCLAIM_STATUS_DEFINE: TStringField;
    CDSOTCADHERENCE: TBooleanField;
    CDSOTCOTC_BARCODE_DEF: TStringField;
    CDSOTCBILL_LATTER: TBooleanField;
    SQLDSOTC_FD: TFDQuery;
    CREATE_DELETE_PRINT_QUERIES: TFDQuery;
    QBorrarNonMatchedNDC: TFDQuery;
    DELETE_PRINT_QUERIES: TFDStoredProc;
    ALTER_DELETE_PRINT_QUERIES: TFDQuery;
    FDTransactionRx: TFDTransaction;
    qMaxPrintQ_ID: TFDQuery;
    dspMaxPrintQ_ID: TDataSetProvider;
    dsMaxPrintQ_ID: TDataSource;
    cdsMaxPrintQ_ID: TClientDataSet;
    cdsMaxPrintQ_IDID: TIntegerField;
    DSPMedOriginal: TDataSetProvider;
    DataSource2: TDataSource;
    CDSMedOriginal: TClientDataSet;
    CDSMedOriginalMedicamentoStr: TStringField;
    CDSMedOriginalDESCRIPCION: TStringField;
    CDSMedOriginalSTRENGTH: TStringField;
    CDSMedOriginalTIPO: TStringField;
    CDSMedOriginalPRODUCTNO: TIntegerField;
    CDSMedOriginalALCHEMY_PRODUCTID: TIntegerField;
    CDSMedOriginalBrand: TStringField;
    SQLDSMedOriginal_FD: TFDQuery;
    cdsSetupLABEL_PRINT_QTYAVAILABEL: TBooleanField;
    cdsSetupGSDD_VERSION: TIntegerField;
    cdsSetupGoldStandardActive: TBooleanField;
    cdsSetupEDUCATION_FONT_SIZE: TIntegerField;
    cdsSetupCAUTIONS_FONT_SIZE: TIntegerField;
    cdsPrescription_FullCompound_NDC: TStringField;
    cdsPrescription_FullCompound_Lote: TStringField;
    cdsPrescription_FullCompound_Expi: TDateField;
    cdsPrescription_FullAvailableDefine2: TStringField;
    cdsPrescription_FullPlanInfo: TStringField;
    cdsPrescription_FullDrugInfo: TStringField;
    cdsPrescription_FullWF_STORAGE: TWideStringField;
    cdsPrescription_FullWF_CASHIER: TWideStringField;
    cdsPrescription_FullWF_SIGNATURE: TWideStringField;
    QPatPlan2: TFDQuery;
    dspPatPlan2: TDataSetProvider;
    dsPatPlan2: TDataSource;
    cdsPatPlan2: TClientDataSet;
    cdsPatPlan2NUMEROCLIENTE: TIntegerField;
    cdsPatPlan2NUMEROPLAN: TAutoIncField;
    cdsPatPlan2PLANMEDICO: TStringField;
    cdsPatPlan2RELACION: TSmallintField;
    cdsPatPlan2PERSONCODE: TStringField;
    cdsPatPlan2INACTIVE_DATE: TSQLTimeStampField;
    cdsPatPlan2CARDHOLDERID: TStringField;
    cdsPatPlan2NOGRUPO: TStringField;
    cdsPatPlan2HOME_PLAN: TStringField;
    cdsPatPlan2PLAN_ID: TStringField;
    cdsPatPlan2ELIGIBILITY_CLARIF_CODE: TStringField;
    cdsPatPlan2FACILITY_ID: TStringField;
    cdsPatPlan2CH_FIRSTNAME: TStringField;
    cdsPatPlan2CH_LASTNAME: TStringField;
    cdsPatPlan2MEDIGAP_ID: TStringField;
    cdsPatPlan2MEDICAID_INDICATOR: TStringField;
    cdsPatPlan2PAAI: TStringField;
    cdsPatPlan2PP997_G2: TStringField;
    cdsPatPlan2MEDICAID_ID_NUMBER: TStringField;
    cdsPatPlan2MEDICAID_AGENCY_NUMBER: TStringField;
    cdsPatPlan2ACTIVO: TBooleanField;
    cdsPatPlan2PLAN_PRIMARIO: TBooleanField;
    cdsPatPlan2CARD_IMAGE: TIntegerField;
    cdsPrescription_FullCARDHOLDERID: TStringField;
    CDSInventarioInvInfo: TStringField;
    DSPPlanesMedicos: TDataSetProvider;
    DSPlanesMedicos: TDataSource;
    CDSPlanesMedicos: TClientDataSet;
    CDSPlanesMedicosABREVIATURA: TStringField;
    CDSPlanesMedicosBINNUMBER: TStringField;
    CDSPlanesMedicosTELEFONO: TStringField;
    CDSPlanesMedicosVERSIONCOL: TStringField;
    CDSPlanesMedicosTONOPULSO: TStringField;
    CDSPlanesMedicosVELOCIDAD: TIntegerField;
    CDSPlanesMedicosBITSDATA: TIntegerField;
    CDSPlanesMedicosPARIDAD: TStringField;
    CDSPlanesMedicosPROCESSORCONTROL: TStringField;
    CDSPlanesMedicosTELEFONO_SERVICIO1: TStringField;
    CDSPlanesMedicosSOFTWARE_VENDOR_ID: TStringField;
    CDSPlanesMedicosDISPENSING_FEE: TSingleField;
    CDSPlanesMedicosTELEFONO_SERVICIO2: TStringField;
    CDSPlanesMedicosPRECIO_CASH_AWP: TStringField;
    CDSPlanesMedicosNUMEROFARMACIA: TStringField;
    CDSPlanesMedicosSERVICE_PROVIDER_ID_QUAL: TStringField;
    CDSPlanesMedicosPROVIDERIDQUALIFIER: TStringField;
    CDSPlanesMedicosPLANESMEDICOSNO: TIntegerField;
    CDSPlanesMedicosSTOPBITS: TSmallintField;
    CDSPlanesMedicosCONSIDER_NON_MATCHENDC: TStringField;
    CDSPlanesMedicosENVIAR_CAMPO_ET: TIntegerField;
    CDSPlanesMedicosGROUP_BY: TIntegerField;
    CDSPlanesMedicosPRICE_TABLE_ID: TIntegerField;
    CDSPlanesMedicosOVERRIDE_SYSTEM_DEFAULT_PRICE: TBooleanField;
    SQLDSPlanesMedicos_FD: TFDQuery;
    cdsPrescription_FullRX_NUMBER_HEADING: TStringField;
    cdsPrescription_FullPresc_FullName2: TStringField;
    cdsPrescription_FullPlanInfo2_NoShowPP: TStringField;
    cdsSetupPrintPagoPlan: TBooleanField;
    cdsSetupPLAN_MEDICO_ABREVIATURA: TBooleanField;
    cdsSetupSTAR_PLUS_INTERFACE: TBooleanField;
    cdsSetupRX_SHOW_NOREFDISP_FLOAT: TBooleanField;
    QCountTTransOTCQ: TFDQuery;
    dsQCountTTransOTCQ: TDataSource;
    QCountTTransOTC: TClientDataSet;
    QCountTTransOTCTTransRefill: TIntegerField;
    dspQCountTTransOTCQ: TDataSetProvider;
    sqlTransHeader: TFDQuery;
    sqlTransDetail: TFDQuery;
    dspTransHead: TDataSetProvider;
    dspTransDetail: TDataSetProvider;
    CDSTransHead: TClientDataSet;
    dsTransHead: TDataSource;
    dsTransDetail: TDataSource;
    cdsSetupPOLEDISPLAYMESSAGE: TStringField;
    cdsSetupSTOREZIPCODE: TStringField;
    cdsPrescription_FullRX_CONTROL: TWideStringField;
    cdsPrescription_FullDAW: TSmallintField;
    cdsSetupemail: TWideStringField;
    cdsSetupemail_Host: TWideStringField;
    cdsSetupemail_Password: TWideStringField;
    cdsSetupemail_Username: TWideStringField;
    cdsSetupemail_Port: TIntegerField;
    cdsPrescription_FullLABEL_LINE1: TStringField;
    cdsSetupPUEBLO: TStringField;
    cdsSetupSTORETELEPHONE: TStringField;
    cdsSetupSTOREADDRESS: TStringField;
    cdsSetupPueblo_Zip: TStringField;
    cdsSetupLOGO: TBlobField;
    sqlTransDetail_Temp: TFDQuery;
    dspTransDetail_Temp: TDataSetProvider;
    dsTransDetail_Temp: TDataSource;
    cdsTransDetail_Temp: TClientDataSet;
    cdsTransDetail_TempPRODDESC_DEFINE: TStringField;
    qPasswords: TFDQuery;
    dspPasswords: TDataSetProvider;
    dsPasswords: TDataSource;
    cdsPasswords: TClientDataSet;
    cdsPasswordsUSERNAME: TStringField;
    cdsPasswordsINICIALES: TStringField;
    cdsPrescription_FullRX_QTY_AVAILABLE: TFMTBCDField;
    cdsPrescription_FullQTY: TFMTBCDField;
    CDSInventarioQTYINVENTARIO: TFMTBCDField;
    cdsPrescription_FullSALES_COST: TFMTBCDField;
    cdsPrescription_FullPLAN_PAY_AMOUNT: TFMTBCDField;
    cdsPrescription_FullPAT_PAY_AMOUNT: TFMTBCDField;
    cdsPrescription_FullAWP: TFMTBCDField;
    cdsPrescription_FullRX_QTY_PRESCRIBED: TFloatField;
    cdsPrescription_FullTOTAL: TFMTBCDField;
    cdsPrescription_FullCASH_RETAIL_PRICE: TFMTBCDField;
    cdsPrescription_FullRX_DISPENSING_FEE_PAID: TFMTBCDField;
    cdsPrescription_FullRX_OTHER_AMOUNT_PAID: TFMTBCDField;
    cdsPrescription_FullEarning: TFloatField;
    CDSInventarioCOSTO: TFMTBCDField;
    CDSInventarioRBP: TFMTBCDField;
    CDSInventarioESPECIAL: TFMTBCDField;
    CDSInventarioMETRICSIZE: TFMTBCDField;
    CDSInventarioPRECIO: TFMTBCDField;
    CDSInventarioCMAXINVENTARIO: TFMTBCDField;
    CDSInventarioCMININVENTARIO: TFMTBCDField;
    CDSOTCTOTAL: TFMTBCDField;
    CDSOTCCOSTOVENTA: TFMTBCDField;
    CDSOTCPAGO_PLAN: TFMTBCDField;
    CDSOTCDEDUCIBLE: TFMTBCDField;
    CDSOTCINCENTIVE_FEE_PAID: TFMTBCDField;
    CDSOTCDISPENSING_FEE_PAID: TFMTBCDField;
    CDSOTCOTHER_AMOUNT_PAID: TFMTBCDField;
    CDSOTCAMOUNT_COPAY_COINS: TFMTBCDField;
    CDSOTCGANANCIA: TFMTBCDField;
    CDSOTCPRECIOFACTURACION: TFMTBCDField;
    CDSOTCINGREDIENT_COST_PAID: TFMTBCDField;
    cdsCompoundsCANTIDADRECETADA: TFMTBCDField;
    cdsCompoundsCANTIDADDESPACHADA: TFMTBCDField;
    cdsTransDetail_TempIDNUMBER: TAutoIncField;
    cdsTransDetail_TempTRANSACTIONNUMBER: TIntegerField;
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
    cdsTransDetail_TempTAX_ESTATAL: TStringField;
    cdsTransDetail_TempTAX_MUNICIPAL: TStringField;
    cdsTransDetail_TempQTY: TFloatField;
    cdsTransDetail_TempOPENED: TStringField;
    cdsTransDetail_TempGROUP_PROD: TStringField;
    cdsTransDetail_TempREGISTER: TSmallintField;
    cdsTransDetail_TempSUPERVISOR: TStringField;
    cdsTransDetail_TempPATROCINIO: TSmallintField;
    cdsTransDetail_TempSUBDEPARTAMENTO: TSmallintField;
    cdsTransDetail_TempBARCODEALTERNO1: TWideStringField;
    cdsTransDetail_TempBARCODEALTERNO2: TWideStringField;
    cdsTransDetail_TempBAG_NUMBER: TIntegerField;
    cdsTransDetail_TempTRANS_TIME: TSQLTimeStampField;
    cdsTransDetail_TempUTILIDAD: TBooleanField;
    cdsTransDetail_TempOTC_NUMBER: TIntegerField;
    cdsTransDetail_TempTAX_SERVICIO: TBooleanField;
    cdsTransDetail_TempTAX: TFMTBCDField;
    cdsTransDetail_TempCOSTO: TFMTBCDField;
    cdsTransDetail_TempPRICE: TFMTBCDField;
    cdsTransDetail_TempTOTAL: TFMTBCDField;
    cdsTransDetail_TempREGTOTAL: TFMTBCDField;
    cdsTransDetail_TempREGPRICE: TFMTBCDField;
    cdsTransDetail_TempAWP: TFMTBCDField;
    cdsTransDetail_TempTOTAL_VALUE: TFMTBCDField;
    cdsTransDetail_TempDISCOUNT: TFMTBCDField;
    cdsTransDetail_TempNOTE: TWideStringField;
    cdsTransDetail_TempKITCHEN: TBooleanField;
    cdsTransDetail_TempTERMINO: TWideStringField;
    cdsTransDetail_TempMAIN_COURSE: TBooleanField;
    cdsTransDetail_TempMAIN_COURSE_ID: TIntegerField;
    cdsTransDetail_TempPRINTED: TBooleanField;
    cdsTransDetail_TempINVCONTROL_RECIPE: TBooleanField;
    cdsTransDetail_TempBUTTON_QTY: TFMTBCDField;
    cdsTransDetail_TempUPC: TStringField;
    cdsTransDetail_TempTAB_SAVED: TBooleanField;
    cdsTransDetail_TempCOMMISSION: TFMTBCDField;
    cdsTransDetail_TempTAX_PROCESSED_FOOD: TBooleanField;
    CDSOTCPatEducation: TStringField;
    CDSOTCCaution1: TStringField;
    CDSOTCCaution2: TStringField;
    CDSOTCCaution3: TStringField;
    CDSOTCCaution4: TStringField;
    CDSOTCCaution5: TStringField;
    frxBarCodeObject1: TfrxBarCodeObject;
    cdsSetupPOS_PRINT_LOGO: TBooleanField;
    cdsSetupROUTINGDATA: TStringField;
    cdsSetupMODEMCOMPORT: TIntegerField;
    cdsSetupSTORENAME: TStringField;
    cdsSetupFACTURARECIBO: TStringField;
    cdsSetupSETTLEMENTBANKID: TStringField;
    cdsSetupCHEQUE: TIntegerField;
    cdsSetupTELEFONO: TStringField;
    cdsSetupDOSWINDOWS: TStringField;
    cdsSetupPOLEDISPLAYCOMPORT: TIntegerField;
    cdsSetupHEADING: TStringField;
    cdsSetupLABELLONGFORM: TStringField;
    cdsSetupFARMACIA: TStringField;
    cdsSetupSEARCHBY: TStringField;
    cdsSetupNOCAJA: TIntegerField;
    cdsSetupRXNOCONTINUO: TStringField;
    cdsSetupINTERACCION: TStringField;
    cdsSetupMESSAGEID: TStringField;
    cdsSetupVERSIONCOL: TStringField;
    cdsSetupBANKID: TStringField;
    cdsSetupMERCHANTID: TStringField;
    cdsSetupTERMINALTYPE: TStringField;
    cdsSetupNUMERO_TRANS: TIntegerField;
    cdsSetupESTADO: TStringField;
    cdsSetupMENSAGE: TStringField;
    cdsSetupNEXT_BARCODE: TStringField;
    cdsSetupDATA_COLECTOR_COLUMNS: TIntegerField;
    cdsSetupPORCIENTO_AWP: TSingleField;
    cdsSetupNO_FARMACIA: TIntegerField;
    cdsSetupTAX_RATE: TFloatField;
    cdsSetupTAX_RATE_FROM: TFloatField;
    cdsSetupTAX_RATE_ESTATAL: TFloatField;
    cdsSetupCOBRAR_OTC_TAX: TStringField;
    cdsSetupIVULOTO_MERCHANT_ID: TStringField;
    cdsSetupIVULOTO_PASSWORD: TStringField;
    cdsSetupPORCIENTO_PATROCINIO: TFloatField;
    cdsSetupNABP: TWideStringField;
    cdsSetupNPI: TWideStringField;
    cdsSetupDRUG_INTERACTION_SEVERITY: TIntegerField;
    cdsSetupSURESCRIPT_DIRECTORY_UPDATE: TDateField;
    cdsSetupSCANED_IMAGE_ADDRESS: TWideStringField;
    cdsSetupADDRESS2: TWideStringField;
    cdsSetupSURESCRIPT_IP: TWideStringField;
    cdsSetupePrescribePrinterName: TWideStringField;
    cdsSetupPrintRxExpirationDate: TBooleanField;
    cdsSetupPrintPatDir: TBooleanField;
    cdsSetupEnforcePrescribersNPI: TBooleanField;
    cdsSetupVerificarTelefonoPaciente: TBooleanField;
    cdsSetupPriceUpdate_ChangeProductName: TBooleanField;
    cdsSetupPriceUpdate_ChangeManufacturer: TBooleanField;
    cdsSetupPROCEDURE_ADD_ON: TWideStringField;
    cdsSetupRX_EXPIRATION_DAYS: TIntegerField;
    cdsSetupWC_REMINDER1_NODAYS: TSmallintField;
    cdsSetupWC_REMINDER2_NODAYS: TSmallintField;
    cdsSetupWC_REMINDER3_NODAYS: TSmallintField;
    cdsSetupWC_CONTACT_HOUR1: TSQLTimeStampField;
    cdsSetupWC_CONTACT_HOUR2: TSQLTimeStampField;
    cdsSetupWC_AUTOLOGOUT: TBooleanField;
    cdsSetupWC_DAYSTO_RTS: TSmallintField;
    cdsSetupWC_REMINDER_MESSAGE_SPANISH: TWideStringField;
    cdsSetupWC_INSERT_BATCH_RX: TBooleanField;
    cdsSetupWC_SMS_USER: TWideStringField;
    cdsSetupWC_SMS_API_ID: TIntegerField;
    cdsSetupWC_REMINDER_MESSAGE_ENGLISH: TWideStringField;
    cdsSetupWC_SMS_TELEPHONE: TWideStringField;
    cdsSetupWC_LOGOUT_SECONDS: TSmallintField;
    cdsSetupWC_SEND_AMOUNT_DUE: TBooleanField;
    cdsSetupWC_BROADCASTBYPHONE: TBooleanField;
    cdsSetupEnforceCustTelUpdate: TBooleanField;
    cdsSetupRX_CONTROLED_EXPIRATION_DAYS: TIntegerField;
    cdsSetupWC_SIP_SERVER: TWideStringField;
    cdsSetupWC_SIP_USER: TWideStringField;
    cdsSetupWC_SIP_PASSWORD: TWideStringField;
    cdsSetupWC_SMS_PROVIDER: TWideStringField;
    cdsSetupWC_INTERFACE: TWideStringField;
    cdsSetupWC_INTERFACE_HOST: TWideStringField;
    cdsSetupWC_INTERFACE_PORT: TIntegerField;
    cdsSetupNON_WESCOM_STORE: TBooleanField;
    cdsSetupWC_STOP_TAG_SEARCH_INTERVAL: TIntegerField;
    cdsSetupSCAN_COLOR: TBooleanField;
    cdsSetupDAW_DEFAULT_VALUE: TWideStringField;
    cdsSetupIVR: TBooleanField;
    cdsSetupDAYS_TO_REFILL_REMIND: TIntegerField;
    cdsSetupPOS_SHOW_RX_SIGNATURE: TBooleanField;
    cdsSetupPOS_SIGNATURE_PASSWORD: TBooleanField;
    cdsSetupRX30_CONVERTION: TBooleanField;
    cdsSetupCLASIC_SIG_CODES: TBooleanField;
    cdsSetupePresc_Q_Days: TIntegerField;
    cdsSetupePresc_Timer_Interval: TIntegerField;
    cdsSetupCHANGE_DRUG_REF: TBooleanField;
    cdsSetupAUTOMATIC_CLAIM_REVERSAL: TBooleanField;
    cdsSetupBATCH_REQUIRED: TBooleanField;
    cdsSetupTS_DOC_LIC: TBooleanField;
    cdsSetupTS_ORIGIN_CODE: TBooleanField;
    cdsSetupTS_SERVICE_DATE: TBooleanField;
    cdsSetupTS_RX_DATE: TBooleanField;
    cdsSetupTS_EXP_DATE: TBooleanField;
    cdsSetupTS_BATCH_NO: TBooleanField;
    cdsSetupTS_COST: TBooleanField;
    cdsSetupTS_AUTO_REFILL: TBooleanField;
    cdsSetupTS_DAW: TBooleanField;
    cdsSetupALLERGY_AUTHORIZATION: TBooleanField;
    cdsSetupGSDD_FOLDER: TWideStringField;
    cdsSetupWC_MAKE_FIRST_NOTIFICATION: TBooleanField;
    cdsSetupCOSTO_CALCULADO: TBooleanField;
    cdsSetupSAVE_CLAIM_TRANSACTIONS: TBooleanField;
    cdsSetupSILENT_BILLING_NEWRX: TBooleanField;
    cdsSetupROBOT: TWideStringField;
    cdsSetupGSDD_DAYS_TO_COMPARE: TIntegerField;
    cdsSetupWF_ENFORCE_FILL: TBooleanField;
    cdsSetupNEWRX_INTERACTIONS: TBooleanField;
    cdsSetupSALESTECH_STAND_ALONE: TBooleanField;
    cdsSetupDONOTBILLINACTIVE_PRODUCT: TBooleanField;
    cdsSetupCONFIRM_OPEN_REGISTER: TBooleanField;
    cdsSetupCD_MERCHANT_ID: TStringField;
    cdsSetupCD_TERMINAL_ID: TStringField;
    cdsSetupCD_COMUNICATION_PORT: TStringField;
    cdsSetupCD_SERVER_IP: TStringField;
    cdsSetupCD_SECUREDEVICE_EMV: TStringField;
    cdsSetupCD_SECURE_DEVICE: TStringField;
    cdsSetupCD_PINPAD_TYPE: TStringField;
    cdsSetupCD_LOG_ACTIVATION: TBooleanField;
    cdsSetupCD_ACTIVE: TBooleanField;
    cdsSetupPOS_IMPORT_SIGNATURE: TBooleanField;
    cdsSetupSHOW_IMAGES_NEWRX: TBooleanField;
    cdsSetupCLEAN_OTC: TDateField;
    cdsSetupCHECK_ALLERGIES_NEWRX: TBooleanField;
    cdsSetupH_LOGOUT_SECONDS: TIntegerField;
    cdsSetupSAVEIMAGETODATABASE: TBooleanField;
    cdsSetupAMAZON: TBooleanField;
    cdsSetupAMAZON_ACCOUNT_KEY: TWideStringField;
    cdsSetupAMAZON_ACCOUNT_NAME: TWideStringField;
    cdsSetupAMAZON_BUCKET_NAME: TWideStringField;
    cdsSetupBYPASS_PAT_VERIFICATION: TBooleanField;
    cdsSetupBYPASS_PRESC_VERIFICATION: TBooleanField;
    cdsSetupPLUGIN_DISPILL: TBooleanField;
    cdsSetupPLUGIN_APPRISS: TBooleanField;
    cdsSetupPLUGIN_SMARTPICKUP: TBooleanField;
    cdsSetupPOS_INCLUDE_BATCH: TBooleanField;
    cdsSetupAPPRISS_USERNAME: TWideStringField;
    cdsSetupAPPRISS_PASSWORD: TWideStringField;
    cdsSetupDEA: TStringField;
    cdsSetupID: TAutoIncField;
    cdsSetupBYPASS_FIRMA_ELECTRONICA: TBooleanField;
    cdsSetupCLASSIC_LOGIN: TBooleanField;
    cdsSetupSP_SELECTALL: TBooleanField;
    cdsSetupSURESCRIPT_VERSION: TWideStringField;
    cdsSetupPOS_USER_INDIVIDUAL_BALANCING: TBooleanField;
    cdsSetupPOS_REST_ALWAYSLOGOUT: TBooleanField;
    cdsSetupPOS_CLASIC_PETTYCASH: TBooleanField;
    cdsSetupPOS_ADD_QTY: TBooleanField;
    cdsSetupDELETE_ALL_ONNEWRX: TBooleanField;
    cdsSetupTIP_PERCENTAGE1: TFMTBCDField;
    cdsSetupTIP_PERCENTAGE2: TFMTBCDField;
    cdsSetupTIP_PERCENTAGE3: TFMTBCDField;
    cdsSetupPOS_RESTAURANT: TBooleanField;
    cdsSetupPOS_INSERT_NEW_PRODUCT: TBooleanField;
    cdsSetupTIME_CARD: TBooleanField;
    cdsSetupPOS_ACTIVE_TIP: TBooleanField;
    cdsSetupMYREFILL_UPDATE_SMARTPICKUP: TBooleanField;
    cdsSetupTAX_PROCESSED_FOOD: TFMTBCDField;
    cdsSetupCOMMISSION1: TFMTBCDField;
    cdsSetupCOMMISSION2: TFMTBCDField;
    cdsSetupCOMMISSION3: TFMTBCDField;
    cdsSetupACTIVE_COMMISSIONS: TBooleanField;
    cdsSetupFAX: TWideStringField;
    cdsSetupSTOP_NEWRX_IFSIMILAR_ING: TBooleanField;
    cdsSetupAUTOMOVIL_APP: TBooleanField;
    cdsSetupSSSOTC_StoreKey: TWideStringField;
    cdsSetupSSSOTC_APIKey: TWideStringField;
    cdsSetupWF_CANCEL_CHECKED_ONREVERSAL: TBooleanField;
    cdsSetupINVENTORY_QUERY: TIntegerField;
    cdsSetupCERTIFICATE: TBlobField;
    cdsSetupENFORCE_RX_SCAN: TBooleanField;
    cdsSetupOVERRIDE_CONTROLLED_RX: TBooleanField;
    cdsSetupENFORCE_MARKET_STAUS: TBooleanField;
    cdsSetupIMAGE_DATABASE_IP: TWideStringField;
    cdsSetupSURESCRIPTS_MAILBOX: TBooleanField;
    cdsSetupPOS_APP_OPEN_DRAWER: TBooleanField;
    cdsSetupRECEIPT_MESSAGE: TMemoField;
    cdsSetupSURESCRIPTS_HTTP_ADDRESS: TWideStringField;
    cdsSetupWC_SMS_PASSWORD: TWideStringField;
    cdsSetupPERMIT_ZERO_MANUALSALE: TBooleanField;
    cdsSetupCOMPLEX_SEARCH: TBooleanField;
    cdsSetupRX_ENFORCE_SIGNATURE_ONCHECKOUT: TBooleanField;
    cdsSetupBTN_PRINT_RECEIPT: TBooleanField;
    cdsSetupQR_CODE: TBlobField;
    cdsSetupENFORCE_LEVEL_OF_SERVICE: TBooleanField;
    cdsSetupPRINT_BARCODE_PARTNUMBER: TStringField;
    IdConnectionIntercept1: TIdConnectionIntercept;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
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
    CDSTransHeadTIP: TFMTBCDField;
    CDSTransHeadTIP2: TFMTBCDField;
    CDSTransHeadTOTAL_TIP: TFMTBCDField;
    CDSTransHeadAMOUNT_TENDERED1: TFMTBCDField;
    CDSTransHeadAMOUNT_TENDERED2: TFMTBCDField;
    CDSTransHeadCASHBACK: TFMTBCDField;
    CDSTransHeadTAX_PROCESSED_FOOD: TFMTBCDField;
    CDSTransHeadSALESMAN: TWideStringField;
    CDSTransHeadDELIVERY_CITY: TWideStringField;
    CDSTransHeadDELIVERY_ZIPCODE: TWideStringField;
    CDSTransHeadDELIVERY_STATE: TStringField;
    qOpenTabs: TFDQuery;
    dsOpenTabs: TDataSource;
    cdsOpenTabs: TClientDataSet;
    cdsOpenTabsID: TIntegerField;
    cdsOpenTabsSERVER: TIntegerField;
    cdsOpenTabsTRANSACTIONNUMBER: TIntegerField;
    cdsOpenTabsCUSTOMER: TWideStringField;
    cdsOpenTabsTELEPHONE: TWideStringField;
    cdsOpenTabsCREDIT_CARD: TWideStringField;
    cdsOpenTabsDATE: TSQLTimeStampField;
    cdsOpenTabsSERVER_DEFINE: TStringField;
    cdsOpenTabsTRANSACTIONNUMBER_DEFINE: TStringField;
    cdsOpenTabsBUTTON_CAPTION: TWideStringField;
    cdsOpenTabsCUSTOMER_ID: TIntegerField;
    cdsOpenTabsDELIVER_BY_ID: TIntegerField;
    cdsOpenTabsDELIVER_BY_DEFINE: TStringField;
    cdsOpenTabsGROUP_BALANCE: TFMTBCDField;
    cdsOpenTabsBALANCE: TFMTBCDField;
    cdsOpenTabsTRANS_TYPE: TWideStringField;
    cdsOpenTabsTRANS_TYPE_DEFINED: TStringField;
    dspOpenTabs: TDataSetProvider;
    cdsPasswordsUSERNO: TAutoIncField;
    qDeliverBy: TFDQuery;
    dspDeliverBy: TDataSetProvider;
    dsDeliverBy: TDataSource;
    cdsDeliverBy: TClientDataSet;
    cdsDeliverByUSERNAME: TStringField;
    cdsDeliverByUSERNO: TAutoIncField;
    cdsTransDetail: TClientDataSet;
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
    cdsTransDetailIDNUMBER: TIntegerField;
    cdsTransDetailMAIN_COURSE: TBooleanField;
    cdsTransDetailMAIN_COURSE_ID: TIntegerField;
    cdsTransDetailTERMINO: TWideStringField;
    cdsTransDetailTOTAL: TFMTBCDField;
    cdsTransDetailTAX: TFMTBCDField;
    cdsTransDetailCOSTO: TFMTBCDField;
    cdsTransDetailPRICE: TFMTBCDField;
    cdsTransDetailREGTOTAL: TFMTBCDField;
    cdsTransDetailREGPRICE: TFMTBCDField;
    cdsTransDetailAWP: TFMTBCDField;
    cdsTransDetailTOTAL_VALUE: TFMTBCDField;
    cdsTransDetailDISCOUNT: TFMTBCDField;
    cdsTransDetailBARCODEALTERNO1: TWideStringField;
    POS_UPDATE_PRINTED: TFDStoredProc;
    DSClientes: TDataSource;
    CDSClientes: TClientDataSet;
    CDSClientesNombreCompleto2: TStringField;
    CDSClientesMailingAddDefine: TStringField;
    CDSClientesNOMBRE: TStringField;
    CDSClientesFECHANACIMIENTO: TSQLTimeStampField;
    CDSClientesSEXO: TIntegerField;
    CDSClientesDIRECCION1: TStringField;
    CDSClientesULTTRANS: TSQLTimeStampField;
    CDSClientesNUMEROCLIENTE: TAutoIncField;
    CDSClientesINTERES: TStringField;
    CDSClientesDIRECCIONFISICA: TStringField;
    CDSClientesAPELLIDOPATERNO: TStringField;
    CDSClientesAPELLIDOMATERNO: TStringField;
    CDSClientesTELEFONO: TStringField;
    CDSClientesFAX: TStringField;
    CDSClientesCELULAR: TStringField;
    CDSClientesESTADO: TStringField;
    CDSClientesAUSPICIO: TFMTBCDField;
    CDSClientesSOCIO: TStringField;
    CDSClientesORIENTACION: TStringField;
    CDSClientesIDENTIFICACION: TStringField;
    CDSClientesSMOKER: TStringField;
    CDSClientesLOCATION: TStringField;
    CDSClientesEMPLOYER_ID: TStringField;
    CDSClientesPATIENT_ID_QUAL: TStringField;
    CDSClientesPREGNANCY_IDICATOR: TStringField;
    CDSClientesFECHA_HIPPA: TSQLTimeStampField;
    CDSClientesINFOADICIONAL: TStringField;
    CDSClientesCONSULTA: TStringField;
    CDSClientesCIUDAD: TStringField;
    CDSClientesMAILING_ADDRESS1: TStringField;
    CDSClientesMAILING_ADDRESS2: TStringField;
    CDSClientesMAILING_CITY: TStringField;
    CDSClientesMAILING_STATE: TStringField;
    CDSClientesMAILING_ZIPCODE: TStringField;
    CDSClientesPATIENT_RESIDENCE: TWideStringField;
    CDSClientesPLACE_OF_SERVICE: TWideStringField;
    CDSClientesEMAIL: TWideStringField;
    CDSClientesCARDHOLDERID: TWideStringField;
    CDSClientesCODIGOPOSTAL: TWideStringField;
    CDSClientesDIRECCION2: TWideStringField;
    CDSClientesSIGNATURE: TMemoField;
    CDSClientesOUT_DIAL_PERMISSION: TWideStringField;
    CDSClientesSSN: TWideStringField;
    CDSClientesNOTIFICATION_MODE_PHONE: TSmallintField;
    CDSClientesNOTIFICATION_MODE_CEL: TSmallintField;
    CDSClientesNOTIFICATION_MODE_SMS: TSmallintField;
    CDSClientesNOTIFICATION_MODE_EMAIL: TSmallintField;
    CDSClientesNIGHT_PHONE: TWideStringField;
    CDSClientesWC_NO_NOTIFICATION: TBooleanField;
    CDSClientesNOTIFICATION_MODE: TWideStringField;
    CDSClientesPRIMARY_TELEPHONE: TWideStringField;
    CDSClientesFACILITY_ID: TIntegerField;
    CDSClientesFACILITY_ADMISSION_DATE: TDateField;
    CDSClientesFACILITY_ROOM: TWideStringField;
    CDSClientesFACILITY_PRESCRIBER: TWideStringField;
    CDSClientesPRICE_TABLE_ID: TIntegerField;
    CDSClientesOVERRIDE_SYSTEM_DEFAULT_PRICE: TBooleanField;
    CDSClientesADHERENCE: TBooleanField;
    CDSClientesNUMERO_REGISTRO_COMERCIANTE: TWideStringField;
    CDSClientesALLERGY: TBooleanField;
    CDSClientesDECEASED: TBooleanField;
    CDSClientesMIDDLE_NAME: TStringField;
    CDSClientesSIGNATURE_RX_LINK: TIntegerField;
    CDSClientesID_IMAGE: TIntegerField;
    CDSClientesRECORD_LOCKED: TBooleanField;
    CDSClientesINSTANCIA: TIntegerField;
    CDSClientesDEUDA_EXTENDIDA: TStringField;
    CDSClientesDEUDA: TFMTBCDField;
    CDSClientesLIMITECREDITO: TFMTBCDField;
    CDSClientesLAWAY: TFMTBCDField;
    CDSClientesDEUDA_WEB: TFMTBCDField;
    CDSClientesACCIONES: TFMTBCDField;
    CDSClientesPATROCINIO: TFMTBCDField;
    CDSClientesVETERANO: TFMTBCDField;
    CDSClientesTAX_EXEMPT: TBooleanField;
    CDSClientesRETAILPRICE_SELECTED: TStringField;
    CDSClientesCLASIFICATION: TWideStringField;
    DSPClientes: TDataSetProvider;
    QClientesFD: TFDQuery;
    CDSTransHeadRecallNoTrans: TStringField;
    CDSOTCQTY: TFMTBCDField;
    cdsPrescription_FullAUTOMATIC_REFILL: TBooleanField;
    CDSTransHeadTRANS_TYPE: TWideStringField;
    cdsPrescription_FullDRUG_EXPIRATION: TDateField;
    cdsCompoundsLOTE: TWideStringField;
    cdsCompoundsFECHA_EXPIRACION: TDateField;
    cdsPrescription_FullINV_INFO: TStringField;
    qryPrinters: TFDQuery;
    dspPrinters: TDataSetProvider;
    dsPrinters: TDataSource;
    cdsPrinters: TClientDataSet;
    cdsPrintersID: TAutoIncField;
    cdsPrintersLABEL_NAME: TWideStringField;
    cdsPrintersLEFT_MARGIN: TFloatField;
    cdsPrintersTOP_MARGIN: TFloatField;
    cdsPrintersPRINTER_NAME: TWideStringField;
    cdsPrintersPAT_EDUCATION: TWideStringField;
    cdsPrintersPRINTER_ID: TIntegerField;
    cdsSetupPRINT_PAT_EDU: TBooleanField;
    cdsSetupPRINT_PAT_EDU_CONTROLED: TBooleanField;
    cdsSetupPATEDU_ONLYONNEWRX: TBooleanField;
    cdsPrintersDEFAULT_HISTORY_LABEL: TBooleanField;
    cdsPrintersDEFAULT_OTC_LABEL: TBooleanField;
    cdsPrintersDEFAULT_NEWRX_LABEL: TBooleanField;
    cdsPrescription_FullLABEL_LINE1b: TStringField;
    cdsPrescription_FullLABEL_LINE1c: TStringField;
    cdsPrescription_FullSIGNATURE_LINE: TStringField;
    cdsPrescription_FullPLAN_NAME: TWideStringField;
    CDSPlanesMedicosNOMBRE: TWideStringField;
    CDSClientesLANGUAGE: TWideStringField;
    cdsPrescription_FullPAT_LANGUAGE: TWideStringField;
    CDSPlanesMedicosOTHER_COVERAGE_CODE_DEFAULT: TStringField;
    CDSPlanesMedicosSCC_420_DK: TStringField;
    CDSPlanesMedicosF340B: TBooleanField;
    CDSPlanesMedicosLTC: TBooleanField;
    CDSPlanesMedicosLTC_SERVICE_PROVIDER_ID: TWideStringField;
    CDSPlanesMedicosLTC_SERVICE_PROVIDER_QUAL: TStringField;
    CDSPlanesMedicosMULTIPLE_RX_CLAIMS: TBooleanField;
    CDSPlanesMedicosPAPER_CLAIM: TBooleanField;
    cdsSetupONLY_PRINT_PHARMACYADDRESS: TBooleanField;
    cdsPrescription_FullALCHEMY_PRODUCTID: TIntegerField;
    cdsPrescription_FullMARKETEDPRODUCTID: TIntegerField;
    cdsPrescription_FullPA: TBooleanField;
    cdsPrescription_FullWF_REVERSE: TBooleanField;
    cdsPrescription_FullREFILL_NOTIFIED: TBooleanField;
    cdsPrescription_FullPAT_INFO: TStringField;
    cdsPrescription_FullOTC_BATCH_NUMBER: TIntegerField;
    FDConnectionPOS: TFDConnection;
    FDTransactionPOS: TFDTransaction;
    FDQueryPOS: TFDQuery;
    qCounters: TFDQuery;
    dspCounters: TDataSetProvider;
    dsCounters: TDataSource;
    cdsCounters: TClientDataSet;
    cdsCountersSTICKER: TLargeintField;
    cdsCounterstitulo1: TStringField;
    cdsCounterstitulo2: TStringField;
    cdsCounterstitulo3: TStringField;
    cdsCounterstitulo4: TStringField;
    cdsCountersReceiptMessage: TStringField;
    cdsPrescription_FullRX_STATUS: TStringField;
    cdsPrescription_FullIOU: TFMTBCDField;
    cdsPrintQueriesRX_ID: TLargeintField;
    cdsPrintQueriesCOPIES: TIntegerField;
    cdsPrintQueriesID: TAutoIncField;
    cdsPrintQueriesRX_OTC: TWideStringField;
    cdsPrintQueriesLABEL_NAME: TWideStringField;
    cdsPrintQueriesTYPIST: TWideStringField;
    cdsPrintQueriesPRINTTOSCREEN: TBooleanField;
    cdsPrintQueriesPATIENT: TWideStringField;
    cdsPrintQueriesINDICATIONS: TWideStringField;
    cdsPrintQueriesPRINTER_ID: TWideStringField;
    cdsPrintQueriesWF_PRINTED: TWideStringField;
    cdsPrintQueriesPRINT_ID: TWideStringField;
    cdsPrintQueriesPRINTED: TBooleanField;
    cdsPrintQueriesTRANSACTION_NUMBER: TIntegerField;
    cdsPrintQueriesTRANS_TYPE: TWideStringField;
    cdsPrintQueriesFINAL_RECEIPT: TBooleanField;
    cdsPrintQueriesPRINT_TYPE: TIntegerField;
    cdsPrintQueriesEMAIL: TWideStringField;
    cdsPrintQueriesMOBILE_PHONE: TWideStringField;
    cdsPrintQueriesCUSTOMER_NUMBER: TIntegerField;
    cdsPrintQueriesDELIVERY: TBooleanField;
    cdsPrintQueriesQUOTE: TBooleanField;
    cdsPrintQueriesPRINT_PATIENT_EDUCATION: TBooleanField;
    cdsPrintQueriesPRINTER_IP: TWideStringField;
    procedure cdsPrescription_FullCalcFields(DataSet: TDataSet);
    procedure cdsPrescription_FullAfterScroll(DataSet: TDataSet);
    procedure CDSOTCAfterScroll(DataSet: TDataSet);
    procedure CDSOTCCalcFields(DataSet: TDataSet);
    procedure CDSMedOriginalCalcFields(DataSet: TDataSet);
    procedure CDSInventarioCalcFields(DataSet: TDataSet);
    procedure CDSTransHeadAfterScroll(DataSet: TDataSet);
    procedure cdsSetupCalcFields(DataSet: TDataSet);
    procedure cdsTransDetailCalcFields(DataSet: TDataSet);
    procedure cdsTransDetail_TempCalcFields(DataSet: TDataSet);
    procedure WarningLabels(Alchemy_ProductID: Integer; LanguageStr: String;
    var Token1, Token2, Token3, Token4, Token5: String);
    function ValidateTextJustNumbers(Token: String): String;
    procedure cdsOpenTabsCalcFields(DataSet: TDataSet);
    procedure CDSTransHeadCalcFields(DataSet: TDataSet);
    procedure CDSClientesCalcFields(DataSet: TDataSet);
    procedure OpenPrinters;
    procedure OpenOTC;
  private
    { Private declarations }
  public
    PatEducation: Boolean;
    StarPlussBarcode: String;
    { Public declarations }
    //GoldStandardDB: String;

  end;

var
  DM: TDM;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UntMain, UntGSDD4, UntGSDD5;

{$R *.dfm}

procedure TDM.CDSClientesCalcFields(DataSet: TDataSet);
begin
  CDSClientesNombreCompleto2.Value := Trim(CDSClientesNOMBRE.Value) + ' ' + Trim(CDSClientesAPELLIDOPATERNO.Value) + ' ' + Trim(CDSClientesAPELLIDOMATERNO.Value);
end;

procedure TDM.CDSInventarioCalcFields(DataSet: TDataSet);
begin
  CDSInventarioInvInfo.Value := 'NDC: ' + trim(CDSInventarioNDC.value) + ' Lote: ' + CDSInventarioLOTE.AsString.Trim + ' Expi: ' + CDSInventarioFECHA_EXPIRACION.asString + ' ' + Trim(Copy(CDSInventarioCASA_FARMACEUTICA.Value,1,50));
  // 'Exp: ' +Trim(CDSInventarioFECHA_EXPIRACION.AsString.Trim) + ' ' + 'Lote: ' + CDSInventarioLOTE.AsString.Trim ;//+ ' NDC: ' + CDSInventarioNDC.AsString.Trim;
end;

procedure TDM.CDSMedOriginalCalcFields(DataSet: TDataSet);
begin
  if CDSMedOriginalSTRENGTH.IsNull then
    CDSMedOriginalMedicamentoStr.Value := Trim(CDSMedOriginalDescripcion.Value) + ' ' + Trim(CDSMedOriginalTIPO.Value)
  else
  begin
    if CDSMedOriginalSTRENGTH.Value > '' then CDSMedOriginalMedicamentoStr.Value := Trim(CDSMedOriginalDescripcion.Value) + ', ' + Trim(CDSMedOriginalSTRENGTH.Value) + ' ' + Trim(CDSMedOriginalTIPO.Value)
    else
      CDSMedOriginalMedicamentoStr.Value := Trim(CDSMedOriginalDescripcion.Value)+ ' ' + Trim(CDSMedOriginalTIPO.Value);
  end;
end;

procedure TDM.cdsOpenTabsCalcFields(DataSet: TDataSet);
begin
  cdsOpenTabsTRANSACTIONNUMBER_DEFINE.Value := 'Order #: ' + cdsOpenTabsTRANSACTIONNUMBER.AsString;
  if cdsOpenTabsTRANS_TYPE.Value = 'I' then cdsOpenTabsTRANS_TYPE_DEFINED.Value := 'Quote';
  if cdsOpenTabsTRANS_TYPE.Value = 'M' then cdsOpenTabsTRANS_TYPE_DEFINED.Value := 'E-Commerce';
  if cdsOpenTabsTRANS_TYPE.Value = 'S' then cdsOpenTabsTRANS_TYPE_DEFINED.Value := 'Saved Transaction';
  if cdsOpenTabsTRANS_TYPE.Value = 'D' then cdsOpenTabsTRANS_TYPE_DEFINED.Value := 'Delivery';
end;

procedure TDM.CDSOTCAfterScroll(DataSet: TDataSet);
begin
//  CDSInventario.Close;
//  CDSInventario.CommandText := 'Select * from InventarioPiso where PRODUCTNO = ' + CDSOTCPRODUCT_ID.asString;
//  CDSInventario.Open;
end;

procedure TDM.CDSOTCCalcFields(DataSet: TDataSet);
Var
  PayAmount, Language: String;
  Token1, Token2, Token3, Token4, Token5: String;
begin
  if cdsSetupSTAR_PLUS_INTERFACE.Value = True then
  begin
    PayAmount := ValidateTextJustNumbers(Format('%n', [cdsOTCTotal.asFloat]));
    CDSOTCOTC_BARCODE_DEF.Value := Format('%.*d',[7, CDSOTCOTCNUMBER.Value])+ '.' + Format('%.*d',[6, StrToInt(PayAmount)]);
  end
  else
    CDSOTCOTC_BARCODE_DEF.Value := 'OT' + IntToStr(CDSOTCOTCNUMBER.Value);
  CDSInventario.Close;
  CDSInventario.CommandText := 'Select * from InventarioPiso where PRODUCTNO = ' + CDSOTCPRODUCT_ID.asString;
  CDSInventario.Open;
  if CDSInventarioALCHEMY_PRODUCTID.Value > 0 then
  begin
    Try
      if CDSOTCNUMEROCLIENTE.Value > 0 then
      begin
        FDQuery1.SQL.Text := 'Select Language from Pacientes where NumeroCliente = ' + IntToStr(CDSOTCNUMEROCLIENTE.Value);
        FDQuery1.Open;
        Language := FDQuery1.FieldByName('Language').Value;
      end
      else
      begin
        Language := 'Spanish';
      end;
      WarningLabels(CDSInventarioALCHEMY_PRODUCTID.Value,
        Trim(Language), Token1, Token2, Token3, Token4,
        Token5);
      cdsOTCCaution1.Value := Token1;
      cdsOTCCaution2.Value := Token2;
      cdsOTCCaution3.Value := Token3;
      cdsOTCCaution4.Value := Token4;
      cdsOTCCaution5.Value := Token5;
      CDSSetup.Refresh;
      if PatEducation = True then
      begin
        if CDSSetupGoldStandardActive.Value = True then
        begin
          case CDSSetupGSDD_VERSION.Value of
            4: cdsOTCPatEducation.Value := GDDS4Routines.PatientEducation('', DM.CDSInventarioNDC.Value, Trim(Language), 'Education', False);
            5: cdsOTCPatEducation.Value := GDDS5Routines.PatientEducation('', DM.CDSInventarioNDC.Value, Trim(Language), 'Education', False);
          end;
        end
        else
          cdsOTCPatEducation.Value := '';
      end;
    Except
       //
    End;
  end;
end;

procedure TDM.cdsPrescription_FullAfterScroll(DataSet: TDataSet);
begin
  if cdsPrescription_FullCOMPOUNDCODE.Value = 1 then
  begin
    if cdsPrescription_FullPRODUCT_ID.Value > 0 then
    begin
      CDSInventario.Close;
      CDSInventario.CommandText := 'Select * from InventarioPiso where PRODUCTNO = ' + cdsPrescription_FullPRODUCT_ID.asString;
      CDSInventario.Open;
    end
    else
    begin
      CDSInventario.Close;
      CDSInventario.CommandText := 'Select * from InventarioPiso where NDC = ' + chr(39) + cdsPrescription_FullNDC.asString.Trim + chr(39);
      CDSInventario.Open;
    end;
    if CDSInventarioDESCRIPCION.AsString.Trim = '' then
    begin
      CDSInventario.Close;
      CDSInventario.CommandText := 'Select * from InventarioPiso where NDC = ' + chr(39) + cdsPrescription_FullNDC.asString.Trim + chr(39);
      CDSInventario.Open;
    end;
  end;
end;


procedure TDM.cdsPrescription_FullCalcFields(DataSet: TDataSet);
Var
  TotalDispensado, TotalRecetado: Double;
  Token1, Token2, Token3, Token4, Token5, PatEducation, MedOriginal: String;
  Qty, Disponible, CurrenRefill: String;
  CompoundCounter: Integer;
  HealthPlan: String;
  PayAmount, SimilarA, DateRxWritten, ServiceDate: String;
  RxNoLanguage, BatchLanguage, DaysLanguage, AvailableLanguage, deLanguage,
  patientLanguage, PatPayAmount : String;
begin

  if cdsPrescription_FullPAT_LANGUAGE.Value = 'SPANISH' then
  begin
    DateRxWritten := 'Fecha Rx: ';
    ServiceDate := 'Fe.Venta: ';
    RxNoLanguage := 'No.Rx. ';
    SimilarA := ' Similar a: ';
    BatchLanguage := ' Lote: ';
    DaysLanguage := 'Dias: ';
    AvailableLanguage := 'Disp. ';
    deLanguage := ' de ';
    patientLanguage := 'Pac. ';
    PatPayAmount := 'Precio: ';
  end
  else
  begin
    DateRxWritten := 'Rx Written: ';
    ServiceDate := 'Filled on: ';
    RxNoLanguage := 'Rx.No. ';
    SimilarA := ' Similar to: ';
    BatchLanguage := ' Batch: ';
    DaysLanguage := 'Days: ';
    AvailableLanguage := 'Avaiable: ';
    deLanguage := ' of ';
    patientLanguage := 'Pat. ';
    PatPayAmount := 'Rx Price: ';
  end;
  cdsPrescription_FullNombreCompleto.Value := Trim(Copy(patientLanguage +  Trim(cdsPrescription_FullPAT_NAME.Value) + ' ' + Trim(cdsPrescription_FullPAT_LASTNAME.Value) + ' ' + Trim(cdsPrescription_FullPAT_MAIDENNAME.Value),1, 55));
  cdsPrescription_FullLABEL_LINE1.Value := RxNoLanguage + cdsPrescription_FullRX_NUMBER.AsString.Trim + '    '+ ServiceDate + cdsPrescription_FullRX_SERVICE_DATE.AsString;
  cdsPrescription_FullLABEL_LINE1b.Value := RxNoLanguage + cdsPrescription_FullRX_NUMBER.AsString.Trim + '  '+ ServiceDate + cdsPrescription_FullRX_SERVICE_DATE.AsString + ' ' + cdsPrescription_FullNombreCompleto.asString+ ' ' + cdsPrescription_FullTYPIST.Value;
  cdsPrescription_FullLABEL_LINE1c.Value := RxNoLanguage + cdsPrescription_FullRX_NUMBER.AsString.Trim + ' ' + DateRxWritten  + ' ' + cdsPrescription_FullRX_DATE.AsString  + ' Qty: ' + cdsPrescription_FullQTY.asString + ' ' + cdsPrescription_FullTYPIST.Value;
  cdsPrescription_FullSIGNATURE_LINE.Value := ServiceDate + cdsPrescription_FullRX_SERVICE_DATE.AsString + ' ID: ' + cdsPrescription_FullPAT_IDENTIFICATION.Value;
  if cdsSetupSTAR_PLUS_INTERFACE.Value = True then
  begin
    if cdsPrescription_FullHealth_plan_abbreviation.asString.Trim = 'CAS' then
      PayAmount := ValidateTextJustNumbers(Format('%n', [cdsPrescription_FullCASH_RETAIL_PRICE.asFloat]))
    else
      PayAmount := ValidateTextJustNumbers(Format('%n', [cdsPrescription_FullPAT_PAY_AMOUNT.asFloat]));
    StarPlussBarcode := Format('%.*d',[7, cdsPrescription_FullRX_NUMBER.Value])+ '.' + Format('%.*d',[6, StrToInt(PayAmount)]);

  end;
  if cdsSetupPLAN_MEDICO_ABREVIATURA.Value = True then
    HealthPlan := cdsPrescription_FullHealth_plan_abbreviation.Value
  else
    HealthPlan := cdsPrescription_FullPLAN_NAME.Value;
  CDSInventario.Close;
  if cdsPrescription_FullPRODUCT_ID.Value > 0 then
    CDSInventario.CommandText := 'Select * from InventarioPiso where PRODUCTNO = ' + cdsPrescription_FullPRODUCT_ID.asString
  else
    CDSInventario.CommandText := 'Select * from InventarioPiso where NDC = ' + chr(39) + cdsPrescription_FullNDC.asString.Trim + chr(39);
  CDSInventario.Open;
  if CDSInventarioDESCRIPCION.AsString.Trim = '' then
  begin
    CDSInventario.Close;
    CDSInventario.CommandText := 'Select * from InventarioPiso where NDC = ' + chr(39) + cdsPrescription_FullNDC.asString.Trim + chr(39);
    CDSInventario.Open
  end;
  cdsPrescription_FullINV_INFO.Value := 'NDC: ' + trim(cdsPrescription_FullNDC.value) +
                                        BatchLanguage + cdsPrescription_FullBATCH_NUMBER.AsString.Trim +
                                        ' Expi: ' + cdsPrescription_FullDRUG_EXPIRATION.asString + ' ' +
                                        Trim(Copy(CDSInventarioCASA_FARMACEUTICA.Value,1,50));

  if Trim(cdsPrescription_FullRXORIGINCODE.Value) = '1' then cdsPrescription_FullRX_ORIGIN_CODE_DEFINE.Value := 'Written';
  if Trim(cdsPrescription_FullRXORIGINCODE.Value) = '2' then cdsPrescription_FullRX_ORIGIN_CODE_DEFINE.Value := 'Telephone';
  if Trim(cdsPrescription_FullRXORIGINCODE.Value) = '3' then cdsPrescription_FullRX_ORIGIN_CODE_DEFINE.Value := 'Electronic';
  if Trim(cdsPrescription_FullRXORIGINCODE.Value) = '4' then cdsPrescription_FullRX_ORIGIN_CODE_DEFINE.Value := 'Facsimile';
  if Trim(cdsPrescription_FullRXORIGINCODE.Value) = '5' then cdsPrescription_FullRX_ORIGIN_CODE_DEFINE.Value := 'Transfer';

  if cdsPrescription_FullRX_STATUS.Value = 'N' then cdsPrescription_FullRX_STATUS_DEFINE.Value := 'NEW';
  if cdsPrescription_FullRX_STATUS.Value = 'P' then cdsPrescription_FullRX_STATUS_DEFINE.Value := 'PARTIAL';
  if cdsPrescription_FullRX_STATUS.Value = 'R' then cdsPrescription_FullRX_STATUS_DEFINE.Value := 'REFILL';
  if cdsPrescription_FullRX_STATUS.Value = 'C' then cdsPrescription_FullRX_STATUS_DEFINE.Value := 'COPAY';

  cdsPrescription_FullPAT_FULL_ADDRESS.Value := Trim(cdsPrescription_FullPAT_CELULAR.Value) + ' '+ Trim(cdsPrescription_FullPAT_ADDRESS1.Value)  + ' ' + Trim(cdsPrescription_FullPAT_ADDRESS2.Value) + ' ' + Trim(cdsPrescription_FullPAT_CITY.Value) + ' ' + Trim(cdsPrescription_FullPAT_STATE.Value) + ' ' + Trim(cdsPrescription_FullPAT_ZIPCODE.Value);
  cdsPrescription_FullPAT_INFO.Value := Trim(cdsPrescription_FullPAT_FULL_ADDRESS.Value) + ' dob: ' +
                                        cdsPrescription_FullPAT_DOB.asString + ' ';

  if cdsSetupSTAR_PLUS_INTERFACE.Value = True then
    cdsPrescription_FullOTCNumber_Print.Value := StarPlussBarcode
  else
    cdsPrescription_FullOTCNumber_Print.Value := Trim('RX'+ cdsPrescription_FullRX_ID.AsString);
  TotalRecetado := cdsPrescription_FullRX_QTY_PRESCRIBED.Value * cdsPrescription_FullRX_REF_AUTHORIZED.Value;
  TotalDispensado := TotalRecetado - cdsPrescription_FullRX_QTY_AVAILABLE.asFloat;
  if (cdsSetupRX_SHOW_NOREFDISP_FLOAT.Value = True) or
  (cdsPrescription_FullHealth_plan_abbreviation.Value = 'CAS') then
  begin
    Try
      cdsPrescription_FullNO_REFILL.Value := TotalDispensado / cdsPrescription_FullRX_QTY_PRESCRIBED.Value;
    Except
      cdsPrescription_FullNO_REFILL.Value := 0;
    End;
    if cdsPrescription_FullNO_REFILL.Value < 0 then cdsPrescription_FullNO_REFILL.Value := 0;
  end
  else
  begin
    QCountTTransOTC.Close;
    QCountTTransOTC.ParamByName('NoReceta').AsLargeInt := cdsPrescription_FullRX_NUMBER.Value;
    QCountTTransOTC.Open;
    cdsPrescription_FullNO_REFILL.Value := QCountTTransOTCTTransRefill.Value;
  end;


  MedOriginal := '';
  if ((cdsPrescription_FullCOMPOUNDCODE.Value = 1) or (cdsPrescription_FullCOMPOUNDCODE.Value = 0)) then
  begin
    if (CDSInventarioBRAND.Value <> 'T') then
    begin
      if CDSSetupGoldStandardActive.Value = True then
      begin
        if (CDSInventarioALCHEMY_PRODUCTID.Value > 0) and (CDSInventarioBRAND.Value <> 'T') then
        begin
          cdsSetup.Refresh;
          try
            case CDSSetupGSDD_VERSION.Value of
              4: MedOriginal := Trim(GDDS4Routines.Generic(CDSInventarioALCHEMY_PRODUCTID.Value, 0));
              5: MedOriginal := Trim(GDDS5Routines.Generic(CDSInventarioALCHEMY_PRODUCTID.Value, 0));
            end;
            if Trim(MedOriginal) > '' then
              SimilarA := SimilarA + Trim(MedOriginal)
            else
              SimilarA := '';
          Except
             SimilarA := '';
          end;
          CDSPrescription_FullMedicamentoMixDefine.Value := Trim(cdsPrescription_FullDRUG.Value) + SimilarA;
        end
        else
        begin
          CDSPrescription_FullMedicamentoMixDefine.Value := cdsPrescription_FullDRUG.Value;
        end;
      end
      else
        CDSPrescription_FullMedicamentoMixDefine.Value := cdsPrescription_FullDRUG.Value;
    end
    else
      CDSPrescription_FullMedicamentoMixDefine.Value := cdsPrescription_FullDRUG.Value;
  end
  else
  begin
    cdsCompounds.Close;
    cdsCompounds.CommandText := 'Select * from Mezclas where NumeroReceta = ' + cdsPrescription_FullRX_NUMBER.AsString + ' order by MEZCLASNO';
    cdsCompounds.Open;
    cdsCompounds.First;
    CompoundCounter := 1;
    while not cdsCompounds.eof do
    begin
      if CompoundCounter = 1 then
      begin
        cdsPrescription_FullCompound_NDC.Value := Trim(cdsCompoundsNDC.Value);
        cdsPrescription_FullCompound_Lote.Value := Trim(cdsCompoundsLOTE.Value);
        cdsPrescription_FullCompound_Expi.asString := cdsCompoundsFECHA_EXPIRACION.AsString;
      end;
      CDSPrescription_FullMedicamentoMixDefine.Value := CDSPrescription_FullMedicamentoMixDefine.Value  + Trim(cdsCompoundsMEDICAMENTO.Value) + '/';
      CompoundCounter := CompoundCounter + 1;
      cdsCompounds.Next;
    end;
  end;
  if cdsPrescription_FullHealth_plan_abbreviation.Value <> 'CAS' then
  begin
    if cdsPrescription_FullCLAIM_STATUS.Value = 1 then
      cdsPrescription_FullEarning.Value := (cdsPrescription_FullPLAN_PAY_AMOUNT.asFloat + cdsPrescription_FullPAT_PAY_AMOUNT.asFloat + cdsPrescription_FullRX_OTHER_AMOUNT_PAID.asFloat) - cdsPrescription_FullSALES_COST.asFloat
    else
      cdsPrescription_FullEarning.Value := 0;
  end
  else
    cdsPrescription_FullEarning.Value := cdsPrescription_FullCASH_RETAIL_PRICE.asFloat - cdsPrescription_FullSALES_COST.asFloat;

  cdsPrescription_FullPresc_FullName.Value := Trim('Dr. ' + Trim(cdsPrescription_FullPRESC_NAME.Value) + ' ' + Trim(cdsPrescription_FullPRESC_LASTNAME.Value) + ' ' + Trim(cdsPrescription_FullPRESC_MAIDENNAME.Value)); // + '  Tel. ' + cdsPrescription_FullPRESC_TEL.Value + ' NPI: '+ Trim(cdsPrescription_FullPRESC_NPI.Value);
  cdsPrescription_FullPresc_FullName2.Value := Trim('Dr. ' + Trim(cdsPrescription_FullPRESC_NAME.Value) + ' ' + Trim(cdsPrescription_FullPRESC_LASTNAME.Value) + ' ' + Trim(cdsPrescription_FullPRESC_MAIDENNAME.Value)) + ' NPI: '+ Trim(cdsPrescription_FullPRESC_NPI.Value);
  cdsPrescription_FullPayment_Line.Text := cdsPrescription_FullHealth_plan_abbreviation.Value + ' Plan Pay: ' + Format('%m', [cdsPrescription_FullPLAN_PAY_AMOUNT.asFloat]) + ' Pat. Pay: ' + Format('%m', [cdsPrescription_FullPAT_PAY_AMOUNT.asFloat]) + ' Other Amount: ' + Format('%m', [cdsPrescription_FullRX_OTHER_AMOUNT_PAID.asFloat]) + ' Earning: ' + Format('%m', [cdsPrescription_FullEarning.asFloat]);


  if cdsPrescription_FullQTY.Value > 0 then
    Qty := Format('%n', [cdsPrescription_FullQTY.asFloat])
  else
    Qty := '0';
  if cdsPrescription_FullRX_QTY_AVAILABLE.Value > 0 then
    Disponible := Format('%n', [cdsPrescription_FullRX_QTY_AVAILABLE.asFloat])
  else
    Disponible := '0';

  CurrenRefill := '0';
  //if (cdsPrescription_FullNO_REF_DISPENSADO.Value > 0) or
  if (cdsPrescription_FullHealth_plan_abbreviation.Value <> 'CAS') then
  begin
    CurrenRefill := cdsPrescription_FullNO_REF_DISPENSADO.asString;
  end
  else
  begin
    if (cdsPrescription_FullNO_REFILL.Value > 0) then
    begin
      CurrenRefill :=  Format('%n', [cdsPrescription_FullNO_REFILL.Value]);
    end
    else
      CurrenRefill := '0';
  end;

  cdsPrescription_FullAvailableDefine.Value := '';
  //if cdsPrescription_FullPAT_LANGUAGE.Value = 'SPANISH' then
  //begin
  if cdsSetupLABEL_PRINT_QTYAVAILABEL.Value = True then
  begin
    cdsPrescription_FullAvailableDefine2.Value := Trim(cdsPrescription_FullRX_STATUS_DEFINE.Value)
    + ' ' +Trim('Qty: ' + Qty + ' '
    + ' '+ AvailableLanguage + Disponible //' Disp.: '
    + ' ' + ' Refill: ' + CurrenRefill + deLanguage + cdsPrescription_FullRX_REF_AUTHORIZED.asString
    + ' ' + DaysLanguage + cdsPrescription_FullDAYS_SUPPLY.AsString
    + ' DAW: ' + cdsPrescription_FullDAW.AsString
    + ' Origin Code: ' + Trim(cdsPrescription_FullRX_ORIGIN_CODE_DEFINE.Value));
    //+ ' Rx.Stautus: ' + cdsPrescription_FullRX_STATUS_DEFINE.Value);

    cdsPrescription_FullAvailableDefine.Value := Trim(cdsPrescription_FullRX_STATUS_DEFINE.Value) + ' '+ Trim('Qty: ' + Qty + ' ' +
    ' '+ AvailableLanguage + Disponible
    + ' ' + ' Refill: ' + CurrenRefill + deLanguage + cdsPrescription_FullRX_REF_AUTHORIZED.asString
    + ' ' + DaysLanguage + cdsPrescription_FullDAYS_SUPPLY.AsString);
  end
  else
  begin
    cdsPrescription_FullAvailableDefine.Value := Trim(cdsPrescription_FullRX_STATUS_DEFINE.Value) + ' '
    + Trim('Qty: ' + Qty
    + ' ' + ' Refill: ' + CurrenRefill + deLanguage + cdsPrescription_FullRX_REF_AUTHORIZED.asString
    + ' ' + DaysLanguage + cdsPrescription_FullDAYS_SUPPLY.AsString);

    cdsPrescription_FullAvailableDefine2.Value := Trim(cdsPrescription_FullRX_STATUS_DEFINE.Value) + ' '
    + Trim('Qty: ' + Qty + ' '
    + ' ' + ' Refill: ' + CurrenRefill + deLanguage + cdsPrescription_FullRX_REF_AUTHORIZED.asString
    + ' ' + DaysLanguage + cdsPrescription_FullDAYS_SUPPLY.AsString
    + ' DAW: ' + cdsPrescription_FullDAW.AsString
    + ' Origin Code: ' + Trim(cdsPrescription_FullRX_ORIGIN_CODE_DEFINE.Value));
  end;

  if cdsPrescription_FullIOU.asFloat > 0 then
  begin
    cdsPrescription_FullAvailableDefine.Value := cdsPrescription_FullAvailableDefine.Value +
      ' IOU: ' + cdsPrescription_FullIOU.asString;
  end;
  if CDSInventarioALCHEMY_PRODUCTID.Value > 0 then
  begin
    Try
      WarningLabels(CDSInventarioALCHEMY_PRODUCTID.Value,
        Trim(cdsPrescription_FullPAT_LANGUAGE.Value), Token1, Token2, Token3, Token4,
        Token5);
      cdsPrescription_FullCaution1.Value := Utf8ToAnsi(Token1);
      cdsPrescription_FullCaution2.Value := Utf8ToAnsi(Token2);
      cdsPrescription_FullCaution3.Value := Utf8ToAnsi(Token3);
      cdsPrescription_FullCaution4.Value := Utf8ToAnsi(Token4);
      cdsPrescription_FullCaution5.Value := Utf8ToAnsi(Token5);
      CDSSetup.Refresh;
      cdsPrescription_FullPatEducation.Value := '';
      //FrmMain.Short_PatEducation := '';
      //FrmMain.Long_PatEducation := '';
      {if CDSSetupGoldStandardActive.Value = True then
      begin
        case CDSSetupGSDD_VERSION.Value of
          4: cdsPrescription_FullPatEducation.Value := GDDS4Routines.PatientEducation('', DM.CDSInventarioNDC.Value, Trim(cdsPrescription_FullPAT_LANGUAGE.Value), 'Education', False);
          5: cdsPrescription_FullPatEducation.Value := GDDS5Routines.PatientEducation('', DM.CDSInventarioNDC.Value, Trim(cdsPrescription_FullPAT_LANGUAGE.Value), 'Education', False);
        end;
      end
      else
        cdsPrescription_FullPatEducation.Value := '';}
    Except
       //
    End;
  end;
  if cdsPrescription_FullHealth_plan_abbreviation.Value = 'CAS' then
    cdsPrescription_FullPatPayAmount.Value := PatPayAmount + Format('%m', [cdsPrescription_FullCASH_RETAIL_PRICE.asFloat])
  else
    cdsPrescription_FullPatPayAmount.Value := PatPayAmount + Format('%m', [cdsPrescription_FullPAT_PAY_AMOUNT.asFloat]);

  CDSPlanesMedicos.Close;
  CDSPlanesMedicos.CommandText := 'Select * from PlanesMedicos where Abreviatura = ' + chr(39) + cdsPrescription_FullHealth_plan_abbreviation.asString.Trim + chr(39);
  CDSPlanesMedicos.Open;

  if (cdsPrescription_FullHealth_plan_abbreviation.value <> 'CAS') and (CDSPlanesMedicosPAPER_CLAIM.value = false) then
  begin
    if cdsPrescription_FullPAT_LANGUAGE.Value = 'SPANISH' then
    begin
      cdsPrescription_FullPlanInfo.value :=  Trim(HealthPlan) + ' Pago Plan: ' + Format('%m', [cdsPrescription_FullPLAN_PAY_AMOUNT.asFloat]) + ' Deducible: ' + Format('%m', [cdsPrescription_FullPAT_PAY_AMOUNT.asFloat]) + ' Auth.: ' + Trim(cdsPrescription_FullAUTHORIZATION_NUMBER.Value);
      cdsPrescription_FullPlanInfo2_NoShowPP.Value := Trim(cdsPrescription_FullHealth_plan_abbreviation.Value) + ' Deducible: ' + Format('%m', [cdsPrescription_FullPAT_PAY_AMOUNT.asFloat]) + ' Auth.: ' + Trim(cdsPrescription_FullAUTHORIZATION_NUMBER.Value);
    end
    else
    begin
      cdsPrescription_FullPlanInfo.value := Trim(HealthPlan) + ' Plan Pay: ' + Format('%m', [cdsPrescription_FullPLAN_PAY_AMOUNT.asFloat]) + ' Pat Pay: ' + Format('%m', [cdsPrescription_FullPAT_PAY_AMOUNT.asFloat]) + ' Auth.: ' + Trim(cdsPrescription_FullAUTHORIZATION_NUMBER.Value);
      cdsPrescription_FullPlanInfo2_NoShowPP.Value := Trim(cdsPrescription_FullHealth_plan_abbreviation.Value) + ' Pat Pay: ' + Format('%m', [cdsPrescription_FullPAT_PAY_AMOUNT.asFloat]) + ' Auth.: ' + Trim(cdsPrescription_FullAUTHORIZATION_NUMBER.Value);
    end;
  end
  else
  begin
    if cdsPrescription_FullPAT_LANGUAGE.Value = 'SPANISH' then
      cdsPrescription_FullPlanInfo.value := Trim(HealthPlan) + ' Precio Venta: ' + Format('%m', [cdsPrescription_FullTotal.asFloat])
    else
      cdsPrescription_FullPlanInfo.value := Trim(HealthPlan) + ' Retail Price: ' + Format('%m', [cdsPrescription_FullTotal.asFloat]);
  end;
  cdsPrescription_FullDrugInfo.Value := 'NDC: ' + trim(CDSInventarioNDC.value) + ' ' + BatchLanguage + cdsPrescription_FullBATCH_NUMBER.AsString.Trim + ' Expi: ' + cdsPrescription_Fulldrug_expiration.asString + ' ' + Trim(Copy(CDSInventarioCASA_FARMACEUTICA.Value,1,50));
  cdsPrescription_FullRX_NUMBER_HEADING.Value :=  Trim(RxNoLanguage) + ' '+cdsPrescription_FullRX_NUMBER.AsString.Trim +  ' ' + ServiceDate + cdsPrescription_FullRX_SERVICE_DATE.AsString + ' ' + cdsPrescription_FullNombreCompleto.AsString.Trim + ' ID: ' + cdsPrescription_FullPAT_IDENTIFICATION.asString.Trim + ' ' + cdsPrescription_FullTYPIST.AsString.Trim;
end;

procedure TDM.cdsSetupCalcFields(DataSet: TDataSet);
begin
  cdsSetupPueblo_Zip.Value := cdsSetupPueblo.Value + ' ' + cdsSetupSTOREZIPCODE.Value;
end;

procedure TDM.cdsTransDetailCalcFields(DataSet: TDataSet);
begin
//  cdsTransDetailPRODUCT_DONENESS.Value := cdsTransDetailPRODDESCRIPTION.Value + ' ' + cdsTransDetailTERMINO.Value;
end;

procedure TDM.cdsTransDetail_TempCalcFields(DataSet: TDataSet);
begin
  cdsTransDetail_TempPRODDESC_DEFINE.Value := Trim(Trim(cdsTransDetail_TempPRODDESCRIPTION.Value) + ' ' + Trim(cdsTransDetail_TempTERMINO.Value));
end;

procedure TDM.CDSTransHeadAfterScroll(DataSet: TDataSet);
begin
  CDSTransDetail.Close;
  CDSTransDetail.CommandText := 'SELECT * FROM TransactionDetail_Temp WHERE TransactionNumber = '+ cdsTransHeadTRANSACTIONNUMBER.asString +' Order By IDNumber Desc';
  CDSTransDetail.Open;
  if cdsTransDetail.RecordCount = 0 then
  begin
    CDSTransDetail.Close;
    CDSTransDetail.CommandText := 'SELECT * FROM TransactionDetail WHERE TransactionNumber = '+ cdsTransHeadTRANSACTIONNUMBER.asString +' Order By IDNumber Desc';
    CDSTransDetail.Open;
  end;
  cdsTransDetail_Temp.Close;
  cdsTransDetail_Temp.CommandText := 'SELECT * FROM TransactionDetail_Temp WHERE TransactionNumber = '+ cdsTransHeadTRANSACTIONNUMBER.asString +' AND KITCHEN = 1 Order By MAIN_COURSE_ID, IDNumber';
  cdsTransDetail_Temp.Open;
  cdsOpenTabs.Close;
  cdsOpenTabs.CommandText := 'Select * from Open_Tabs where  TransactionNumber = '+ cdsTransHeadTRANSACTIONNUMBER.asString;
  cdsOpenTabs.Open;
end;

procedure TDM.CDSTransHeadCalcFields(DataSet: TDataSet);
begin
    CDSTransHeadRecallNoTrans.Value := 'HK' + IntToStr(CDSTransHeadTRANSACTIONNUMBER.Value);
end;

function TDM.ValidateTextJustNumbers(Token: String): String;
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

Procedure TDM.WarningLabels(Alchemy_ProductID: Integer; LanguageStr :String; Var Token1, Token2, Token3, Token4, Token5: String);
Var
  Counter: Integer;
begin
   Token1 := '';
   Token2 := '';
   Token3 := '';
   Token4 := '';
   Token5 := '';
   if UpperCase(LanguageStr) = 'ENGLISH' then  LanguageStr := '%en%' else LanguageStr := '%es%';
   With DM do
   begin
     cdsWarningLabels.Close;
     cdsWarningLabels.CommandText := 'SELECT DISTINCT Product_Warning_Label.ProductID, Product_Warning_Label.WarningLabelID, Product_Warning_Label.WarningOrder, Warning_Label.Warning, ' +
                        ' Warning_Label.WarningLabelGroupID, Warning_Label.LanguageCode, Warning_Label_Group.WarningLabelGroupID AS Expr1, Warning_Label_Group.GroupName, ' +
                        ' Warning_Label_Group.GroupDescription, Warning_Label.WarningLabelID AS Expr2 ' +
                  ' FROM   Product_Warning_Label INNER JOIN ' +
                        ' Warning_Label ON Product_Warning_Label.WarningLabelID = Warning_Label.WarningLabelID INNER JOIN ' +
                        ' Warning_Label_Group ON Warning_Label.WarningLabelGroupID = Warning_Label_Group.WarningLabelGroupID ' +
                  ' WHERE     (Warning_Label.LanguageCode LIKE '+ chr(39) +  LanguageStr + chr(39) +  ') ' +
                  ' and ProductID = ' + IntToStr(Alchemy_ProductID) +
                  ' order by WarningOrder ';
     //Memo1.Lines.Add(cdsWarningLabels.CommandText);
     cdsWarningLabels.Open;
     cdsWarningLabels.First;
     Counter := 1;
     while not cdsWarningLabels.Eof  do
     begin
       if Counter = 1 then Token1 := cdsWarningLabelsWarning.Value;
       if Counter = 2 then Token2 := cdsWarningLabelsWarning.Value;
       if Counter = 3 then Token3 := cdsWarningLabelsWarning.Value;
       if Counter = 4 then Token4 := cdsWarningLabelsWarning.Value;
       if Counter = 5 then Token5 := cdsWarningLabelsWarning.Value;
       Counter := Counter + 1;
       cdsWarningLabels.Next;
     end;
   end;
end;

procedure TDM.OpenPrinters;
begin
   cdsPrinters.Close;
   cdsPrinters.CommandText := 'Select * from Printers where printer_id = ' + Trim(FrmMain.PrinterID);
   cdsPrinters.Open;
end;

procedure TDM.OpenOTC;
begin
  With DM do
  begin
    CDSOTC.Close;
    CDSOTC.CommandText := 'Select * from OTC where OTCNumber = ' + cdsPrintQueriesRX_ID.AsString;
    CDSOTC.Open;
    if CDSOTCPRODUCT_ID.Value > 0 then
    begin
      CDSInventario.Close;
      CDSInventario.CommandText := 'Select * from InventarioPiso where ProductNo = ' + CDSOTCPRODUCT_ID.AsString;
      CDSInventario.Open;
    end
    else
    begin
      CDSInventario.Close;
      CDSInventario.CommandText := 'Select * from InventarioPiso where NDC = ' + chr(39) + Trim(CDSOTCNDC.AsString) + chr(39);
      CDSInventario.Open;
      FDQuery1.SQL.Text := 'Update OTC set PRODUCT_ID = ' + CDSInventarioPRODUCTNO.asString + ' where OTCNumber = ' + cdsPrintQueriesRX_ID.AsString;
      FDQuery1.ExecSQL;
    end;
  end;
end;

end.
