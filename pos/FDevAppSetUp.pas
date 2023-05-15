unit FDevAppSetUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, INIFiles;

type
  TfrmDevAppSetUp = class(TForm)
    Label1: TLabel;
    rgParity: TRadioGroup;
    rgDataBits: TRadioGroup;
    rgStopBits: TRadioGroup;
    rgSpeed: TRadioGroup;
    cbPortCOM: TComboBox;
    Label2: TLabel;
    Bevel1: TBevel;
    btnOK: TButton;
    btnCancel: TButton;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExtComName(ComNr: DWORD): string;
    function CheckCom(AComNumber: Integer): Integer;
    procedure ChangeConnectionSettings;
  end;

var
  frmDevAppSetUp: TfrmDevAppSetUp;

implementation

uses FMain;

{$R *.dfm}

function TfrmDevAppSetUp.ExtComName(ComNr: DWORD): string;
begin
     if (ComNr > 9) then
        Result := Format('\\\\.\\COM%d', [ComNr])
     else
         Result := Format('COM%d', [ComNr]);
end;

function TfrmDevAppSetUp.CheckCom(AComNumber: Integer): Integer;
var
   FHandle: THandle;
begin
     Result := 0;
     FHandle := CreateFile(PChar(ExtComName(AComNumber)),
                           GENERIC_READ or GENERIC_WRITE,
                           0, {exclusive access}
                           nil, {no security attrs}
                           OPEN_EXISTING,
                           FILE_ATTRIBUTE_NORMAL,
                           0);

     if (FHandle <> INVALID_HANDLE_VALUE) then
        CloseHandle(FHandle)
     else
         Result := GetLastError;
end;

procedure TfrmDevAppSetUp.ChangeConnectionSettings;
var
   comNum : integer;
begin
     comNum := 0;
     if (Length(cbPortCOM.Text) = 4) or (Length(cbPortCOM.Text) = 5) then
        begin
             try
                comNum := strtoint(Copy(cbPortCOM.Text, length(cbPortCOM.Text),1));
             except
                   on EConvertError do
                      begin
                           raise Exception.Create('System was not recognize your serial COM number, failed !.');
                           exit;
                      end;
             end;
        end
     else if (Length(cbPortCOM.Text) < 4) or (Length(cbPortCOM.Text) > 5) then
             begin
                  comNum := 1;
                  MessageDlg('System was not recognize your serial COM port.',
                  mtWarning, [mbOK], 0);
             end;

     {case comNum of
          1 : begin
                   frmMain.BarcodeReader.Port := psCom1;
                   btnOK.Enabled := true;
              end;
          2 : begin
                   frmMain.BarcodeReader.Port := psCom2;
                   btnOK.Enabled := true;
              end;
          3 : begin
                   frmMain.BarcodeReader.Port := psCom3;
                   btnOK.Enabled := true;
              end;
          4 : begin
                   frmMain.BarcodeReader.Port := psCom4;
                   btnOK.Enabled := true;
              end;
          5 : begin
                   frmMain.BarcodeReader.Port := psCom5;
                   btnOK.Enabled := true;
              end;
          6 : begin
                   frmMain.BarcodeReader.Port := psCom6;
                   btnOK.Enabled := true;
              end;
          7 : begin
                   frmMain.BarcodeReader.Port := psCom7;
                   btnOK.Enabled := true;
              end;
          8 : begin
                   frmMain.BarcodeReader.Port := psCom8;
                   btnOK.Enabled := true;
              end;
          else
              btnOK.Enabled := false;
     end;}

     {case rgParity.ItemIndex of
          0 : frmMain.BarcodeReader.Parity := parityNone;
          1 : frmMain.BarcodeReader.Parity := parityOdd;
          2 : frmMain.BarcodeReader.Parity := paritySpace;
          3 : frmMain.BarcodeReader.Parity := parityEven;
          4 : frmMain.BarcodeReader.Parity := parityMark;
     end;}

     {case rgDataBits.ItemIndex of
          0 : frmMain.BarcodeReader.DataBits := db7Bits;
          1 : frmMain.BarcodeReader.DataBits := db8Bits;
     end;}

     {case rgStopBits.ItemIndex of
          0 : frmMain.BarcodeReader.StopBits := sbStop1;
          1 : frmMain.BarcodeReader.StopBits := sbStop15;
          2 : frmMain.BarcodeReader.StopBits := sbStop2;
     end; }

     {case rgSpeed.ItemIndex of
           0 : frmMain.BarcodeReader.BitRate := br300;
           1 : frmMain.BarcodeReader.BitRate := br600;
           2 : frmMain.BarcodeReader.BitRate := br1200;
           3 : frmMain.BarcodeReader.BitRate := br2400;
           4 : frmMain.BarcodeReader.BitRate := br4800;
           5 : frmMain.BarcodeReader.BitRate := br9600;
           6 : frmMain.BarcodeReader.BitRate := br14400;
           7 : frmMain.BarcodeReader.BitRate := br19200;
           8 : frmMain.BarcodeReader.BitRate := br38400;
           9 : frmMain.BarcodeReader.BitRate := br57600;
          10 : frmMain.BarcodeReader.BitRate := br115200;
     end;}

     with frmMain do
          begin
               INIConfig := TIniFile.Create(appDir + 'config.ini');
               cfgParity := inttostr(rgParity.ItemIndex);
               cfgDataBits := inttostr(rgDataBits.ItemIndex);
               cfgStopBits := inttostr(rgStopBits.ItemIndex);
               cfgSpeed := inttostr(rgSpeed.ItemIndex);
               cfgPort := 'COM' + inttostr(comNum);
               INIConfig.WriteString('SetUp','Parity',cfgParity);
               INIConfig.WriteString('SetUp','DataBits',cfgDataBits);
               INIConfig.WriteString('SetUp','StopBits',cfgStopBits);
               INIConfig.WriteString('SetUp','Speed',cfgSpeed);
               INIConfig.WriteString('SetUp','Port',cfgPort);
               INIConfig.Free;
          end;
