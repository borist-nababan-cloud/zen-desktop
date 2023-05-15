unit FDMDB;

interface

uses
  SysUtils, Classes, MemDS, DBAccess, MyAccess, Data.DB;

type
  TdmDB = class(TDataModule)
    zenDB: TMyConnection;
    qryTherapist: TMyQuery;
    dsQryTherapist: TDataSource;
    qrySearch: TMyQuery;
    qryFind: TMyQuery;
    qryCari: TMyQuery;
    transMaster: TMyQuery;
    dsTransMaster: TDataSource;
    transDetail: TMyQuery;
    dsTransDetail: TDataSource;
    MenuTrans: TMyQuery;
    dsMenuTrans: TDataSource;
    qryRoom: TMyQuery;
    dsQryRoom: TDataSource;
    dsTblAroma: TDataSource;
    QRYCOUNTER1: TMyQuery;
    QRYCOUNTER2: TMyQuery;
    qryBarang: TMyQuery;
    dsQryBarang: TDataSource;
    dsTblAdditional: TDataSource;
    qryTemp: TMyQuery;
    dsTblPayment: TDataSource;
    PrintMaster: TMyQuery;
    dsPrintMaster: TDataSource;
    PrintDetail: TMyQuery;
    dsPrintDetail: TDataSource;
    QRYCOUNTER3: TMyQuery;
    PrintRedeem: TMyQuery;
    dsPrintRedeem: TDataSource;
    dsTblTherapist: TDataSource;
    dsTblRuangan: TDataSource;
    dsTblStockKasir: TDataSource;
    dsTblMembers: TDataSource;
    dsTblMembersTypeNone: TDataSource;
    qryPrintSO: TMyQuery;
    dsQryPrintSO: TDataSource;
    TransPayment: TMyQuery;
    dsTransPayment: TDataSource;
    qryPaket: TMyQuery;
    dsQryPaket: TDataSource;
    qryGC: TMyQuery;
    dsQryGC: TDataSource;
    qryGCDetail: TMyQuery;
    dsQryGCDetail: TDataSource;
    dstblProduk: TDataSource;
    dstblJenis: TDataSource;
    qryBooking: TMyQuery;
    dsqryBooking: TDataSource;
    qryFoot: TMyQuery;
    dsqryFoot: TDataSource;
    dsTblDriver: TDataSource;
    qryTransDrivers: TMyQuery;
    dsQryTransDrivers: TDataSource;
    tblTherapist: TMyTable;
    tblStockkasir: TMyTable;
    tblMembers: TMyTable;
    TblMembersTypeNone: TMyTable;
    tblDriver: TMyTable;
    tblRuangan: TMyTable;
    tblJenis: TMyTable;
    tblProduuct: TMyTable;
    tblAdditional: TMyTable;
    tblAroma: TMyTable;
    qryUpdate: TMyQuery;
    QRYCOUNTEREXEC: TMyQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDB: TdmDB;

implementation

{$R *.dfm}

end.
