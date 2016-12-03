﻿unit GunSonu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,System.DateUtils,UnityObjects_TLB,System.Win.ComObj;

type
  TfmGunSonu = class(TForm)
    btn1: TButton;
    qry1: TADOQuery;
    procedure btn1Click(Sender: TObject);
  private
    procedure UretimFisi(xADOQueryData: TADOQuery; xType: Integer; xDivisionNR,
      xBelgeNo: string; xBelgeTarihi: TDateTime; strBelgeSaati: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGunSonu: TfmGunSonu;
  boolHataOlustu:Boolean;
  UnityApp:OleVariant;
implementation
 uses UnitAnaMenu,units,Sec;
{$R *.dfm}

procedure TfmGunSonu.btn1Click(Sender: TObject);
begin
UnityApp := CreateOleObject('UnityObjects.UnityApplication');
      if not UnityApp.Connected then begin
        if not UnityApp.Login('LOGO', 'logo', 16) then
          ShowMessage(inttoStr(unityapp.GetLastError) + ': ' + UnityApp.GetLastErrorString);
      end;
end;

procedure TfmGunSonu.UretimFisi(xADOQueryData: TADOQuery; xType: Integer;
  xDivisionNR: string; xBelgeNo: string; xBelgeTarihi: TDateTime;
  strBelgeSaati: string);
var
  slip: OleVariant;
  transactionstransaction: OleVariant;
  iSayi, iHataSayisi, iNormalSayi: integer;
  qryTmp: TADOQuery;
  iWhouseNR: Integer;
  iCostGrp: Integer;
  iInternalRef: Integer;
  iHour: Integer;
  iMinute: Integer;
  iSecond: Integer;
  dtSaat: TDateTime;
function GetLogoCostGrp(iWhouseNr: integer): integer;
var
  qryTmp: TADOQuery;
begin
  qryTmp:=TADOQuery.Create(Self);
  qryTmp.Connection := FormAnaMenu.AdoConnectionMain;
  with qryTmp do
  begin
    Close;
    sql.Clear;
    SQL.Add('SELECT COSTGRP FROM GOPLUS..L_CAPIWHOUSE LCW WITH (NOLOCK)');
    SQL.Add('WHERE AND NR=:NR');
    Parameters.ParamByName('NR').Value:=IntToStr(iWhouseNr);
    Open;
  end;
  Result := qryTmp.FieldByName('COSTGRP').AsInteger;
  qryTmp.Free;
end;
function LogoTime(xNow: TDateTime): integer; overload;
begin
  Result := (HourOf(xNow) * 16777216) + (MinuteOf(xNow) * 65536) + (SecondOf(xNow) * 256);
end;
begin
  if boolHataOlustu = True then Exit;

  // 13: Üretim Fiþi
  // 12: Sarf Fiþi
  // 11: Fire Fiþi
  try
    iNormalSayi := 0;
    iHataSayisi := 0;
    if xADOQueryData.IsEmpty then exit;

    if strBelgeSaati <> '' then
    begin
      iHour := StrToInt(trim(copy(strBelgeSaati, 1, 2)));
      iMinute := StrToInt(trim(copy(strBelgeSaati, 4, 2)));
      iSecond := StrToIntDef(trim(copy(strBelgeSaati, 7, 2)), 0);
      dtSaat := EncodeTime(iHour, iMinute, iSecond, 0);
    end;

    if xType = 11 then // Fire Fiþi
    begin
      dtSaat := IncMinute(dtSaat, -1); // Fatura saati - 1 dk
    end
    else if xType = 12 then // Sarf Fiþi
    begin
      dtSaat := IncMinute(dtSaat, -1); // Fatura saati - 1 dk
    end
    else if xType = 13 then // Üretim Fiþi
    begin
      dtSaat := IncMinute(dtSaat, -1); // Fatura saati - 1 dk
      dtSaat := IncSecond(dtSaat, -2); // Fatura saati - 1 dk
    end;


    slip := UnityApp.NewDataObject(1);
    slip.New;
    //slip.DataFields.FieldByName('NUMBER').Value := '~';
    slip.DataFields.FieldByName('GROUP').Value := 3;
    slip.DataFields.FieldByName('TYPE').Value := xType;
    slip.DataFields.FieldByName('DATE').Value := xBelgeTarihi;

    if strBelgeSaati <> '' then
      slip.DataFields.FieldByName('TIME').Value := LogoTime(dtSaat)
    else
      slip.DataFields.FieldByName('TIME').Value := Date;


    slip.DataFields.FieldByName('DOC_NUMBER').Value := xBelgeNo;
    slip.DataFields.FieldByName('AUXIL_CODE').Value := 'POSF';
    slip.DataFields.FieldByName('CREATED_BY').Value := 0;//APP_USER_ID;
    slip.DataFields.FieldByName('DATE_CREATED').Value := Date;
    slip.DataFields.FieldByName('HOUR_CREATED').Value := HourOf(Now);
    slip.DataFields.FieldByName('MIN_CREATED').Value := MinuteOf(Now);
    slip.DataFields.FieldByName('SEC_CREATED').Value := SecondOf(Now);
    slip.DataFields.FieldByName('MODIFIED_BY').Value := 0;//APP_USER_ID;
    slip.DataFields.FieldByName('DATE_MODIFIED').Value := Date;
    slip.DataFields.FieldByName('HOUR_MODIFIED').Value := HourOf(Now);
    slip.DataFields.FieldByName('MIN_MODIFIED').Value := MinuteOf(Now);
    slip.DataFields.FieldByName('SEC_MODIFIED').Value := SecondOf(Now);
    slip.DataFields.FieldByName('CURRSEL_TOTALS').Value := 1;
    slip.DataFields.FieldByName('SOURCE_DIVISION_NR').Value := xDivisionNR;
    qryTmp := TADOQuery.Create(nil);
    //OpenQuery('SELECT FACTNR,WHOUSENR FROM XXFIRMDBXX..LK_XXFXX_DIVDEFAULTS WHERE OFFICECODE=' + xDivisionNR, qryTmp);
    iWhouseNR :=0;
    qryTmp.Free;
    iCostGrp := GetLogoCostGrp(iWhouseNR);

    slip.DataFields.FieldByName('SOURCE_WH').Value := iWhouseNR;
    slip.DataFields.FieldByName('SOURCE_COST_GRP').Value := iCostGrp;
    transactionstransaction := slip.DataFields.FieldByName('TRANSACTIONS').Lines;
    xADOQueryData.First;
    xADOQueryData.DisableControls;
    while not xADOQueryData.Eof do
    begin
      transactionstransaction.AppendLine;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('ITEM_REFERENCE').Value := xADOQueryData.FieldByName('ITEMREF').AsInteger;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('LINE_TYPE').Value := 0;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('QUANTITY').Value := xADOQueryData.FieldByName('AMOUNT').AsFloat;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('PRICE').Value := xADOQueryData.FieldByName('UNITPRICE').AsFloat;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('UNIT_CODE').Value := xADOQueryData.FieldByName('CODE').AsString;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('SOURCEINDEX').Value := iWhouseNR;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('SOURCECOSTGRP').Value := iCostGrp;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('UNIT_CONV1').Value := 1;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('UNIT_CONV2').Value := 1;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('COST_RATE').Value := 1;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('EU_VAT_STATUS').Value := 4;
      transactionstransaction.item[(transactionstransaction.Count - 1)].FieldByName('EDT_CURR').Value := 1;
      xADOQueryData.Next;
    end;
    xADOQueryData.EnableControls;

    //slip.ExportToXML('MATERIAL_SLIPS','D:\Kullan.xml');
    if slip.Post then
    begin
      Inc(iNormalSayi);
      iInternalRef := slip.DataFields.FieldByName('INTERNAL_REFERENCE').Value;
    end
    else
    begin
      boolHataOlustu := True;
      if slip.ErrorCode <> 0 then
      begin
        //LogEkle(5, Klr_sc_Tarih + ' : ' + DateToStr(xBelgeTarihi) + ' - ' + Klr_cc_Isyeri + ' : ' + xDivisionNR + ' ' + Klr_lm_Mesaj + ' ( ' + Klr_msg_OBJ_DBError + ' : (' + IntToStr(slip.ErrorCode) + ') - ' + slip.ErrorDesc + ' )');
        if slip.DBErrorDesc <> '' then
        //  LogEkle(5, Klr_sc_Tarih + ' : ' + DateToStr(xBelgeTarihi) + ' - ' + Klr_cc_Isyeri + ' : ' + xDivisionNR + ' ' + Klr_lm_Mesaj + ' ( ' + Klr_msg_OBJ_DBError + ' : ' + slip.DBErrorDesc + ' )');
      end
      else
      begin
        if slip.ValidateErrors.Count > 0 then
          for iSayi := 0 to slip.ValidateErrors.Count - 1 do
          //  LogEkle(5, Klr_sc_Tarih + ' : ' + DateToStr(xBelgeTarihi) + ' - ' + Klr_cc_Isyeri + ' : ' + xDivisionNR + ' ' + Klr_lm_Mesaj + ' ( ' + IntToStr(iSayi) + ' - XML Error : (' + IntToStr(slip.ValidateErrors.item[iSayi].ID) + ') - ' + slip.ValidateErrors.item[iSayi].Error + ' )');
      end;
      Inc(iHataSayisi);
    end
  finally
    //HideWaitMessage;
    slip := Null;
    transactionstransaction := Null;
  end;
end;






end.
