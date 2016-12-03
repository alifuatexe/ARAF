unit UnitAnaMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue, dxSkinsdxNavBarPainter,
  dxSkinsdxNavBarAccordionViewPainter, dxNavBarCollns, cxClasses, dxNavBarBase,
  dxNavBar , cxGraphics,ADODB,IniFiles, Data.DB, IdCoder, IdCoder3to4,
  IdCoderMIME, IdBaseComponent, cxPC, dxSkinscxPCPainter, dxBarBuiltInMenu,
  dxTabbedMDI, cxPropertiesStore, Vcl.ComCtrls, ElastFrm;


type
  TFormAnaMenu = class(TForm)
    dxNavBar1: TdxNavBar;
    dxNavBarGroupSabitTanimlamalar: TdxNavBarGroup;
    dxNavBar1GroupHareketler: TdxNavBarGroup;
    dxNavBarUrunTanimlama: TdxNavBarItem;
    dxNavBarUrunGirisi: TdxNavBarItem;
    dxNavBarUrunCikisi: TdxNavBarItem;
    ADOConnectionMain: TADOConnection;
    IdEncoderMIME1: TIdEncoderMIME;
    IdDecoderMIME1: TIdDecoderMIME;
    dxNavBarUrunTipTanimlama: TdxNavBarItem;
    dxNavBarBirimTanimlama: TdxNavBarItem;
    dxNavBar1ItemUsersTanimla: TdxNavBarItem;
    dxNavBar1ItemReceteTanimlama: TdxNavBarItem;
    dxNavBar1ItemKullaniciGrubuTanimlama: TdxNavBarItem;
    cxPropertiesStore1: TcxPropertiesStore;
    dxTabbedMDIManager1: TdxTabbedMDIManager;
    dxNavBar1ItemOperasyonTanimlama: TdxNavBarItem;
    dxNavBar1ItemIsmerkeziTanimlama: TdxNavBarItem;
    dxNavBar1ItemIsmerkeziGrubuTanimlama: TdxNavBarItem;
    dxNavBar1GroupStok: TdxNavBarGroup;
    dxNavBar1ItemStokOperasyonIliskilendirme: TdxNavBarItem;
    dxNavBar1ItemIsemriOlusturma: TdxNavBarItem;
    dxNavBar1GroupPlanlama: TdxNavBarGroup;
    ElasticForm1: TElasticForm;
    dxNavBar1GroupUretimKaydi: TdxNavBarGroup;
    dxNavBar1ItemUretimKaydi: TdxNavBarItem;
    procedure dxNavBarUrunTanimlamaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxNavBarUrunGirisiClick(Sender: TObject);
    procedure dxNavBar1ItemUsersTanimlaClick(Sender: TObject);
    procedure dxNavBar1ItemReceteTanimlamaClick(Sender: TObject);
    procedure dxNavBar1ItemKullaniciGrubuTanimlamaClick(Sender: TObject);
    procedure dxNavBar1ItemOperasyonTanimlamaClick(Sender: TObject);
    procedure dxNavBar1ItemIsmerkeziTanimlamaClick(Sender: TObject);
    procedure dxNavBar1ItemIsmerkeziGrubuTanimlamaClick(Sender: TObject);
    procedure dxNavBar1ItemStokOperasyonIliskilendirmeClick(Sender: TObject);
    procedure dxNavBar1ItemIsemriOlusturmaClick(Sender: TObject);
    procedure dxNavBar1ItemUretimKaydiClick(Sender: TObject);
  private
    procedure OnItemClick(Sender: TObject);
    procedure ReadConnectionIniFile();
    Function ConnectDB(): Boolean;
    procedure Login;
    { Private declarations }
  public
   Path,GridDizaynPath:string;
    { Public declarations }

  end;
Function OpenQueryOnDataSet(QSQL: WideString;xAdoQuery: TADOQuery): Boolean;
Function ExecSQLString(QSQL: WideString): Boolean;

var
  APP_SERVERNAME: string;
  APP_DBNAME: string;
  APP_USERNAME: string;
  APP_PASSWORD: string;
  APP_PATH : string;
var
  FormAnaMenu: TFormAnaMenu;

implementation

{$R *.dfm}
uses UnitUrunTanimlama,UnitUrunCikis,UnitReceteTanimlama,
UnitKullaniciTanimlama,UnitUrunGiris,unitLogin,
UnitConnectionSettings,UnitBirimTanimlama,UnitUrunTipTanimlama,UniKullaniciGrupTanimlama,
UnitOperasyonTanimlama,UnitIsmerkeziTanimlama,UnitIsmerkeziGrubuTanimlama,UnitStokOperasyon,GunSonu,UnitIsEmriOlusturma;