end;

procedure TfrmDevAppSetUp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmDevAppSetUp.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmDevAppSetUp.btnOKClick(Sender: TObject);
begin
     if (MessageDlg('This will cause stopping the device system service.'#13+
                    'You will need to restart the application to check the device connection.'#13#13 +
                    'Continue process ?', mtConfirmation, mbOKCancel, 0) = mrOK) then
        begin
             //frmMain.BarcodeReader.Active := false;
             ChangeConnectionSettings;
        end;

     Close;
end;

procedure TfrmDevAppSetUp.FormCreate(Sender: TObject);
var
   i, Err: Integer;
begin
     cbPortCOM.Clear;
     for i := 1 to 8 do
         begin
              Err := CheckCom(i);
              if (Err = 0) or (Err = ERROR_ACCESS_DENIED) then
                 {the Port exists, if  Err = ERROR_ACCESS_DENIED then the port is already open}
                 cbPortCOM.Items.Add('COM'+inttostr(i))
              else if (Err = ERROR_FILE_NOT_FOUND) then
                      cbPortCOM.Tag := i {the Port does not exists}
              else
                  cbPortCOM.Items.Add('COM'+inttostr(i)); {another Error}
         end;

     with frmMain do
          begin
               if (not FileExists(appDir + 'config.ini')) then
                  begin
                       INIConfig := TIniFile.Create(appDir + 'config.ini');
                       cfgParity := '0';
                       cfgDataBits := '1';
                       cfgStopBits := '0';
                       cfgSpeed := '2';
                       cfgPort := 'COM4';

                       INIConfig.WriteString('SetUp','Parity',cfgParity);
                       INIConfig.WriteString('SetUp','DataBits',cfgDataBits);
                       INIConfig.WriteString('SetUp','StopBits',cfgStopBits);
                       INIConfig.WriteString('SetUp','Speed',cfgSpeed);
                       INIConfig.WriteString('SetUp','Port',cfgPort);

                       rgParity.ItemIndex := strtoint(cfgParity);
                       rgDataBits.ItemIndex := strtoint(cfgDataBits);
                       rgStopBits.ItemIndex := strtoint(cfgStopBits);
                       rgSpeed.ItemIndex := strtoint(cfgSpeed);
                       cbPortCOM.ItemIndex := cbPortCOM.Items.IndexOf(cfgPort);

                       ChangeConnectionSettings;
                  end
               else
                   begin
                        INIConfig := TIniFile.Create(appDir + 'config.ini');
                        cfgParity := INIConfig.ReadString('SetUp', 'Parity', '0');
                        cfgDataBits := INIConfig.ReadString('SetUp', 'DataBits', '1');
                        cfgStopBits := INIConfig.ReadString('SetUp', 'StopBits', '0');
                        cfgSpeed := INIConfig.ReadString('SetUp', 'Speed', '2');
                        cfgPort := INIConfig.ReadString('SetUp', 'Port', 'COM4');

                        rgParity.ItemIndex := strtoint(cfgParity);
                        rgDataBits.ItemIndex := strtoint(cfgDataBits);
                        rgStopBits.ItemIndex := strtoint(cfgStopBits);
                        rgSpeed.ItemIndex := strtoint(cfgSpeed);
                        cbPortCOM.ItemIndex := cbPortCOM.Items.IndexOf(cfgPort);

                        ChangeConnectionSettings;
                   end;
          end;
end;

end.
