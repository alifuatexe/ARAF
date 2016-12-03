unit UnitUsersTanimlama;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBasic, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, Vcl.Menus,
  cxContainer, cxEdit, cxLabel, cxTextEdit, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxPC, cxMaskEdit, cxButtonEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  Data.Win.ADODB, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxDBEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxSplitter;

type
  TFormUnitUsersTanimlama = class(TFormBasic)
    ADOQueryBirim: TADOQuery;
    DataSourceBirim: TDataSource;
    ADOQueryBirimKEYID: TAutoIncField;
    ADOQueryBirimBIRIM_ADI: TWideStringField;
    ADOQuery1KEYID: TAutoIncField;
    ADOQuery1KULLANICI_KODU: TWideStringField;
    ADOQuery1KULLANICI_ADI: TWideStringField;
    ADOQuery1KULLANICI_SOYADI: TWideStringField;
    ADOQuery1KULLANICI_SIFRE: TWideStringField;
    gridViewKEYID: TcxGridDBColumn;
    gridViewKULLANICI_KODU: TcxGridDBColumn;
    gridViewKULLANICI_ADI: TcxGridDBColumn;
    gridViewKULLANICI_SOYADI: TcxGridDBColumn;
    gridViewKULLANICI_SIFRE: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    edtKeyid: TcxTextEdit;
    edtKullniciAdi: TcxTextEdit;
    edtSifre: TcxTextEdit;
    edtKullNo: TcxTextEdit;
    edtAdi: TcxTextEdit;
    edtSoyad�: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnDegistirClick(Sender: TObject);
    procedure gridViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnKaydetClick(Sender: TObject);
    procedure BtnYeniClick(Sender: TObject);
    procedure BtnSilClick(Sender: TObject);
  private
    procedure Listele;
    { Private declarations }
  public
    { Public declarations }
     xNotRef : Integer;
    OpenInsertMode : Boolean;
  end;

var
  FormUnitUsersTanimlama: TFormUnitUsersTanimlama;

implementation

{$R *.dfm}
 uses CariSec,UnitAnaMenu, UnitUrunTanimlama, UnitBirimTanimlama;
procedure TFormUnitUsersTanimlama.BtnDegistirClick(Sender: TObject);
begin
  inherited;
edtKeyid.Text:=ADOQuery1KEYID.AsString;
edtKullniciAdi.Text:=ADOQueryBirimBIRIM_ADI.Value;

end;

procedure TFormUnitUsersTanimlama.BtnKaydetClick(Sender: TObject);
var
  xAdoQuery : TADOQuery;
begin
inherited;
  TRY
    xAdoQuery:=TADOQuery.Create(Self);
    xAdoQuery.Connection := FormAnaMenu.AdoConnectionMain;
  with xAdoQuery do
   begin


   Parameters.ParamByName('KULLANICI_KODU').Value:=edtKullNo.Text;
   Parameters.ParamByName('KULLANICI_ADI').Value:=edtKullniciAdi.Text;
   Parameters.ParamByName('KULLANICI_SOYADI').Value:=edtSoyad�.Text;
   Parameters.ParamByName('KULLANICI_SIFRE').Value:=edtSifre.Text;
   ExecSQL;
   end;
  FINALLY
   FreeAndNil(xAdoQuery);
   Listele;
  END;
end;



procedure TFormUnitUsersTanimlama.BtnSilClick(Sender: TObject);
var
  xAdoQuery : TADOQuery;
begin
inherited;
  TRY
    xAdoQuery:=TADOQuery.Create(Self);
    xAdoQuery.Connection := FormAnaMenu.AdoConnectionMain;
    with  xAdoQuery do
    begin
      Close;
      sql.Clear;
      sql.Add('DELETE FROM BIRIM_TANIM WHERE KEYID=:KEYID');
      Parameters.ParamByName('KEYID').Value:=ADOQuery1KEYID.Value;
      ExecSQL;
    end;
  FINALLY
    FreeAndNil(xAdoQuery);
    listele;
  END;
end;

procedure TFormUnitUsersTanimlama.BtnYeniClick(Sender: TObject);
begin
  inherited;
edtKeyid.Text:='';
edtKullniciAdi.Text:='';
end;

procedure TFormUnitUsersTanimlama.Listele;
begin
  ADOQuery1.close;
  ADOQuery1.Open;
  gridView.DataController.DataSource:=nil;
  gridView.DataController.DataSource:=DataSource1;
  gridView.ApplyBestFit(nil);
end;

procedure TFormUnitUsersTanimlama.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FormUnitBirimTanimlama := nil;
end;

procedure TFormUnitUsersTanimlama.FormShow(Sender: TObject);
begin
  inherited;
Listele;
end;

procedure TFormUnitUsersTanimlama.gridViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
BtnDegistirClick(self);
end;

end.