function FindForm(const FormName: String): TForm;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[i].Name = FormName then
    begin
      Result := Screen.Forms[i];
    end;
  end;
end;

procedure CreateFormFromName(const FormName: string; ImageIndex: Integer = 0; FormCaption: string = '');
var
  fc: TFormClass;
  f: TForm;
  i: integer;
  Love:Ttabsheet;
begin

  fc := TFormClass(FindClass(FormName));
  f := FindForm(Copy(FormName, 2, Length(FormName) - 1));
  if f = nil then
  begin
    f := fc.Create(nil); // Application
   // f.Parent:=Love;
    f.Tag := ImageIndex;
    f.Show;
  end
  else
    f.Show;

end;
procedure TFormAnaMenu.dxNavBar1ItemIsemriOlusturmaClick(Sender: TObject);
begin
  OnItemClick(sender);
end;

procedure TFormAnaMenu.dxNavBar1ItemIsmerkeziGrubuTanimlamaClick(
  Sender: TObject);
begin
  OnItemClick(sender);
end;

procedure TFormAnaMenu.dxNavBar1ItemIsmerkeziTanimlamaClick(Sender: TObject);
begin
  OnItemClick(sender);
end;

procedure TFormAnaMenu.dxNavBar1ItemKullaniciGrubuTanimlamaClick(
  Sender: TObject);
begin
 OnItemClick(sender);
end;

procedure TFormAnaMenu.dxNavBar1ItemOperasyonTanimlamaClick(Sender: TObject);
begin
 OnItemClick(sender);
end;

procedure TFormAnaMenu.dxNavBar1ItemReceteTanimlamaClick(Sender: TObject);
begin
 OnItemClick(sender);
end;

procedure TFormAnaMenu.dxNavBar1ItemStokOperasyonIliskilendirmeClick(
  Sender: TObject);
begin
  OnItemClick(sender);
end;

procedure TFormAnaMenu.dxNavBar1ItemUretimKaydiClick(Sender: TObject);
begin
  OnItemClick(sender);
end;

procedure TFormAnaMenu.dxNavBar1ItemUsersTanimlaClick(Sender: TObject);
begin
  OnItemClick(sender);
end;

procedure TFormAnaMenu.dxNavBarUrunGirisiClick(Sender: TObject);
begin
OnItemClick(sender);
end;

procedure TFormAnaMenu.dxNavBarUrunTanimlamaClick(Sender: TObject);
begin
  OnItemClick(sender);
end;


procedure TFormAnaMenu.FormCreate(Sender: TObject);
var
  xConnectionIni: TIniFile;
  xConnectionForm: TFormConnectionSettings;
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'Connection.ini')
    then
  begin
    ShowMessage('Bağlantı ayarları yapılmalıdır.');
    xConnectionForm := TFormConnectionSettings.Create(Self);
    xConnectionForm.ShowModal;
    if xConnectionForm.ModalResult <> mrOk then
      Application.Terminate;
  end;

  try
    while not ConnectDB do
    begin
      xConnectionForm := TFormConnectionSettings.Create(Self);

      xConnectionForm.ShowModal;
      if xConnectionForm.ModalResult <> mrOk then
      begin
        Application.Terminate;
        Exit;
      end;
      xConnectionForm.Free;
    end;
  finally
//  Login;
//  if Application.tag=0 then
//   Application.Terminate;


  end;
  APP_PATH := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName));

  GridDizaynPath:= ExtractFilepath(Application.ExeName)+'GridDizaynları\';

RegisterClass(TFormUrunTanimlama);
RegisterClass(TFormUrunGiris);
RegisterClass(TFormUnitBirimTanimlama);
RegisterClass(TFormUnitUrunTipTanimlama);
RegisterClass(TFormUnitUrunCikis);
RegisterClass(TFormUnitKullaniciTanimlama);
RegisterClass(TFormUnitReceteTanimlama);
RegisterClass(TFormUniKullaniciGrupTanimlama);
RegisterClass(TFormUnitOperasyonTanimlama);
RegisterClass(TFormUnitIsmerkeziTanimlama);
RegisterClass(TFormUnitIsmerkeziGrubuTanimlama);
RegisterClass(TFormUnitStokOperasyon);
RegisterClass(TFormUnitIsEmriOlusturma);
RegisterClass(TfmGunSonu);
end;
procedure TFormAnaMenu.Login;
var
xFormLogin: TFormLogin;
begin
      xFormLogin := TFormLogin.Create(Self);
      xFormLogin.ShowModal;
      if xFormLogin.ModalResult <> mrOk then
      begin
        Application.Terminate;
        Exit;
      end
      else
      begin
        Application.tag :=xFormLogin.kullaniciID;
      end;
      xFormLogin.Free;
