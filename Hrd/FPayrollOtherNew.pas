unit FPayrollOtherNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBAccess, strUtils, MyAccess;

type
  TfrmPayrollOtherNew = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    edBulanNew: TComboBox;
    Label4: TLabel;
    edTahunNew: TComboBox;
    edKeterangan: TEdit;
    Label2: TLabel;
    Button1: TButton;
    edPeriodeNew: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    qryNew1 : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmPayrollOtherNew: TfrmPayrollOtherNew;

implementation

{$R *.dfm}

uses FDMDB, FMenuMain, FPayrollOther;

procedure TfrmPayrollOtherNew.Button1Click(Sender: TObject);
var
  intTahun, intLastID : Integer;
  strPeriode, strBulan, strKode, strLastID : String;
begin
  case edBulanNew.ItemIndex of
    0 : strBulan := '01';
    1 : strBulan := '02';
    2 : strBulan := '03';
    3 : strBulan := '04';
    4 : strBulan := '05';
    5 : strBulan := '06';
    6 : strBulan := '07';
    7 : strBulan := '08';
    8 : strBulan := '09';
    9 : strBulan := '10';
    10 : strBulan := '11';
    11 : strBulan := '12';
  end;
  intTahun := StrToInt(RightStr(edTahunNew.Text, 2));
  strPeriode := 'OP.' + frmMenuMain.IDOUTLET + '.' + IntToStr(intTahun) + strBulan + '01';
  strKode := 'OP.' + frmMenuMain.IDOUTLET + '.' + IntToStr(intTahun) + strBulan + '%';
  qryNew1.Close;
  qryNew1.SQL.Clear;
  qryNew1.SQL.Add('select kodepayroll, bulan, tahun from ben_payroll_other ' +
      'where kodepayroll like ''' + strKode + ''' ORDER BY kodepayroll ASC');
  qryNew1.Open;
  if (qryNew1.IsEmpty) then
    begin
       edPeriodeNew.Text := strPeriode;
       frmPayrollOther.edTahun.Text := edTahunNew.Text;
       frmPayrollOther.edBulan.Text := edBulanNew.Text;
       frmPayrollOther.edKeterangan.Text := edKeterangan.Text;
       frmPayrollOther.edPeriode.Items.Add(strPeriode);
       frmPayrollOther.edPeriode.Text := strPeriode;
       frmPayrollOther.btnLoad.Click;
       frmPayrollOtherNew.Close;
    end
  else if (NOT qryNew1.IsEmpty) then
    begin
      if (MessageDlg('Data Payroll Sudah Ada, ' + #13 +
          'Apakah Akan Membuat Data Baru ?', mtConfirmation, mbOKCancel,0) = mrOk) then
         begin
           qryNew1.Last;
           intLastID := StrToInt(RightStr(qryNew1.Fields[0].AsString, 2));
           intLastID := intLastID + 1;
           case Length(IntToStr(intLastID)) of
             1 : strLastID := '0' + IntToStr(intLastID);
             2 : strLastID := IntToStr(intLastID);
           end;
           strPeriode := 'OP.' + frmMenuMain.IDOUTLET + '.' + IntToStr(intTahun) + strBulan + strLastID;
           frmPayrollOther.edTahun.Text := edTahunNew.Text;
           frmPayrollOther.edBulan.Text := edBulanNew.Text;
           frmPayrollOther.edPeriode.Items.Add(strPeriode);
           frmPayrollOther.edPeriode.Text := strPeriode;
           frmPayrollOther.edKeterangan.Text := edKeterangan.Text;
           frmPayrollOther.btnLoad.Click;
           Application.ProcessMessages;
           frmPayrollOtherNew.Close;
         end;
      frmPayrollOtherNew.Close;
    end;
end;

procedure TfrmPayrollOtherNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryNew1.Free;
   Action := caFree;
end;

procedure TfrmPayrollOtherNew.FormCreate(Sender: TObject);
begin
  qryNew1 := TMyQuery.Create(Self);
   qryNew1.Connection := DMDB.StoreDB;
   qryNew1.SQL.Add('select * from temptable');
   qryNew1.Active := true;
end;

end.
