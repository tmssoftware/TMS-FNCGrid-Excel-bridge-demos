unit UMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Forms,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  System.Rtti, FMX.TMSFNCDataGridCell, FMX.TMSFNCDataGridData,
  FMX.TMSFNCDataGridBase, FMX.TMSFNCDataGridCore, FMX.TMSFNCDataGridRenderer,
  FMX.TMSFNCDataGridExcelExport, FMX.StdCtrls, FMX.Dialogs,
  FMX.TMSFNCCustomControl, FMX.TMSFNCDataGrid, FMX.Objects, FMX.Types,
  FMX.Controls, FMX.Controls.Presentation, FMX.TMSFNCCustomComponent,
  FMX.TMSFNCBitmapContainer;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TRectangle;
    cbFormatting: TCheckBox;
    cbCellMargins: TCheckBox;
    cbCellsAsStrings: TCheckBox;
    cbCellSizes: TCheckBox;
    cbFormulas: TCheckBox;
    cbHardBorders: TCheckBox;
    cbHiddenColumns: TCheckBox;
    cbHiddenRows: TCheckBox;
    cbImages: TCheckBox;
    cbOutlines: TCheckBox;
    cbRawHTML: TCheckBox;
    cbReadOnlyToLocked: TCheckBox;
    cbShowGridlines: TCheckBox;
    cbSummaryRowsBelow: TCheckBox;
    cbStandardPalette: TCheckBox;
    cbWordWrapped: TCheckBox;
    cbCheckboxes: TCheckBox;
    cbHyperlinks: TCheckBox;
    Label1: TLabel;
    DataGrid: TTMSFNCDataGrid;
    SaveDialogExcel: TSaveDialog;
    SaveDialogPdf: TSaveDialog;
    SaveDialogHtml: TSaveDialog;
    BtnExportPdf: TButton;
    BtnExportHTML: TButton;
    BtnAbout: TButton;
    BtnExportExcel: TButton;
    ExcelExport: TTMSFNCDataGridExcelExport;
    BitmapContainer: TTMSFNCBitmapContainer;
    procedure FormCreate(Sender: TObject);
    procedure BtnExportExcelClick(Sender: TObject);
    procedure BtnExportHTMLClick(Sender: TObject);
    procedure BtnExportPdfClick(Sender: TObject);
    procedure BtnAboutClick(Sender: TObject);
  private
    procedure SetExportOptions;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}


procedure TMainForm.FormCreate(Sender: TObject);
var
  bmp: TTMSFNCBitmap;
begin
  DataGrid.RowCount := 25;
  DataGrid.ColumnCount := 12;

  DataGrid.MergeCells(1, 1, 2, 2);
  DataGrid.MergeCells(1, 0, 2, 1);
  DataGrid.MergeCells(0, 2, 1, 2);


  DataGrid.Cells[1, 1] := '<font color="#FF0000">This</font> is <b>bold</b>';
  DataGrid.Cells[1, 0] := '<img src="idx:0"><font face="tahoma">This is <b>Tahoma</b></font>';

  DataGrid.Cells[0, 2] := 'Fixed col'#13'merged';

  DataGrid.MergeCells(2, 3, 2, 2);
  DataGrid.Cells[2, 3] := 'Here we have one <a href="action">link</a>';
  DataGrid.Colors[2, 3] := TAlphaColors.Yellow;

  DataGrid.MergeCells(0, 8, DataGrid.ColumnCount - 1, 1);
  DataGrid.Cells[0, 8] := 'This is a merged cell across the grid';

  DataGrid.MergeCells(4, 2, 4, 6);

  bmp := TTMSFNCBitmap.CreateFromFile('..\..\slr.jpg');
  try
    DataGrid.AddBitmap(4, 2, bmp);
    DataGrid.ControlWidths[4, 2] := 200;
    DataGrid.ControlHeights[4, 2] := 300;
  finally
    bmp.Free;
  end;

  DataGrid.MergeCells(1, 6, 2, 2);
  DataGrid.Cells[1, 6] := 'Wordwrapped text in a merged cell displayed here';
  DataGrid.Layouts[1, 6].WordWrapping := true;

  DataGrid.MergeCells(1, 10, 3, 1);
  DataGrid.AddCheckBox(1, 10, False);
  DataGrid.Cells[1, 10] := 'Checkbox 1';
  DataGrid.RowHeights[10] := 50;
  DataGrid.MergeCells(1, 11, 3, 1);
  DataGrid.AddCheckBox(1, 11, True);
  DataGrid.Cells[1, 11] := 'Checkbox 2';

  DataGrid.AddDataRadioButton(1, 12);
  DataGrid.Cells[0, 12] := 'Option 1';

  DataGrid.MergeCells(1, 12, 3, 1);

  DataGrid.AddDataRadioButton(1, 13);
  DataGrid.Cells[0, 13] := 'Option 2';

  DataGrid.MergeCells(1, 13, 3, 1);

  DataGrid.Comments[1, 14] := 'This is a comment!';

