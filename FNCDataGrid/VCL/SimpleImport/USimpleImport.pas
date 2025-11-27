unit USimpleImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, System.UITypes,
  StdCtrls, ExtCtrls, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, System.Rtti, VCL.TMSFNCDataGridCell,
  VCL.TMSFNCDataGridData, VCL.TMSFNCDataGridBase, VCL.TMSFNCDataGridCore,
  VCL.TMSFNCDataGridRenderer, VCL.TMSFNCDataGridExcelImport,
  VCL.TMSFNCCustomControl, VCL.TMSFNCDataGrid;

type
  TFSimpleImport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cbFormatting: TCheckBox;
    cbCellSizes: TCheckBox;
    cbFormulas: TCheckBox;
    cbImages: TCheckBox;
    cbOutlines: TCheckBox;
    cbHTML: TCheckBox;
    cbReadOnlyToLocked: TCheckBox;
    cbClearCells: TCheckBox;
    cbResizeGrid: TCheckBox;
    cbComments: TCheckBox;
    edZoom: TEdit;
    Label1: TLabel;
    BtnAbout: TButton;
    BtnImport: TButton;
    OpenDialog: TOpenDialog;
    DataGrid: TTMSFNCDataGrid;
    ExcelImport: TTMSFNCDataGridExcelImport;
    procedure BtnAboutClick(Sender: TObject);
    procedure BtnImportClick(Sender: TObject);
    procedure edZoomChange(Sender: TObject);
  private
    procedure SetImportOptions;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSimpleImport: TFSimpleImport;

implementation

{$R *.dfm}

procedure TFSimpleImport.BtnAboutClick(Sender: TObject);
begin
  ShowMessage('This example shows how to use TTMSFNCDataGridExcelImport to import an Excel file into a grid');
end;

procedure TFSimpleImport.SetImportOptions;
begin
  ExcelImport.ImportOptions.Formulas := cbFormulas.Checked;
    ExcelImport.ImportOptions.Images := cbImages.Checked;
    ExcelImport.ImportOptions.Comments := cbComments.Checked;
    ExcelImport.ImportOptions.CellFormatting := cbFormatting.Checked;
    ExcelImport.ImportOptions.CellSizes := cbCellSizes.Checked;
    ExcelImport.ImportOptions.LockedCellsAsReadonly := cbReadOnlyToLocked.Checked;
    ExcelImport.ImportOptions.Html := cbHtml.Checked;
    ExcelImport.ImportOptions.Outlines := cbOutlines.Checked;
    ExcelImport.ImportOptions.ClearCells := cbClearCells.Checked;
    ExcelImport.ImportOptions.ResizeGrid := cbResizeGrid.Checked;

    ExcelImport.Zoom := StrToInt(edZoom.Text);
end;

procedure TFSimpleImport.BtnImportClick(Sender: TObject);
begin
  if not OpenDialog.Execute then exit;

  SetImportOptions;
  ExcelImport.Import(OpenDialog.FileName);
end;

procedure TFSimpleImport.edZoomChange(Sender: TObject);
var
  v: integer;
begin
  if not TryStrToInt(edZoom.Text, v) then
  begin
     ShowMessage('Zoom must be an integer number');
     exit;
  end;

  if (v <> 0) and ((v < 10) or (v > 400)) then
  begin
    ShowMessage('Zoom must be 0, or a number between 10 and 400');
    exit;
  end;

end;

end.
