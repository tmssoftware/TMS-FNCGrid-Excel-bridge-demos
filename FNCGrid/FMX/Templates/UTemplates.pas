unit UTemplates;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCGridCell, FMX.TMSFNCGridOptions, FMX.StdCtrls,
  FMX.TMSFNCGridExcelExport, FMX.TMSFNCCustomControl,
  FMX.TMSFNCCustomScrollControl, FMX.TMSFNCGridData, FMX.TMSFNCCustomGrid,
  FMX.TMSFNCGrid, FMX.Controls.Presentation, FlexCel.FMXSupport, FlexCel.Core, FlexCel.XlsAdapter;

type
  TMainForm = class(TForm)
    Panel2: TPanel;
    DataGrid: TTMSFNCGrid;
    ExcelExport: TTMSFNCGridExcelExport;
    Panel1: TPanel;
    btnExport: TButton;
    Label1: TLabel;
    procedure btnExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExcelExportExportCell(Sender: TObject;
      var Args: TExportCellEventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.btnExportClick(Sender: TObject);
var
  Path: string;
  Xls: TXlsFile;
begin
  Path:= '..\..\';

  {NOTE: This example uses a "demoTemplate.xls" file that is used as a starting file.
         If you want to embed demoTemplate in your exe (in order to not distribute
		 extra files) you could embed it as a resource into the exe.
	}

  //Open the template.
  Xls := TXlsFile.Create(Path + 'demotemplate.xls', true); //Open the template into an XlsFile object that we will use to export the grid.
  try

    //Export into a an existing sheet, moving rows down.
    Xls.ActiveSheetByName := 'Rows Down';
    ExcelExport.LocationOptions.XlsStartRow :=9;
    ExcelExport.Export(Xls, TInsertInSheet.InsertRows);

    //Export into a an existing sheet, moving rows down and deleting a row, to be able to use the chart.
    xls.ActiveSheetByName := 'With Chart';
    ExcelExport.LocationOptions.XlsStartRow :=11;
    ExcelExport.Export(Xls, TInsertInSheet.InsertRowsExceptFirstAndSecond);

    //Finally save the file. We could do extra manipulation here.
    Xls.Save(Path + 'result.xls');
  finally
    Xls.Free;
  end;

  if TTMSFNCUtils.Message('Do you want to open the generated file?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
   TTMSFNCUtils.OpenFile(Path + 'result.xls');
end;

procedure TMainForm.ExcelExportExportCell(Sender: TObject;
  var Args: TExportCellEventArgs);
var
  fm: TFlxFormat;
begin
  if (Args.GridCol = 3) then
  begin
    fm := Args.CellFormat;
    fm.Format:='##.00';
    Args.CellFormat := fm;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DataGrid.LoadFromCSV('..\..\populations.txt');
  DataGrid.AutoSizeColumns(false);
end;

end.
