unit UOnDemandFormatting;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FlexCel.FMXSupport, FlexCel.Core, FlexCel.XlsAdapter, System.Rtti,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCDataGridCell, FMX.TMSFNCDataGridData, FMX.TMSFNCDataGridBase,
  FMX.TMSFNCDataGridCore, FMX.TMSFNCDataGridRenderer,
  FMX.TMSFNCDataGridExcelExport, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.TMSFNCCustomControl, FMX.TMSFNCDataGrid;

type
  TFMainForm = class(TForm)
    SaveDialog: TSaveDialog;
    ExcelExport: TTMSFNCDataGridExcelExport;
    DataGrid: TTMSFNCDataGrid;
    Panel1: TPanel;
    btnExport: TButton;
    btnAbout: TButton;
    btnExportAsStrings: TButton;
    procedure ExcelExportExportCell(Sender: TObject;
      var Args: TDataGridExportCellEventArgs);
    procedure ExcelExportExportComment(Sender: TObject;
      var Args: TDataGridExportCommentEventArgs);
    procedure btnAboutClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnExportAsStringsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure DoExport(const AsString: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainForm: TFMainForm;

implementation

{$R *.fmx}

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


procedure TFMainForm.btnAboutClick(Sender: TObject);
begin
  ShowMessage('This example shows how to convert formatting between the Grid and Excel. '+
    'Excel and FNCDataGrid use incompatible format strings, so you need to tell TMSFNCExcelExport ' +
    'how the formats map.' +#10#10+ 'We also show how you can use an event to format a comment.');
end;

procedure TFMainForm.btnExportAsStringsClick(Sender: TObject);
begin
  DoExport(true);
end;

procedure TFMainForm.btnExportClick(Sender: TObject);
begin
  DoExport(false);
end;

procedure TFMainForm.ExcelExportExportCell(Sender: TObject;
  var Args: TDataGridExportCellEventArgs);
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
  var Args: TDataGridExportCommentEventArgs);
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

procedure TFMainForm.FormCreate(Sender: TObject);
begin
  DataGrid.Floats[1, 1] := 2.7128;
  DataGrid.Floats[1, 2] := 3.1415926;
  DataGrid.Cells[1,3] := '=A2 + 1'; //This formula won't work when exporting as strings.

  DataGrid.Comments[1,2] := 'This cell is formatted in an event';
  DataGrid.Comments[1,3] := 'This formula won''t work when exporting as strings, since you can''t add 1 to a string.';

end;

end.
