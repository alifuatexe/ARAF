inherited FormUnitIsmerkeziGrubuTanimlama: TFormUnitIsmerkeziGrubuTanimlama
  Caption = #304#351' Merkezi Grubu Tan'#305'mlama Ekran'#305
  ClientHeight = 413
  ClientWidth = 692
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 708
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Width = 692
    Height = 356
    ExplicitWidth = 692
    ExplicitHeight = 356
    ClientRectBottom = 351
    ClientRectRight = 687
    inherited PageDetay: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 25
      ExplicitWidth = 685
      ExplicitHeight = 326
      inherited Panel4: TPanel
        Width = 498
        Height = 326
        ExplicitWidth = 498
        ExplicitHeight = 326
        inherited Panel3: TPanel
          Width = 496
          Height = 104
          ExplicitWidth = 496
          ExplicitHeight = 104
          object Label1: TLabel
            Left = 5
            Top = 20
            Width = 11
            Height = 13
            Caption = 'ID'
          end
          object Label2: TLabel
            Left = 5
            Top = 46
            Width = 50
            Height = 13
            Caption = 'Grup Kodu'
          end
          object Label3: TLabel
            Left = 5
            Top = 73
            Width = 41
            Height = 13
            Caption = 'Grup Ad'#305
          end
        end
        inherited Panel5: TPanel
          Top = 113
          Width = 496
          Height = 212
          ExplicitTop = 113
          ExplicitWidth = 496
          ExplicitHeight = 212
          inherited cxGrid1: TcxGrid
            Width = 494
            Height = 210
            ExplicitWidth = 494
            ExplicitHeight = 210
            inherited gridView: TcxGridDBTableView
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.NavigatorHints = True
              OptionsBehavior.PullFocusing = True
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsCustomize.ColumnsQuickCustomizationReordering = qcrEnabled
              OptionsView.ScrollBars = ssHorizontal
              OptionsView.ShowEditButtons = gsebAlways
              OptionsView.GroupRowStyle = grsOffice11
              OptionsView.ShowColumnFilterButtons = sfbAlways
              object gridViewWSG_ID: TcxGridDBColumn
                Caption = 'Id'
                DataBinding.FieldName = 'WSG_ID'
                Width = 58
              end
              object gridViewWSG_CODE: TcxGridDBColumn
                Caption = 'Kodu'
                DataBinding.FieldName = 'WSG_CODE'
                Width = 75
              end
              object gridViewWSG_NAME: TcxGridDBColumn
                Caption = 'Ad'#305
                DataBinding.FieldName = 'WSG_NAME'
                Width = 75
              end
            end
          end
        end
        inherited cxSplitter2: TcxSplitter
          Top = 105
          Width = 496
          ExplicitTop = 105
          ExplicitWidth = 496
        end
      end
      inherited cxSplitter1: TcxSplitter
        Height = 326
        ExplicitHeight = 326
      end
      inherited Panel2: TPanel
        Height = 326
        TabOrder = 4
        ExplicitHeight = 326
        inherited btnAra: TcxButton
          Top = 265
          OnClick = btnAraClick
          ExplicitTop = 265
        end
        object edtBirimAdiAra: TcxTextEdit
          Left = 1
          Top = 44
          TabOrder = 1
          OnKeyDown = edtBirimAdiAraKeyDown
          Width = 170
        end
        object cxLabel3: TcxLabel
          Left = 1
          Top = 21
          Caption = 'Birim Ad'#305
          Transparent = True
        end
      end
      object edtKeyid: TcxTextEdit
        Left = 296
        Top = 17
        TabOrder = 2
        Width = 121
      end
      object edtGrupKodu: TcxTextEdit
        Left = 296
        Top = 44
        TabOrder = 3
        Width = 121
      end
      object edtGrupAdi: TcxTextEdit
        Left = 296
        Top = 71
        TabOrder = 5
        Width = 233
      end
    end
  end
  inherited Panel1: TPanel
    Width = 692
    ExplicitWidth = 692
    inherited GridPanel1: TGridPanel
      Width = 690
      ColumnCollection = <
        item
          Value = 25.024202101173890000
        end
        item
          Value = 25.032764840680120000
        end
        item
          Value = 24.961980390381530000
        end
        item
          Value = 24.981052667764470000
        end>
      ExplicitWidth = 690
      inherited BtnYeni: TcxButton
        ExplicitWidth = 172
      end
      inherited BtnKaydet: TcxButton
        ExplicitLeft = 173
        ExplicitWidth = 172
      end
      inherited BtnDegistir: TcxButton
        ExplicitLeft = 345
        ExplicitWidth = 171
      end
      inherited BtnSil: TcxButton
        OnClick = BtnSilClick
        ExplicitLeft = 516
        ExplicitWidth = 173
      end
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      'select * from WORKSTATION_GROUP')
    Left = 538
    Top = 100
    object ADOQuery1WSG_ID: TAutoIncField
      FieldName = 'WSG_ID'
      ReadOnly = True
    end
    object ADOQuery1WSG_CODE: TWideStringField
      FieldName = 'WSG_CODE'
      Size = 50
    end
    object ADOQuery1WSG_NAME: TWideStringField
      FieldName = 'WSG_NAME'
      Size = 50
    end
  end
  inherited DataSource1: TDataSource
    Left = 618
    Top = 100
  end
end
