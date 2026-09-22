unit FChangeJadwal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGraphics, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Menus, cxLookAndFeelPainters,
  cxButtons, cxSpinEdit, cxTimeEdit, cxLookAndFeels, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, MyAccess;

type
  TfrmChangeJadwal = class(TForm)
    edSelectDate: TcxDateEdit;
    Label1: TLabel;
    edJamMasuk: TcxTimeEdit;
    edJamKeluar: TcxTimeEdit;
    Label4: TLabel;
    cxButton1: TcxButton;
    Label5: TLabel;
    edTanggalMasuk: TcxDateEdit;
    edTanggalKeluar: TcxDateEdit;
    Label6: TLabel;
    Label7: TLabel;
    btnChange: TcxButton;
    Label13: TLabel;
    edQuickSearch: TcxTextEdit;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edKode: TEdit;
    edID: TEdit;
    edNama: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edQuickSearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qrySearch, qryExec, qryCari : TMyQuery;
  public
    { Public declarations }
  end;

var
  frmChangeJadwal: TfrmChangeJadwal;

implementation

uses FDMdb, DB;

{$R *.dfm}

procedure TfrmChangeJadwal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //
    qrySearch.Free;
    qryExec.Free;
    Action := caFree;
end;

procedure TfrmChangeJadwal.FormCreate(Sender: TObject);
begin
    qrySearch := TMyQuery.Create(Self);
    qrySearch.Connection := DMDB.dbInternal;
    qrySearch.SQL.Add('select * from temptable');
    qrySearch.Active := true;

    qryCari := TMyQuery.Create(Self);
    qryCari.Connection := DMDB.dbInternal;
    qryCari.SQL.Add('select * from temptable');
    qryCari.Active := true;

    qryExec := TMyQuery.Create(Self);
    qryExec.Connection := DMDB.dbInternal;
    qryExec.SQL.Add('select * from temptable');
    qryExec.Active := true;



     edSelectDate.Date := Date;
     
end;

procedure TfrmChangeJadwal.cxButton1Click(Sender: TObject);
var
   id_karyawan : String;
begin
     id_karyawan := edID.Text;
     qryCari.Close;
      qryCari.SQL.Clear;
      qryCari.SQL.Add('select kodeshift, tglmasuk, jmasuk, tglkeluar, jkeluar ' +
          'from ben_hrd_jadwal_local where kodekaryawan = ''' + edKode.Text + ''' ' +
          'and tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', edSelectDate.Date) + '''');
      qryCari.Open;
      if (qryCari.IsEmpty) then
        begin
             ShowMessage('Data karyawan ' + id_karyawan + #13 +
                          'TIdak Ada Mohon cek kembali Tanggal dan ID ');
              btnChange.Enabled := False;
        end
      else if (not qryCari.IsEmpty) then
        begin
            edTanggalMasuk.Date := qryCari.Fields[1].AsDateTime;
            edJamMasuk.Time := qryCari.Fields[2].AsDateTime;
            edTanggalKeluar.Date := qryCari.Fields[3].AsDateTime;
            edJamKeluar.Time := qryCari.Fields[4].AsDateTime;
            btnChange.Enabled := True;
        end;

//     --
//     qrySearch.Close;
//     qrySearch.SQL.Clear;
//     qrySearch.SQL.Add('select * from jadwal where id_karyawan = ''' +
//                       id_karyawan + ''' and tgl_masuk = ''' +
//                       FormatDateTime('yyyy-MM-dd', edSelectDate.Date) + '''');
//     qrySearch.Open;
//     if (qryCari.IsEmpty) then
//         begin
//              ShowMessage('Data karyawan ' + id_karyawan + #13 +
//                          'TIdak Ada Mohon cek kembali Tanggal dan ID ');
//              btnChange.Enabled := False;
//         end
//     else if (not qryCari.IsEmpty) then
//         begin
//              edTanggalMasuk.Date := qryCari.Fields[5].AsDateTime;
//              edJamMasuk.Time := qryCari.Fields[6].AsDateTime;
//              edTanggalKeluar.Date := qryCari.Fields[7].AsDateTime;
//              edJamKeluar.Time := qryCari.Fields[8].AsDateTime;
//              edNama.Text := qryCari.Fields[2].AsString;
////              lblAutonum.Caption := qrySearch.Fields[0].AsString;
//              btnChange.Enabled := True;
//         end;

end;

procedure TfrmChangeJadwal.edQuickSearchKeyPress(Sender: TObject;
  var Key: Char);
var
  strSearch : String;
begin
     if (key = #13) then
        begin
          case Length(edQuickSearch.Text) of
           1 : strSearch := '0000' + edQuickSearch.Text;
           2 : strSearch := '000' + edQuickSearch.Text;
           3 : strSearch := '00' + edQuickSearch.Text;
           4 : strSearch := '0' + edQuickSearch.Text;
           5 : strSearch := edQuickSearch.Text;
          end;
         qrySearch.Close;
         qrySearch.SQL.Clear;
         qrySearch.SQL.Add('select kodekaryawan, idkaryawan, namakaryawan, departemen ' +
           'from ben_hrd_karyawan_info where idkaryawan = ' + QuotedStr(strSearch) +
           ' and active = ''' + 'Y' + '''');
         qrySearch.Open;
         if (qrySearch.IsEmpty) then
           begin
             ShowMessage('ID Finger Tidak Ditemukan !');
             Exit;
           end;
         edKode.Text := qrySearch.Fields[0].AsString;
         edID.Text := qrySearch.Fields[1].AsString;
         edNama.Text := qrySearch.Fields[2].AsString;
         //ed := qryChange1.Fields[3].AsString;
         //CariJadwal;
         edQuickSearch.Clear;
         edSelectDate.SetFocus;
     end;
end;

procedure TfrmChangeJadwal.btnChangeClick(Sender: TObject);
begin

     qryExec.Sql.Clear;
     qryExec.SQL.Add('update ben_hrd_jadwal_local set ' +
               'jmasuk = ''' + FormatDateTime('hh:mm:ss', edJamMasuk.Time) + ''',' +
               'tglkeluar = ''' + FormatDateTime('yyyy-MM-dd', edTanggalKeluar.Date) + ''',' +
               'jkeluar = ''' + FormatDateTime('hh:mm:ss', edJamKeluar.Time) + ''' ' +
               'where kodekaryawan = ''' + edKode.Text + ''' ' +
               'AND tglmasuk = ''' + FormatDateTime('yyyy-MM-dd', edTanggalMasuk.Date) + ''';');
     qryExec.ExecSql;
     ShowMessage('Jadwal Berhasil di Update!');
     btnChange.Enabled := False;
     edSelectDate.Date := Date;
     edTanggalKeluar.Date := Date;
     edTanggalMasuk.Date := Date;
     edJamMasuk.Time := Time;
     edJamKeluar.Time := Time;
     edQuickSearch.Clear;
     edKode.Clear;
     edID.Clear;
     edNama.Clear;
     edQuickSearch.SetFocus;


end;

end.