//  DataGrid.SetNodeRow(3,5);
//  DataGrid.SetNodeRow(5,2);

  DataGrid.ColumnWidths[5] := 100;

  DataGrid.AddBitmap(5 , 10, '1');
  DataGrid.Cells[5, 10] := 'Ok';

  DataGrid.AddBitmap(5 , 11, '3');
  DataGrid.Cells[5, 11] := 'Edit';


  DataGrid.Colors[2, 5] := TAlphaColors.Red;
  DataGrid.Layouts[3, 5].Fill.Kind := gfkGradient;
  DataGrid.Layouts[3, 5].Fill.GradientType := gfgtLinear;
  DataGrid.Layouts[3, 5].Fill.Color := TAlphaColors.Navy;
  DataGrid.Layouts[3, 5].Fill.ColorTo := TAlphaColors.Yellow;


  DataGrid.RowHeights[15] := 60;

  DataGrid.Cells[5, 12] := 'A cell <a href="https://www.tmssoftware.com" title="TMS software">hyperlink</a>';
  DataGrid.Cells[5, 13] := 'https://www.tmssoftware.com';

  DataGrid.AddButton(5, 15, 'Press me');

end;

procedure TMainForm.SetExportOptions;
begin
    ExcelExport.ExportOptions.CellSizes := cbCellSizes.IsChecked;
    ExcelExport.ExportOptions.Formulas := cbFormulas.IsChecked;
    ExcelExport.ExportOptions.CellsAsStrings := cbCellsAsStrings.IsChecked;
    ExcelExport.ExportOptions.CellFormatting := cbFormatting.IsChecked;
    ExcelExport.ExportOptions.WordWrapped := cbWordWrapped.IsChecked;
    ExcelExport.ExportOptions.RawHTML := cbRawHTML.IsChecked;
    ExcelExport.ExportOptions.Images := cbImages.IsChecked;
    ExcelExport.ExportOptions.Checkboxes := cbCheckboxes.IsChecked;
    ExcelExport.ExportOptions.HiddenColumns := cbHiddenColumns.IsChecked;
    ExcelExport.ExportOptions.HiddenRows := cbHiddenRows.IsChecked;
    ExcelExport.ExportOptions.HardBorders := cbHardBorders.IsChecked;
    ExcelExport.ExportOptions.ShowGridLines := cbShowGridLines.IsChecked;
    ExcelExport.ExportOptions.CellMargins := cbCellMargins.IsChecked;
    ExcelExport.ExportOptions.ReadonlyCellsAsLocked := cbReadOnlyToLocked.IsChecked;
    ExcelExport.ExportOptions.Outlines := cbOutlines.IsChecked;
    ExcelExport.ExportOptions.SummaryRowsBelowDetail := cbSummaryRowsBelow.IsChecked;
    ExcelExport.ExportOptions.UseExcelStandardColorPalette := cbStandardPalette.IsChecked;
    if cbHyperlinks.IsChecked then
      ExcelExport.ExportOptions.Hyperlinks := THyperlinkExportMode.FirstLink
      else ExcelExport.ExportOptions.Hyperlinks := THyperlinkExportMode.None;
    ExcelExport.LocationOptions.GridStartRow := 0;
    ExcelExport.LocationOptions.GridStartCol := 0;
end;

procedure TMainForm.BtnExportExcelClick(Sender: TObject);
begin
  if not SaveDialogExcel.Execute then exit;

  SetExportoptions;
  ExcelExport.Export(SaveDialogExcel.FileName, 'Result');

  if TTMSFNCUtils.Message('Do you want to open the generated file?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    TTMSFNCUtils.OpenFile(SaveDialogExcel.FileName);
  end;


end;

procedure TMainForm.BtnExportHTMLClick(Sender: TObject);
begin
  if not SaveDialogHtml.Execute then exit;

  SetExportoptions;
  ExcelExport.ExportHtml(SaveDialogHtml.FileName, THtmlExportMode.SingleSheet);

  if TTMSFNCUtils.Message('Do you want to open the generated file?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    TTMSFNCUtils.OpenFile(SaveDialogHtml.FileName);
  end;

end;

procedure TMainForm.BtnExportPdfClick(Sender: TObject);
begin
  if not SaveDialogPdf.Execute then exit;

  SetExportoptions;
  ExcelExport.ExportPdf(SaveDialogPdf.FileName);

  if TTMSFNCUtils.Message('Do you want to open the generated file?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    TTMSFNCUtils.OpenFile(SaveDialogPdf.FileName);
  end;

end;

procedure TMainForm.BtnAboutClick(Sender: TObject);
begin
  ShowMessage('This is a demo showing the basic functionality of TTMSFNCDataGridExcelExport');

end;


end.