end;
procedure TFormAnaMenu.OnItemClick(Sender: TObject);
var
  FormName: string;
begin

  FormName := Trim((Sender as TdxNavBarItem).Hint);
  CreateFormFromName(Trim((Sender as TdxNavBarItem).Hint), (Sender as TdxNavBarItem).Tag, (Sender as TdxNavBarItem).Caption);
 // navBarMenu.Invalidate;
end;
function TFormAnaMenu.ConnectDB: Boolean;
begin
  ReadConnectionIniFile;
  try
    AdoConnectionMain.Connected := False;
    AdoConnectionMain.ConnectionString :=
      'Provider=SQLOLEDB.1;Password=' + APP_PASSWORD +
      ';Persist Security Info=True;User ID=' + APP_USERNAME +
      ';Initial Catalog=' + APP_DBNAME + ';Data Source=' + APP_SERVERNAME + ';';
    AdoConnectionMain.Connected := True;
    Result := True;
  except
    Result := False;
  end;
end;
Function ExecSQLString(QSQL: WideString): Boolean;
var
  xAdoQuery : TADOQuery;
begin
  TRY
    xAdoQuery.Connection := FormAnaMenu.AdoConnectionMain;
    xAdoQuery.Close;
    xAdoQuery.SQL.Clear;
    xAdoQuery.SQL.Text := QSQL;
    xAdoQuery.ExecSQL;
    Result := True;
  except
    Result := False;
  END;
end;
function OpenQueryOnDataSet(QSQL: WideString; xAdoQuery: TADOQuery): Boolean;
begin
  try
    xAdoQuery.Connection := FormAnaMenu.AdoConnectionMain;
    xAdoQuery.Close;
    xAdoQuery.SQL.Clear;
    xAdoQuery.SQL.Text := QSQL;
    xAdoQuery.Open;
    Result := True;
  except
    Result := False;
  end;
end;
procedure TFormAnaMenu.ReadConnectionIniFile;
var
  xConnectionIni: TIniFile;
  xConnectionForm: TFormConnectionSettings;
begin
  xConnectionIni := TIniFile.Create(ExtractFilePath(Application.ExeName)
      + 'Connection.ini');
  if FileExists(ExtractFilePath(Application.ExeName) + 'Connection.Ini') then
  begin
    xConnectionINI := TIniFile.Create(ExtractFilePath(Application.ExeName)
        + 'Connection.Ini');
    APP_SERVERNAME := IdDecoderMIME1.DecodeString
      (xConnectionINI.ReadString(IdEncoderMIME1.EncodeString
          ('ConnectionInformation'), IdEncoderMIME1.EncodeString('srv_nm'),
        ''));
    APP_DBNAME := IdDecoderMIME1.DecodeString
      (xConnectionINI.ReadString(IdEncoderMIME1.EncodeString
          ('ConnectionInformation'), IdEncoderMIME1.EncodeString('DBName'),
        ''));
    APP_USERNAME := IdDecoderMIME1.DecodeString
      (xConnectionINI.ReadString(IdEncoderMIME1.EncodeString
          ('ConnectionInformation'), IdEncoderMIME1.EncodeString('user_name'),
        ''));
    APP_PASSWORD := IdDecoderMIME1.DecodeString
      (xConnectionINI.ReadString(IdEncoderMIME1.EncodeString
          ('ConnectionInformation'), IdEncoderMIME1.EncodeString('psswrd'),
        ''));
    xConnectionINI.Free;
  end;

  if (Trim(APP_SERVERNAME) = '') or (Trim(APP_DBNAME) = '') or
    (Trim(APP_USERNAME) = '') or (Trim(APP_PASSWORD) = '') then
  begin
    xConnectionForm := TFormConnectionSettings.Create(Self);
    xConnectionForm.ShowModal;
    if xConnectionForm.ModalResult <> mrOk then
    begin
      Application.Terminate;
      Exit;
    end;
    xConnectionForm.Free;
    ReadConnectionIniFile;
  end;
end;

end.
