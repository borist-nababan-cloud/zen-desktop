 unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, cxBarEditItem,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  dxSkinsdxBarPainter, cxTextEdit, cxContainer, cxEdit, dxSkinsForm,
  dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery, dxGalleryControl,
  dxRibbonBackstageViewGalleryControl, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  cxButtons, cxPC, dxSkinscxPCPainter, dxBarBuiltInMenu, dxTabbedMDI,
  XSuperObject, MainSource, cxMaskEdit, cxDropDownEdit, dxLayoutLookAndFeels, MyAccess,
  dxScreenTip, dxCustomHint, cxHint, AdvGlowButton, AdvShapeButton, WinInet,
  System.Notification, strUtils, RegularExpressions, IdEMailAddress, IdGlobal, IdAttachmentFile,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, MMSystem,
  System.Threading, cxMemo, System.Net.HttpClient, System.Net.URLClient, System.NetEncoding, DateUtils, Data.DB;

type

TActiveFormSess = (afsTrans1,afsTrans2, afsLunas);
  TSessionMode = (smCheckIn,
  smCheckOut);
  TTransactionMode = (tmNew, tmEdit, tmTest);
TfrmMain = class(TdxRibbonForm)
    BarManagerMain: TdxBarManager;
    PAGE_CONTROL: TdxRibbon;
    pgMaster: TdxRibbonTab;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    mainStatusBar: TdxRibbonStatusBar;
    cxLabel1: TcxLabel;
    mainSkinControl: TdxSkinController;
    dxRibbonBackstageViewTabSheet2: TdxRibbonBackstageViewTabSheet;
    pgPOS: TdxRibbonTab;
    pgHRD: TdxRibbonTab;
    pgReportHRD: TdxRibbonTab;
    BarMasterProduct: TdxBar;
    pgSync: TdxRibbonTab;
    APPLICATION_USER: TdxBarLargeButton;
    dxRibbonBackstageViewTabSheet3: TdxRibbonBackstageViewTabSheet;
    Panel1: TPanel;
    BACKSTAGE_EXIT: TcxButton;
    dxTabbedMDIManager1: TdxTabbedMDIManager;
    cxLabel2: TcxLabel;
    lblAppName: TcxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MainLabelAppName: TLabel;
    MainLabelAppVersion: TLabel;
    MainLabelAppRelease: TLabel;
    MainLabelAppLegal: TLabel;
    MainLabelAppDeveloper: TLabel;
    cxLabel3: TcxLabel;
    THEME_APPLY: TcxButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edToolbarStyle: TcxComboBox;
    edSkinStyle: TcxComboBox;
    mainStyle: TdxLayoutLookAndFeelList;
    MainLayoutFeel: TdxLayoutOfficeLookAndFeel;
    MainSkinFeel: TdxLayoutSkinLookAndFeel;
    edColorScheme: TcxComboBox;
    edColorAccent: TcxComboBox;
    BACKSTAGE_CONFIG: TcxButton;
    BarMasterHrd: TdxBar;
    BarHrdPresensi: TdxBar;
    BarHrdReport: TdxBar;
    BarDataSync: TdxBar;
    pgProduct: TdxRibbonTab;
    tmrFormLogin: TTimer;
    BACKSTAGE_LOGIN: TcxButton;
    pgAPPS: TdxRibbonTab;
    BarApplication: TdxBar;
    APP_USER: TdxBarLargeButton;
    APP_GROUP: TdxBarLargeButton;
    APP_REG_ACCESS: TdxBarLargeButton;
    APP_REG_BUTTON: TdxBarButton;
    APP_CHANGE_PASS: TdxBarButton;
    BarMasterPos: TdxBar;
    MASTER_PRODUCT_SATUAN: TdxBarButton;
    MASTER_PRODUCT_KATEGORI: TdxBarButton;
    POS_MAIN_TRANS: TdxBarLargeButton;
    POS_MASTER_MENU: TdxBarLargeButton;
    POS_MASTER_GC_DETAILS: TdxBarLargeButton;
    POS_MASTER_GC_MASTER: TdxBarLargeButton;
    cxHintStyleController1: TcxHintStyleController;
    Panel2: TPanel;
    BACKSTAGE_TRANS_POS: TAdvGlowButton;
    AdvShapeButton1: TAdvShapeButton;
    BACKSTAGE_REPORT_POS: TAdvGlowButton;
    Label6: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    BACKSTAGE_FP_SCAN: TAdvGlowButton;
    AdvShapeButton2: TAdvShapeButton;
    BACKSTAGE_ABSEN_MANUAL: TAdvGlowButton;
    HRD_MASTER_KARYAWAN: TdxBarSubItem;
    HRD_MASTER_KARYAWAN_ADMIN: TdxBarButton;
    HRD_MASTER_KARYAWAN_SPV: TdxBarButton;
    APP_EXIT: TdxBarLargeButton;
    HRD_MASTER_DIVISI: TdxBarButton;
    HRD_MASTER_AGAMA: TdxBarButton;
    HRD_MASTER_KONTRAK: TdxBarSubItem;
    HRD_MASTER_KONTRAK_ADMIN: TdxBarButton;
    HRD_MASTER_KONTRAK_SPV: TdxBarButton;
    dxBarSeparator1: TdxBarSeparator;
    HRD_KONTRAK_BERJALAN_SPV: TdxBarButton;
    HRD_KONTRAK_BERJALAN_ADMIN: TdxBarButton;
    dxBarSeparator2: TdxBarSeparator;
    HRD_KONTRAK_HISTORY_ADMIN: TdxBarButton;
    HRD_KONTRAK_HISTORY_SPV: TdxBarButton;
    HRD_SCAN_FINGER_USB: TdxBarLargeButton;
    HRD_REG_FINGER: TdxBarButton;
    HRD_MANUAL_ABSEN: TdxBarButton;
    HRD_INPUT_FORM: TdxBarSubItem;
    HRD_INPUT_LEMBUR: TdxBarButton;
    HRD_INPUT_CUTI: TdxBarButton;
    HRD_INPUT_SAKIT: TdxBarButton;
    HRD_INPUT_IJIN_KELUAR: TdxBarButton;
    HRD_INPUT_TIDAK_MASUK: TdxBarButton;
    HRD_INPUT_IJIN_MASUK: TdxBarButton;
    BACKSTAGE_INPUT_LEMBUR: TAdvGlowButton;
    Panel4: TPanel;
    Label8: TLabel;
    BACKSTAGE_MASTER_KARYAWAN_ADMIN: TAdvGlowButton;
    AdvShapeButton4: TAdvShapeButton;
    BACKSTAGE_KONTRAK_BERJALAN_SPV: TAdvGlowButton;
    BACKSTAGE_MASTER_KARYAWAN_SPV: TAdvGlowButton;
    BACKSTAGE_KONTRAK_BERJALAN_ADMIN: TAdvGlowButton;
    BACKSTAGE_INPUT_CUTI: TAdvGlowButton;
    AdvShapeButton5: TAdvShapeButton;
    BACKSTAGE_INPUT_PULANG: TAdvGlowButton;
    BACKSTAGE_INPUT_SAKIT: TAdvGlowButton;
    HRD_INPUT_IJIN_PULANG: TdxBarButton;
    DELETED_HRD_REKAP_PRESENSI: TdxBarLargeButton;
    BACKSTAGE_REKAP_PRESENSI: TAdvGlowButton;
    tmrClock: TTimer;
    HRD_SALDO_CUTI_GENERATE: TdxBarButton;
    HRD_SALDO_CUTI_EDIT: TdxBarButton;
    BarPosTrans: TdxBar;
    POS_TRANS: TdxBarLargeButton;
    POS_MASTER_MAIN_MENU: TdxBarLargeButton;
    POS_MASTER_GC: TdxBarSubItem;
    POS_GC_DETAILS: TdxBarButton;
    POS_GC_PACKET: TdxBarButton;
    pgReportPoS: TdxRibbonTab;
    barReportMasterPos: TdxBar;
    REPORT_MASTER_POS_GC: TdxBarSubItem;
    REPORT_MASTER_POS_GC_DETAIL: TdxBarButton;
    REPORT_MASTER_POS_GC_MASTER: TdxBarButton;
    POS_RELEASE_LOCK: TdxBarButton;
    POS_MASTER_PROMO: TdxBarLargeButton;
    POS_PAYMENT: TdxBarLargeButton;
    APP_MASTER_PASSWORD: TdxBarLargeButton;
    POS_MASTER_PAYMENT: TdxBarLargeButton;
    barMasterKasBank: TdxBar;
    MASTER_BANK_LIST: TdxBarLargeButton;
    MASTER_KAS_LIST: TdxBarLargeButton;
    BACKSTAGE_POS_PAYMENT: TAdvGlowButton;
    AdvShapeButton3: TAdvShapeButton;
    TrayIcon1: TTrayIcon;
    NotifMain: TNotificationCenter;
    POS_MASTER_MEMBERS: TdxBarLargeButton;
    POS_CARI_MEMBER: TdxBarButton;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    REPORT_POS_DAYLI_REVENUE: TdxBarLargeButton;
    REPORT_POS_DETAILS: TdxBarButton;
    REPORT_POS_MASTER: TdxBarButton;
    REPORT_POS_PAYMENT: TdxBarButton;
    REPORT_POS_MASTER_ADMIN: TdxBarButton;
    REPORT_POS_DETAILS_ADMIN: TdxBarButton;
    REPORT_POS_PAYMENT_ADMIN: TdxBarButton;
    POS_TR_CALL: TdxBarLargeButton;
    BarHrdpayroll: TdxBar;
    HRD_MASTER_PERIODE: TdxBarSubItem;
    HRD_PERIODE_PAYROLL: TdxBarButton;
    HRD_PERIODE_REPORT: TdxBarButton;
    HRD_PERIODE_UMX3: TdxBarButton;
    HRD_PERIODE_THR: TdxBarButton;
    HRD_MASTER_VARIABLE_REPORT: TdxBarButton;
    HRD_REPORT_THERAPIST: TdxBarLargeButton;
    POS_TR_START: TdxBarLargeButton;
    POS_TR_CALL_2: TdxBarLargeButton;
    HRD_REP_NILAI_TR: TdxBarLargeButton;
    POS_TR_STATUS: TdxBarLargeButton;
    REPORT_POS_PERIODIC_REVENUE: TdxBarLargeButton;
    POS_REJECT_GUEST: TdxBarButton;
    POS_TRANS_HOTEL: TdxBarLargeButton;
    POS_PAYMENT_HOTEL: TdxBarLargeButton;
    REPORT_POS_DAYLI_REVENUE_HOTEL: TdxBarLargeButton;
    POS_HISTORY_MEMBER: TdxBarLargeButton;
    REPORT_POS_TOP_REQUEST: TdxBarButton;
    REPORT_POS_DAYLI_REVENUE_ADMIN: TdxBarLargeButton;
    HRD_REKAP_PRESENSI_OLD: TdxBarLargeButton;
    HRD_JADWAL_OUTLET: TdxBarSubItem;
    HRD_JADWAL_TETAP: TdxBarButton;
    HRD_JADWAL_HARIAN: TdxBarButton;
    HRD_MASTER_SHIFT: TdxBarButton;
    dxBarSeparator3: TdxBarSeparator;
    dxBarSubItem1: TdxBarSubItem;
    HRD_PAYROLL_ADMIN: TdxBarButton;
    HRD_PAYROLL_SPV: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSeparator4: TdxBarSeparator;
    dxBarSeparator5: TdxBarSeparator;
    HRD_REP_PAYROLL_SPV: TdxBarButton;
    HRD_REP_PAYROLL_ADM: TdxBarButton;
    HRD_REP_PAYROLL_POTONGAN_SPV: TdxBarButton;
    HRD_REP_PAYROLL_TAMBAHAN_SPV: TdxBarButton;
    HRD_REP_PAYROLL_POTONGAN_ADM: TdxBarButton;
    HRD_REP_PAYROLL_TAMBAHAN_ADM: TdxBarButton;
    HRD_REP_PAYROLL_DETAILS_SPV: TdxBarButton;
    HRD_REP_PAYROLL_DETAILS_ADM: TdxBarButton;
    HRD_REP_PAYROLL_CASHIN_SPV: TdxBarButton;
    HRD_REP_PAYROLL_OTHER_SPV: TdxBarButton;
    HRD_REP_PAYROLL_CASHIN_ADM: TdxBarButton;
    HRD_REP_PAYROLL_OTHER_ADM: TdxBarButton;
    dxBarSeparator6: TdxBarSeparator;
    HRD_REP_KONTRAK_SPV: TdxBarButton;
    HRD_REP_KONTRAK_ADM: TdxBarButton;
    HRD_REP_REKAP_PRESENSI: TdxBarButton;
    HRD_REP_ABSEN_MANUAL: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    HRD_REPORT_LEMBUR: TdxBarButton;
    HRD_REPORT_SAKIT: TdxBarButton;
    HRD_REPORT_CUTI: TdxBarButton;
    REPORT_POS_VOID: TdxBarButton;
    REPORT_POS_VOID_ADMIN: TdxBarButton;
    HRD_LIBUR_NASIONAL: TdxBarButton;
    POS_DRIVER_MASTER: TdxBarSubItem;
    POS_DRIVERS_REGISTER: TdxBarButton;
    POS_DRIVERS_LIST: TdxBarButton;
    HRD_THR_ADMIN: TdxBarButton;
    HRD_THR_SPV: TdxBarButton;
    HRD_THR_PARAMETER: TdxBarButton;
    HRD_REP_THR_SPV: TdxBarButton;
    HRD_REP_THR_ADMIN: TdxBarButton;
    POS_TRANS_DRIVERS: TdxBarLargeButton;
    barOutletID: TcxBarEditItem;
    barMemo: TdxBarEdit;
    barLog: TcxBarEditItem;
    POS_TIPS_RCPT: TdxBarLargeButton;
    POS_TIPS_ADMIN: TdxBarLargeButton;
    REPORT_POS_TIPS_RCPT: TdxBarLargeButton;
    REPORT_POS_TIPS_ADMIN: TdxBarLargeButton;
    HRD_INPUT_CHANGE_JADWAL: TdxBarButton;
    HRD_REPORT_JADWAL: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    PRODUCT_MASTER: TdxBarSubItem;
    PROD_MASTER_BARANG: TdxBarButton;
    PROD_MASTER_SUPPLIER: TdxBarButton;
    BarProdHoTrans: TdxBar;
    BarProdOutletTrans: TdxBar;
    dxBarSubItem4: TdxBarSubItem;
    HRD_INPUT_ABSEN_MANUAL: TdxBarButton;
    REPORT_POS_DAYLI_REVENUE_BALI_ADMIN: TdxBarLargeButton;
    REPORT_POS_DAYLI_REVENUE_BALI: TdxBarLargeButton;
    tmrWebChat: TTimer;
    POS_MASTER_ROOM: TdxBarButton;
    POS_TR_FLOW: TdxBarLargeButton;
    procedure tmrWebChatTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BACKSTAGE_EXITClick(Sender: TObject);
    procedure edToolbarStylePropertiesChange(Sender: TObject);
    procedure mainSkinControlSkinForm(Sender: TObject; AForm: TCustomForm;
      var ASkinName: string; var UseSkin: Boolean);
    procedure edSkinStylePropertiesChange(Sender: TObject);
    procedure edColorSchemePropertiesChange(Sender: TObject);
    procedure edColorAccentPropertiesChange(Sender: TObject);
    procedure BACKSTAGE_CONFIGClick(Sender: TObject);
    procedure THEME_APPLYClick(Sender: TObject);
    procedure tmrFormLoginTimer(Sender: TObject);
    procedure BACKSTAGE_LOGINClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure APP_CHANGE_PASSClick(Sender: TObject);
    procedure APP_GROUPClick(Sender: TObject);
    procedure APP_USERClick(Sender: TObject);
    procedure POS_MAIN_TRANSClick(Sender: TObject);
    procedure APP_REG_BUTTONClick(Sender: TObject);
    procedure HRD_REG_FINGERClick(Sender: TObject);
    procedure HRD_SCAN_FINGER_USBClick(Sender: TObject);
    procedure BACKSTAGE_FP_SCANClick(Sender: TObject);
    procedure HRD_MASTER_DIVISIClick(Sender: TObject);
    procedure HRD_MASTER_KARYAWAN_SPVClick(Sender: TObject);
    procedure HRD_MASTER_KARYAWAN_ADMINClick(Sender: TObject);
    procedure BACKSTAGE_ABSEN_MANUALClick(Sender: TObject);
    procedure HRD_MANUAL_ABSENClick(Sender: TObject);
    procedure HRD_MASTER_KONTRAK_SPVClick(Sender: TObject);
    procedure HRD_MASTER_KONTRAK_ADMINClick(Sender: TObject);
    procedure HRD_INPUT_CUTIClick(Sender: TObject);
    procedure BACKSTAGE_MASTER_KARYAWAN_SPVClick(Sender: TObject);
    procedure BACKSTAGE_MASTER_KARYAWAN_ADMINClick(Sender: TObject);
    procedure BACKSTAGE_KONTRAK_BERJALAN_SPVClick(Sender: TObject);
    procedure BACKSTAGE_KONTRAK_BERJALAN_ADMINClick(Sender: TObject);
    procedure HRD_KONTRAK_BERJALAN_ADMINClick(Sender: TObject);
    procedure HRD_KONTRAK_BERJALAN_SPVClick(Sender: TObject);
    procedure DELETED_HRD_REKAP_PRESENSIClick(Sender: TObject);
    procedure tmrClockTimer(Sender: TObject);
    procedure HRD_INPUT_LEMBURClick(Sender: TObject);
    procedure APP_EXITClick(Sender: TObject);
    procedure BACKSTAGE_INPUT_CUTIClick(Sender: TObject);
    procedure BACKSTAGE_INPUT_LEMBURClick(Sender: TObject);
    procedure HRD_SALDO_CUTI_EDITClick(Sender: TObject);
    procedure HRD_SALDO_CUTI_GENERATEClick(Sender: TObject);
    procedure HRD_INPUT_SAKITClick(Sender: TObject);
    procedure HRD_INPUT_IJIN_PULANGClick(Sender: TObject);
    procedure BACKSTAGE_INPUT_PULANGClick(Sender: TObject);
    procedure BACKSTAGE_INPUT_SAKITClick(Sender: TObject);
    procedure HRD_INPUT_TIDAK_MASUKClick(Sender: TObject);
    procedure HRD_INPUT_IJIN_MASUKClick(Sender: TObject);
    procedure dxTabbedMDIManager1TdxTabbedMDITabPropertiesTcxPCCustomButtonsButtons0Click(
      Sender: TObject);
    procedure POS_TRANSClick(Sender: TObject);
    procedure POS_MASTER_MAIN_MENUClick(Sender: TObject);
    procedure POS_GC_DETAILSClick(Sender: TObject);
    procedure POS_GC_PACKETClick(Sender: TObject);
    procedure POS_RELEASE_LOCKClick(Sender: TObject);
    procedure POS_MASTER_PROMOClick(Sender: TObject);
    procedure POS_PAYMENTClick(Sender: TObject);
    procedure APP_MASTER_PASSWORDClick(Sender: TObject);
    procedure POS_MASTER_PAYMENTClick(Sender: TObject);
    procedure MASTER_BANK_LISTClick(Sender: TObject);
    procedure BACKSTAGE_POS_PAYMENTClick(Sender: TObject);
    procedure BACKSTAGE_TRANS_POSClick(Sender: TObject);
    procedure REPORT_MASTER_POS_GC_MASTERClick(Sender: TObject);
    procedure POS_MASTER_MEMBERSClick(Sender: TObject);
    procedure POS_CARI_MEMBERClick(Sender: TObject);
    procedure BACKSTAGE_REPORT_POSClick(Sender: TObject);
    procedure REPORT_POS_DAYLI_REVENUEClick(Sender: TObject);
    procedure REPORT_POS_DETAILSClick(Sender: TObject);
    procedure REPORT_POS_PAYMENTClick(Sender: TObject);
    procedure REPORT_POS_MASTER_ADMINClick(Sender: TObject);
    procedure REPORT_POS_PAYMENT_ADMINClick(Sender: TObject);
    procedure POS_TR_CALLClick(Sender: TObject);
    procedure HRD_MASTER_VARIABLE_REPORTClick(Sender: TObject);
    procedure HRD_PERIODE_REPORTClick(Sender: TObject);
    procedure HRD_REPORT_THERAPISTClick(Sender: TObject);
    procedure POS_TR_STARTClick(Sender: TObject);
    procedure POS_TR_CALL_2Click(Sender: TObject);
    procedure HRD_REP_NILAI_TRClick(Sender: TObject);
    procedure POS_TR_STATUSClick(Sender: TObject);
    procedure REPORT_POS_PERIODIC_REVENUEClick(Sender: TObject);
    procedure POS_REJECT_GUESTClick(Sender: TObject);
    procedure POS_TRANS_HOTELClick(Sender: TObject);
    procedure POS_PAYMENT_HOTELClick(Sender: TObject);
    procedure REPORT_POS_DAYLI_REVENUE_HOTELClick(Sender: TObject);
    procedure POS_HISTORY_MEMBERClick(Sender: TObject);
    procedure REPORT_POS_TOP_REQUESTClick(Sender: TObject);
    procedure HRD_PERIODE_THRClick(Sender: TObject);
    procedure REPORT_POS_DAYLI_REVENUE_ADMINClick(Sender: TObject);
    procedure HRD_REKAP_PRESENSI_OLDClick(Sender: TObject);
    procedure HRD_MASTER_SHIFTClick(Sender: TObject);
    procedure HRD_PAYROLL_ADMINClick(Sender: TObject);
    procedure HRD_PAYROLL_SPVClick(Sender: TObject);
    procedure HRD_JADWAL_TETAPClick(Sender: TObject);
    procedure HRD_JADWAL_HARIANClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_SPVClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_POTONGAN_SPVClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_ADMClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_DETAILS_SPVClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_DETAILS_ADMClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_OTHER_SPVClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_OTHER_ADMClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_CASHIN_SPVClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_CASHIN_ADMClick(Sender: TObject);
    procedure HRD_REPORT_LEMBURClick(Sender: TObject);
    procedure HRD_REP_ABSEN_MANUALClick(Sender: TObject);
    procedure HRD_REP_REKAP_PRESENSIClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_TAMBAHAN_ADMClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_TAMBAHAN_SPVClick(Sender: TObject);
    procedure HRD_REP_PAYROLL_POTONGAN_ADMClick(Sender: TObject);
    procedure HRD_REP_KONTRAK_ADMClick(Sender: TObject);
    procedure HRD_REP_KONTRAK_SPVClick(Sender: TObject);
    procedure HRD_REPORT_SAKITClick(Sender: TObject);
    procedure HRD_REPORT_CUTIClick(Sender: TObject);
    procedure REPORT_POS_MASTERClick(Sender: TObject);
    procedure REPORT_POS_DETAILS_ADMINClick(Sender: TObject);
    procedure REPORT_POS_VOIDClick(Sender: TObject);
    procedure REPORT_POS_VOID_ADMINClick(Sender: TObject);
    procedure HRD_PERIODE_PAYROLLClick(Sender: TObject);
    procedure HRD_LIBUR_NASIONALClick(Sender: TObject);
    procedure POS_DRIVERS_REGISTERClick(Sender: TObject);
    procedure POS_DRIVERS_LISTClick(Sender: TObject);
    procedure HRD_THR_PARAMETERClick(Sender: TObject);
    procedure HRD_THR_ADMINClick(Sender: TObject);
    procedure HRD_THR_SPVClick(Sender: TObject);
    procedure HRD_REP_THR_ADMINClick(Sender: TObject);
    procedure HRD_REP_THR_SPVClick(Sender: TObject);
    procedure POS_TRANS_DRIVERSClick(Sender: TObject);
    procedure POS_TIPS_ADMINClick(Sender: TObject);
    procedure POS_TIPS_RCPTClick(Sender: TObject);
    procedure REPORT_POS_TIPS_RCPTClick(Sender: TObject);
    procedure REPORT_POS_TIPS_ADMINClick(Sender: TObject);
    procedure HRD_INPUT_IJIN_KELUARClick(Sender: TObject);
    procedure HRD_INPUT_CHANGE_JADWALClick(Sender: TObject);
    procedure HRD_REPORT_JADWALClick(Sender: TObject);
    procedure HRD_INPUT_ABSEN_MANUALClick(Sender: TObject);
    procedure HRD_PERIODE_UMX3Click(Sender: TObject);
    procedure REPORT_POS_DAYLI_REVENUE_BALI_ADMINClick(Sender: TObject);
    procedure POS_MASTER_ROOMClick(Sender: TObject);
    procedure POS_TR_FLOWClick(Sender: TObject);
  private
    { Private declarations }
    CNTLOGIN : Integer;
    qrySetAccess, qryRegBut1, qryRegBut2, qryRegBut3, qryMain1 : TMyQuery;
    function CekInternet: Boolean;
    procedure LoadConfigApps();
    procedure LoadStyleList();

  public
    { Public declarations }
    LOCAL_DBNAME, LOCAL_DBUSER, LOCAL_DBHOST, LOCAL_DBPASS, LOCAL_DBPORT,
    USERAPPS, NAMEAPPS, GROUPAKSES,
    SERVER_DBNAME, SERVER_DBUSER, SERVER_DBHOST, SERVER_DBPASS, SERVER_DBPORT,
    STR_BUILDING, TXTPASS, TXTUSER, URLBASEMAILHOST, URLBASEMAILPORT,
    APP_VERSION, APP_TRADEMARK, APP_RELEASE, APP_NAME, APP_DEVELOPER,
    DBHRDNAME, DBPOSNAME, SESSION, APP_CHANGEDB, APP_OUTLETID, SATJUAL,
    APP_OUTLETNAME, APP_OUTLETADDRESS, APP_OUTLETPHONE, APP_OUTLETCITY,
    APP_OUTLETPROVINCE, APP_OUTLETZIPCODE, APP_OUTLETPLAT,
    MINPRICE, PASSDELETE, PASSCETAK, MEMBERDBNAME, JUDULATAS, JUDULBAWAH,
    MERGERDBNAME, FOOTER1, FOOTER2, FOOTER3, SUPABASE_URL, SUPABASE_KEY  : String;
    IDXSOPRINTER, IDXPOSPRINTER, N_PEMBULATAN, API_OUTLET_ID : Integer;
    ConfigJSON          : XSuperObject.ISuperObject;
    pnlSession : array[0..1] of TPanel;
    sesStatus : array[0..1] of TSessionMode;
    trnStatus : array[0..1] of TTransactionMode;
    function IsFormOpen(const FormName : string): Boolean;
    procedure RegisterButton;
    procedure KirimNotif(var Judul : String; NotIsi : String);
    procedure StartAccess(var GROUPAKSES: Integer);
    procedure UpdateBeliGC(var KodePaket : String; KodePayMain : String; KodeMember : String);
    procedure UpdatePakaiGC(var KodePayMain : String; NomorGC : String);
    procedure InsertMember(var KodeMember : String);
    procedure UpdateMember(var KodeMemberMain:String;KodePaymentMain:String;
              pTambah : Double; pKurang : Double; pSisa:Double; pAwal:Double; nSubtotal : Double);
    procedure PutNewMember(var KodeMemberMain:String;KodePaymentMain:String;
              pTambah : Double; pKurang : Double; pSisa:Double; pAwal:Double; nSubtotal : Double);
    procedure SendMemberMail(const namaCnt : String; emailAddress: string; subject: string; body: string; strattachFiles: string);
    procedure CekIDOUTLET;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}
