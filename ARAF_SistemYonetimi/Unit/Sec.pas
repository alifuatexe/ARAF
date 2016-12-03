unit Sec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ADODB, cxCurrencyEdit,StrUtils,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator;

type
  TfrmSec = class(TForm)
    Panel1: TPanel;
    btnSec: TSpeedButton;
    btnKapat: TSpeedButton;
    grid: TcxGrid;
    gridDBTableView1: TcxGridDBTableView;
    gridLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    qryListe: TADOQuery;
    dsListe: TDataSource;
    procedure btnSecClick(Sender: TObject);
    procedure btnKapatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridDBTableView1DblClick(Sender: TObject);
    procedure gridDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    SqlStr: string;
    { Public declarations }
  end;

var
  frmSec: TfrmSec;

implementation

uses UnitAnaMenu;

{$R *.dfm}

procedure TfrmSec.btnSecClick(Sender: TObject);
begin
  ModalResult := MrOk;
end;

procedure TfrmSec.btnKapatClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSec.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Release;

end;

procedure TfrmSec.gridDBTableView1DblClick(Sender: TObject);
begin
  if btnsec.Enabled = True then btnSecClick(Self);
end;

procedure TfrmSec.gridDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then gridDBTableView1DblClick(Self);
end;

procedure TfrmSec.FormShow(Sender: TObject);
var  formname:string;
begin
  formname := AnsiReplaceStr(self.Caption, '/', '_');
  formname := AnsiReplaceStr(formname, '-', '_');
  gridDBTableView1.RestoreFromIniFile(FormAnaMenu.GridDizaynPath + 'tbvdbGrid_' + formname, true, false, [], 'myview');
  try
    with qryListe do
    begin
      Close;
      SQL.Clear;
      SQL.add(SqlStr);
      Open;
      gridDBTableView1.ClearItems;
      gridDBTableView1.DataController.DataSource := dsListe;
      gridDBTableView1.DataController.CreateAllItems;
      gridDBTableView1.ApplyBestFit();
      if RecordCount = 0 then btnSec.Enabled := False;
    end;
  except on E: Exception do
    begin
      Showmessage('Sorguda Hata var');
      Abort;
    end;
  end;
end;

procedure TfrmSec.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var formname: string;
begin

  //  tbvdbGrid.StoreToIniFile(path+'tbvdbGrid_'+self.Name,true,[],'myview');
  formname := AnsiReplaceStr(self.Caption, '/', '_');
  formname := AnsiReplaceStr(formname, '\', '_');
  formname := AnsiReplaceStr(formname, '-', '_');
  gridDBTableView1.StoreToIniFile(FormAnaMenu.GridDizaynPath + 'tbvdbGrid_' + formname, true, [], 'myview');
end;

procedure TfrmSec.FormCreate(Sender: TObject);
begin
  Caption := 'Cari Sec';
end;

end.

