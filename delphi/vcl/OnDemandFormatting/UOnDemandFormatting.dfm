object FMainForm: TFMainForm
  Left = 0
  Top = 0
  Caption = 'Formatting on demand'
  ClientHeight = 243
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 208
    Width = 523
    Height = 35
    Align = alBottom
    TabOrder = 0
    ExplicitWidth = 472
    object btnExport: TButton
      Left = 0
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Export'
      TabOrder = 0
      OnClick = btnExportClick
    end
    object btnAbout: TButton
      Left = 217
      Top = 6
      Width = 75
      Height = 25
      Caption = 'About'
      TabOrder = 1
      OnClick = btnAboutClick
    end
    object btnExportAsStrings: TButton
      Left = 81
      Top = 6
      Width = 104
      Height = 25
      Caption = 'Export as Strings'
      TabOrder = 2
      OnClick = btnExportAsStringsClick
    end
  end
  object DataGrid: TTMSFNCGrid
    Left = 0
    Top = 0
    Width = 523
    Height = 208
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
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
    ExplicitWidth = 472
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007|*.xlsx|Excel 97/2003|*.xls'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 275
    Top = 10
  end
  object ExcelExport: TTMSFNCGridExcelExport
    Grid = DataGrid
    Version = '1.0'
    OnExportCell = ExcelExportExportCell
    OnExportComment = ExcelExportExportComment
    Left = 232
    Top = 128
  end
end
