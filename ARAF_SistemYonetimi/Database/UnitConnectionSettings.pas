unit UnitConnectionSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel,
  dxSkinCoffee, cxTextEdit, StdCtrls, cxGroupBox,  Menus,
  cxButtons, IniFiles, IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME,
  UnitBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, Vcl.ExtCtrls, cxPC,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Data.Win.ADODB, Vcl.ComCtrls,
  cxSplitter, ElastFrm;

type
  TFormConnectionSettings = class(TFormBasic)
    cxGroupBox1: TcxGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxTextEditServerName: TcxTextEdit;
    cxTextEditUserName: TcxTextEdit;
    cxTextEditDBName: TcxTextEdit;
    Label1: TLabel;
    cxTextEditPassword: TcxTextEdit;
    cxButtonSave: TcxButton;
    cxButtonCancel: TcxButton;
    IdEncoderMIME1: TIdEncoderMIME;
    IdDecoderMIME1: TIdDecoderMIME;
    procedure cxButtonSaveClick(Sender: TObject);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConnectionSettings: TFormConnectionSettings;

implementation

{$R *.dfm}

procedure TFormConnectionSettings.cxButtonCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFormConnectionSettings.cxButtonSaveClick(Sender: TObject);
var
  ConnectionINI: TIniFile;
begin
  inherited;
  if Trim(cxTextEditServerName.Text) = '' then
  begin
    ShowMessage('Server ad� girilmelidir.');
    cxTextEditServerName.SetFocus;
    Exit;
  end;

  if Trim(cxTextEditDBName.Text) = '' then
  begin
    ShowMessage('Veritaban� ad� girilmelidir.');
    cxTextEditDBName.SetFocus;
    Exit;
  end;

  if Trim(cxTextEditUserName.Text) = '' then
  begin
    ShowMessage('Kullan�c� ad� girilmelidir.');
    cxTextEditUserName.SetFocus;
    Exit;
  end;

  if Trim(cxTextEditPassword.Text) = '' then
  begin
    ShowMessage('Kullan�c� �ifresi girilmelidir.');
    cxTextEditPassword.SetFocus;
    Exit;
  end;

  ConnectionINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'Connection.Ini');
  ConnectionINI.WriteString(IdEncoderMIME1.EncodeString('ConnectionInformation'), IdEncoderMIME1.EncodeString('srv_nm'),IdEncoderMIME1.EncodeString(cxTextEditServerName.Text));
  ConnectionINI.WriteString(IdEncoderMIME1.EncodeString('ConnectionInformation'), IdEncoderMIME1.EncodeString('DBName'),IdEncoderMIME1.EncodeString(cxTextEditDBName.Text));
  ConnectionINI.WriteString(IdEncoderMIME1.EncodeString('ConnectionInformation'), IdEncoderMIME1.EncodeString('user_name'),IdEncoderMIME1.EncodeString(cxTextEditUserName.Text));
  ConnectionINI.WriteString(IdEncoderMIME1.EncodeString('ConnectionInformation'), IdEncoderMIME1.EncodeString('psswrd'),IdEncoderMIME1.EncodeString(cxTextEditPassword.Text));
  ConnectionINI.Free;

  ModalResult := mrOk;
end;

procedure TFormConnectionSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FormConnectionSettings := Nil;
end;

procedure TFormConnectionSettings.FormCreate(Sender: TObject);
var
  xConnectionIni: TIniFile;
begin
  inherited;
  if FileExists(ExtractFilePath(Application.ExeName)+'Connection.Ini') then
  begin
    xConnectionINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'Connection.Ini');
    cxTextEditServerName.Text := IdDecoderMIME1.DecodeString(xConnectionINI.ReadString(IdEncoderMIME1.EncodeString('ConnectionInformation'), IdEncoderMIME1.EncodeString('srv_nm'),''));
    cxTextEditDBName.Text := IdDecoderMIME1.DecodeString(xConnectionINI.ReadString(IdEncoderMIME1.EncodeString('ConnectionInformation'), IdEncoderMIME1.EncodeString('DBName'),''));
    cxTextEditUserName.Text := IdDecoderMIME1.DecodeString(xConnectionINI.ReadString(IdEncoderMIME1.EncodeString('ConnectionInformation'), IdEncoderMIME1.EncodeString('user_name'),''));
    cxTextEditPassword.Text := IdDecoderMIME1.DecodeString(xConnectionINI.ReadString(IdEncoderMIME1.EncodeString('ConnectionInformation'), IdEncoderMIME1.EncodeString('psswrd'),''));
    xConnectionINI.Free;
  end;
end;

end.
