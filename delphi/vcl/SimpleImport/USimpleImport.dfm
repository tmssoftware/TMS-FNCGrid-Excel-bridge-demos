object FSimpleImport: TFSimpleImport
  Left = 0
  Top = 0
  Caption = 'Simple Import Demo'
  ClientHeight = 506
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    758
    506)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 146
    Height = 459
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 357
      Width = 26
      Height = 13
      Caption = 'Zoom'
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 144
      Height = 24
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'Import Options'
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object cbFormatting: TCheckBox
      Left = 8
      Top = 100
      Width = 97
      Height = 17
      Caption = 'Formatting'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cbCellSizes: TCheckBox
      Left = 8
      Top = 123
      Width = 97
      Height = 17
      Caption = 'Cell Sizes'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbFormulas: TCheckBox
      Left = 8
      Top = 31
      Width = 97
      Height = 17
      Caption = 'Formulas'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object cbImages: TCheckBox
      Left = 8
      Top = 54
      Width = 97
      Height = 17
      Caption = 'Images'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object cbOutlines: TCheckBox
      Left = 8
      Top = 192
      Width = 97
      Height = 17
      Caption = 'Outlines'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object cbHTML: TCheckBox
      Left = 8
      Top = 169
      Width = 97
      Height = 17
      Caption = 'HTML'
      TabOrder = 6
    end
    object cbReadOnlyToLocked: TCheckBox
      Left = 8
      Top = 146
      Width = 129
      Height = 17
      Caption = 'ReadOnly -> Locked'
      TabOrder = 7
    end
    object cbClearCells: TCheckBox
      Left = 8
      Top = 262
      Width = 97
      Height = 17
      Caption = 'Clear Cells'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object cbResizeGrid: TCheckBox
      Left = 8
      Top = 285
      Width = 138
      Height = 17
      Caption = 'Resize Grid'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object cbComments: TCheckBox
      Left = 8
      Top = 77
      Width = 97
      Height = 17
      Caption = 'Comments'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
    object edZoom: TEdit
      Left = 8
      Top = 376
      Width = 121
      Height = 21
      TabOrder = 11
      Text = '0'
      OnChange = edZoomChange
    end
  end
  object BtnAbout: TButton
    Left = 144
    Top = 473
    Width = 121
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'About'
    TabOrder = 1
    OnClick = BtnAboutClick
  end
  object BtnImport: TButton
    Left = 8
    Top = 473
    Width = 121
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Import Excel File'
    TabOrder = 2
    OnClick = BtnImportClick
  end
  object DataGrid: TTMSFNCGrid
    Left = 160
    Top = 8
    Width = 590
    Height = 459
    ParentDoubleBuffered = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    DoubleBuffered = True
    TabOrder = 3
    Options.Editing.CalcFormat = '%g'
    Options.Grouping.CalcFormat = '%g'
    Options.Grouping.GroupCountFormat = '(%d)'
    Options.IO.XMLEncoding = 'ISO-8859-1'
    Options.Mouse.ColumnSizeMargin = 6
    Options.Mouse.RowSizeMargin = 6
    Columns = <
      item
        BorderWidth = 1
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ID = ''
        Width = 68.00000000000000000
      end
      item
        BorderWidth = 1
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ID = ''
        Width = 68.00000000000000000
      end
      item
        BorderWidth = 1
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ID = ''
        Width = 68.00000000000000000
      end
      item
        BorderWidth = 1
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ID = ''
        Width = 68.00000000000000000
      end
      item
        BorderWidth = 1
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ID = ''
        Width = 68.00000000000000000
      end>
    TopRow = 1
    Appearance.FixedLayout.Fill.Color = 15132390
    Appearance.FixedLayout.Font.Charset = DEFAULT_CHARSET
    Appearance.FixedLayout.Font.Color = clWindowText
    Appearance.FixedLayout.Font.Height = -11
    Appearance.FixedLayout.Font.Name = 'Tahoma'
    Appearance.FixedLayout.Font.Style = [fsBold]
    Appearance.NormalLayout.Fill.Color = -1
    Appearance.NormalLayout.Font.Charset = DEFAULT_CHARSET
    Appearance.NormalLayout.Font.Color = clWindowText
    Appearance.NormalLayout.Font.Height = -11
    Appearance.NormalLayout.Font.Name = 'Tahoma'
    Appearance.NormalLayout.Font.Style = []
    Appearance.GroupLayout.Fill.Color = 12817262
    Appearance.GroupLayout.Font.Charset = DEFAULT_CHARSET
    Appearance.GroupLayout.Font.Color = clWhite
    Appearance.GroupLayout.Font.Height = -11
    Appearance.GroupLayout.Font.Name = 'Tahoma'
    Appearance.GroupLayout.Font.Style = []
    Appearance.SummaryLayout.Fill.Color = 14009785
    Appearance.SummaryLayout.Font.Charset = DEFAULT_CHARSET
    Appearance.SummaryLayout.Font.Color = clWindowText
    Appearance.SummaryLayout.Font.Height = -11
    Appearance.SummaryLayout.Font.Name = 'Tahoma'
    Appearance.SummaryLayout.Font.Style = []
    Appearance.SelectedLayout.Fill.Color = 14599344
    Appearance.SelectedLayout.Font.Charset = DEFAULT_CHARSET
    Appearance.SelectedLayout.Font.Color = clWhite
    Appearance.SelectedLayout.Font.Height = -11
    Appearance.SelectedLayout.Font.Name = 'Tahoma'
    Appearance.SelectedLayout.Font.Style = []
    Appearance.FocusedLayout.Fill.Color = 14599344
    Appearance.FocusedLayout.Font.Charset = DEFAULT_CHARSET
    Appearance.FocusedLayout.Font.Color = clWhite
    Appearance.FocusedLayout.Font.Height = -11
    Appearance.FocusedLayout.Font.Name = 'Tahoma'
    Appearance.FocusedLayout.Font.Style = []
    Appearance.FixedSelectedLayout.Fill.Color = 14599344
    Appearance.FixedSelectedLayout.Font.Charset = DEFAULT_CHARSET
    Appearance.FixedSelectedLayout.Font.Color = clWindowText
    Appearance.FixedSelectedLayout.Font.Height = -11
    Appearance.FixedSelectedLayout.Font.Name = 'Tahoma'
    Appearance.FixedSelectedLayout.Font.Style = []
    Appearance.BandLayout.Fill.Color = 14745599
    Appearance.BandLayout.Font.Charset = DEFAULT_CHARSET
    Appearance.BandLayout.Font.Color = clWindowText
    Appearance.BandLayout.Font.Height = -11
    Appearance.BandLayout.Font.Name = 'Tahoma'
    Appearance.BandLayout.Font.Style = []
    Appearance.ProgressLayout.Format = '%.0f%%'
    LeftCol = 1
    ScrollMode = scmItemScrolling
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'Excel Files|*.xlsx;*.xls|Xls files (Excel 2003 or older)|*.xls|X' +
      'lsx files (Excel 2007 or newer)|*.xlsx|All files|*.*'
    Left = 592
    Top = 136
  end
  object ExcelImport: TTMSFNCGridExcelImport
    Grid = DataGrid
    Version = '1.0'
    Left = 376
    Top = 256
  end
end
