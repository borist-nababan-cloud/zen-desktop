unit FBooking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxSpinEdit, cxTimeEdit,
  cxCalc, cxMemo, Menus, cxLookAndFeelPainters, cxButtons, AppEvnts;

type
  TfrmBooking = class(TForm)
    Label18: TLabel;
    Panel1: TPanel;
    Label15: TLabel;
    edTrans: TcxTextEdit;
    Label2: TLabel;
    edTgl: TcxDateEdit;
    Label4: TLabel;
    edNama: TcxTextEdit;
    edWaktu: TcxTimeEdit;
    Label1: TLabel;
    Label3: TLabel;
    edTelp: TcxTextEdit;
    edJumlah: TcxCalcEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edNotes: TcxMemo;
    Panel2: TPanel;
    btnNewB: TcxButton;
    btnSaveB: TcxButton;
    btnViewB: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnNewBClick(Sender: TObject);
    procedure btnSaveBClick(Sender: TObject);
    procedure btnViewBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    V_ID,V_Session,V_Periode, V_Number : String;
    function CreateNewAutoNum : String;
    procedure ClearForm();
  end;

var
  frmBooking: TfrmBooking;

implementation

uses FDMDB, FBrowseBooking;

{$R *.dfm}

function TfrmBooking.CreateNewAutoNum: string;
var
   lastID, strTmpNum, strNum, NewID : string;
   intTmpNum, intNum : integer;
begin
     with dmDB do
          begin
               
               NewID := V_Session + '.' + V_Periode + '.';
               Sleep(100);
               qrySearch.Close;
               qrySearch.SQL.Clear;
               qrySearch.SQL.Add('SELECT id_booking FROM booking ' +
                               'WHERE id_booking LIKE ''' + NewID + '%'' ORDER BY id_booking ASC');
               qrySearch.Open;

               if (qrySearch.IsEmpty) then
                  begin
                       Result := V_Session + '.' + V_Periode + '.' + '001';
                       exit;
                  end;

               qrySearch.Last;

               lastID    := qrySearch.Fields[0].AsString;
               strTmpNum := Copy(lastID, length(lastID)-2, 3);
               intTmpNum := strtoint(strTmpNum);
               intNum    := intTmpNum + 1;

               case length(inttostr(intNum)) of
                    //1 : strNum := '0000' + inttostr(intNum);
                    //2 : strNum := '000' + inttostr(intNum);
                    1 : strNum := '00' + inttostr(intNum);
                    2 : strNum := '0' + inttostr(intNum);
                    3 : strNum := inttostr(intNum);
               end;

               V_Number := strNum;
               V_ID := V_Session + '.' + V_Periode + '.' + V_Number;
               Result := V_ID;
          end;
end;

procedure TfrmBooking.ClearForm();
begin
    edTrans.Clear;
    edTgl.EditValue:= Date;
    edWaktu.Clear;
    edNama.Clear;
    edJumlah.EditValue:=0;
    edNotes.Clear;
    edTelp.Clear;
end;

procedure TfrmBooking.FormCreate(Sender: TObject);
begin
    edTgl.EditValue := Date;
    V_Session := 'TB';
    V_Periode := FormatDateTime('ddmmYY', Date);

end;

procedure TfrmBooking.btnNewBClick(Sender: TObject);
var
  pesan : String;
begin
    with dmDB do
      begin
          if(btnNewB.Tag = 0) then
             begin
                ClearForm;
                V_ID := CreateNewAutoNum;
                edTrans.Text := V_ID;
                qryUpdate.Sql.Clear;
                qryUpdate.Sql.Add('INSERT INTO booking VALUES( ' +
                                  '''' + edTrans.Text+ ''' , ' +
                                  '''' + FormatDateTime('YYYY-mm-dd', Date) + ''' , ' +
                                  '''' + FormatDateTime('YYYY-mm-dd', edTgl.EditValue) + ''' , ' +
                                  '''' + FormatDateTime('HH:MM:ss', edWaktu.EditValue) + ''' , ' +
                                  '''' + 'NONE' + ''' , ' +
                                  '''' + '0' + ''' , ' +
                                  '''' + '0' + ''' , ' +
                                  '''' + 'NONE' + ''')');
                qryUpdate.ExecSql;
                btnNewB.Caption:= 'Cancel';
                btnNewB.Tag:= 1;
             end
          else
             begin
                pesan:='Booking akan dibatalkan?';
                if (Messagedlg(Pesan,mtConfirmation,[mbYes,mbNo],0)=mrYes) then
                        begin
                            qryUpdate.Sql.Clear;
                            qryUpdate.Sql.Add('DELETE FROM booking ' +
                                              'WHERE id_booking = ''' + edTrans.Text + '''');
                            qryUpdate.ExecSql;
                            Sleep(10);
                            ClearForm;
                            btnNewB.Tag:=0;
                            btnNewB.Caption:= 'New';
                        end;
             end;
      end;
end;

procedure TfrmBooking.btnSaveBClick(Sender: TObject);
begin
   with dmDB do
     begin
        Screen.Cursor:= crHourGlass;
        qryCari.Close;
        qryCari.SQL.Clear;
        qryCari.SQL.Add('SELECT id_booking from booking ' +
                        'WHERE id_booking = ''' + edTrans.Text + '''');
        qryCari.Open;
        if(qryCari.IsEmpty) then
          begin
                qryUpdate.Sql.Clear;
                qryUpdate.Sql.Add('INSERT INTO booking VALUES( ' +
                                  '''' + edTrans.Text+ ''' , ' +
                                  '''' + FormatDateTime('YYYY-mm-dd', Date) + ''' , ' +
                                  '''' + FormatDateTime('YYYY-mm-dd', edTgl.EditValue) + ''' , ' +
                                  '''' + FormatDateTime('HH:MM:ss', edWaktu.EditValue) + ''' , ' +
                                  '''' + edNama.Text + ''' , ' +
                                  '''' + edTelp.Text + ''' , ' +
                                  '''' + VarToStr(edJumlah.EditValue) + ''' , ' +
                                  '''' + edNotes.Text + ''')');
                qryUpdate.ExecSql;
          end
        else
          begin
                qryUpdate.Sql.Clear;
                qryUpdate.Sql.Add('UPDATE booking SET ' +
                                  'tgl_booking = ''' + FormatDateTime('YYYY-mm-dd', edTgl.EditValue) + ''' , ' +
                                  'jam_booking = ''' + FormatDateTime('HH:MM:ss', edWaktu.EditValue) + ''' , ' +
                                  'nama = ''' + edNama.Text + ''' , ' +
                                  'no_telp = ''' + edTelp.Text + ''' , ' +
                                  'jumlah = ''' + VarToStr(edJumlah.EditValue) + ''' , ' +
                                  'notes = ''' + edNotes.Text + ''' ' +
                                  'WHERE id_booking = ''' + edTrans.Text + '''');
                qryUpdate.ExecSql;
          end;
        
     end;
     btnNewB.Caption := 'New';
     btnNewB.Tag := 0;
     ShowMessage('Data Tersimpan.');
     Screen.Cursor:= crDefault;

end;

procedure TfrmBooking.btnViewBClick(Sender: TObject);
begin
    with dmDB do
        begin
                Application.CreateForm(TfrmBrowseBooking, frmBrowseBooking);
                qryBooking.Close;
                qryBooking.SQL.Clear;
                qryBooking.SQL.Add('SELECT * FROM booking ORDER by tgl_booking DESC');
                qryBooking.Open;
                frmBrowseBooking.ShowModal;
        end;
end;

end.
