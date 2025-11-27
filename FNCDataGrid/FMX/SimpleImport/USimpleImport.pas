unit USimpleImport;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  System.Rtti, FMX.TMSFNCDataGridCell, FMX.TMSFNCDataGridData,
  FMX.TMSFNCDataGridBase, FMX.TMSFNCDataGridCore, FMX.TMSFNCDataGridRenderer,
  FMX.TMSFNCDataGridExcelImport, FMX.Edit, FMX.StdCtrls,
  FMX.TMSFNCCustomControl, FMX.TMSFNCDataGrid, FMX.Controls.Presentation;

type
  TFSimpleImport = class(TForm)
    BtnAbout: TButton;
    BtnImport: TButton;
    DataGrid: TTMSFNCDataGrid;
    ExcelImport: TTMSFNCDataGridExcelImport;
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    Label1: TLabel;
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
    Label2: TLabel;
    procedure BtnImportClick(Sender: TObject);
    procedure BtnAboutClick(Sender: TObject);
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

{$R *.fmx}

procedure TFSimpleImport.BtnAboutClick(Sender: TObject);
begin
  ShowMessage('This example shows how to use TTMSFNCDataGridExcelImport to import an Excel file into a grid');
end;

procedure TFSimpleImport.SetImportOptions;
begin
  ExcelImport.ImportOptions.Formulas := cbFormulas.IsChecked;
    ExcelImport.ImportOptions.Images := cbImages.IsChecked;
    ExcelImport.ImportOptions.Comments := cbComments.IsChecked;
    ExcelImport.ImportOptions.CellFormatting := cbFormatting.IsChecked;
    ExcelImport.ImportOptions.CellSizes := cbCellSizes.IsChecked;
    ExcelImport.ImportOptions.LockedCellsAsReadonly := cbReadOnlyToLocked.IsChecked;
    ExcelImport.ImportOptions.Html := cbHtml.IsChecked;
    ExcelImport.ImportOptions.Outlines := cbOutlines.IsChecked;
    ExcelImport.ImportOptions.ClearCells := cbClearCells.IsChecked;
    ExcelImport.ImportOptions.ResizeGrid := cbResizeGrid.IsChecked;

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
