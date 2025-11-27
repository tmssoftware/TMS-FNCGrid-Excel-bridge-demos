{*************************************************************************}
{ TAdvStringGrid demo unit                                                }
{                                                                         }
{ written by TMS Software                                                 }
{            copyright (c)1998-2012                                       }
{            Email : info@tmssoftware.Com                                 }
{            Web : https://www.tmssoftware.com                             }
{                                                                         }
{ The source code is given as is. The author is not responsible           }
{ for any possible damage done due to the use of this code.               }
{ The component can be freely used in any application. The complete       }
{ source code remains property of the author and may not be distributed,  }
{ published, given or sold in any form as such. No parts of the source    }
{ code can be included in any other component or application without      }
{ written authorization of the author.                                    }
{*************************************************************************}
unit UMainForm;

interface

uses
  Windows, Forms, Messages, SysUtils, Classes, VCL.Graphics,

  Vcl.ImgList,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, System.Rtti, VCL.TMSFNCDataGridCell,
  VCL.TMSFNCDataGridData, VCL.TMSFNCDataGridBase, VCL.TMSFNCDataGridCore,
  VCL.TMSFNCDataGridRenderer, VCL.TMSFNCDataGridExcelExport,
  VCL.TMSFNCDataGrid, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, Vcl.Dialogs,
  VCL.TMSFNCCustomControl, System.ImageList, VCL.TMSFNCCustomComponent,
  VCL.TMSFNCBitmapContainer;

type
  TMainForm = class(TForm)
    ImageList1: TImageList;
    BtnExportExcel: TButton;
    BtnAbout: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
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
    SaveDialogExcel: TSaveDialog;
    cbCheckboxes: TCheckBox;
    BtnExportPdf: TButton;
    BtnExportHTML: TButton;
    SaveDialogPdf: TSaveDialog;
    SaveDialogHtml: TSaveDialog;
    cbHyperlinks: TCheckBox;
    DataGrid: TTMSFNCDataGrid;
    ExcelExport: TTMSFNCDataGridExcelExport;
    BitmapContainer: TTMSFNCBitmapContainer;
    procedure FormCreate(Sender: TObject);

    procedure BtnExportExcelClick(Sender: TObject);
    procedure BtnAboutClick(Sender: TObject);
    procedure BtnExportPdfClick(Sender: TObject);
    procedure BtnExportHTMLClick(Sender: TObject);
  private
    procedure SetExportOptions;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

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
  DataGrid.Colors[2, 3] := clYellow;

  DataGrid.MergeCells(0, 8, DataGrid.ColumnCount - 1, 1);
  DataGrid.Cells[0, 8] := 'This is a merged cell across the grid';

  DataGrid.MergeCells(4, 2, 4, 6);

  bmp := TTMSFNCBitmap.CreateFromFile('..\..\slr.jpg');
  try
    DataGrid.AddBitmap(4, 2, bmp);
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


  DataGrid.Colors[2, 5] := clRed;
  DataGrid.Layouts[3, 5].Fill.Kind := gfkGradient;
  DataGrid.Layouts[3, 5].Fill.GradientType := gfgtLinear;
  DataGrid.Layouts[3, 5].Fill.Color := clNavy;
  DataGrid.Layouts[3, 5].Fill.ColorTo := clYellow;



  DataGrid.RowHeights[15] := 60;

  DataGrid.Cells[5, 12] := 'A cell <a href="https://www.tmssoftware.com" title="TMS software">hyperlink</a>';
  DataGrid.Cells[5, 13] := 'https://www.tmssoftware.com';

  DataGrid.AddButton(5, 15, 'Press me');
end;


procedure TMainForm.SetExportOptions;
begin
    ExcelExport.ExportOptions.CellSizes := cbCellSizes.Checked;
    ExcelExport.ExportOptions.Formulas := cbFormulas.Checked;
    ExcelExport.ExportOptions.CellsAsStrings := cbCellsAsStrings.Checked;
    ExcelExport.ExportOptions.CellFormatting := cbFormatting.Checked;
    ExcelExport.ExportOptions.WordWrapped := cbWordWrapped.Checked;
    ExcelExport.ExportOptions.RawHTML := cbRawHTML.Checked;
    ExcelExport.ExportOptions.Images := cbImages.Checked;
    ExcelExport.ExportOptions.Checkboxes := cbCheckboxes.Checked;
    ExcelExport.ExportOptions.HiddenColumns := cbHiddenColumns.Checked;
    ExcelExport.ExportOptions.HiddenRows := cbHiddenRows.Checked;
    ExcelExport.ExportOptions.HardBorders := cbHardBorders.Checked;
    ExcelExport.ExportOptions.ShowGridLines := cbShowGridLines.Checked;
    ExcelExport.ExportOptions.CellMargins := cbCellMargins.Checked;
    ExcelExport.ExportOptions.ReadonlyCellsAsLocked := cbReadOnlyToLocked.Checked;
    ExcelExport.ExportOptions.Outlines := cbOutlines.Checked;
    ExcelExport.ExportOptions.SummaryRowsBelowDetail := cbSummaryRowsBelow.Checked;
    ExcelExport.ExportOptions.UseExcelStandardColorPalette := cbStandardPalette.Checked;
    if cbHyperlinks.Checked then
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
