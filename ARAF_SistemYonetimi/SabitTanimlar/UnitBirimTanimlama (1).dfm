inherited FormUnitBirimTanimlama: TFormUnitBirimTanimlama
  Caption = 'Birim Tan'#305'mlama Ekran'#305
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
          object cxLabel1: TcxLabel
            Left = 5
            Top = 17
            Caption = 'KEYID'
            Transparent = True
          end
          object cxLabel2: TcxLabel
            Left = 5
            Top = 40
            Caption = 'Birim Ad'#305
            Transparent = True
          end
          object cxLabel4: TcxLabel
            Left = 5
            Top = 71
            Caption = 'A'#231#305'klama'
            Transparent = True
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
              object gridViewUNIT_ID: TcxGridDBColumn
                Caption = 'Birim Id'
                DataBinding.FieldName = 'UNIT_ID'
              end
              object gridViewUNIT_NAME: TcxGridDBColumn
                Caption = 'Birim '#304'smi'
                DataBinding.FieldName = 'UNIT_NAME'
              end
              object gridViewEXPLANATION: TcxGridDBColumn
                Caption = 'A'#231#305'klama'
                DataBinding.FieldName = 'EXPLANATION'
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
      object edtBirimAdi: TcxTextEdit
        Left = 296
        Top = 44
        TabOrder = 3
        Width = 121
      end
      object edtAciklama: TcxTextEdit
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
      inherited BtnKaydet: TcxButton
        ExplicitLeft = 173
        ExplicitTop = 1
        ExplicitWidth = 172
        ExplicitHeight = 53
      end
      inherited BtnDegistir: TcxButton
        ExplicitLeft = 345
        ExplicitTop = 1
        ExplicitWidth = 171
        ExplicitHeight = 53
      end
      inherited BtnSil: TcxButton
        OnClick = BtnSilClick
        ExplicitLeft = 516
        ExplicitTop = 1
        ExplicitWidth = 173
        ExplicitHeight = 53
      end
      inherited BtnYeni: TcxButton
        ExplicitLeft = 1
        ExplicitWidth = 172
        ExplicitHeight = 53
      end
    end
  end
  inherited ADOQuery1: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      'select * from UNIT_DEFINITION')
    Left = 578
    Top = 92
    object ADOQuery1UNIT_ID: TAutoIncField
      FieldName = 'UNIT_ID'
      ReadOnly = True
    end
    object ADOQuery1UNIT_NAME: TWideStringField
      FieldName = 'UNIT_NAME'
      Size = 10
    end
    object ADOQuery1EXPLANATION: TWideStringField
      FieldName = 'EXPLANATION'
      Size = 50
    end
  end
  inherited DataSource1: TDataSource
    Left = 626
    Top = 92
  end
end
