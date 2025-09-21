unit UOnDemandFormatting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls,
  System.UITypes,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCGridCell,
  VCL.TMSFNCGridOptions, VCL.TMSFNCGridExcelExport, VCL.TMSFNCCustomControl,
  VCL.TMSFNCCustomScrollControl, VCL.TMSFNCGridData, VCL.TMSFNCCustomGrid,
  VCL.TMSFNCGrid;

type
  TFMainForm = class(TForm)
    Panel1: TPanel;
    btnExport: TButton;
    btnAbout: TButton;
    SaveDialog: TSaveDialog;
    btnExportAsStrings: TButton;
    DataGrid: TTMSFNCGrid;
    ExcelExport: TTMSFNCGridExcelExport;
    procedure ExcelExportExportCell(Sender: TObject;
      var Args: TExportCellEventArgs);
    procedure ExcelExportExportComment(Sender: TObject;
      var Args: TExportCommentEventArgs);
    procedure btnAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnExportAsStringsClick(Sender: TObject);
  private
    procedure DoExport(const AsString: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainForm: TFMainForm;

implementation

{$R *.dfm}

procedure TFMainForm.ExcelExportExportCell(Sender: TObject;
  var Args: TExportCellEventArgs);
var
  Fm: TFlxFormat;
begin
  //We can't modify Args.CellFormat directly
  //So we assign it to a variable.
  Fm := Args.CellFormat;
  if Args.GridRow = 1 then Fm.Format := '$ 0.000'
  else if Args.GridRow = 2 then Fm.Format := '0.00000';

  Args.CellFormat := Fm;

end;

procedure TFMainForm.ExcelExportExportComment(Sender: TObject;
  var Args: TExportCommentEventArgs);
var
  Anchor: TClientAnchor;
begin
 if Args.GridRow = 3 then
 begin
   Args.CommentProperties.ShapeFill := TShapeFill_Create(true, TSolidFill_Create(Colors.Red));

   //Make the box a little bigger
   Anchor := Args.CommentProperties.Anchor;
   Args.CommentProperties.Anchor := TClientAnchor.Create(Anchor.AnchorType, Anchor.Row1, Anchor.Dy1, Anchor.Col1, Anchor.Dx1, Anchor.Row2 + 1, Anchor.Dy2, Anchor.Col2, Anchor.Dx2);
   //We might had done instead: Args.CommentProperties.AutoSize := true; //but it won't resize the way we want.
 end;
end;

procedure TFMainForm.btnAboutClick(Sender: TObject);
begin
  ShowMessage('This example shows how to convert formatting between the Grid and Excel. '+
    'Excel and FNCGrid use incompatible format strings, so you need to tell TMSFNCExcelExport ' +
    'how the formats map.' +#10#10+ 'We also show how you can use an event to format a comment.');
end;

procedure TFMainForm.btnExportAsStringsClick(Sender: TObject);
begin
  //When exporting as strings, numbers will display exactly as they do in the grid,
  //but they won't be "real" numbers, they will be strings. (that can't be used in formulas)
  DoExport(true);
end;


procedure TFMainForm.btnExportClick(Sender: TObject);
begin
  DoExport(false);
end;

procedure TFMainForm.DoExport(const AsString: boolean);
begin
  if not SaveDialog.Execute then exit;
  ExcelExport.ExportOptions.CellsAsStrings := AsString;
  ExcelExport.Export(SaveDialog.FileName);
  if TTMSFNCUtils.Message('Do you want to open the generated file?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    TTMSFNCUtils.OpenFile(SaveDialog.FileName);
  end;
end;


procedure TFMainForm.FormCreate(Sender: TObject);
begin
  DataGrid.FloatFormat := '%.3m';
  DataGrid.Floats[1, 1] := 2.7128;
  DataGrid.FloatFormat := '%.5f';
  DataGrid.Floats[1, 2] := 3.1415926;
  DataGrid.Cells[1,3] := '=A2 + 1'; //This formula won't work when exporting as strings.

  DataGrid.Comments[1,2] := 'This cell is formatted in an event';
  DataGrid.Comments[1,3] := 'This formula won''t work when exporting as strings, since you can''t add 1 to a string.';

end;


end.