uses FConfigSetup, FdmDB, FLogin, FPassword, FGroupManagement, FUserManagement,
  FRegKaryawan, FKaryawanScanFinger, FMasterDivisi, FMasterKaryawan,
  FPresensiManual, FMasterKontrak, FIjinCutiList, FRekapHarianBaru, FLemburList,
  FSaldoCuti, FSaldoCutiGenerate, FIjinSakitList, FIjinPulangList, FIjinTMList,
  FPosMainMenu, FPosTransMain, FGiftCertificate, FGiftCertificateMaster,
  FPosReleaseLock, FPosPromoMaster, FPosPembayaran, FMasterPassword,
  FPosMasterPayment, FMasterBank, FReportGCMaster, FMemberCari, FMemberMaster,
  FReportPendapatanHarian, FReportDayli, FReportPosPayment, FTherapisCall,
  FReportPeriode, FMasterReportVariable, FTherapistReport, FTherapisStart,
  FTherapisCall2, FLaporanTherapistReport, FTherapistStatus,
  FReportPendapatanBulanan, FReejectGuest, FPosTransHotel, FMemberHistory,
  FRepTopRequest, FTHRCutOff, FRekapHarianOld, FMasterShift, FPayrollAdmin,
  FJadwalTetap, FJadwalOutlet, FReportPayroll, FRepPayrollDetails,
  FReportOtherPayroll, FReportCashIn, FRepPotongan, FRepTambahan,
  FReportKontrakBerjalan, FReportAbsenManual, FReportRekapAbsen,
  FReportSakit, FReportCuti, FReportLembur, FReportPosMaster, FReportVoid,
  FPayrollPeriode, FLiburNasional, FRegistrationDrivers, FDrivers,
  FTHRPerhitungan, FTHRParameter, FTHRReport, FDriverSelectTrans,
  FPosTransPaymentTips, FPosLapTips, FIjinMasukList, FIjinKeluar, FChangeJadwal,
  FReportSchedule, FReportPendapatanHarianApi, FPeriodeUM,
  FBALIReportPendapatanHarian, FPosMstrRuangan, FTherapisFlow;

{ TForm2 }

procedure TfrmMain.InsertMember(var KodeMember: String);
var
  dbMemberPoint : TMyConnection;
  sQryFind, sQryCari, sQryExec, lqrySearch, lQryExec : TMyQuery;
  jSonItem : XSuperObject.ISuperObject;
  strJson, judulNotif, isiNotif : String;
begin
    lqrySearch := TMyQuery.Create(Self);
    lqrySearch.Connection := DMDB.dbInternal;
    lqrySearch.SQL.Add('select * from temptable');
    lqrySearch.Active := true;

    if (CekInternet = False) then
       begin
          jSonItem :=  XSuperObject.SO('{}');
          jSonItem.S['KodeMember'] := KodeMember;
          strJson := jSonItem.AsJSON(False, False);
          lQryExec.SQL.Clear;
          lQryExec.SQL.Add('insert into logmain values(' +
              '''' + '' + ''',' +
              '''' + 'MI' + ''',' +
              QuotedStr(strJson) + ');');
          lQryExec.ExecSQL;
       end;
    if (CekInternet = False) then
       begin
          jSonItem :=  XSuperObject.SO('{}');
          jSonItem.S['KodeMember'] := KodeMember;

          strJson := jSonItem.AsJSON(False, False);

          lQryExec.SQL.Clear;
          lQryExec.SQL.Add('insert into logmain values(' +
              '''' + '' + ''',' +
              '''' + 'MI' + ''',' +
              QuotedStr(strJson) + ');');
          lQryExec.ExecSQL;
       end;
   if (CekInternet = True) then
       begin
         dbMemberPoint := TMyConnection.Create(nil);
         dbMemberPoint.Server := frmMain.SERVER_DBHOST;
         dbMemberPoint.Database := frmMain.MEMBERDBNAME;
         dbMemberPoint.Username := frmMain.SERVER_DBUSER;
         dbMemberPoint.Password := frmMain.SERVER_DBPASS;
         dbMemberPoint.Port := StrToInt(frmMain.SERVER_DBPORT);
         try
              dbMemberPoint.Connected := True;
           Except
             on E : Exception do
             Exit;
           end;
         if (dbMemberPoint.Connected = True) then
           begin
              sQryCari := TMyQuery.Create(Self);
              sQryCari.Connection := dbMemberPoint;
              sQryCari.SQL.Add('select * from empty_x');
              sQryCari.Active := true;

              sQryFind := TMyQuery.Create(Self);
              sQryFind.Connection := dbMemberPoint;
              sQryFind.SQL.Add('select * from empty_x');
              sQryFind.Active := true;

              sQryExec := TMyQuery.Create(Self);
              sQryExec.Connection := dbMemberPoint;
              sQryExec.SQL.Add('select * from empty_x');
              sQryExec.Active := true;

              sQryExec.SQL.Clear;

              sQryCari.Close;
              sQryCari.SQL.Clear;
              sQryCari.SQL.Add('select id_members from members where id_members = ''' +
                   KodeMember + '''');
              sQryCari.Open;
              if (sQryCari.IsEmpty) then
                  begin
                    lqrySearch.Close;
                    lqrySearch.SQL.Clear;
                    lqrySearch.SQL.Add('select * from members where id_members = ''' +
                        KodeMember + '''');
                    lqrySearch.Open;
                    sQryExec.SQL.Add('insert into members values(' +
                          QuotedStr(lqrySearch.Fields[0].AsString) + ',' +
                          '''' + FormatDateTime('yyyy-MM-dd', lqrySearch.Fields[1].AsDateTime) + ''',' +
                          '''' + FormatDateTime('yyyy-MM-dd', lqrySearch.Fields[2].AsDateTime) + ''',' +
                          QuotedStr(lqrySearch.Fields[3].AsString) + ',' +
                          QuotedStr(lqrySearch.Fields[4].AsString) + ',' +
                          QuotedStr(lqrySearch.Fields[5].AsString) + ',' +
                          QuotedStr(lqrySearch.Fields[6].AsString) + ',' +
                          QuotedStr(lqrySearch.Fields[7].AsString) + ',' +
                          '''' + FormatDateTime('yyyy-MM-dd', lqrySearch.Fields[8].AsDateTime) + ''',' +
                          QuotedStr(lqrySearch.Fields[9].AsString) + ',' +
                          QuotedStr(lqrySearch.Fields[10].AsString) + ',' +
                          QuotedStr(lqrySearch.Fields[11].AsString) + ',' +
                          '''' + FloatToStr(lqrySearch.Fields[12].AsFloat) + ''',' +
                          '''' + lqrySearch.Fields[13].AsString + ''',' +
                          QuotedStr(lqrySearch.Fields[14].AsString) + ',' +
                          QuotedStr(lqrySearch.Fields[15].AsString) + ',' +
                          QuotedStr(lqrySearch.Fields[16].AsString) + ',' +
                          QuotedStr(frmMain.APP_OUTLETID) + ');');
                  end
              else if (NOT sQryCari.IsEmpty) then
                  begin
                    lqrySearch.Close;
                    lqrySearch.SQL.Clear;
                    lqrySearch.SQL.Add('select * from members where id_members = ''' +
                        KodeMember + '''');
                    lqrySearch.Open;
                    sQryExec.SQL.Add('update members set ' +
                      'nama_lengkap = ' + QuotedStr(lqrySearch.Fields[3].AsString) + ',' +
                      'alamat = ' + QuotedStr(lqrySearch.Fields[4].AsString) + ',' +
                      'id_identity = ' + QuotedStr(lqrySearch.Fields[6].AsString) + ',' +
                      'tempat_lahir = ' + QuotedStr(lqrySearch.Fields[7].AsString) + ',' +
                      'tanggal_lahir = ''' + FormatDateTime('yyyy-MM-dd', lqrySearch.Fields[8].AsDateTime) + ''',' +
                      'jenis_kelamin = ' + QuotedStr(lqrySearch.Fields[9].AsString) + ',' +
                      'staff_id = ' + QuotedStr(frmMain.USERAPPS) + ',' +
                      'notes = ' + QuotedStr(lqrySearch.Fields[11].AsString) + ',' +
                      'no_telepon = ' + QuotedStr(lqrySearch.Fields[15].AsString) + ',' +
                      'no_handphone = ' + QuotedStr(lqrySearch.Fields[16].AsString) + ' ' +
                      'where id_members = ''' + KodeMember + ''';');
                  end;

              sQryFind.Close;
              sQryFind.SQL.Clear;
              sQryFind.SQL.Add('select id_members from saldoawal where id_members = ''' +
                   KodeMember + '''');
              sQryFind.Open;

             if (sQryFind.IsEmpty) then
               begin
                  sQryExec.SQL.Add('insert into saldoawal values(' +
                     '''' + KodeMember + ''',' +
                     '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                     '''' + FloatToStr(0) + ''',' +
                     QuotedStr(frmMain.USERAPPS) + ',' +
                     '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                     '''' + 'NONE' + ''');');
               end;

             sQryExec.ExecSQL;
             judulNotif := 'Update Member';
             isiNotif := 'Update Data Member ' + LeftStr(KodeMember, 8) + ' Ke Server Online Selesai !';
             KirimNotif(judulNotif, isiNotif);
             sQryCari.Free;
             sQryFind.Free;
             sQryExec.Free;
             dbMemberPoint.Disconnect;
           end
         else if (dbMemberPoint.Connected = False) then
           begin
              jSonItem :=  XSuperObject.SO('{}');
              jSonItem.S['KodeMember'] := KodeMember;
              strJson := jSonItem.AsJSON(False, False);

              lQryExec.SQL.Clear;
              lQryExec.SQL.Add('insert into logmain values(' +
                  '''' + '' + ''',' +
                  '''' + 'MI' + ''',' +
                  QuotedStr(strJson) + ');');
              lQryExec.ExecSQL;
           end;

         dbMemberPoint.Free;
       end;
   lqrySearch.Free;
end;

function TfrmMain.IsFormOpen(const FormName : string): Boolean;
var
  i: Integer;
begin
     Result := False;
     for i := Screen.FormCount - 1 DownTo 0 do
         if (Screen.Forms[i].Name = FormName) then
             begin
                  Result := True;
                  Break;
             end;
end;

procedure TfrmMain.KirimNotif(var Judul: String; NotIsi: String);
var
  notifikasi : TNotification;
begin
   notifikasi := NotifMain.CreateNotification;
   try
      notifikasi.Name := frmMain.APP_OUTLETNAME;
      notifikasi.Title := Judul;
      notifikasi.AlertBody := NotIsi;
      NotifMain.PresentNotification(notifikasi);
    finally
      notifikasi.Free;
    end;
end;

procedure TfrmMain.RegisterButton;
var
   i, y : Integer;
   nameBtn, nameUnit, capBtn, namaTombol, strCaption, nameParent : String;
   cCOmpClass : TComponentClass;
   cCompName : TComponentName;
   tempComp : TComponent;
begin
  if (dmDB.dbInternal.Connected = False) then Exit;
  Screen.Cursor := crHourGlass;
  qryRegBut1 := TMyQuery.Create(Self);
  qryRegBut1.Connection := DMDB.dbInternal;
  qryRegBut1.SQL.Add('select * from temptable');
  qryRegBut1.Active := true;

  qryRegBut2 := TMyQuery.Create(Self);
  qryRegBut2.Connection := DMDB.dbInternal;
  qryRegBut2.SQL.Add('select * from temptable');
  qryRegBut2.Active := true;

  qryRegBut3 := TMyQuery.Create(Self);
  qryRegBut3.Connection := DMDB.dbInternal;
  qryRegBut3.SQL.Add('select * from temptable');
  qryRegBut3.Active := true;


     for i := 0 to frmMain.ComponentCount - 1 do
         begin
          strCaption := frmMain.Components[i].UnitName;
          nameBtn := frmMain.Components[i].Name;
          nameUnit := frmMain.Components[i].ClassName;
          nameParent := frmMain.Components[i].ClassParent.ClassName;
          //ShowMessage('Button Name : ' + nameBtn + #13 + 'Unit Name : ' + nameUnit + #13 + 'Parent Name : ' + nameParent + #13);
          if ((nameUnit = 'TcxButton') OR (nameUnit = 'TdxBarButton') OR
              (nameUnit = 'TdxBarLargeButton') OR (nameUnit = 'TAdvGlowButton')) then
              begin
               nameBtn := frmMain.Components[i].Name;
               nameParent := frmMain.Components[i].GetParentComponent.Name;
               with dmDB do
                    begin
                         qryRegBut2.Close;
                         qryRegBut2.SQL.Clear;
                         qryRegBut2.SQL.Add('select regname from regbutton where regname = ''' +
                                           nameBtn + '''');
                         qryRegBut2.Open;
                         if (qryRegBut2.IsEmpty) then
                             begin
                                  qryRegBut3.Close;
                                  qryRegBut3.SQL.Clear;
                                  qryRegBut3.SQL.Add('insert into regbutton values(' +
                                     '''' + '' + ''',' +
                                     '''' + nameBtn + ''',' +
                                     '''' + nameParent + ''',' +
                                     '''' + nameUnit + ''',' +
                                     '''' + 'ZEN INTERNAL SYSTEM' + ''')');
                                  qryRegBut3.ExecSQL;
                             end;
                    end;
              end;
          Application.ProcessMessages;
         end;

     qryRegBut1.Free;
     qryRegBut2.Free;
     qryRegBut3.Free;
     Screen.Cursor := crDefault;
end;

procedure TfrmMain.REPORT_MASTER_POS_GC_MASTERClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportGCMaster')) then
       begin
            Application.CreateForm(TfrmReportGCMaster, frmReportGCMaster);
            frmReportGCMaster.FormStyle := fsMDIChild;
            frmReportGCMaster.Show;
            frmReportGCMaster.WindowState := wsNormal;
            frmReportGCMaster.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportGCMaster')) then
        begin
             ShowMessage('Form Report GC Packet has been created');
             frmReportGCMaster.Show;
             frmReportGCMaster.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_DAYLI_REVENUEClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportPendapatanHarianApi')) then
       begin
            Application.CreateForm(TfrmReportPendapatanHarianApi, frmReportPendapatanHarianApi);
            frmReportPendapatanHarianApi.FormStyle := fsMDIChild;
            frmReportPendapatanHarianApi.Show;
            frmReportPendapatanHarianApi.WindowState := wsNormal;
            frmReportPendapatanHarianApi.Position := poDesktopCenter;
            frmReportPendapatanHarianApi.edServerTime.Properties.ReadOnly := True;
       end
     else if (IsFormOpen('frmReportPendapatanHarianApi')) then
        begin
             frmReportPendapatanHarianApi.edServerTime.Properties.ReadOnly := True;
             ShowMessage('Form Report GC Packet has been created');
             frmReportPendapatanHarianApi.Show;
             frmReportPendapatanHarianApi.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_DAYLI_REVENUE_ADMINClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportPendapatanHarianApi')) then
       begin
            Application.CreateForm(TfrmReportPendapatanHarianApi, frmReportPendapatanHarianApi);
            frmReportPendapatanHarianApi.FormStyle := fsMDIChild;
            frmReportPendapatanHarianApi.Show;
            frmReportPendapatanHarianApi.WindowState := wsNormal;
            frmReportPendapatanHarianApi.Position := poDesktopCenter;
            frmReportPendapatanHarianApi.edServerTime.Properties.ReadOnly := False;
       end
     else if (IsFormOpen('frmReportPendapatanHarianApi')) then
        begin
             frmReportPendapatanHarianApi.edServerTime.Properties.ReadOnly := False;
             ShowMessage('Form Report Harian has been created');
             frmReportPendapatanHarianApi.Show;
             frmReportPendapatanHarianApi.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_DAYLI_REVENUE_BALI_ADMINClick(Sender: TObject);
begin
     if (not IsFormOpen('frmBALIReportPendapatanHarian')) then
       begin
            Application.CreateForm(TfrmBALIReportPendapatanHarian, frmBALIReportPendapatanHarian);
            frmBALIReportPendapatanHarian.FormStyle := fsMDIChild;
            frmBALIReportPendapatanHarian.Show;
            frmBALIReportPendapatanHarian.WindowState := wsNormal;
            frmBALIReportPendapatanHarian.Position := poDesktopCenter;
            frmBALIReportPendapatanHarian.edServerTime.Properties.ReadOnly := False;
       end
     else if (IsFormOpen('frmBALIReportPendapatanHarian')) then
        begin
             frmBALIReportPendapatanHarian.edServerTime.Properties.ReadOnly := False;
             ShowMessage('Form Report Harian has been created');
             frmBALIReportPendapatanHarian.Show;
             frmBALIReportPendapatanHarian.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_DAYLI_REVENUE_HOTELClick(Sender: TObject);
begin
  if (not IsFormOpen('frmReportPendapatanHarian')) then
       begin
            Application.CreateForm(TfrmReportPendapatanHarian, frmReportPendapatanHarian);
            frmReportPendapatanHarian.Tag := 1;
            frmReportPendapatanHarian.edServerTime.Properties.ReadOnly := False;
            frmReportPendapatanHarian.FormStyle := fsMDIChild;
            frmReportPendapatanHarian.Show;
            frmReportPendapatanHarian.WindowState := wsNormal;
            frmReportPendapatanHarian.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportPendapatanHarian')) then
        begin
             ShowMessage('Form Report GC Packet has been created');
             frmReportPendapatanHarian.Tag := 1;
             frmReportPendapatanHarian.edServerTime.Properties.ReadOnly := False;
             frmReportPendapatanHarian.Show;
             frmReportPendapatanHarian.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.SendMemberMail(const namaCnt: String; emailAddress,
  subject,body,strattachFiles: string);
var
  qryEmail : TMyQuery;
  MailAcc, MailPass, judulNotif, isiNotif : String;
  Attachmentfile: TIdAttachmentFile;
  lsBody : TStringList;
  isOkMail : Boolean;
begin
  //ShowMessage('A');
  if (CekInternet = False) then
       begin
         judulNotif := 'Internet Disconnected';
         isiNotif := 'Failed Send Mail to ' + namaCnt;
         KirimNotif(judulNotif, isiNotif);
         Exit;
       end;
  isOkMail := ValidateEmail(emailAddress);
  //ShowMessage('B');
  if (isOkMail = False) then
    begin
      ShowMessage('Invalid Email Address !!' + #13 +
                  'Please Check Your Mail Address !');
      Exit;
    end;
  //ShowMessage('C');
  lsBody := TStringList.Create;
  qryEmail := TMyQuery.Create(Self);
  qryEmail.Connection := DMDB.dbInternal;
  qryEmail.SQL.Add('select * from temptable');
  qryEmail.Active := true;

  qryEmail.Close;
  qryEmail.SQL.Clear;
  qryEmail.SQL.Add('select passkey from ben_master_password where moduleinfo = ''' +
      'MAIN_MAIL_PASSWORD' + '''');
  qryEmail.Open;
  MailPass := DecryptPass(qryEmail.Fields[0].AsString);
  //ShowMessage('D');
  //ShowMessage(MailPass);
  qryEmail.Close;
  qryEmail.SQL.Clear;
  qryEmail.SQL.Add('select passkey from ben_master_password where moduleinfo = ''' +
      'MAIN_MAIL' + '''');
  qryEmail.Open;
  MailAcc := qryEmail.Fields[0].AsString;
  //ShowMessage(MailAcc);

  lsBody.Text := body;
  // IO HANDLER SETTINGS //
  With IdSSLIOHandlerSocketOpenSSL1 do
      begin
        Destination := 'smtp.gmail.com:587';
        Host := 'smtp.gmail.com';
        MaxLineAction := maException;
        Port := 587;
        SSLOptions.Method := sslvTLSv1;
        SSLOptions.Mode := sslmUnassigned;
        SSLOptions.VerifyMode := [];
        SSLOptions.VerifyDepth := 0;
      end;
  //SETTING SMTP COMPONENT DATA //
  IdSMTP1.Host := 'smtp.gmail.com';
  IdSMTP1.Port := 587;
  IdSMTP1.Username := MailAcc; // please change to your gmail address //
  IdSMTP1.Password := MailPass;
  IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
  IdSMTP1.AuthType := satDefault;
  IdSMTP1.UseTLS := utUseExplicitTLS;

  // SETTING email MESSAGE DATA //
  IdMessage1.Clear;
  // add recipient list //
  with IdMessage1.Recipients.Add do
  begin
    Name := namaCnt;
    Address := emailAddress; // please change email address as required //
  end;
  {
  // add CC list //
  with IdMessage1.CCList.Add do
  begin
    Name := 'CC Recipient 1';
    Address := CCRecipient1@email.com; // please change email address as required //
  end;
//add BCC list //
  with IdMessage1.BCCList.Add do
  begin
    Name := 'BCC Recipient 1';
    Address := BCCRecipient1@email.com; // please change email address as required //
  end;
  }
  //add Attachment to mail //
  Attachmentfile := TIdAttachmentFile.Create(IdMessage1.MessageParts,strattachFiles);
  IdMessage1.From.Address :=  MailAcc; // please change to your gmail address //;
  IdMessage1.Subject := subject;
  IdMessage1.Body := lsBody;
  //IdMessage1.Priority := mpHigh;
  TRY
      IdSMTP1.Connect();
      IdSMTP1.Send(IdMessage1);
      judulNotif := 'Send Mail';
      isiNotif := 'Send Mail to ' + namaCnt + ' Success!';
      KirimNotif(judulNotif, isiNotif);
      IdSMTP1.Disconnect();
    except on e:Exception do
      begin
        judulNotif := 'Send Mail';
        isiNotif := 'Failed Send Mail to ' + namaCnt;
        KirimNotif(judulNotif, isiNotif);
        IdSMTP1.Disconnect();
      end;
  end;
  AttachmentFile.Free;
  lsBody.Free;
  qryEmail.Free;
end;

procedure TfrmMain.StartAccess(var GROUPAKSES: Integer);
var
  i : Integer;
  nameBtn, nameUnit, capBtn, namaTombol, nameParent, strCaption, strSql : String;
begin
  Screen.Cursor := crHourGlass;
  qrySetAccess := TMyQuery.Create(Self);
  qrySetAccess.Connection := DMDB.dbInternal;
  qrySetAccess.SQL.Add('select * from temptable');
  qrySetAccess.Active := true;
     for i := 0 to frmMain.ComponentCount - 1 do
       begin
          strCaption := frmMain.Components[i].UnitName;
          nameBtn := frmMain.Components[i].Name;
          nameUnit := frmMain.Components[i].ClassName;
          nameParent := frmMain.Components[i].ClassParent.ClassName;
        if ((nameUnit = 'TcxButton') OR (nameUnit = 'TdxBarButton')
              OR (nameUnit = 'TdxBarLargeButton') OR (nameUnit = 'TAdvGlowButton')) then
            begin
               qrySetAccess.Close;
               qrySetAccess.SQL.Clear;
               qrySetAccess.SQL.Add('select autonum from usersakses where idusergroup = ''' +
                      IntToStr(GROUPAKSES) + ''' and regname = ''' +
                      nameBtn + '''');
               qrySetAccess.Open;
               if (qrySetAccess.IsEmpty) then
                  begin
                      if (frmMain.Components[i] is TcxButton) then
                         begin
                              (frmMain.Components[i] as TcxButton).Visible := False;
                         end
                      else if (frmMain.Components[i] is TdxBarButton) then
                         begin
                              (frmMain.Components[i] as TdxBarButton).Visible := ivNever;
                         end
                      else if (frmMain.Components[i] is TAdvGlowButton) then
                         begin
                              (frmMain.Components[i] as TAdvGlowButton).Enabled := False;
                         end
                      else if (frmMain.Components[i] is TdxBarLargeButton) then
                         begin
                              (frmMain.Components[i] as TdxBarLargeButton).Visible := ivNever;
                         end;

                  end
               else if (NOT qrySetAccess.IsEmpty) then
                  begin
                     if (frmMain.Components[i] is TcxButton) then
                         begin
                              (frmMain.Components[i] as TcxButton).Visible := True;
                         end
                     else if (frmMain.Components[i] is TAdvGlowButton) then
                         begin
                              (frmMain.Components[i] as TAdvGlowButton).Enabled := True;
                         end
                      else if (frmMain.Components[i] is TdxBarButton) then
                         begin
                              (frmMain.Components[i] as TdxBarButton).Visible := ivAlways;
                         end
                      else if (frmMain.Components[i] is TdxBarLargeButton) then
                         begin
                              (frmMain.Components[i] as TdxBarLargeButton).Visible := ivAlways;
                         end;
                  end;

            end;
       end;
     qrySetAccess.Free;
     Screen.Cursor := crDefault;
     PAGE_CONTROL.Enabled := True;
     TTask.Run(
                procedure
                  begin
                     TThread.Synchronize(nil,
                        procedure
                        begin
                           frmMain.CekIDOUTLET;
                        end);
                  end
               );
end;

procedure TfrmMain.tmrClockTimer(Sender: TObject);
begin
    mainStatusBar.Panels[1].Text := FormatDateTime('dd-MMMM-yyyy hh:mm:ss', Now);
end;

procedure TfrmMain.tmrWebChatTimer(Sender: TObject);
var
  HTTP: THTTPClient;
  Resp: IHTTPResponse;
  Headers: TNetHeaders;
  Endpoint: string;
  JSONArray: ISuperArray;
  JSONRoom: ISuperObject;
  sMemberName, sLastMsg, sCategory: string;
  Note: TNotification;
begin
  if (SUPABASE_URL = '') or (SUPABASE_KEY = '') or (APP_OUTLETID = '') then Exit;
  if not IsFormOpen('frmPosTransMain') then
  begin
    tmrWebChat.Enabled := False;
    Exit;
  end;

  tmrWebChat.Enabled := False;
  try
    HTTP := THTTPClient.Create;
    try
      HTTP.ConnectionTimeout := 5000;
      HTTP.ResponseTimeout := 8000;
      SetLength(Headers, 3);
      Headers[0] := TNameValuePair.Create('apikey', SUPABASE_KEY);
      Headers[1] := TNameValuePair.Create('Authorization', 'Bearer ' + SUPABASE_KEY);
      Headers[2] := TNameValuePair.Create('Accept', 'application/json');

      Endpoint := SUPABASE_URL + 'web_chat_rooms?kode_outlet=eq.' + APP_OUTLETID +
                  '&unread_by_outlet=eq.true&status=in.(WAITING_STAFF,ACTIVE)&select=id,member_name,last_message,category&limit=1';

      Resp := HTTP.Get(Endpoint, nil, Headers);
      if Resp.StatusCode = 200 then
      begin
        JSONArray := SA(Resp.ContentAsString);
        if Assigned(JSONArray) and (JSONArray.Length > 0) then
        begin
          JSONRoom := JSONArray.O[0];
          sMemberName := JSONRoom.S['member_name'];
          sLastMsg := JSONRoom.S['last_message'];
          sCategory := JSONRoom.S['category'];

            MessageBeep(MB_ICONASTERISK);
            barLog.EditValue := Format('[CHAT TAMU] %s (%s): %s', [sMemberName, sCategory, sLastMsg]);

            try
              Note := frmMain.NotifMain.CreateNotification;
              try
                Note.Name := 'WEB_CHAT_ALERT';
                Note.Title := 'Pesan Tamu Website (' + APP_OUTLETNAME + ')';
                Note.AlertBody := 'Tamu: ' + sMemberName + ' - "' + sLastMsg + '"';
                Note.FireDate := Now;
                frmMain.NotifMain.PresentNotification(Note);
              finally
                Note.Free;
              end;
            except
            end;
          end;
        end;
    finally
      HTTP.Free;
    end;
  except
  end;

  if IsFormOpen('frmPosTransMain') then
    tmrWebChat.Enabled := True;
end;

procedure TfrmMain.tmrFormLoginTimer(Sender: TObject);
begin
     //ShowMessage(IntToStr(CNTLOGIN));
     CNTLOGIN := CNTLOGIN + 1;
     if (CNTLOGIN = 2) then
        begin
            Application.CreateForm(TfrmLogin, frmLogin);
            frmLogin.Show;
            tmrFormLogin.Enabled := False;
            {if (APP_CHANGEDB = 'Y') then
               begin
                   frmLogin.btnLoadOther.Visible := True;
               end
            else if (APP_CHANGEDB = 'N') then
               begin
                   frmLogin.btnLoadOther.Visible := False;
               end;}

        end;

end;

procedure TfrmMain.UpdateBeliGC(var KodePaket: String; KodePayMain: String; KodeMember : String);
var
  lqrySearch: TMyQuery;
  BulkGC: ISuperArray;
  JSONGC: ISuperObject;
  sGCNumber, sPack, sMember, sOutletBuy, sQRCode, sPayloadJSON, sUrl, sKey, sPayCode: String;
  dtTglJual, dtExpired: TDateTime;
  bIsActive, bHasUsed: Boolean;
begin
  if (Trim(SUPABASE_URL) = '') or (Trim(SUPABASE_KEY) = '') then
  begin
    barLog.EditValue := '[GC-BUY] Konfigurasi Supabase belum diisi. SyncAgent akan menyusulkan data gc_sold.';
    Exit;
  end;

  lqrySearch := TMyQuery.Create(nil);
  try
    lqrySearch.Connection := DMDB.dbInternal;
    lqrySearch.SQL.Text :=
      'SELECT s.*, ' +
      '  (SELECT d.paket_number FROM gc_detail d WHERE d.gc_number = s.gc_number LIMIT 1) AS pack_number ' +
      'FROM gc_sold s ' +
      'WHERE s.payment_jual = :pPay ' +
      '  AND s.gc_number IS NOT NULL AND s.gc_number <> '''' AND s.gc_number <> ''(NONE)''';
    lqrySearch.ParamByName('pPay').AsString := KodePayMain;
    lqrySearch.Open;

    if lqrySearch.IsEmpty then
    begin
      barLog.EditValue := '[GC-BUY] Tidak ditemukan data gc_sold untuk payment ' + KodePayMain;
      Exit;
    end;

    BulkGC := SA();
    while not lqrySearch.Eof do
    begin
      sGCNumber := Trim(lqrySearch.FieldByName('gc_number').AsString);
      sPack := Trim(lqrySearch.FieldByName('pack_number').AsString);
      if (sPack = '') or (sPack = '(NONE)') then
        sPack := Trim(KodePaket);

      sMember := Trim(lqrySearch.FieldByName('id_members').AsString);
      if (sMember = '') or (sMember = '(NONE)') then
        sMember := Trim(KodeMember);

      sOutletBuy := Trim(lqrySearch.FieldByName('outlet_jual').AsString);
      if (sOutletBuy = '') or (sOutletBuy = '(NONE)') then
        sOutletBuy := APP_OUTLETID;

      if (not lqrySearch.FieldByName('tgl_jual').IsNull) and (FormatDateTime('yyyy', lqrySearch.FieldByName('tgl_jual').AsDateTime) <> '2000') then
      begin
        dtTglJual := lqrySearch.FieldByName('tgl_jual').AsDateTime;
        // Jika tanggal jual = hari ini (kolom DATE tanpa jam), gunakan jam real-time Now
        if DateOf(dtTglJual) = Date then
          dtTglJual := Now;
      end
      else
        dtTglJual := Now;

      // expired_date selalu 120 hari dari tanggal beli (tgl_jual / buy_at)
      dtExpired := IncDay(DateOf(dtTglJual), 120);

      bIsActive := UpperCase(Trim(lqrySearch.FieldByName('aktif').AsString)) <> 'N';
      bHasUsed := UpperCase(Trim(lqrySearch.FieldByName('pakai').AsString)) = 'Y';

      JSONGC := SO();
      if (sMember <> '') and (sMember <> '(NONE)') then
        JSONGC.S['user_uid'] := sMember
      else
        JSONGC.Null['user_uid'] := jNull;

      JSONGC.S['gc_number'] := sGCNumber;
      JSONGC.S['gc_barcode'] := sGCNumber;

      sQRCode := Trim(lqrySearch.FieldByName('notes').AsString);
      if (sQRCode <> '') and (sQRCode <> '(NONE)') then
        JSONGC.S['qrcode'] := sQRCode
      else
        JSONGC.Null['qrcode'] := jNull;

      if (sPack <> '') and (sPack <> '(NONE)') then
        JSONGC.S['pack_number'] := sPack
      else
        JSONGC.Null['pack_number'] := jNull;

      JSONGC.S['nama_gc'] := lqrySearch.FieldByName('nama_menu').AsString;
      JSONGC.F['value'] := lqrySearch.FieldByName('harga_jasa').AsFloat;
      JSONGC.S['buy_at'] := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss"+07:00"', dtTglJual);
      JSONGC.S['expired_date'] := FormatDateTime('yyyy-mm-dd', dtExpired);
      JSONGC.B['is_active'] := bIsActive;
      JSONGC.B['has_used'] := bHasUsed;
      JSONGC.Null['used_at'] := jNull;
      JSONGC.S['id_payment_buy'] := KodePayMain;
      JSONGC.Null['id_payment_used'] := jNull;
      JSONGC.S['kode_outlet_buy'] := sOutletBuy;
      JSONGC.Null['kode_outlet_used'] := jNull;

      BulkGC.Add(JSONGC);
      lqrySearch.Next;
    end;

    if BulkGC.Length = 0 then Exit;
    sPayloadJSON := BulkGC.AsJSON;
  finally
    lqrySearch.Free;
  end;

  // Capture immutable strings for background HTTP dispatch (zero UI blocking)
  sUrl := SUPABASE_URL;
  sKey := SUPABASE_KEY;
  sPayCode := KodePayMain;

  TTask.Run(
    procedure
    var
      HTTP: THTTPClient;
      Headers: TNetHeaders;
      ReqBody: TStringStream;
      Resp: IHTTPResponse;
      sErrMsg: String;
      iStatus: Integer;
    begin
      HTTP := THTTPClient.Create;
      ReqBody := TStringStream.Create(sPayloadJSON, TEncoding.UTF8);
      try
        HTTP.ConnectionTimeout := 5000;
        HTTP.ResponseTimeout := 10000;
        SetLength(Headers, 4);
        Headers[0] := TNameValuePair.Create('apikey', sKey);
        Headers[1] := TNameValuePair.Create('Authorization', 'Bearer ' + sKey);
        Headers[2] := TNameValuePair.Create('Content-Type', 'application/json');
        // Insert-only: mencegah menimpa status has_used=true jika GC sudah dipakai di cabang lain
        Headers[3] := TNameValuePair.Create('Prefer', 'resolution=ignore-duplicates');
        try
          Resp := HTTP.Post(sUrl + 'ot_pos_gc_transaction?on_conflict=gc_number', ReqBody, nil, Headers);
          iStatus := Resp.StatusCode;
          if (iStatus = 200) or (iStatus = 201) then
          begin
            TThread.Queue(nil,
              procedure
              var
                Judul, Isi: String;
              begin
                Judul := 'Upload GC';
                Isi := 'Upload Pembelian GC ' + sPayCode + ' ke Supabase Selesai';
                KirimNotif(Judul, Isi);
                barLog.EditValue := '[GC-BUY] ' + Isi + ' (HTTP ' + IntToStr(iStatus) + ')';
              end);
          end
          else
          begin
            sErrMsg := Format('[GC-BUY] Gagal upload GC %s (HTTP %d): %s. SyncAgent akan menyusulkan otomatis.',
              [sPayCode, iStatus, Resp.ContentAsString]);
            TThread.Queue(nil,
              procedure
              begin
                barLog.EditValue := sErrMsg;
              end);
          end;
        except
          on E: Exception do
          begin
            sErrMsg := '[GC-BUY] Koneksi Supabase gagal untuk ' + sPayCode + ': ' + E.Message + ' (SyncAgent akan menyusulkan otomatis)';
            TThread.Queue(nil,
              procedure
              begin
                barLog.EditValue := sErrMsg;
              end);
          end;
        end;
      finally
        ReqBody.Free;
        HTTP.Free;
      end;
    end);
end;

procedure TfrmMain.UpdateMember(var KodeMemberMain: String;
  KodePaymentMain: String; pTambah, pKurang, pSisa, pAwal, nSubtotal: Double);
var
  dbMemberPoint : TMyConnection;
  sQryCari, sQryExec, lqrySearch, lQryExec : TMyQuery;
  jSonItem : XSuperObject.ISuperObject;
  strJson, judulNotif, isiNotif : String;
begin
    lqrySearch := TMyQuery.Create(Self);
    lqrySearch.Connection := DMDB.dbInternal;
    lqrySearch.SQL.Add('select * from temptable');
    lqrySearch.Active := true;

    lQryExec := TMyQuery.Create(Self);
    lQryExec.Connection := DMDB.dbInternal;
    lQryExec.SQL.Add('select * from temptable');
    lQryExec.Active := true;
   if (CekInternet = False) then
       begin
          jSonItem :=  XSuperObject.SO('{}');
          jSonItem.S['KodePayMain'] := KodePaymentMain;
          jSonItem.S['KodeMemberMain'] := KodeMemberMain;
          jSonItem.F['pTambah'] := pTambah;
          jSonItem.F['pKurang'] := pKurang;
          jSonItem.F['pSisa'] := pSisa;
          jSonItem.F['pAwal'] := pAwal;
          jSonItem.F['nSubtotal'] := nSubtotal;
          strJson := jSonItem.AsJSON(False, False);

          lQryExec.SQL.Clear;
          lQryExec.SQL.Add('insert into logmain values(' +
              '''' + '' + ''',' +
              '''' + 'MP' + ''',' +
              QuotedStr(strJson) + ');');
          lQryExec.ExecSQL;
       end;
   if (CekInternet = True) then
       begin
         dbMemberPoint := TMyConnection.Create(nil);
         dbMemberPoint.Server := frmMain.SERVER_DBHOST;
         dbMemberPoint.Database := frmMain.MEMBERDBNAME;
         dbMemberPoint.Username := frmMain.SERVER_DBUSER;
         dbMemberPoint.Password := frmMain.SERVER_DBPASS;
         dbMemberPoint.Port := StrToInt(frmMain.SERVER_DBPORT);
         try
              dbMemberPoint.Connected := True;
           Except
             on E : Exception do
             Exit;
           end;
         if (dbMemberPoint.Connected = True) then
           begin
              sQryCari := TMyQuery.Create(Self);
              sQryCari.Connection := dbMemberPoint;
              sQryCari.SQL.Add('select * from empty_x');
              sQryCari.Active := true;

              sQryExec := TMyQuery.Create(Self);
              sQryExec.Connection := dbMemberPoint;
              sQryExec.SQL.Add('select * from empty_x');
              sQryExec.Active := true;

              sQryExec.SQL.Clear;

              sQryCari.Close;
              sQryCari.SQL.Clear;
              sQryCari.SQL.Add('select id_members from saldoawal where id_members = ''' +
                   KodeMemberMain + '''');
              sQryCari.Open;

             if (sQryCari.IsEmpty) then
               begin
                  sQryExec.SQL.Add('insert into saldoawal values(' +
                     '''' + KodeMemberMain + ''',' +
                     '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                     '''' + FloatToStr(pSisa) + ''',' +
                     QuotedStr(frmMain.USERAPPS) + ',' +
                     '''' + FormatDateTime('yyyy-MM-dd hh:mm:ss', Now) + ''',' +
                     '''' + 'NONE' + ''');');
               end;
             sQryExec.Sql.Add('insert into history_trans(trans_id, tanggal, waktu, jumlah_trans, id_member, point_a,' +
                      'point_t, point_k, point_end, id_outlet, user_input) values(' +
                      '''' + KodePaymentMain + ''',' +
                      '''' + FormatDateTime('yyyy-MM-dd', Date) + ''',' +
                      '''' + FormatDateTime('hh:mm:ss', Time) + ''',' +
                      '''' + FloatToStr(nSubtotal) + ''',' +
                      '''' + KodeMemberMain + ''',' +
                      '''' + FloatToStr(pAwal) + ''',' +
                      '''' + FloatToStr(pTambah) + ''',' +
                      '''' + FloatToStr(pKurang) + ''',' +
                      '''' + FloatToStr(pSisa) + ''',' +
                      '''' + frmMain.APP_OUTLETID + ''',' +
                      '''' + 'AUTOMATIC' + ''');');

             sQryExec.SQL.Add('update members set ' +
                 'tot_point = ''' + FloatToStr(pSisa) + ''' ' +
                 'where id_members = ''' + KodeMemberMain + ''';');

             sQryExec.ExecSQL;
             lqrySearch.Close;
             lqrySearch.SQL.Clear;
             lqrySearch.SQL.Add('select id_members from members where id_members = ''' + KodeMemberMain + '''');
             lqrySearch.Open;
             if (lqrySearch.IsEmpty) then
               begin
                 sQryCari.Close;
                  sQryCari.SQL.Clear;
                  sQryCari.SQL.Add('select * from members where id_members = ''' +
                       KodeMemberMain + '''');
                  sQryCari.Open;
                  if (not sQryCari.IsEmpty) then
                    begin
                      lQryExec.SQL.Clear;
                      lQryExec.SQL.Add('insert into members values(' +
                          '''' + sQryCari.Fields[0].AsString + ''',' +
                          '''' + FormatDateTime('yyyy-MM-dd', sQryCari.Fields[1].AsDateTime) + ''',' +
                          '''' + FormatDateTime('yyyy-MM-dd', sQryCari.Fields[2].AsDateTime) + ''',' +
                          QuotedStr(sQryCari.Fields[3].AsString) + ',' +
                          QuotedStr(sQryCari.Fields[17].AsString) + ',' +
                          QuotedStr(sQryCari.Fields[5].AsString) + ',' +
                          QuotedStr(sQryCari.Fields[6].AsString) + ',' +
                          QuotedStr(sQryCari.Fields[7].AsString) + ',' +
                          '''' + FormatDateTime('yyyy-MM-dd', sQryCari.Fields[8].AsDateTime) + ''',' +
                          QuotedStr(sQryCari.Fields[9].AsString) + ',' +
                          QuotedStr(sQryCari.Fields[10].AsString) + ',' +
                          QuotedStr(sQryCari.Fields[11].AsString) + ',' +
                          '''' + FloatToStr(sQryCari.Fields[12].AsFloat) + ''',' +
                          QuotedStr(sQryCari.Fields[13].AsString) + ',' +
                          QuotedStr(sQryCari.Fields[14].AsString) + ',' +
                          QuotedStr(sQryCari.Fields[15].AsString) + ',' +
                          QuotedStr(sQryCari.Fields[16].AsString) + ');');
                      lQryExec.ExecSQL;
                    end;
               end;
             judulNotif := 'Update Member';
             isiNotif := 'Update Data Member ' + KodeMemberMain + ' Ke Server Online Selesai !';
             KirimNotif(judulNotif, isiNotif);
             sQryCari.Free;
             sQryExec.Free;
             dbMemberPoint.Disconnect;
           end
         else if (dbMemberPoint.Connected = False) then
           begin
              jSonItem :=  XSuperObject.SO('{}');
              jSonItem.S['KodePayMain'] := KodePaymentMain;
              jSonItem.S['KodeMemberMain'] := KodeMemberMain;
              jSonItem.F['pTambah'] := pTambah;
              jSonItem.F['pKurang'] := pKurang;
              jSonItem.F['pSisa'] := pSisa;
              jSonItem.F['pAwal'] := pAwal;
              jSonItem.F['nSubtotal'] := nSubtotal;
              strJson := jSonItem.AsJSON(False, False);

              lQryExec.SQL.Clear;
              lQryExec.SQL.Add('insert into logmain values(' +
                  '''' + '' + ''',' +
                  '''' + 'MP' + ''',' +
                  QuotedStr(strJson) + ');');
              lQryExec.ExecSQL;
           end;
         dbMemberPoint.Free;
       end;
   jSonItem :=  XSuperObject.SO('{}');
   jSonItem.S['KodePayMain'] := KodePaymentMain;
   jSonItem.S['KodeMemberMain'] := KodeMemberMain;
   strJson := jSonItem.AsJSON(False, False);

   lQryExec.SQL.Clear;
   lQryExec.SQL.Add('insert into logmain values(' +
      '''' + '' + ''',' +
      '''' + 'TP' + ''',' +
      QuotedStr(strJson) + ');');
   lQryExec.ExecSQL;
   lqrySearch.Free;
   lQryExec.Free;
end;

procedure TfrmMain.UpdatePakaiGC(var KodePayMain: String; NomorGC: String);
var
  lqrySearch, lQryExec: TMyQuery;
  JSONPatch, JSONInsert: ISuperObject;
  sPatchJSON, sInsertJSON, sUrl, sKey, sGC, sPayCode: String;
  sMember, sNamaGC, sOutletBuy, sPayBuy, sQRCode: String;
  fHargaGC: Double;
  dtTglJual, dtExpired, dtNow: TDateTime;
begin
  sGC := Trim(NomorGC);
  if sGC = '' then Exit;

  dtNow := Now;
  sMember := '';
  sNamaGC := 'GC ' + sGC;
  sOutletBuy := APP_OUTLETID;
  sPayBuy := KodePayMain;
  sQRCode := '';
  fHargaGC := 0;
  dtTglJual := dtNow;
  dtExpired := IncDay(dtNow, 120);

  // 1. WAJIB: Update lokal gc_sold terlebih dahulu (agar tetap aman meski internet mati)
  lQryExec := TMyQuery.Create(nil);
  lqrySearch := TMyQuery.Create(nil);
  try
    lQryExec.Connection := DMDB.dbInternal;
    lQryExec.SQL.Text :=
      'UPDATE gc_sold SET ' +
      '  payment_pakai = :pPay, ' +
      '  pakai = ''Y'', ' +
      '  outlet_pakai = :pOutlet, ' +
      '  tgl_pakai = :pTgl ' +
      'WHERE gc_number = :pGC';
    lQryExec.ParamByName('pPay').AsString := KodePayMain;
    lQryExec.ParamByName('pOutlet').AsString := APP_OUTLETID;
    lQryExec.ParamByName('pTgl').AsString := FormatDateTime('yyyy-mm-dd', dtNow);
    lQryExec.ParamByName('pGC').AsString := sGC;
    lQryExec.ExecSQL;

    // Ambil metadata lokal untuk fallback auto-insert bila belum ada di Supabase
    lqrySearch.Connection := DMDB.dbInternal;
    lqrySearch.SQL.Text := 'SELECT * FROM gc_sold WHERE gc_number = :pGC LIMIT 1';
    lqrySearch.ParamByName('pGC').AsString := sGC;
    lqrySearch.Open;
    if not lqrySearch.IsEmpty then
    begin
      sMember := Trim(lqrySearch.FieldByName('id_members').AsString);
      if Trim(lqrySearch.FieldByName('nama_menu').AsString) <> '' then
        sNamaGC := lqrySearch.FieldByName('nama_menu').AsString;
      fHargaGC := lqrySearch.FieldByName('harga_jasa').AsFloat;
      if (Trim(lqrySearch.FieldByName('outlet_jual').AsString) <> '') and
         (Trim(lqrySearch.FieldByName('outlet_jual').AsString) <> '(NONE)') then
        sOutletBuy := Trim(lqrySearch.FieldByName('outlet_jual').AsString);
      if (Trim(lqrySearch.FieldByName('payment_jual').AsString) <> '') and
         (Trim(lqrySearch.FieldByName('payment_jual').AsString) <> '(NONE)') then
        sPayBuy := Trim(lqrySearch.FieldByName('payment_jual').AsString);
      if (not lqrySearch.FieldByName('tgl_jual').IsNull) and
         (FormatDateTime('yyyy', lqrySearch.FieldByName('tgl_jual').AsDateTime) <> '2000') then
        dtTglJual := lqrySearch.FieldByName('tgl_jual').AsDateTime;
      // expired_date selalu 120 hari dari tanggal beli (tgl_jual / buy_at)
      dtExpired := IncDay(DateOf(dtTglJual), 120);
      sQRCode := Trim(lqrySearch.FieldByName('notes').AsString);
    end;
  finally
    lqrySearch.Free;
    lQryExec.Free;
  end;

  if (Trim(SUPABASE_URL) = '') or (Trim(SUPABASE_KEY) = '') then
  begin
    barLog.EditValue := '[GC-USE] Konfigurasi Supabase belum diisi. Status pakai tersimpan lokal.';
    Exit;
  end;

  // 2. Siapkan payload PATCH & fallback INSERT ke Supabase
  JSONPatch := SO();
  JSONPatch.B['has_used'] := True;
  JSONPatch.S['used_at'] := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss"+07:00"', dtNow);
  JSONPatch.S['id_payment_used'] := KodePayMain;
  JSONPatch.S['kode_outlet_used'] := APP_OUTLETID;
  sPatchJSON := JSONPatch.AsJSON;

  JSONInsert := SO();
  if (sMember <> '') and (sMember <> '(NONE)') then
    JSONInsert.S['user_uid'] := sMember
  else
    JSONInsert.Null['user_uid'] := jNull;
  JSONInsert.S['gc_number'] := sGC;
  JSONInsert.S['gc_barcode'] := sGC;
  if (sQRCode <> '') and (sQRCode <> '(NONE)') then
    JSONInsert.S['qrcode'] := sQRCode
  else
    JSONInsert.Null['qrcode'] := jNull;
  JSONInsert.Null['pack_number'] := jNull;
  JSONInsert.S['nama_gc'] := sNamaGC;
  JSONInsert.F['value'] := fHargaGC;
  JSONInsert.S['buy_at'] := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss"+07:00"', dtTglJual);
  JSONInsert.S['expired_date'] := FormatDateTime('yyyy-mm-dd', dtExpired);
  JSONInsert.B['is_active'] := True;
  JSONInsert.B['has_used'] := True;
  JSONInsert.S['used_at'] := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss"+07:00"', dtNow);
  JSONInsert.S['id_payment_buy'] := sPayBuy;
  JSONInsert.S['id_payment_used'] := KodePayMain;
  JSONInsert.S['kode_outlet_buy'] := sOutletBuy;
  JSONInsert.S['kode_outlet_used'] := APP_OUTLETID;
  sInsertJSON := JSONInsert.AsJSON;

  sUrl := SUPABASE_URL;
  sKey := SUPABASE_KEY;
  sPayCode := KodePayMain;

  // 3. Push real-time non-blocking ke Supabase
  TTask.Run(
    procedure
    var
      HTTP: THTTPClient;
      HeadersPatch, HeadersPost: TNetHeaders;
      ReqBody: TStringStream;
      Resp: IHTTPResponse;
      sEncodedGC, sErrMsg: String;
    begin
      HTTP := THTTPClient.Create;
      try
        HTTP.ConnectionTimeout := 5000;
        HTTP.ResponseTimeout := 10000;
        sEncodedGC := TNetEncoding.URL.Encode(sGC);

        SetLength(HeadersPatch, 4);
        HeadersPatch[0] := TNameValuePair.Create('apikey', sKey);
        HeadersPatch[1] := TNameValuePair.Create('Authorization', 'Bearer ' + sKey);
        HeadersPatch[2] := TNameValuePair.Create('Content-Type', 'application/json');
        HeadersPatch[3] := TNameValuePair.Create('Prefer', 'return=representation');

        try
          ReqBody := TStringStream.Create(sPatchJSON, TEncoding.UTF8);
          try
            Resp := HTTP.Patch(sUrl + 'ot_pos_gc_transaction?gc_number=eq.' + sEncodedGC, ReqBody, nil, HeadersPatch);
          finally
            ReqBody.Free;
          end;

          // Jika belum ada row di Supabase (response '[]'), lakukan upsert INSERT
          if (Resp.StatusCode = 200) and (Trim(Resp.ContentAsString) = '[]') then
          begin
            SetLength(HeadersPost, 4);
            HeadersPost[0] := TNameValuePair.Create('apikey', sKey);
            HeadersPost[1] := TNameValuePair.Create('Authorization', 'Bearer ' + sKey);
            HeadersPost[2] := TNameValuePair.Create('Content-Type', 'application/json');
            HeadersPost[3] := TNameValuePair.Create('Prefer', 'resolution=merge-duplicates');

            ReqBody := TStringStream.Create(sInsertJSON, TEncoding.UTF8);
            try
              Resp := HTTP.Post(sUrl + 'ot_pos_gc_transaction?on_conflict=gc_number', ReqBody, nil, HeadersPost);
            finally
              ReqBody.Free;
            end;
          end;

          if (Resp.StatusCode = 200) or (Resp.StatusCode = 201) or (Resp.StatusCode = 204) then
          begin
            TThread.Queue(nil,
              procedure
              var
                judulNotif, isiNotif: String;
              begin
                judulNotif := 'Update Pembayaran GC';
                isiNotif := 'Update Data Gift Certificate ' + sGC + ' ke Supabase Selesai !';
                KirimNotif(judulNotif, isiNotif);
                barLog.EditValue := '[GC-USE] ' + isiNotif;
              end);
          end
          else
          begin
            sErrMsg := Format('[GC-USE] Gagal update GC %s (HTTP %d): %s. SyncAgent akan menyusulkan via refgift.',
              [sGC, Resp.StatusCode, Resp.ContentAsString]);
            TThread.Queue(nil,
              procedure
              begin
                barLog.EditValue := sErrMsg;
              end);
          end;
        except
          on E: Exception do
          begin
            sErrMsg := '[GC-USE] Koneksi Supabase gagal untuk GC ' + sGC + ' (' + sPayCode + '): ' + E.Message;
            TThread.Queue(nil,
              procedure
              begin
                barLog.EditValue := sErrMsg;
              end);
          end;
        end;
      finally
        HTTP.Free;
      end;
    end);
end;

procedure TfrmMain.LoadStyleList;
begin

end;

procedure TfrmMain.mainSkinControlSkinForm(Sender: TObject; AForm: TCustomForm;
  var ASkinName: string; var UseSkin: Boolean);
begin
     //
end;

procedure TfrmMain.MASTER_BANK_LISTClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMasterBank')) then
       begin
            Application.CreateForm(TfrmMasterBank, frmMasterBank);
            frmMasterBank.FormStyle := fsMDIChild;
            frmMasterBank.Show;
            frmMasterBank.WindowState := wsNormal;
            frmMasterBank.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmMasterBank')) then
        begin
             ShowMessage('Form Master Bank has been created');
             frmMasterBank.Show;
             frmMasterBank.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_CARI_MEMBERClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMemberCari')) then
       begin
            Application.CreateForm(TfrmMemberCari, frmMemberCari);
            frmMemberCari.FormStyle := fsMDIChild;
            frmMemberCari.Show;
            frmMemberCari.WindowState := wsNormal;
            frmMemberCari.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmMemberCari')) then
        begin
             ShowMessage('Form GC Details has been created');
             frmMemberCari.Show;
             frmMemberCari.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_DRIVERS_LISTClick(Sender: TObject);
begin
     //TfrmDrivers
     if (not IsFormOpen('frmDrivers')) then
       begin
            Application.CreateForm(TfrmDrivers, frmDrivers);
            frmDrivers.FormStyle := fsMDIChild;
            frmDrivers.Show;
            frmDrivers.WindowState := wsNormal;
            frmDrivers.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmDrivers')) then
        begin
             ShowMessage('Form GC Details has been created');
             frmDrivers.Show;
             frmDrivers.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_DRIVERS_REGISTERClick(Sender: TObject);
begin
     //reg driver
     if (not IsFormOpen('frmRegistrationDrivers')) then
       begin
            Application.CreateForm(TfrmRegistrationDrivers, frmRegistrationDrivers);
            frmRegistrationDrivers.FormStyle := fsMDIChild;
            frmRegistrationDrivers.Show;
            frmRegistrationDrivers.WindowState := wsNormal;
            frmRegistrationDrivers.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmRegistrationDrivers')) then
        begin
             ShowMessage('Form GC Details has been created');
             frmRegistrationDrivers.Show;
             frmRegistrationDrivers.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_GC_DETAILSClick(Sender: TObject);
begin
   if (not IsFormOpen('frmGiftCertificate')) then
       begin
            Application.CreateForm(TfrmGiftCertificate, frmGiftCertificate);
            frmGiftCertificate.FormStyle := fsMDIChild;
            frmGiftCertificate.Show;
            frmGiftCertificate.WindowState := wsNormal;
            frmGiftCertificate.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmGiftCertificate')) then
        begin
             ShowMessage('Form GC Details has been created');
             frmGiftCertificate.Show;
             frmGiftCertificate.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_GC_PACKETClick(Sender: TObject);
begin
  if (not IsFormOpen('frmGiftCertificateMaster')) then
       begin
            Application.CreateForm(TfrmGiftCertificateMaster, frmGiftCertificateMaster);
            frmGiftCertificateMaster.FormStyle := fsMDIChild;
            frmGiftCertificateMaster.Show;
            frmGiftCertificateMaster.WindowState := wsNormal;
            frmGiftCertificateMaster.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmGiftCertificateMaster')) then
        begin
             ShowMessage('Form GC Master has been created');
             frmGiftCertificate.Show;
             frmGiftCertificate.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_HISTORY_MEMBERClick(Sender: TObject);
begin
    if (not IsFormOpen('frmMemberHistory')) then
       begin
            Application.CreateForm(TfrmMemberHistory, frmMemberHistory);
            frmMemberHistory.FormStyle := fsMDIChild;
            frmMemberHistory.Show;
            frmMemberHistory.WindowState := wsNormal;
            frmMemberHistory.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmMemberHistory')) then
        begin
             ShowMessage('Form Member History has been created');
             frmMemberHistory.Show;
             frmMemberHistory.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_MAIN_TRANSClick(Sender: TObject);
begin
  {if (not IsFormOpen('frmPosMain')) then
      begin
           Application.CreateForm(TfrmPosMain, frmPosMain);
           frmPosMain.FormStyle := fsMDIChild;
           frmPosMain.Show;

      end
     else if (IsFormOpen('frmPosMain')) then
      begin
           frmPosMain.Show;
      end;}
end;

procedure TfrmMain.POS_MASTER_MAIN_MENUClick(Sender: TObject);
begin
   //TfrmPosMainMenu
   if (not IsFormOpen('frmPosMainMenu')) then
       begin
            Application.CreateForm(TfrmPosMainMenu, frmPosMainMenu);
            frmPosMainMenu.FormStyle := fsMDIChild;
            frmPosMainMenu.Show;
            frmPosMainMenu.WindowState := wsNormal;
            frmPosMainMenu.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosMainMenu')) then
        begin
             ShowMessage('Form Main Menu has been created');
             frmPosMainMenu.Show;
             frmPosMainMenu.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_MASTER_MEMBERSClick(Sender: TObject);
begin
    if (not IsFormOpen('frmMemberMaster')) then
       begin
            Application.CreateForm(TfrmMemberMaster, frmMemberMaster);
            frmMemberMaster.FormStyle := fsMDIChild;
            frmMemberMaster.Show;
            frmMemberMaster.WindowState := wsNormal;
            frmMemberMaster.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmMemberMaster')) then
        begin
             ShowMessage('Form Master Member has been created');
             frmMemberMaster.Show;
             //frmMemberMaster.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_MASTER_PAYMENTClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPosMasterPayment')) then
       begin
            Application.CreateForm(TfrmPosMasterPayment, frmPosMasterPayment);
            frmPosMasterPayment.FormStyle := fsMDIChild;
            frmPosMasterPayment.Show;
            frmPosMasterPayment.WindowState := wsNormal;
            frmPosMasterPayment.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosMasterPayment')) then
        begin
             ShowMessage('Form Master Payment PoS has been created');
             frmPosMasterPayment.Show;
             frmPosMasterPayment.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_MASTER_PROMOClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPosPromoMaster')) then
       begin
            Application.CreateForm(TfrmPosPromoMaster, frmPosPromoMaster);
            frmPosPromoMaster.FormStyle := fsMDIChild;
            frmPosPromoMaster.Show;
            frmPosPromoMaster.WindowState := wsNormal;
            frmPosPromoMaster.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosPromoMaster')) then
        begin
             ShowMessage('Form Master Promo PoS has been created');
             frmPosPromoMaster.Show;
             frmPosPromoMaster.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_MASTER_ROOMClick(Sender: TObject);
begin
     //TfrmPosMstrRuangan
     if (not IsFormOpen('frmPosMstrRuangan')) then
       begin
            Application.CreateForm(TfrmPosMstrRuangan, frmPosMstrRuangan);
            frmPosMstrRuangan.FormStyle := fsMDIChild;
            frmPosMstrRuangan.Caption := ' Master Ruangan';
            frmPosMstrRuangan.Show;
//            frmPosMstrRuangan.Tag := 0;
            frmPosMstrRuangan.WindowState := wsNormal;
//            frmPosMstrRuangan.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosMstrRuangan')) then
        begin
             ShowMessage('Form Master Ruangan has been created');
             frmPosMstrRuangan.Show;
             frmPosMstrRuangan.Caption := '  Master Ruangan';
//             frmPosMstrRuangan.Tag := 0;
//             frmPosMstrRuangan.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_PAYMENTClick(Sender: TObject);
begin
    if (not IsFormOpen('frmPosPembayaran')) then
       begin
            Application.CreateForm(TfrmPosPembayaran, frmPosPembayaran);
            frmPosPembayaran.FormStyle := fsMDIChild;
            frmPosPembayaran.Caption := '  PoS Pembayaran';
            frmPosPembayaran.Show;
            frmPosPembayaran.Tag := 0;
            frmPosPembayaran.WindowState := wsNormal;
            frmPosPembayaran.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosPembayaran')) then
        begin
             ShowMessage('Form Payment PoS has been created');
             frmPosPembayaran.Show;
             frmPosPembayaran.Caption := '  PoS Pembayaran';
             frmPosPembayaran.Tag := 0;
             frmPosPembayaran.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_PAYMENT_HOTELClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPosPembayaran')) then
       begin
            Application.CreateForm(TfrmPosPembayaran, frmPosPembayaran);
            frmPosPembayaran.Tag := 1;
            frmPosPembayaran.FormStyle := fsMDIChild;
            frmPosPembayaran.Show;

            frmPosPembayaran.Caption := '  PoS Pembayaran Hotel';
            frmPosPembayaran.WindowState := wsNormal;
            frmPosPembayaran.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosPembayaran')) then
        begin
             ShowMessage('Form Payment PoS has been created');
             frmPosPembayaran.Tag := 1;
             frmPosPembayaran.Show;
             frmPosPembayaran.Caption := '  PoS Pembayaran Hotel';
             //frmPosPembayaran.Tag := 1;
             frmPosPembayaran.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_REJECT_GUESTClick(Sender: TObject);
begin
   //
   if (not IsFormOpen('frmRejectGuest')) then
       begin
            Application.CreateForm(TfrmRejectGuest, frmRejectGuest);
            frmRejectGuest.FormStyle := fsMDIChild;
            frmRejectGuest.Show;
            frmRejectGuest.WindowState := wsNormal;
            frmRejectGuest.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmRejectGuest')) then
        begin
             ShowMessage('Form Rejected Guest has been created');
             frmRejectGuest.Show;
             frmRejectGuest.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_RELEASE_LOCKClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPosReleaseLock')) then
       begin
            Application.CreateForm(TfrmPosReleaseLock, frmPosReleaseLock);
            frmPosReleaseLock.FormStyle := fsMDIChild;
            frmPosReleaseLock.Show;
            frmPosReleaseLock.WindowState := wsNormal;
            frmPosReleaseLock.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosReleaseLock')) then
        begin
             ShowMessage('Form Release Locked PoS has been created');
             frmPosReleaseLock.Show;
             frmPosReleaseLock.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_TIPS_ADMINClick(Sender: TObject);
begin
     // is admin
     if (not IsFormOpen('frmPosTransPaymentTips')) then
       begin
            Application.CreateForm(TfrmPosTransPaymentTips, frmPosTransPaymentTips);
            frmPosTransPaymentTips.FormStyle := fsMDIChild;
            frmPosTransPaymentTips.Show;
            frmPosTransPaymentTips.ISADMIN := True;
            frmPosTransPaymentTips.edTanggal.Enabled := True;
            frmPosTransPaymentTips.WindowState := wsNormal;
            frmPosTransPaymentTips.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosTransPaymentTips')) then
        begin
             ShowMessage('Form Pos Transaction Tips has been created');
             frmPosTransPaymentTips.Show;
             frmPosTransPaymentTips.ISADMIN := True;
             frmPosTransPaymentTips.edTanggal.Enabled := True;
             frmPosTransPaymentTips.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_TIPS_RCPTClick(Sender: TObject);
begin
     // reception
     if (not IsFormOpen('frmPosTransPaymentTips')) then
       begin
            Application.CreateForm(TfrmPosTransPaymentTips, frmPosTransPaymentTips);
            frmPosTransPaymentTips.FormStyle := fsMDIChild;
            frmPosTransPaymentTips.Show;
            frmPosTransPaymentTips.ISADMIN := False;
            frmPosTransPaymentTips.edTanggal.Enabled := False;
            frmPosTransPaymentTips.WindowState := wsNormal;
            frmPosTransPaymentTips.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosTransPaymentTips')) then
        begin
             ShowMessage('Form Pos Transaction Tips has been created');
             frmPosTransPaymentTips.Show;
             frmPosTransPaymentTips.ISADMIN := False;
            frmPosTransPaymentTips.edTanggal.Enabled := False;
             frmPosTransPaymentTips.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_TRANSClick(Sender: TObject);
begin
   //TfrmPosTransMain
   if (not IsFormOpen('frmPosTransMain')) then
       begin
            Application.CreateForm(TfrmPosTransMain, frmPosTransMain);
            frmPosTransMain.FormStyle := fsMDIChild;
            frmPosTransMain.Show;
            frmPosTransMain.WindowState := wsNormal;
            frmPosTransMain.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosTransMain')) then
        begin
             ShowMessage('Form Main Menu has been created');
             frmPosTransMain.Show;
             frmPosTransMain.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_TRANS_DRIVERSClick(Sender: TObject);
begin
    //TfrmDriverSelectTrans
    if (not IsFormOpen('frmDriverSelectTrans')) then
       begin
            Application.CreateForm(TfrmDriverSelectTrans, frmDriverSelectTrans);
            frmDriverSelectTrans.FormStyle := fsMDIChild;
            frmDriverSelectTrans.Show;
            frmDriverSelectTrans.WindowState := wsNormal;
            frmDriverSelectTrans.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmDriverSelectTrans')) then
        begin
             ShowMessage('Form Trans Drivers has been created');
             frmDriverSelectTrans.Show;
             frmDriverSelectTrans.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_TRANS_HOTELClick(Sender: TObject);
begin
  {if (not IsFormOpen('frmPosTransHotel')) then
       begin
            Application.CreateForm(TfrmPosTransHotel, frmPosTransHotel);
            frmPosTransHotel.FormStyle := fsMDIChild;
            frmPosTransHotel.Show;
            frmPosTransHotel.WindowState := wsNormal;
            frmPosTransHotel.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosTransHotel')) then
        begin
             ShowMessage('Form Main Menu has been created');
             frmPosTransHotel.Show;
             frmPosTransHotel.Position := poDesktopCenter;
             Exit;
        end;}
     //TfrmPosTransMain
   if (not IsFormOpen('frmPosTransMain')) then
       begin
            Application.CreateForm(TfrmPosTransMain, frmPosTransMain);
            frmPosTransMain.Tag := 1;
            frmPosTransMain.FormStyle := fsMDIChild;
            frmPosTransMain.Show;
            frmPosTransMain.WindowState := wsNormal;
            frmPosTransMain.Position := poDesktopCenter;
            frmPosTransMain.edDateTimeServer.Properties.ReadOnly := False;
            //frmPosTransMain.tmrRefresh.Enabled := False;

       end
     else if (IsFormOpen('frmPosTransMain')) then
        begin
             ShowMessage('Form Main Menu has been created');
             frmPosTransMain.Tag := 1;
             frmPosTransMain.Show;
             frmPosTransMain.Position := poDesktopCenter;
             frmPosTransMain.edDateTimeServer.Properties.ReadOnly := False;
             //frmPosTransMain.tmrRefresh.Enabled := False;

             Exit;
        end;
end;

procedure TfrmMain.POS_TR_CALLClick(Sender: TObject);
begin
    //TfrmTherapisCall
    if (not IsFormOpen('frmTherapisCall')) then
       begin
            Application.CreateForm(TfrmTherapisCall, frmTherapisCall);
            if (Screen.MonitorCount > 1) then
                 begin
                      frmTherapisCall.FormStyle := fsNormal;
                      frmTherapisCall.Left:=Screen.Monitors[1].Left;
                      frmTherapisCall.Top:=Screen.Monitors[1].Top;
                      frmTherapisCall.Width:=Screen.Monitors[1].Width;
                      frmTherapisCall.Height:=Screen.Monitors[1].Height;
                 end
            else if (Screen.MonitorCount = 1) then
                 begin
                    frmTherapisCall.FormStyle := fsMDIChild;
                 end;

            frmTherapisCall.Show;
            frmTherapisCall.WindowState := wsNormal;
            //frmTherapisCall.Position := poDesktopCenter;
       end
     else if (IsFormOpen('frmTherapisCall')) then
        begin
             ShowMessage('Form Therapis Call has been created');
             Exit;
        end;
end;

procedure TfrmMain.POS_TR_CALL_2Click(Sender: TObject);
begin
   if (not IsFormOpen('frmTherapisCall2')) then
       begin
            Application.CreateForm(TfrmTherapisCall2, frmTherapisCall2);
            if (Screen.MonitorCount > 1) then
                 begin
                      frmTherapisCall2.FormStyle := fsNormal;
                      frmTherapisCall2.Left:=Screen.Monitors[1].Left;
                      frmTherapisCall2.Top:=Screen.Monitors[1].Top;
                      frmTherapisCall2.Width:=Screen.Monitors[1].Width;
                      frmTherapisCall2.Height:=Screen.Monitors[1].Height;
                 end
            else if (Screen.MonitorCount = 1) then
                 begin
                    frmTherapisCall2.FormStyle := fsMDIChild;
                 end;

            frmTherapisCall2.Show;
            frmTherapisCall2.WindowState := wsNormal;
            //frmTherapisCall.Position := poDesktopCenter;
       end
     else if (IsFormOpen('frmTherapisCall2')) then
        begin
             ShowMessage('Form Therapis Call has been created');
             Exit;
        end;
end;

procedure TfrmMain.POS_TR_FLOWClick(Sender: TObject);
begin
      if (not IsFormOpen('frmTherapisFlow')) then
       begin
            Application.CreateForm(TfrmTherapisFlow, frmTherapisFlow);
            frmTherapisFlow.FormStyle := fsMDIChild;
            frmTherapisFlow.Show;
            frmTherapisFlow.WindowState := wsNormal;
            frmTherapisFlow.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmTherapisFlow')) then
        begin
             ShowMessage('Form Therapist Flow has been created');
             frmTherapisFlow.Show;
             frmTherapisFlow.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_TR_STARTClick(Sender: TObject);
begin
  if (not IsFormOpen('frmTherapisStart')) then
       begin
            Application.CreateForm(TfrmTherapisStart, frmTherapisStart);
            frmTherapisStart.FormStyle := fsMDIChild;
            frmTherapisStart.Show;
            frmTherapisStart.WindowState := wsNormal;
            frmTherapisStart.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmTherapisStart')) then
        begin
             ShowMessage('Form Therapist Start has been created');
             frmTherapisStart.Show;
             frmTherapisStart.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.POS_TR_STATUSClick(Sender: TObject);
begin
   //TfrmTherapistStatus
   if (not IsFormOpen('frmTherapistStatus')) then
       begin
            Application.CreateForm(TfrmTherapistStatus, frmTherapistStatus);
            frmTherapistStatus.FormStyle := fsMDIChild;
            frmTherapistStatus.Show;
            frmTherapistStatus.WindowState := wsNormal;
            frmTherapistStatus.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmTherapistStatus')) then
        begin
             ShowMessage('Form Therapist Status has been created');
             frmTherapistStatus.Show;
             frmTherapistStatus.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.PutNewMember(var KodeMemberMain: String;
  KodePaymentMain: String; pTambah, pKurang, pSisa, pAwal, nSubtotal: Double);
var
  Note: TNotification;





begin
    { Member Point Transaction - saved locally and synced to Supabase via SyncAgent }
    barLog.EditValue := Format('Member: %s, Payment: %s, Point: +%.0f -%.0f Sisa: %.0f', 
      [KodeMemberMain, KodePaymentMain, pTambah, pKurang, pSisa]);

    { Kirim notifikasi sistem desktop }
    Note := frmMain.NotifMain.CreateNotification;
    try
        try
            Note.Name := 'UPDATE MEMBER BARU';
            Note.Title := 'UPDATE MEMBER BARU';
            Note.AlertBody := 'Member ' + KodeMemberMain + ' poin berhasil diproses (Sisa: ' + FloatToStr(pSisa) + ')';
            Note.FireDate := Now;
            frmMain.NotifMain.PresentNotification(Note);
        except
        end;
    finally
        Note.Free;
    end;
end;

procedure TfrmMain.LoadConfigApps;
var
   jsonConfig : TStringList;
   ConfigDir : String;
begin
     ConfigDir := ExtractFilePath(Application.ExeName);
     ConfigJSON := XSuperObject.SO('{}');
     if (Not FileExists(ConfigDir + 'config.json')) then
        begin
             APP_VERSION := 'Beta 1.0';
             APP_TRADEMARK := 'karuniamotor.com';
             APP_RELEASE := '2019-11-15';
             APP_NAME := 'Karunia New Apps';
             APP_DEVELOPER := 'borist.nababan@gmail.com';
             APP_CHANGEDB := 'N';
             APP_OUTLETID := '101';
             IDXSOPRINTER := 0;
             IDXPOSPRINTER := 0;
             APP_OUTLETNAME := 'BB Jembatan';
             ConfigJSON.O['AppInfo'].AsObject.S['AppName'] := APP_NAME;
             ConfigJSON.O['AppInfo'].AsObject.S['Version'] := APP_VERSION;
             ConfigJSON.O['AppInfo'].AsObject.S['Developer'] := APP_DEVELOPER;
             ConfigJSON.O['AppInfo'].AsObject.S['Release'] := APP_RELEASE;
             ConfigJSON.O['AppInfo'].AsObject.S['Trademark'] := APP_TRADEMARK;
             ConfigJSON.O['AppInfo'].AsObject.S['OutletID'] := APP_OUTLETID;
             ConfigJSON.O['AppInfo'].AsObject.S['OutletName'] := APP_OUTLETNAME;
             ConfigJSON.O['AppInfo'].AsObject.S['OutletAddress'] := APP_OUTLETADDRESS;
             ConfigJSON.O['AppInfo'].AsObject.S['OutletPhone'] := APP_OUTLETPHONE;
             ConfigJSON.O['AppInfo'].AsObject.S['OutletCity'] := APP_OUTLETCITY;
             ConfigJSON.O['AppInfo'].AsObject.S['Satjual'] := SATJUAL;
             ConfigJSON.O['AppInfo'].AsObject.I['Toolbar'] := 1;
             ConfigJSON.O['AppInfo'].AsObject.I['Accent'] := 1;
             ConfigJSON.O['AppInfo'].AsObject.S['Global'] := 'Blue';
             ConfigJSON.O['AppInfo'].AsObject.S['Component'] := 'Blue';
             ConfigJSON.O['AppInfo'].AsObject.I['PrinterPos'] := 0;
             ConfigJSON.O['AppInfo'].AsObject.I['PrinterSO'] := 0;
             PASSDELETE := EncryptPass('');
             ConfigJSON.O['AppInfo'].AsObject.S['PassDelete'] := PASSDELETE;

             PASSCETAK := EncryptPass('');
             ConfigJSON.O['AppInfo'].AsObject.S['PassCetak'] := PASSCETAK;

             edToolbarStyle.ItemIndex := 1;

             edColorAccent.ItemIndex := 1;
             PAGE_CONTROL.ColorSchemeAccent := TdxRibbonColorSchemeAccent(edColorAccent.ItemIndex);
             edSkinStyle.Text := 'Blue';
             mainSkinControl.SkinName := edSkinStyle.Text;
             edColorScheme.Text := 'Blue';

             LOCAL_DBHOST := EncryptPass('localhost');
             ConfigJSON.O['LocalDB'].AsObject.S['HostName'] := LOCAL_DBHOST;
             LOCAL_DBUSER := EncryptPass('root');
             ConfigJSON.O['LocalDB'].AsObject.S['UserName'] := LOCAL_DBUSER;
             LOCAL_DBNAME := EncryptPass('bc_zen');
             ConfigJSON.O['LocalDB'].AsObject.S['DBName'] := LOCAL_DBNAME;
             LOCAL_DBPORT := EncryptPass('3306');
             ConfigJSON.O['LocalDB'].AsObject.S['Port'] := LOCAL_DBPORT;
             LOCAL_DBPASS := EncryptPass('');
             ConfigJSON.O['LocalDB'].AsObject.S['Password'] := LOCAL_DBPASS;

             SERVER_DBHOST := EncryptPass('localhost');
             ConfigJSON.O['ServerDB'].AsObject.S['HostName'] := SERVER_DBHOST;
             SERVER_DBUSER := EncryptPass('root');
             ConfigJSON.O['ServerDB'].AsObject.S['UserName'] := SERVER_DBUSER;
             SERVER_DBNAME := EncryptPass('bc_zen');
             ConfigJSON.O['ServerDB'].AsObject.S['DBName'] := SERVER_DBNAME;
             SERVER_DBPORT := EncryptPass('3306');
             ConfigJSON.O['ServerDB'].AsObject.S['Port'] := SERVER_DBPORT;
             SERVER_DBPASS := EncryptPass('');
             ConfigJSON.O['ServerDB'].AsObject.S['Password'] := SERVER_DBPASS;

             ConfigJSON.O['Database'].AsObject.S['hrd'] := DBHRDNAME;
             ConfigJSON.O['Database'].AsObject.S['pos'] := DBPOSNAME;
             ConfigJSON.O['Database'].AsObject.S['changedb'] := APP_CHANGEDB;

             if not ConfigJSON.Contains('Supabase') then
               ConfigJSON.O['Supabase'] := SO();
             ConfigJSON.O['Supabase'].AsObject.S['REST_URL'] := EncryptPass('');
             ConfigJSON.O['Supabase'].AsObject.S['PublishableKey'] := EncryptPass('');

             ConfigJSON.SaveTo(ConfigDir + 'config.json', true, true);
        end
     else if (FileExists(ConfigDir + 'config.json')) then
         begin
              jsonConfig := TStringList.Create;
              jsonConfig.LoadFromFile(ConfigDir + 'config.json');
              ConfigJSON := XSuperObject.SO(jsonConfig.Text);
              APP_VERSION := ConfigJSON.O['AppInfo'].AsObject.S['Version'];;
              APP_TRADEMARK := ConfigJSON.O['AppInfo'].AsObject.S['Trademark'];
              APP_RELEASE := ConfigJSON.O['AppInfo'].AsObject.S['Release'];
              APP_NAME := ConfigJSON.O['AppInfo'].AsObject.S['AppName'];
              APP_DEVELOPER := ConfigJSON.O['AppInfo'].AsObject.S['Developer'];
              APP_OUTLETID := ConfigJSON.O['AppInfo'].AsObject.S['OutletID'];
              APP_OUTLETNAME := ConfigJSON.O['AppInfo'].AsObject.S['OutletName'];
              APP_OUTLETADDRESS := ConfigJSON.O['AppInfo'].AsObject.S['OutletAddress'];
              APP_OUTLETPHONE := ConfigJSON.O['AppInfo'].AsObject.S['OutletPhone'];
              APP_OUTLETCITY := ConfigJSON.O['AppInfo'].AsObject.S['OutletCity'];
              APP_OUTLETPROVINCE := ConfigJSON.O['AppInfo'].AsObject.S['OutletProvince'];
              APP_OUTLETZIPCODE := ConfigJSON.O['AppInfo'].AsObject.S['OutletZipcode'];
              PASSDELETE :=  DecryptPass(ConfigJSON.O['AppInfo'].AsObject.S['PassDelete']);
              PASSCETAK :=  DecryptPass(ConfigJSON.O['AppInfo'].AsObject.S['PassCetak']);
              edToolbarStyle.ItemIndex := ConfigJSON.O['AppInfo'].AsObject.I['Toolbar'];
              edColorAccent.ItemIndex := ConfigJSON.O['AppInfo'].AsObject.I['Accent'];
              edSkinStyle.Text := ConfigJSON.O['AppInfo'].AsObject.S['Global'];
              edColorScheme.Text := ConfigJSON.O['AppInfo'].AsObject.S['Component'];

              IDXSOPRINTER := ConfigJSON.O['AppInfo'].AsObject.I['PrinterSO'];
              IDXPOSPRINTER := ConfigJSON.O['AppInfo'].AsObject.I['PrinterPos'];
              N_PEMBULATAN := ConfigJSON.O['AppInfo'].AsObject.I['Pembulatan'];
              MEMBERDBNAME := ConfigJSON.O['AppInfo'].AsObject.S['MemberDB'];
              JUDULATAS := ConfigJSON.O['AppInfo'].AsObject.S['JudulAtas'];
              JUDULBAWAH := ConfigJSON.O['AppInfo'].AsObject.S['JudulBawah'];
              FOOTER1 := ConfigJSON.O['AppInfo'].AsObject.S['Footer1'];
              FOOTER2 := ConfigJSON.O['AppInfo'].AsObject.S['Footer2'];
              FOOTER3 := ConfigJSON.O['AppInfo'].AsObject.S['Footer3'];
              MERGERDBNAME := ConfigJSON.O['AppInfo'].AsObject.S['MergerDB'];

              SERVER_DBNAME := DecryptPass(ConfigJSON.O['ServerDB'].AsObject.S['DBName']);
              SERVER_DBUSER := DecryptPass(ConfigJSON.O['ServerDB'].AsObject.S['UserName']);
              SERVER_DBHOST := DecryptPass(ConfigJSON.O['ServerDB'].AsObject.S['HostName']);
              SERVER_DBPASS := DecryptPass(ConfigJSON.O['ServerDB'].AsObject.S['Password']);
              SERVER_DBPORT := DecryptPass(ConfigJSON.O['ServerDB'].AsObject.S['Port']);

              LOCAL_DBNAME := DecryptPass(ConfigJSON.O['LocalDB'].AsObject.S['DBName']);
              LOCAL_DBUSER := DecryptPass(ConfigJSON.O['LocalDB'].AsObject.S['UserName']);
              LOCAL_DBHOST := DecryptPass(ConfigJSON.O['LocalDB'].AsObject.S['HostName']);
              LOCAL_DBPASS := DecryptPass(ConfigJSON.O['LocalDB'].AsObject.S['Password']);
              LOCAL_DBPORT := DecryptPass(ConfigJSON.O['LocalDB'].AsObject.S['Port']);

              DBHRDNAME := ConfigJSON.O['Database'].AsObject.S['hrd'];
              DBPOSNAME := ConfigJSON.O['Database'].AsObject.S['pos'];
              APP_CHANGEDB := ConfigJSON.O['Database'].AsObject.S['changedb'];

              // Supabase settings
              if ConfigJSON.Contains('Supabase') then
              begin
                SUPABASE_URL := Trim(DecryptPass(ConfigJSON.O['Supabase'].S['REST_URL']));
                if (SUPABASE_URL <> '') and not (SUPABASE_URL[Length(SUPABASE_URL)] in ['/', '\']) then
                  SUPABASE_URL := SUPABASE_URL + '/';
                SUPABASE_KEY := Trim(DecryptPass(ConfigJSON.O['Supabase'].S['PublishableKey']));
              end;
              jsonConfig.Free;
         end;
    if Assigned(dmDB) and Assigned(dmDB.dbInternal) then
    begin
      dmDB.dbInternal.Connected := False;
      dmDB.dbInternal.Server := LOCAL_DBHOST;
      dmDB.dbInternal.Database := LOCAL_DBNAME;
      dmDB.dbInternal.Username := LOCAL_DBUSER;
      dmDB.dbInternal.Password := LOCAL_DBPASS;
      dmDB.dbInternal.Port := StrToIntDef(LOCAL_DBPORT, 3306);
    end;

    MainLabelAppName.Caption := APP_NAME;
    frmMain.Caption := APP_NAME;
    APP_VERSION := 'Alpha 1.1.1';
    MainLabelAppVersion.Caption := APP_VERSION;
    MainLabelAppRelease.Caption := APP_RELEASE;
    MainLabelAppDeveloper.Caption := APP_DEVELOPER;
    MainLabelAppLegal.Caption := APP_TRADEMARK;
    
    CNTLOGIN := 0;
end;

procedure TfrmMain.BACKSTAGE_EXITClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmMain.BACKSTAGE_FP_SCANClick(Sender: TObject);
begin
   if (not IsFormOpen('frmKaryawanScanFinger')) then
       begin
            Application.CreateForm(TfrmKaryawanScanFinger, frmKaryawanScanFinger);
            if (Screen.MonitorCount > 1) then
                 begin
                      frmKaryawanScanFinger.FormStyle := fsNormal;
                      frmKaryawanScanFinger.Left:=Screen.Monitors[1].Left;
                      frmKaryawanScanFinger.Top:=Screen.Monitors[1].Top;
                      frmKaryawanScanFinger.Width:=Screen.Monitors[1].Width;
                      frmKaryawanScanFinger.Height:=Screen.Monitors[1].Height;
                 end
            else if (Screen.MonitorCount = 1) then
                 begin
                    frmKaryawanScanFinger.FormStyle := fsMDIChild;
                 end;
            frmKaryawanScanFinger.Show;
            frmKaryawanScanFinger.WindowState := wsNormal;
            frmKaryawanScanFinger.Position := poDesktopCenter;
       end
     else if (IsFormOpen('frmKaryawanScanFinger')) then
        begin
             ShowMessage('Karyawan Scan Finger Form has been created');
            frmKaryawanScanFinger.Show;
            frmKaryawanScanFinger.WindowState := wsNormal;
            frmKaryawanScanFinger.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.BACKSTAGE_INPUT_CUTIClick(Sender: TObject);
begin
   if (not IsFormOpen('frmIjinCutiList')) then
       begin
            Application.CreateForm(TfrmIjinCutiList, frmIjinCutiList);
            frmIjinCutiList.Show;
            frmIjinCutiList.WindowState := wsNormal;
            frmIjinCutiList.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmIjinCutiList')) then
        begin
             ShowMessage('Form Cuti has been created');
             frmIjinCutiList.Show;
             frmIjinCutiList.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.BACKSTAGE_INPUT_LEMBURClick(Sender: TObject);
begin
   if (not IsFormOpen('frmLemburList')) then
       begin
            Application.CreateForm(TfrmLemburList, frmLemburList);
            frmLemburList.Show;
            frmLemburList.WindowState := wsNormal;
            frmLemburList.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmLemburList')) then
        begin
             ShowMessage('Form Cuti has been created');
             frmLemburList.Show;
             frmLemburList.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.BACKSTAGE_INPUT_PULANGClick(Sender: TObject);
begin
   if (not IsFormOpen('frmIjinPulangList')) then
       begin
            Application.CreateForm(TfrmIjinPulangList, frmIjinPulangList);
            frmIjinPulangList.FormStyle := fsMDIChild;
            frmIjinPulangList.Show;
            frmIjinPulangList.WindowState := wsNormal;
            frmIjinPulangList.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmIjinPulangList')) then
        begin
             ShowMessage('Form List Ijin Pulang has been created');
             frmIjinPulangList.Show;
             frmLemburList.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.BACKSTAGE_INPUT_SAKITClick(Sender: TObject);
begin
  if (not IsFormOpen('frmIjinSakitList')) then
       begin
            Application.CreateForm(TfrmIjinSakitList, frmIjinSakitList);
            frmIjinSakitList.FormStyle := fsMDIChild;
            frmIjinSakitList.Show;
            frmIjinSakitList.WindowState := wsNormal;
            frmIjinSakitList.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmIjinSakitList')) then
        begin
             ShowMessage('Form List Sakit has been created');
             frmIjinSakitList.Show;
             frmIjinSakitList.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.BACKSTAGE_KONTRAK_BERJALAN_ADMINClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMasterKaryawan')) then
       begin
        Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
        frmMasterKaryawan.btnSelect.Visible := True;
        frmMasterKaryawan.btnSelect.Tag := 1;
        frmMasterKaryawan.btnNew.Visible := False;
        frmMasterKaryawan.btnEdit.Visible := False;
        frmMasterKaryawan.btnKontrak.Visible := False;
        frmMasterKaryawan.ISADMIN := True;
        frmMasterKaryawan.Caption := 'Kontrak Berjalan Detail Karyawan Admin';
        frmMasterKaryawan.Show;
        frmMasterKaryawan.WindowState := wsNormal;
        frmMasterKaryawan.Position := poDesktopCenter;
       end
 else if (IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
        Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
        frmMasterKaryawan.btnSelect.Visible := True;
        frmMasterKaryawan.btnSelect.Tag := 1;
        frmMasterKaryawan.btnNew.Visible := False;
        frmMasterKaryawan.btnEdit.Visible := False;
        frmMasterKaryawan.btnKontrak.Visible := False;
        frmMasterKaryawan.ISADMIN := True;
        frmMasterKaryawan.Caption := 'Kontrak Berjalan Detail Karyawan Admin';
        frmMasterKaryawan.Show;
        frmMasterKaryawan.WindowState := wsNormal;
        frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmMain.BACKSTAGE_KONTRAK_BERJALAN_SPVClick(Sender: TObject);
begin
  if (not IsFormOpen('frmMasterKaryawan')) then
       begin
        Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
        frmMasterKaryawan.btnSelect.Visible := True;
        frmMasterKaryawan.btnSelect.Tag := 1;
        frmMasterKaryawan.btnNew.Visible := False;
        frmMasterKaryawan.btnEdit.Visible := False;
        frmMasterKaryawan.btnKontrak.Visible := False;
        frmMasterKaryawan.ISADMIN := False;
        frmMasterKaryawan.Caption := 'Kontrak Berjalan Detail Karyawan SPV';
        frmMasterKaryawan.Show;
        frmMasterKaryawan.WindowState := wsNormal;
        frmMasterKaryawan.Position := poDesktopCenter;
       end
 else if (IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
        Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
        frmMasterKaryawan.btnSelect.Visible := True;
        frmMasterKaryawan.btnSelect.Tag := 1;
        frmMasterKaryawan.btnNew.Visible := False;
        frmMasterKaryawan.btnEdit.Visible := False;
        frmMasterKaryawan.btnKontrak.Visible := False;
        frmMasterKaryawan.ISADMIN := False;
        frmMasterKaryawan.Caption := 'Kontrak Berjalan Detail Karyawan SPV';
        frmMasterKaryawan.Show;
        frmMasterKaryawan.WindowState := wsNormal;
        frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmMain.APP_CHANGE_PASSClick(Sender: TObject);
begin
      qryMain1 := TMyQuery.Create(Self);
      qryMain1.Connection := DMDB.dbInternal;
      qryMain1.SQL.Add('select * from temptable');
      qryMain1.Active := true;
     if (not IsFormOpen('frmPassword')) then
      begin
           Application.CreateForm(TfrmPassword, frmPassword);
           qryMain1.Close;
           qryMain1.SQL.Clear;
           qryMain1.SQL.Add('select * from users where userid = ''' +
                            frmMain.USERAPPS + '''');
           qryMain1.Open;
           frmPassword.edUname.Text := qryMain1.Fields[0].AsString;
           frmPassword.OLD_PASS := DecryptPass(qryMain1.Fields[1].AsString);
           frmPassword.edNewPass.Text := '';
           frmPassword.edNama.Text := qryMain1.Fields[4].AsString;
           frmPassword.Show;
           frmPassword.FormStyle := fsMDIChild;

           //frmRekapHarian.Position := poDesktopCenter;
           //frmWelcome.WindowState := wsNormal;
      end
   else if (IsFormOpen('frmPassword')) then
      begin
           ShowMessage('Form Password has been created');
           frmPassword.FormStyle := fsMDIChild;
           frmPassword.Show;
           Exit;
      end;
   qryMain1.Free;
end;

procedure TfrmMain.APP_EXITClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmMain.APP_GROUPClick(Sender: TObject);
begin
     if (not IsFormOpen('frmGroupManagement')) then
      begin
           Application.CreateForm(TfrmGroupManagement, frmGroupManagement);
           frmGroupManagement.FormStyle := fsMDIChild;
           frmGroupManagement.Show;

      end
     else if (IsFormOpen('frmGroupManagement')) then
      begin
           frmGroupManagement.Show;
      end
end;

procedure TfrmMain.APP_MASTER_PASSWORDClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMasterPassword')) then
       begin
            Application.CreateForm(TfrmMasterPassword, frmMasterPassword);
            frmMasterPassword.FormStyle := fsMDIChild;
            frmMasterPassword.Show;
            frmMasterPassword.WindowState := wsNormal;
            frmMasterPassword.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmMasterPassword')) then
        begin
             ShowMessage('Form Master Password has been created');
             frmMasterPassword.Show;
             frmMasterPassword.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.APP_REG_BUTTONClick(Sender: TObject);
begin
    //
end;

procedure TfrmMain.APP_USERClick(Sender: TObject);
begin
     if (not IsFormOpen('frmUserManagement')) then
      begin
           Application.CreateForm(TfrmUserManagement, frmUserManagement);
           frmUserManagement.FormStyle := fsMDIChild;
           frmUserManagement.Show;

      end
     else if (IsFormOpen('frmUserManagement')) then
      begin
           frmUserManagement.Show;
      end;
end;

procedure TfrmMain.BACKSTAGE_ABSEN_MANUALClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPresensiManual')) then
       begin
            Application.CreateForm(TfrmPresensiManual, frmPresensiManual);
            frmPresensiManual.Show;
            frmPresensiManual.WindowState := wsNormal;
            frmPresensiManual.Position := poDesktopCenter;
       end
     else if (IsFormOpen('frmPresensiManual')) then
        begin
             ShowMessage('Form Presensi Manual Form has been created');
             frmPresensiManual.Show;
             frmPresensiManual.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.BACKSTAGE_CONFIGClick(Sender: TObject);
begin
     Application.CreateForm(TfrmConfigSetup, frmConfigSetup);
     frmConfigSetup.Show;
end;

procedure TfrmMain.BACKSTAGE_LOGINClick(Sender: TObject);
begin
     Application.CreateForm(TfrmLogin, frmLogin);
     frmLogin.Show;
end;

procedure TfrmMain.BACKSTAGE_MASTER_KARYAWAN_ADMINClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMasterKaryawan')) then
       begin
            Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
            frmMasterKaryawan.btnSelect.Visible := False;
            frmMasterKaryawan.ISADMIN := True;
            frmMasterKaryawan.Show;
            frmMasterKaryawan.WindowState := wsNormal;
       end
 else if (IsFormOpen('frmMasterKaryawan')) then
    begin
        frmMasterKaryawan.Close;
        Sleep(100);
        Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
        frmMasterKaryawan.btnSelect.Visible := False;
        frmMasterKaryawan.ISADMIN := True;
        frmMasterKaryawan.Show;
        frmMasterKaryawan.WindowState := wsNormal;
        frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmMain.BACKSTAGE_MASTER_KARYAWAN_SPVClick(Sender: TObject);
begin
    if (not IsFormOpen('frmMasterKaryawan')) then
       begin
            Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
            frmMasterKaryawan.btnSelect.Visible := False;
            frmMasterKaryawan.ISADMIN := False;
            frmMasterKaryawan.Caption := 'Master Karyawan';
            frmMasterKaryawan.Show;
            frmMasterKaryawan.WindowState := wsNormal;
            frmMasterKaryawan.Position := poDesktopCenter;
       end
 else if (IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := False;
      frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Caption := 'Master Karyawan';
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
      frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmMain.BACKSTAGE_POS_PAYMENTClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPosPembayaran')) then
       begin
            Application.CreateForm(TfrmPosPembayaran, frmPosPembayaran);
            frmPosPembayaran.FormStyle := fsMDIChild;
            frmPosPembayaran.Show;
            frmPosPembayaran.WindowState := wsNormal;
            frmPosPembayaran.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosPembayaran')) then
        begin
             ShowMessage('Form Payment PoS has been created');
             frmPosPembayaran.Show;
             frmPosPembayaran.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.BACKSTAGE_REPORT_POSClick(Sender: TObject);
begin
  //
end;

procedure TfrmMain.BACKSTAGE_TRANS_POSClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPosTransMain')) then
       begin
            Application.CreateForm(TfrmPosTransMain, frmPosTransMain);
            frmPosTransMain.FormStyle := fsMDIChild;
            frmPosTransMain.Show;
            frmPosTransMain.WindowState := wsNormal;
            frmPosTransMain.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosTransMain')) then
        begin
             ShowMessage('Form Main Menu has been created');
             frmPosTransMain.Show;
             frmPosTransMain.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.CekIDOUTLET;
begin
    { Set Outlet ID - local & Supabase compatible without external Strapi blocking }
    try
      API_OUTLET_ID := StrToIntDef(APP_OUTLETID, 77);
      barOutletID.EditValue := APP_OUTLETID + '#' + IntToStr(API_OUTLET_ID);
    except
      API_OUTLET_ID := 77;
      barOutletID.EditValue := APP_OUTLETID + '#77';
    end;
end;

function TfrmMain.CekInternet: Boolean;
begin
    result := (InternetGetConnectedState(nil, 0));
end;

procedure TfrmMain.REPORT_POS_DETAILSClick(Sender: TObject);
begin
   if (not IsFormOpen('TfrmReportDayli')) then
       begin
            Application.CreateForm(TfrmReportDayli, frmReportDayli);
            frmReportDayli.FormStyle := fsMDIChild;
            frmReportDayli.Show;
            frmReportDayli.WindowState := wsNormal;
            frmReportDayli.edStart.Properties.ReadOnly := True;
            frmReportDayli.edEnd.Properties.ReadOnly := True;
            frmReportDayli.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportDayli')) then
        begin
             ShowMessage('Form Report Details has been created');
             frmReportDayli.edStart.Properties.ReadOnly := True;
             frmReportDayli.edEnd.Properties.ReadOnly := True;
             frmReportDayli.Show;
             frmReportDayli.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_DETAILS_ADMINClick(Sender: TObject);
begin
   if (not IsFormOpen('TfrmReportPoSMaster')) then
       begin
            Application.CreateForm(TfrmReportPoSMaster, frmReportPoSMaster);
            frmReportPoSMaster.edStart.Properties.ReadOnly := False;
            frmReportPoSMaster.edEnd.Properties.ReadOnly := False;
            frmReportPoSMaster.FormStyle := fsMDIChild;
            frmReportPoSMaster.Show;
            frmReportPoSMaster.WindowState := wsNormal;
            frmReportPoSMaster.Position := poDesktopCenter;

       end
     else if (IsFormOpen('TfrmReportPoSMaster')) then
        begin
             ShowMessage('Form Report PoS Master has been created');
             frmReportPoSMaster.edStart.Properties.ReadOnly := False;
             frmReportPoSMaster.edEnd.Properties.ReadOnly := False;
             frmReportPoSMaster.Show;
             frmReportPoSMaster.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_MASTERClick(Sender: TObject);
begin
   if (not IsFormOpen('TfrmReportPoSMaster')) then
       begin
            Application.CreateForm(TfrmReportPoSMaster, frmReportPoSMaster);
            frmReportPoSMaster.edStart.Properties.ReadOnly := True;
            frmReportPoSMaster.edEnd.Properties.ReadOnly := True;
            frmReportPoSMaster.FormStyle := fsMDIChild;
            frmReportPoSMaster.Show;
            frmReportPoSMaster.WindowState := wsNormal;
            frmReportPoSMaster.Position := poDesktopCenter;

       end
     else if (IsFormOpen('TfrmReportPoSMaster')) then
        begin
             ShowMessage('Form Report PoS Master has been created');
             frmReportPoSMaster.edStart.Properties.ReadOnly := True;
             frmReportPoSMaster.edEnd.Properties.ReadOnly := True;
             frmReportPoSMaster.Show;
             frmReportPoSMaster.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_MASTER_ADMINClick(Sender: TObject);
begin
  if (not IsFormOpen('TfrmReportDayli')) then
       begin
            Application.CreateForm(TfrmReportDayli, frmReportDayli);
            frmReportDayli.FormStyle := fsMDIChild;
            frmReportDayli.Show;
            frmReportDayli.WindowState := wsNormal;
            frmReportDayli.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportDayli')) then
        begin
             ShowMessage('Form Report Details has been created');
             frmReportDayli.Show;
             frmReportDayli.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_PAYMENTClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportPosPayment')) then
       begin
            Application.CreateForm(TfrmReportPosPayment, frmReportPosPayment);
            frmReportPosPayment.edStart.Properties.ReadOnly := True;
            frmReportPosPayment.edEnd.Properties.ReadOnly := True;
            frmReportPosPayment.FormStyle := fsMDIChild;
            frmReportPosPayment.Show;
            frmReportPosPayment.WindowState := wsNormal;
            frmReportPosPayment.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportPosPayment')) then
        begin
             ShowMessage('Form Report Payment has been created');
             frmReportPosPayment.edStart.Properties.ReadOnly := True;
             frmReportPosPayment.edEnd.Properties.ReadOnly := True;
             frmReportPosPayment.Show;
             frmReportPosPayment.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_PAYMENT_ADMINClick(Sender: TObject);
begin
  if (not IsFormOpen('frmReportPosPayment')) then
       begin
            Application.CreateForm(TfrmReportPosPayment, frmReportPosPayment);
            frmReportPosPayment.FormStyle := fsMDIChild;
            frmReportPosPayment.Show;
            frmReportPosPayment.WindowState := wsNormal;
            frmReportPosPayment.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportPosPayment')) then
        begin
             ShowMessage('Form Report Payment has been created');
             frmReportPosPayment.Show;
             frmReportPosPayment.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_PERIODIC_REVENUEClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportPendapatanBulanan')) then
       begin
            Application.CreateForm(TfrmReportPendapatanBulanan, frmReportPendapatanBulanan);
            frmReportPendapatanBulanan.FormStyle := fsMDIChild;
            frmReportPendapatanBulanan.Show;
            frmReportPendapatanBulanan.WindowState := wsNormal;
            frmReportPendapatanBulanan.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportPendapatanBulanan')) then
        begin
             ShowMessage('Periodic Report has been created');
             frmReportPendapatanBulanan.Show;
             frmReportPendapatanBulanan.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_TIPS_ADMINClick(Sender: TObject);
begin
     if (not IsFormOpen('frmRepTopRequest')) then
       begin
            Application.CreateForm(TfrmPosLapTips, frmPosLapTips);
            frmPosLapTips.FormStyle := fsMDIChild;
            frmPosLapTips.Show;
            frmPosLapTips.ISADMIN := True;
            frmPosLapTips.WindowState := wsNormal;
            frmPosLapTips.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosLapTips')) then
        begin
             ShowMessage('Top Request has been created');
             frmPosLapTips.Show;
             frmPosLapTips.ISADMIN := True;
             frmPosLapTips.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_TIPS_RCPTClick(Sender: TObject);
begin
     if (not IsFormOpen('frmRepTopRequest')) then
       begin
            Application.CreateForm(TfrmPosLapTips, frmPosLapTips);
            frmPosLapTips.FormStyle := fsMDIChild;
            frmPosLapTips.Show;
            frmPosLapTips.ISADMIN := False;
            frmPosLapTips.edStart.Enabled := False;
             frmPosLapTips.edEnd.Enabled := False;
            frmPosLapTips.WindowState := wsNormal;
            frmPosLapTips.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPosLapTips')) then
        begin
             ShowMessage('Top Request has been created');
             frmPosLapTips.Show;
             frmPosLapTips.ISADMIN := False;
             frmPosLapTips.edStart.Enabled := False;
             frmPosLapTips.edEnd.Enabled := False;
             frmPosLapTips.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_TOP_REQUESTClick(Sender: TObject);
begin
   if (not IsFormOpen('frmRepTopRequest')) then
       begin
            Application.CreateForm(TfrmRepTopRequest, frmRepTopRequest);
            frmRepTopRequest.FormStyle := fsMDIChild;
            frmRepTopRequest.Show;
            frmRepTopRequest.WindowState := wsNormal;
            frmRepTopRequest.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmRepTopRequest')) then
        begin
             ShowMessage('Top Request has been created');
             frmRepTopRequest.Show;
             frmRepTopRequest.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_VOIDClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportVoid')) then
       begin
            Application.CreateForm(TfrmReportVoid, frmReportVoid);
            frmReportVoid.FormStyle := fsMDIChild;
            frmReportVoid.Show;
            frmReportVoid.WindowState := wsNormal;
            frmReportVoid.edStart.Properties.ReadOnly := True;
            frmReportVoid.edEnd.Properties.ReadOnly := True;
            frmReportVoid.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportVoid')) then
        begin
             ShowMessage('Form Report Details has been created');
             frmReportVoid.edStart.Properties.ReadOnly := True;
             frmReportVoid.edEnd.Properties.ReadOnly := True;
             frmReportVoid.Show;
             frmReportVoid.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.REPORT_POS_VOID_ADMINClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportVoid')) then
       begin
            Application.CreateForm(TfrmReportVoid, frmReportVoid);
            frmReportVoid.FormStyle := fsMDIChild;
            frmReportVoid.Show;
            frmReportVoid.WindowState := wsNormal;
            frmReportVoid.edStart.Properties.ReadOnly := False;
            frmReportVoid.edEnd.Properties.ReadOnly := False;
            frmReportVoid.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportVoid')) then
        begin
             ShowMessage('Form Report Details has been created');
             frmReportVoid.edStart.Properties.ReadOnly := False;
             frmReportVoid.edEnd.Properties.ReadOnly := False;
             frmReportVoid.Show;
             frmReportVoid.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.dxTabbedMDIManager1TdxTabbedMDITabPropertiesTcxPCCustomButtonsButtons0Click(
  Sender: TObject);
begin
    //
end;

procedure TfrmMain.THEME_APPLYClick(Sender: TObject);
var
   jsonConfig : TStringList;
   ConfigDir : String;
begin
    ConfigDir := ExtractFilePath(Application.ExeName);
    //ConfigJSON := XSuperObject.SO(jsonConfig.Text);
    ConfigJSON.O['AppInfo'].AsObject.I['Toolbar'] := edToolbarStyle.ItemIndex;
    ConfigJSON.O['AppInfo'].AsObject.I['Accent'] := edColorAccent.ItemIndex;
    ConfigJSON.O['AppInfo'].AsObject.S['Global'] := edColorScheme.Text;
    ConfigJSON.O['AppInfo'].AsObject.S['Component'] := edSkinStyle.Text;
    ConfigJSON.SaveTo(ConfigDir + 'config.json', true, true);
    ShowMessage('Theme has been Update,' + #13 +
         'For Maximum Effect, Please Restart Program !');

end;

procedure TfrmMain.edColorAccentPropertiesChange(Sender: TObject);
begin
     PAGE_CONTROL.ColorSchemeAccent := TdxRibbonColorSchemeAccent(edColorAccent.ItemIndex);
end;

procedure TfrmMain.edColorSchemePropertiesChange(Sender: TObject);
begin
     PAGE_CONTROL.ColorSchemeName := edColorScheme.Text;
end;

procedure TfrmMain.edSkinStylePropertiesChange(Sender: TObject);
begin
    mainSkinControl.SkinName := edSkinStyle.Text;
end;

procedure TfrmMain.edToolbarStylePropertiesChange(Sender: TObject);
begin
     PAGE_CONTROL.Style := TdxRibbonStyle(edToolbarStyle.ItemIndex);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  DisableAero := True;
  LoadConfigApps;
  tmrWebChat.Enabled := False;

  //tmrFormLogin.Enabled := True;
  Screen.Cursor := crDefault;
  PAGE_CONTROL.ActiveTab := pgAPPS;
  //PAGE_CONTROL.Style := TdxRibbonStyle(1);
  //PAGE_CONTROL.ColorSchemeAccent := 2;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
     tmrFormLogin.Enabled := True;
end;

procedure TfrmMain.HRD_INPUT_ABSEN_MANUALClick(Sender: TObject);
begin
     if (not IsFormOpen('frmPresensiManual')) then
       begin
            Application.CreateForm(TfrmPresensiManual, frmPresensiManual);
            frmPresensiManual.Show;
            frmPresensiManual.WindowState := wsNormal;
            frmPresensiManual.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmPresensiManual')) then
        begin
             ShowMessage('Form Absen Manual has been created');
             frmPresensiManual.Show;
             frmPresensiManual.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_INPUT_CHANGE_JADWALClick(Sender: TObject);
begin
    if (not IsFormOpen('frmChangeJadwal')) then
       begin
            Application.CreateForm(TfrmChangeJadwal, frmChangeJadwal);
            frmChangeJadwal.Show;
            frmChangeJadwal.WindowState := wsNormal;
            frmChangeJadwal.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmChangeJadwal')) then
        begin
             ShowMessage('Form Change Jadwal has been created');
             frmChangeJadwal.Show;
             frmChangeJadwal.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_INPUT_CUTIClick(Sender: TObject);
begin
   if (not IsFormOpen('frmIjinCutiList')) then
       begin
            Application.CreateForm(TfrmIjinCutiList, frmIjinCutiList);
            frmIjinCutiList.Show;
            frmIjinCutiList.WindowState := wsNormal;
            frmIjinCutiList.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmIjinCutiList')) then
        begin
             ShowMessage('Form Cuti has been created');
             frmIjinCutiList.Show;
             frmIjinCutiList.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_INPUT_IJIN_KELUARClick(Sender: TObject);
begin
     //TfrmIjinKeluar
     if (not IsFormOpen('frmIjinKeluar')) then
       begin
            Application.CreateForm(TfrmIjinKeluar, frmIjinKeluar);
            frmIjinKeluar.FormStyle := fsMDIChild;
            frmIjinKeluar.Show;
            frmIjinKeluar.WindowState := wsNormal;
            frmIjinKeluar.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmIjinKeluar')) then
        begin
             ShowMessage('Form List Ijin Keluar has been created');
             frmIjinKeluar.Show;
             frmIjinKeluar.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_INPUT_IJIN_MASUKClick(Sender: TObject);
begin
    //TfrmIjinMasukList
    if (not IsFormOpen('frmIjinMasukList')) then
       begin
            Application.CreateForm(TfrmIjinMasukList, frmIjinMasukList);
            frmIjinMasukList.FormStyle := fsMDIChild;
            frmIjinMasukList.Show;
            frmIjinMasukList.WindowState := wsNormal;
            frmIjinMasukList.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmIjinMasukList')) then
        begin
             ShowMessage('Form List Ijin Masuk has been created');
             frmIjinPulangList.Show;
             frmIjinMasukList.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_INPUT_IJIN_PULANGClick(Sender: TObject);
begin
   //TfrmIjinPulangList
   if (not IsFormOpen('frmIjinPulangList')) then
       begin
            Application.CreateForm(TfrmIjinPulangList, frmIjinPulangList);
            frmIjinPulangList.FormStyle := fsMDIChild;
            frmIjinPulangList.Show;
            frmIjinPulangList.WindowState := wsNormal;
            frmIjinPulangList.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmIjinPulangList')) then
        begin
             ShowMessage('Form List Ijin Pulang has been created');
             frmIjinPulangList.Show;
             frmLemburList.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_INPUT_LEMBURClick(Sender: TObject);
begin
    if (not IsFormOpen('frmLemburList')) then
       begin
            Application.CreateForm(TfrmLemburList, frmLemburList);
            frmLemburList.FormStyle := fsMDIChild;
            frmLemburList.Show;
            frmLemburList.WindowState := wsNormal;
            frmLemburList.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmLemburList')) then
        begin
             ShowMessage('Form List Lembur has been created');
             frmLemburList.Show;
             frmLemburList.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_INPUT_SAKITClick(Sender: TObject);
begin
   //TfrmIjinSakitList
   if (not IsFormOpen('frmIjinSakitList')) then
       begin
            Application.CreateForm(TfrmIjinSakitList, frmIjinSakitList);
            frmIjinSakitList.FormStyle := fsMDIChild;
            frmIjinSakitList.Show;
            frmIjinSakitList.WindowState := wsNormal;
            frmIjinSakitList.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmIjinSakitList')) then
        begin
             ShowMessage('Form List Sakit has been created');
             frmIjinSakitList.Show;
             frmIjinSakitList.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_INPUT_TIDAK_MASUKClick(Sender: TObject);
begin
   //TfrmIjinTMList
   if (not IsFormOpen('frmIjinTMList')) then
       begin
            Application.CreateForm(TfrmIjinTMList, frmIjinTMList);
            frmIjinTMList.Show;
            frmIjinTMList.WindowState := wsNormal;
            frmIjinTMList.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmIjinTMList')) then
        begin
             ShowMessage('Form List Tidak Masuk has been created');
             frmIjinTMList.Show;
             frmIjinTMList.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_JADWAL_HARIANClick(Sender: TObject);
begin
   //
   if (not IsFormOpen('frmJadwalOutlet')) then
       begin
            Application.CreateForm(TfrmJadwalOutlet, frmJadwalOutlet);
            frmJadwalOutlet.Show;
            frmJadwalOutlet.WindowState := wsNormal;
            frmJadwalOutlet.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmJadwalOutlet')) then
        begin
             ShowMessage('Form Jadwal Tetap has been created');
             frmJadwalOutlet.Show;
             frmJadwalOutlet.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_JADWAL_TETAPClick(Sender: TObject);
begin
  //
  if (not IsFormOpen('frmJadwalTetap')) then
       begin
            Application.CreateForm(TfrmJadwalTetap, frmJadwalTetap);
            frmJadwalTetap.Show;
            frmJadwalTetap.WindowState := wsNormal;
            frmJadwalTetap.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmJadwalTetap')) then
        begin
             ShowMessage('Form Jadwal Tetap has been created');
             frmJadwalTetap.Show;
             frmJadwalTetap.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_KONTRAK_BERJALAN_ADMINClick(Sender: TObject);
begin
    if (not IsFormOpen('frmMasterKaryawan')) then
       begin
        Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
        frmMasterKaryawan.btnSelect.Visible := True;
        frmMasterKaryawan.btnSelect.Tag := 1;
        frmMasterKaryawan.btnNew.Visible := False;
        frmMasterKaryawan.btnEdit.Visible := False;
        frmMasterKaryawan.btnKontrak.Visible := False;
        frmMasterKaryawan.ISADMIN := True;
        frmMasterKaryawan.Show;
        frmMasterKaryawan.WindowState := wsNormal;
        frmMasterKaryawan.Position := poDesktopCenter;
       end
 else if (IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
        Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
        frmMasterKaryawan.btnSelect.Visible := True;
        frmMasterKaryawan.btnSelect.Tag := 1;
        frmMasterKaryawan.btnNew.Visible := False;
        frmMasterKaryawan.btnEdit.Visible := False;
        frmMasterKaryawan.btnKontrak.Visible := False;
        frmMasterKaryawan.ISADMIN := True;
        frmMasterKaryawan.Show;
        frmMasterKaryawan.WindowState := wsNormal;
        frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmMain.HRD_KONTRAK_BERJALAN_SPVClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMasterKaryawan')) then
       begin
        Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
        frmMasterKaryawan.btnSelect.Visible := True;
        frmMasterKaryawan.btnSelect.Tag := 1;
        frmMasterKaryawan.btnNew.Visible := False;
        frmMasterKaryawan.btnEdit.Visible := False;
        frmMasterKaryawan.btnKontrak.Visible := False;
        frmMasterKaryawan.ISADMIN := False;
        frmMasterKaryawan.Caption := 'Kontrak Berjalan Detail Karyawan Spv';
        frmMasterKaryawan.Show;
        frmMasterKaryawan.WindowState := wsNormal;
        frmMasterKaryawan.Position := poDesktopCenter;
       end
 else if (IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
        Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
        frmMasterKaryawan.btnSelect.Visible := True;
        frmMasterKaryawan.btnSelect.Tag := 1;
        frmMasterKaryawan.btnNew.Visible := False;
        frmMasterKaryawan.btnEdit.Visible := False;
        frmMasterKaryawan.btnKontrak.Visible := False;
        frmMasterKaryawan.ISADMIN := False;
        frmMasterKaryawan.Caption := 'Kontrak Berjalan Detail Karyawan Spv';
        frmMasterKaryawan.Show;
        frmMasterKaryawan.WindowState := wsNormal;
        frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmMain.HRD_LIBUR_NASIONALClick(Sender: TObject);
begin
     //TfrmLiburNasional
     if (not IsFormOpen('frmLiburNasional')) then
       begin
            Application.CreateForm(TfrmLiburNasional, frmLiburNasional);
            frmLiburNasional.Show;
            frmLiburNasional.WindowState := wsNormal;
            frmLiburNasional.Position := poDesktopCenter;
       end
     else if (IsFormOpen('frmLiburNasional')) then
        begin
             ShowMessage('Form Libur Nasional has been created');
             frmLiburNasional.Show;
             frmLiburNasional.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_MANUAL_ABSENClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPresensiManual')) then
       begin
            Application.CreateForm(TfrmPresensiManual, frmPresensiManual);
            frmPresensiManual.Show;
            frmPresensiManual.WindowState := wsNormal;
            frmPresensiManual.Position := poDesktopCenter;
       end
     else if (IsFormOpen('frmPresensiManual')) then
        begin
             ShowMessage('Form Presensi Manual Form has been created');
             frmPresensiManual.Show;
             frmPresensiManual.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_MASTER_DIVISIClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMasterDivisi')) then
       begin
            Application.CreateForm(TfrmMasterDivisi, frmMasterDivisi);
            frmMasterDivisi.Show;
            frmMasterDivisi.Position := poDesktopCenter;
            frmMasterDivisi.WindowState := wsNormal;

       end
 else if (IsFormOpen('frmMasterDivisi')) then
    begin
         ShowMessage('Form Master Divisi has been created');
         frmMasterDivisi.Show;
         frmMasterDivisi.Position := poDesktopCenter;
         Exit;
    end;
end;

procedure TfrmMain.HRD_MASTER_KARYAWAN_ADMINClick(Sender: TObject);
begin
  if (not IsFormOpen('frmMasterKaryawan')) then
       begin
            Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
            frmMasterKaryawan.btnSelect.Visible := False;
            frmMasterKaryawan.ISADMIN := True;
            frmMasterKaryawan.Show;
            frmMasterKaryawan.WindowState := wsNormal;
       end
 else if (IsFormOpen('frmMasterKaryawan')) then
    begin
        frmMasterKaryawan.Close;
        Sleep(100);
        Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
        frmMasterKaryawan.btnSelect.Visible := False;
        frmMasterKaryawan.ISADMIN := True;
        frmMasterKaryawan.Show;
        frmMasterKaryawan.WindowState := wsNormal;
        frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmMain.HRD_MASTER_KARYAWAN_SPVClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMasterKaryawan')) then
       begin
            Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
            frmMasterKaryawan.btnSelect.Visible := False;
            frmMasterKaryawan.ISADMIN := False;
            frmMasterKaryawan.Caption := 'Master Karyawan';
            frmMasterKaryawan.Show;
            frmMasterKaryawan.WindowState := wsNormal;
            frmMasterKaryawan.Position := poDesktopCenter;
       end
 else if (IsFormOpen('frmMasterKaryawan')) then
    begin
      frmMasterKaryawan.Close;
      Sleep(100);
      Application.CreateForm(TfrmMasterKaryawan, frmMasterKaryawan);
      frmMasterKaryawan.btnSelect.Visible := False;
      frmMasterKaryawan.ISADMIN := False;
      frmMasterKaryawan.Caption := 'Master Karyawan';
      frmMasterKaryawan.Show;
      frmMasterKaryawan.WindowState := wsNormal;
      frmMasterKaryawan.Position := poDesktopCenter;
    end;
end;

procedure TfrmMain.HRD_MASTER_KONTRAK_ADMINClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMasterKontrak')) then
       begin
            Application.CreateForm(TfrmMasterKontrak, frmMasterKontrak);
            frmMasterKontrak.ISADMIN := True;
            frmMasterKontrak.FormStyle := fsMDIChild;
            frmMasterKontrak.Caption := 'Master Kontrak as Admin';
            frmMasterKontrak.Show;
            frmMasterKontrak.WindowState := wsNormal;
            frmMasterKontrak.Position := poDesktopCenter;
       end
 else if (IsFormOpen('frmMasterKontrak')) then
    begin
         ShowMessage('Form Master Kontrak has been created');
         frmMasterKontrak.Position := poDesktopCenter;
         Exit;
    end;
end;

procedure TfrmMain.HRD_MASTER_KONTRAK_SPVClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMasterKontrak')) then
       begin
            Application.CreateForm(TfrmMasterKontrak, frmMasterKontrak);
            frmMasterKontrak.FormStyle := fsMDIChild;
            frmMasterKontrak.Caption := 'Master Kontrak as SPV';
            //frmMasterKontrak.lblJudlForm.Caption :=
            frmMasterKontrak.Show;
            frmMasterKontrak.WindowState := wsNormal;
            frmMasterKontrak.Position := poDesktopCenter;
       end
 else if (IsFormOpen('frmMasterKontrak')) then
    begin
         ShowMessage('Form Master Kontrak has been created');
         frmMasterKontrak.Show;
         frmMasterKontrak.Position := poDesktopCenter;
         Exit;
    end;
end;

procedure TfrmMain.HRD_MASTER_SHIFTClick(Sender: TObject);
begin
   if (not IsFormOpen('frmMasterShift')) then
       begin
            Application.CreateForm(TfrmMasterShift, frmMasterShift);
            frmMasterShift.FormStyle := fsMDIChild;
            frmMasterShift.Show;
            frmMasterShift.WindowState := wsNormal;
            frmMasterShift.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmMasterShift')) then
        begin
             ShowMessage('Form Master Shift has been created');
             frmMasterShift.Show;
             frmMasterShift.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_MASTER_VARIABLE_REPORTClick(Sender: TObject);
begin
   //TfrmMasterReportVariable
   if (not IsFormOpen('frmMasterReportVariable')) then
       begin
            Application.CreateForm(TfrmMasterReportVariable, frmMasterReportVariable);
            frmMasterReportVariable.FormStyle := fsMDIChild;
            frmMasterReportVariable.Show;
            frmMasterReportVariable.WindowState := wsNormal;
            frmMasterReportVariable.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmMasterReportVariable')) then
        begin
             ShowMessage('Form Master Report has been created');
             frmMasterReportVariable.Show;
             frmMasterReportVariable.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_PAYROLL_ADMINClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPayrollAdmin')) then
      begin
           Application.CreateForm(TfrmPayrollAdmin, frmPayrollAdmin);
           frmPayrollAdmin.ISADMIN := 'Y';
           frmPayrollAdmin.Show;
           frmPayrollAdmin.WindowState := wsNormal;
           frmPayrollAdmin.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmPayrollAdmin')) then
      begin
           ShowMessage('Form Payrol has been created');
           frmPayrollAdmin.ISADMIN := 'Y';
           frmPayrollAdmin.Show;
           frmPayrollAdmin.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_PAYROLL_SPVClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPayrollAdmin')) then
      begin
           Application.CreateForm(TfrmPayrollAdmin, frmPayrollAdmin);
           frmPayrollAdmin.ISADMIN := 'N';
           frmPayrollAdmin.Show;
           frmPayrollAdmin.WindowState := wsNormal;
           frmPayrollAdmin.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmPayrollAdmin')) then
      begin
           ShowMessage('Form Payrol has been created');
           frmPayrollAdmin.ISADMIN := 'N';
           frmPayrollAdmin.Show;
           frmPayrollAdmin.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_PERIODE_PAYROLLClick(Sender: TObject);
begin
   if (not IsFormOpen('frmPayrollPeriode')) then
      begin
           Application.CreateForm(TfrmPayrollPeriode, frmPayrollPeriode);
           frmPayrollPeriode.FormStyle := fsNormal;
           frmPayrollPeriode.Show;
           frmPayrollPeriode.Width := 350;
           frmPayrollPeriode.Height := 255;
           frmPayrollPeriode.WindowState := wsNormal;
           frmPayrollPeriode.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmPayrollPeriode')) then
      begin
           ShowMessage('Report Periode Form has been created');
           frmPayrollPeriode.Show;
           frmPayrollPeriode.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_PERIODE_REPORTClick(Sender: TObject);
begin
  //TfrmReportPeriode
  if (not IsFormOpen('frmReportPeriode')) then
      begin
           Application.CreateForm(TfrmReportPeriode, frmReportPeriode);
           frmReportPeriode.FormStyle := fsNormal;
           frmReportPeriode.Show;
           frmReportPeriode.Width := 350;
           frmReportPeriode.Height := 255;
           frmReportPeriode.WindowState := wsNormal;
           frmReportPeriode.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmReportPeriode')) then
      begin
           ShowMessage('Report Periode Form has been created');
           frmReportPeriode.Show;
           frmReportPeriode.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_PERIODE_THRClick(Sender: TObject);
begin
   //
   if (not IsFormOpen('frmTHRCutOff')) then
      begin
           Application.CreateForm(TfrmTHRCutOff, frmTHRCutOff);
           frmTHRCutOff.Show;
           frmTHRCutOff.WindowState := wsNormal;
           frmTHRCutOff.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmTHRCutOff')) then
      begin
           ShowMessage('THR Periode Form has been created');
           frmTHRCutOff.Show;
           frmTHRCutOff.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_PERIODE_UMX3Click(Sender: TObject);
begin
     //TfrmPeriodeUM
     if (not IsFormOpen('frmPeriodeUM')) then
      begin
           Application.CreateForm(TfrmPeriodeUM, frmPeriodeUM);
           frmPeriodeUM.Show;
           frmPeriodeUM.WindowState := wsNormal;
           frmPeriodeUM.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmPeriodeUM')) then
      begin
           ShowMessage('Finger Registration Form has been created');
           frmPeriodeUM.Show;
           frmPeriodeUM.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REG_FINGERClick(Sender: TObject);
begin
   if (not IsFormOpen('frmRegKaryawan')) then
      begin
           Application.CreateForm(TfrmRegKaryawan, frmRegKaryawan);
           frmRegKaryawan.Show;
           frmRegKaryawan.WindowState := wsNormal;
           frmRegKaryawan.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmRegKaryawan')) then
      begin
           ShowMessage('Finger Registration Form has been created');
           frmRegKaryawan.Show;
           frmRegKaryawan.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.DELETED_HRD_REKAP_PRESENSIClick(Sender: TObject);
begin
   {Application.CreateForm(TfrmRekapHarianBaru, frmRekapHarianBaru);
   frmRekapHarianBaru.FormStyle := fsMDIChild;
   frmRekapHarianBaru.Show;
   frmRekapHarianBaru.WindowState := wsNormal;
   frmRekapHarianBaru.Position := poDesktopCenter;}
   if (not IsFormOpen('frmRekapHarianBaru')) then
      begin
           Application.CreateForm(TfrmRekapHarianBaru, frmRekapHarianBaru);
           frmRekapHarianBaru.FormStyle := fsMDIChild;
           frmRekapHarianBaru.Show;
           frmRekapHarianBaru.WindowState := wsNormal;
           //frmRekapHarianBaru.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmRekapHarianBaru')) then
      begin
           ShowMessage('Rekap Harian Form has been created');
           frmRekapHarianBaru.Show;
           //frmRekapHarianBaru.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REKAP_PRESENSI_OLDClick(Sender: TObject);
begin
   if (not IsFormOpen('frmRekapHarianOld')) then
      begin
           Application.CreateForm(TfrmRekapHarianOld, frmRekapHarianOld);
           frmRekapHarianOld.FormStyle := fsMDIChild;
           frmRekapHarianOld.Show;
           frmRekapHarianOld.WindowState := wsNormal;
           //frmRekapHarianBaru.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmRekapHarianOld')) then
      begin
           ShowMessage('Rekap Harian Form has been created');
           frmRekapHarianOld.Show;
           //frmRekapHarianBaru.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REPORT_CUTIClick(Sender: TObject);
begin
    //TfrmReportCuti
    if (not IsFormOpen('frmReportCuti')) then
       begin
            Application.CreateForm(TfrmReportCuti, frmReportCuti);
            frmReportCuti.FormStyle := fsMDIChild;
            frmReportCuti.Show;
            frmReportCuti.WindowState := wsNormal;
            frmReportCuti.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportCuti')) then
        begin
             ShowMessage('Form Report Laporan has been created');
             frmReportCuti.Show;
             frmReportCuti.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_REPORT_JADWALClick(Sender: TObject);
begin
     //
     if (not IsFormOpen('frmReportSchedule')) then
       begin
            Application.CreateForm(TfrmReportSchedule, frmReportSchedule);
            frmReportSchedule.FormStyle := fsMDIChild;
            frmReportSchedule.Show;
            frmReportSchedule.WindowState := wsNormal;
            frmReportSchedule.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportSchedule')) then
        begin
             ShowMessage('Form Report Jadwal Lokal has been created');
             frmReportSchedule.Show;
             frmReportSchedule.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_REPORT_LEMBURClick(Sender: TObject);
begin
    //
    if (not IsFormOpen('frmReportLembur')) then
       begin
            Application.CreateForm(TfrmReportLembur, frmReportLembur);
            frmReportLembur.FormStyle := fsMDIChild;
            frmReportLembur.Show;
            frmReportLembur.WindowState := wsNormal;
            frmReportLembur.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportLembur')) then
        begin
             ShowMessage('Form Report Laporan has been created');
             frmReportLembur.Show;
             frmReportLembur.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_REPORT_SAKITClick(Sender: TObject);
begin
   //
   if (not IsFormOpen('frmReportSakit')) then
       begin
            Application.CreateForm(TfrmReportSakit, frmReportSakit);
            frmReportSakit.FormStyle := fsMDIChild;
            frmReportSakit.Show;
            frmReportSakit.WindowState := wsNormal;
            frmReportSakit.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmReportSakit')) then
        begin
             ShowMessage('Form Therapist Report has been created');
             frmReportSakit.Show;
             frmReportSakit.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_REPORT_THERAPISTClick(Sender: TObject);
begin
    //TfrmTherapistReport
    if (not IsFormOpen('frmTherapistReport')) then
       begin
            Application.CreateForm(TfrmTherapistReport, frmTherapistReport);
            frmTherapistReport.FormStyle := fsMDIChild;
            frmTherapistReport.Show;
            frmTherapistReport.WindowState := wsNormal;
            frmTherapistReport.Position := poDesktopCenter;

       end
     else if (IsFormOpen('frmTherapistReport')) then
        begin
             ShowMessage('Form Therapist Report has been created');
             frmTherapistReport.Show;
             frmTherapistReport.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_REP_ABSEN_MANUALClick(Sender: TObject);
begin
   //TfrmReportAbsenManual
   if (not IsFormOpen('frmReportAbsenManual')) then
      begin
           Application.CreateForm(TfrmReportAbsenManual, frmReportAbsenManual);
           frmReportAbsenManual.Show;
           frmReportAbsenManual.WindowState := wsNormal;
           frmReportAbsenManual.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmReportAbsenManual')) then
      begin
           ShowMessage('Form Laporan Absen Manual has been created');
           frmReportAbsenManual.Show;
           frmReportAbsenManual.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_KONTRAK_ADMClick(Sender: TObject);
begin
    //
    if (not IsFormOpen('frmReportKontrakBerjalan')) then
      begin
           Application.CreateForm(TfrmReportKontrakBerjalan, frmReportKontrakBerjalan);
           frmReportKontrakBerjalan.ISADMIN := True;
           frmReportKontrakBerjalan.Show;
           frmReportKontrakBerjalan.Caption := ' Report Kontrak Berjalan As Admin';
           frmReportKontrakBerjalan.WindowState := wsNormal;
           frmReportKontrakBerjalan.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmReportKontrakBerjalan')) then
      begin
           ShowMessage('Form Report Kontrak Berjalan has been created');
           frmReportKontrakBerjalan.ISADMIN := True;
           frmReportKontrakBerjalan.Show;
           frmReportKontrakBerjalan.Caption := ' Report Kontrak Berjalan As Admin';
           frmReportKontrakBerjalan.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_KONTRAK_SPVClick(Sender: TObject);
begin
    if (not IsFormOpen('frmReportKontrakBerjalan')) then
      begin
           Application.CreateForm(TfrmReportKontrakBerjalan, frmReportKontrakBerjalan);
           frmReportKontrakBerjalan.ISADMIN := False;
           frmReportKontrakBerjalan.Show;
           frmReportKontrakBerjalan.Caption := ' Report Kontrak Berjalan As Spv';
           frmReportKontrakBerjalan.WindowState := wsNormal;
           frmReportKontrakBerjalan.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmReportKontrakBerjalan')) then
      begin
           ShowMessage('Form Report Kontrak Berjalan has been created');
           frmReportKontrakBerjalan.ISADMIN := True;
           frmReportKontrakBerjalan.Show;
           frmReportKontrakBerjalan.Caption := ' Report Kontrak Berjalan As Spv';
           frmReportKontrakBerjalan.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_NILAI_TRClick(Sender: TObject);
begin
   if (not IsFormOpen('frmLaporanTherapistReport')) then
      begin
           Application.CreateForm(TfrmLaporanTherapistReport, frmLaporanTherapistReport);
           frmLaporanTherapistReport.FormStyle := fsMDIChild;
           frmLaporanTherapistReport.Show;
           frmLaporanTherapistReport.WindowState := wsNormal;
           //frmRekapHarianBaru.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmLaporanTherapistReport')) then
      begin
           ShowMessage('Laporan Penilaian has been created');
           frmLaporanTherapistReport.Show;
           //frmRekapHarianBaru.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_ADMClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportPayroll')) then
      begin
           Application.CreateForm(TfrmReportPayroll, frmReportPayroll);
           frmReportPayroll.ISADMIN := 'Y';
           frmReportPayroll.Show;
           frmReportPayroll.Caption := ' Report Payroll As Admin';
           frmReportPayroll.WindowState := wsNormal;
           frmReportPayroll.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmReportPayroll')) then
      begin
           ShowMessage('Form laporan Payroll has been created');
           frmReportPayroll.ISADMIN := 'Y';
           frmReportPayroll.Show;
           frmReportPayroll.Caption := ' Report Payroll As Admin';
           frmReportPayroll.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_CASHIN_ADMClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportCashIn')) then
      begin
           Application.CreateForm(TfrmReportCashIn, frmReportCashIn);
           frmReportCashIn.ISADMIN := True;
           frmReportCashIn.Show;
           frmReportCashIn.Caption := ' Report Cash In As Admin';
           frmReportCashIn.WindowState := wsNormal;
           frmReportCashIn.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmReportCashIn')) then
      begin
           ShowMessage('Form Report Payroll Cash In has been created');
           frmReportCashIn.ISADMIN := True;
           frmReportCashIn.Show;
           frmReportCashIn.Caption := ' Report Cash In As Admin';
           frmReportCashIn.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_CASHIN_SPVClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportCashIn')) then
      begin
           Application.CreateForm(TfrmReportCashIn, frmReportCashIn);
           frmReportCashIn.ISADMIN := False;
           frmReportCashIn.Show;
           frmReportCashIn.Caption := ' Report Cash In As SPV';
           frmReportCashIn.WindowState := wsNormal;
           frmReportCashIn.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmReportCashIn')) then
      begin
           ShowMessage('Form Report Payroll Cash In has been created');
           frmReportCashIn.ISADMIN := False;
           frmReportCashIn.Show;
           frmReportCashIn.Caption := ' Report Cash In As SPV';
           frmReportCashIn.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_DETAILS_ADMClick(Sender: TObject);
begin
   if (not IsFormOpen('frmRepPayrollDetails')) then
      begin
           Application.CreateForm(TfrmRepPayrollDetails, frmRepPayrollDetails);
           frmRepPayrollDetails.ISADMIN := True;
           frmRepPayrollDetails.Show;
           frmRepPayrollDetails.Caption := ' Report Payroll Detail As Admin';
           frmRepPayrollDetails.WindowState := wsNormal;
           frmRepPayrollDetails.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmRepPayrollDetails')) then
      begin
           ShowMessage('Form laporan Payroll has been created');
           frmRepPayrollDetails.ISADMIN := True;
           frmRepPayrollDetails.Show;
           frmRepPayrollDetails.Caption := ' Report Payroll Detail As Admin';
           frmRepPayrollDetails.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_DETAILS_SPVClick(Sender: TObject);
begin
   if (not IsFormOpen('frmRepPayrollDetails')) then
      begin
           Application.CreateForm(TfrmRepPayrollDetails, frmRepPayrollDetails);
           frmRepPayrollDetails.ISADMIN := False;
           frmRepPayrollDetails.Show;
           frmRepPayrollDetails.Caption := ' Report Payroll Detail As SPV';
           frmRepPayrollDetails.WindowState := wsNormal;
           frmRepPayrollDetails.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmRepPayrollDetails')) then
      begin
           ShowMessage('Form laporan Payroll has been created');
           frmRepPayrollDetails.ISADMIN := False;
           frmRepPayrollDetails.Show;
           frmRepPayrollDetails.Caption := ' Report Payroll Detail As SPV';
           frmRepPayrollDetails.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_OTHER_ADMClick(Sender: TObject);
begin
   if (not IsFormOpen('frmReportOtherPayroll')) then
      begin
           Application.CreateForm(TfrmReportOtherPayroll, frmReportOtherPayroll);
           frmReportOtherPayroll.ISADMIN := 'Y';
           frmReportOtherPayroll.Show;
           frmReportOtherPayroll.Caption := ' Report Payroll Other As Admin';
           frmReportOtherPayroll.WindowState := wsNormal;
           frmReportOtherPayroll.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmReportOtherPayroll')) then
      begin
           ShowMessage('Form Report Payroll Other has been created');
           frmReportOtherPayroll.ISADMIN := 'Y';
           frmReportOtherPayroll.Show;
           frmReportOtherPayroll.Caption := ' Report Payroll Other As Admin';
           frmReportOtherPayroll.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_OTHER_SPVClick(Sender: TObject);
begin
    if (not IsFormOpen('frmReportOtherPayroll')) then
      begin
           Application.CreateForm(TfrmReportOtherPayroll, frmReportOtherPayroll);
           frmReportOtherPayroll.ISADMIN := 'N';
           frmReportOtherPayroll.Show;
           frmReportOtherPayroll.Caption := ' Report Payroll Other As SPV';
           frmReportOtherPayroll.WindowState := wsNormal;
           frmReportOtherPayroll.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmReportOtherPayroll')) then
      begin
           ShowMessage('Form Report Payroll Other has been created');
           frmReportOtherPayroll.ISADMIN := 'N';
           frmReportOtherPayroll.Show;
           frmReportOtherPayroll.Caption := ' Report Payroll Other As SPV';
           frmReportOtherPayroll.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_POTONGAN_ADMClick(Sender: TObject);
begin
    if (not IsFormOpen('frmRepPotongan')) then
      begin
           Application.CreateForm(TfrmRepPotongan, frmRepPotongan);
           //frmRepPotongan.ISADMIN := 'N';
           frmRepPotongan.Show;
           frmRepPotongan.Caption := ' Report Potongan Payroll';
           frmRepPotongan.WindowState := wsNormal;
           frmRepPotongan.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmRepPotongan')) then
      begin
           ShowMessage('Form laporan Payroll has been created');
           //frmRepPotongan.ISADMIN := 'N';
           frmRepPotongan.Show;
           frmRepPotongan.Caption := ' Report Potongan Payroll';
           frmRepPotongan.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_POTONGAN_SPVClick(Sender: TObject);
begin
    //TfrmRepPotongan
    if (not IsFormOpen('frmRepPotongan')) then
      begin
           Application.CreateForm(TfrmRepPotongan, frmRepPotongan);
           //frmRepPotongan.ISADMIN := 'N';
           frmRepPotongan.Show;
           frmRepPotongan.Caption := ' Report Potongan Payroll';
           frmRepPotongan.WindowState := wsNormal;
           frmRepPotongan.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmRepPotongan')) then
      begin
           ShowMessage('Form laporan Payroll has been created');
           //frmRepPotongan.ISADMIN := 'N';
           frmRepPotongan.Show;
           frmRepPotongan.Caption := ' Report Potongan Payroll';
           frmRepPotongan.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_SPVClick(Sender: TObject);
begin
   //
   if (not IsFormOpen('frmReportPayroll')) then
      begin
           Application.CreateForm(TfrmReportPayroll, frmReportPayroll);
           frmReportPayroll.ISADMIN := 'N';
           frmReportPayroll.Show;
           frmReportPayroll.Caption := ' Report Payroll As SPV';
           frmReportPayroll.WindowState := wsNormal;
           frmReportPayroll.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmReportPayroll')) then
      begin
           ShowMessage('Form laporan Payroll has been created');
           frmReportPayroll.ISADMIN := 'N';
           frmReportPayroll.Show;
           frmReportPayroll.Caption := ' Report Payroll As SPV';
           frmReportPayroll.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_TAMBAHAN_ADMClick(Sender: TObject);
begin
   //
   if (not IsFormOpen('frmRepTambahan')) then
      begin
           Application.CreateForm(TfrmRepTambahan, frmRepTambahan);
           //frmRepPotongan.ISADMIN := 'N';
           frmRepTambahan.Show;
           frmRepTambahan.Caption := ' Report Tambahan Payroll';
           frmRepTambahan.WindowState := wsNormal;
           frmRepTambahan.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmRepTambahan')) then
      begin
           ShowMessage('Form laporan Payroll has been created');
           //frmRepPotongan.ISADMIN := 'N';
           frmRepTambahan.Show;
           frmRepTambahan.Caption := ' Report Tambahan Payroll';
           frmRepTambahan.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_PAYROLL_TAMBAHAN_SPVClick(Sender: TObject);
begin
    //TfrmRepTambahan
    if (not IsFormOpen('frmRepTambahan')) then
      begin
           Application.CreateForm(TfrmRepTambahan, frmRepTambahan);
           //frmRepPotongan.ISADMIN := 'N';
           frmRepTambahan.Show;
           frmRepTambahan.Caption := ' Report Tambahan Payroll';
           frmRepTambahan.WindowState := wsNormal;
           frmRepTambahan.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmRepTambahan')) then
      begin
           ShowMessage('Form laporan Payroll has been created');
           //frmRepPotongan.ISADMIN := 'N';
           frmRepTambahan.Show;
           frmRepTambahan.Caption := ' Report Tambahan Payroll';
           frmRepTambahan.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_REKAP_PRESENSIClick(Sender: TObject);
begin
    //TfrmLapRekapAbsen
    if (not IsFormOpen('frmLapRekapAbsen')) then
      begin
           Application.CreateForm(TfrmLapRekapAbsen, frmLapRekapAbsen);
           frmLapRekapAbsen.Show;
           frmLapRekapAbsen.WindowState := wsNormal;
           frmLapRekapAbsen.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmLapRekapAbsen')) then
      begin
           ShowMessage('Form Edit Saldo Cuti has been created');
           frmLapRekapAbsen.Show;
           frmLapRekapAbsen.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_REP_THR_ADMINClick(Sender: TObject);
begin
    //
    if (not IsFormOpen('frmTHRReport')) then
      begin
           Application.CreateForm(TfrmTHRReport, frmTHRReport);
           frmTHRReport.ISADMIN := 'Y';
           frmTHRReport.Show;
           frmTHRReport.Caption := ' Report THR As Admin';
           frmTHRReport.WindowState := wsNormal;
           frmTHRReport.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmTHRReport')) then
      begin
           ShowMessage('Form laporan Payroll has been created');
           frmTHRReport.ISADMIN := 'Y';
           frmTHRReport.Show;
           frmTHRReport.Caption := ' Report THR As Admin';
           frmTHRReport.Position := poDesktopCenter;
      end;
end;

procedure TfrmMain.HRD_REP_THR_SPVClick(Sender: TObject);
begin
     //TfrmTHRReport
     if (not IsFormOpen('frmTHRReport')) then
      begin
           Application.CreateForm(TfrmTHRReport, frmTHRReport);
           frmTHRReport.ISADMIN := 'N';
           frmTHRReport.Show;
           frmTHRReport.Caption := ' Report Payroll As SPV';
           frmTHRReport.WindowState := wsNormal;
           frmTHRReport.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmTHRReport')) then
      begin
           ShowMessage('Form laporan Payroll has been created');
           frmTHRReport.ISADMIN := 'N';
           frmTHRReport.Show;
           frmTHRReport.Caption := ' Report Payroll As SPV';
           frmTHRReport.Position := poDesktopCenter;
      end;
end;

procedure TfrmMain.HRD_SALDO_CUTI_EDITClick(Sender: TObject);
begin
  //TfrmSaldoCuti
  if (not IsFormOpen('frmSaldoCuti')) then
      begin
           Application.CreateForm(TfrmSaldoCuti, frmSaldoCuti);
           frmSaldoCuti.Show;
           frmSaldoCuti.WindowState := wsNormal;
           frmSaldoCuti.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmSaldoCuti')) then
      begin
           ShowMessage('Form Edit Saldo Cuti has been created');
           frmSaldoCuti.Show;
           frmSaldoCuti.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_SALDO_CUTI_GENERATEClick(Sender: TObject);
begin
    //TfrmSaldoCutiGenerate
    if (not IsFormOpen('frmSaldoCutiGenerate')) then
      begin
           Application.CreateForm(TfrmSaldoCutiGenerate, frmSaldoCutiGenerate);
           frmSaldoCutiGenerate.FormStyle := fsMDIChild;
           frmSaldoCutiGenerate.Show;
           frmSaldoCutiGenerate.WindowState := wsNormal;
           frmSaldoCutiGenerate.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmSaldoCutiGenerate')) then
      begin
           ShowMessage('Form Edit Saldo Cuti has been created');
           frmSaldoCutiGenerate.Show;
           frmSaldoCutiGenerate.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_SCAN_FINGER_USBClick(Sender: TObject);
begin
   if (not IsFormOpen('frmKaryawanScanFinger')) then
       begin
            Application.CreateForm(TfrmKaryawanScanFinger, frmKaryawanScanFinger);
            if (Screen.MonitorCount > 1) then
                 begin
                      frmKaryawanScanFinger.FormStyle := fsNormal;
                      frmKaryawanScanFinger.Left:=Screen.Monitors[1].Left;
                      frmKaryawanScanFinger.Top:=Screen.Monitors[1].Top;
                      frmKaryawanScanFinger.Width:=Screen.Monitors[1].Width;
                      frmKaryawanScanFinger.Height:=Screen.Monitors[1].Height;
                 end
            else if (Screen.MonitorCount = 1) then
                 begin
                    frmKaryawanScanFinger.FormStyle := fsMDIChild;
                 end;
            frmKaryawanScanFinger.Show;
            frmKaryawanScanFinger.WindowState := wsNormal;
            frmKaryawanScanFinger.Position := poDesktopCenter;
       end
     else if (IsFormOpen('frmKaryawanScanFinger')) then
        begin
             ShowMessage('Karyawan Scan Finger Form has been created');
            frmKaryawanScanFinger.Show;
            frmKaryawanScanFinger.WindowState := wsNormal;
            frmKaryawanScanFinger.Position := poDesktopCenter;
             Exit;
        end;
end;

procedure TfrmMain.HRD_THR_ADMINClick(Sender: TObject);
begin
    //TfrmTHRPerhitungan
    if (not IsFormOpen('frmTHRPerhitungan')) then
      begin
           Application.CreateForm(TfrmTHRPerhitungan, frmTHRPerhitungan);
           frmTHRPerhitungan.ISADMIN := 'Y';
           frmTHRPerhitungan.FormStyle := fsMDIChild;
           frmTHRPerhitungan.Show;
           frmTHRPerhitungan.WindowState := wsNormal;
           frmTHRPerhitungan.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmTHRPerhitungan')) then
      begin
           ShowMessage('Form Perhitungan THR has been created');
           frmTHRPerhitungan.ISADMIN := 'Y';
           frmTHRPerhitungan.Show;
           frmTHRPerhitungan.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_THR_PARAMETERClick(Sender: TObject);
begin
    //
    if (not IsFormOpen('frmTHRParameter')) then
      begin
           Application.CreateForm(TfrmTHRParameter, frmTHRParameter);
           frmTHRParameter.FormStyle := fsMDIChild;
           frmTHRParameter.Show;
           frmTHRParameter.WindowState := wsNormal;
           frmTHRParameter.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmTHRParameter')) then
      begin
           ShowMessage('Form Parameter THR has been created');
           frmTHRParameter.Show;
           frmTHRParameter.Position := poDesktopCenter;
           Exit;
      end;
end;

procedure TfrmMain.HRD_THR_SPVClick(Sender: TObject);
begin
    if (not IsFormOpen('frmTHRPerhitungan')) then
      begin
           Application.CreateForm(TfrmTHRPerhitungan, frmTHRPerhitungan);
           frmTHRPerhitungan.ISADMIN := 'N';
           frmTHRPerhitungan.FormStyle := fsMDIChild;
           frmTHRPerhitungan.Show;
           frmTHRPerhitungan.WindowState := wsNormal;
           frmTHRPerhitungan.Position := poDesktopCenter;
      end
   else if (IsFormOpen('frmTHRPerhitungan')) then
      begin
           ShowMessage('Form Perhitungan THR has been created');
           frmTHRPerhitungan.ISADMIN := 'N';
           frmTHRPerhitungan.Show;
           frmTHRPerhitungan.Position := poDesktopCenter;
           Exit;
      end;
end;

end.
