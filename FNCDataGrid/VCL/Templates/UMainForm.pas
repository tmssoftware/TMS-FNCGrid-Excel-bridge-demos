unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, Dialogs, System.UITypes,
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  System.Rtti, VCL.TMSFNCDataGridCell, VCL.TMSFNCDataGridData,
  VCL.TMSFNCDataGridBase, VCL.TMSFNCDataGridCore, VCL.TMSFNCDataGridRenderer,
  VCL.TMSFNCDataGridExcelExport, VCL.TMSFNCCustomControl, VCL.TMSFNCDataGrid,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    btnExport: TButton;
    Panel2: TPanel;
    DataGrid: TTMSFNCDataGrid;
    ExcelExport: TTMSFNCDataGridExcelExport;
    procedure btnExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure ExcelExportExportCell(Sender: TObject;
      var Args: TDataGridExportCellEventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnExportClick(Sender: TObject);
var
  Path: string;
  Xls: TXlsFile;
begin
  Path := ExtractFilePath(Application.ExeName) + '..\..\';

  {NOTE: This example uses a "demoTemplate.xls" file that is used as a starting file.
         If you want to embed demoTemplate in your exe (in order to not distribute
		 extra files) you could embed it as a resource into the exe.
	}

  //Open the template.
  Xls := TXlsFile.Create(Path + 'demotemplate.xls', true); //Open the template into an XlsFile object that we will use to export the grid.
  try

    //Export into a an existing sheet, moving rows down.
    Xls.ActiveSheetByName := 'Rows Down';
    ExcelExport.LocationOptions.XlsStartRow := 9;
    ExcelExport.LocationOptions.GridStartRow := 0;
    ExcelExport.LocationOptions.GridStartCol := 0;
    ExcelExport.Export(Xls, TInsertInSheet.InsertRows);

    //Export into a an existing sheet, moving rows down and deleting a row, to be able to use the chart.
    xls.ActiveSheetByName := 'With Chart';
    ExcelExport.LocationOptions.XlsStartRow := 11;
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
  var Args: TDataGridExportCellEventArgs);
var
  fm: TFlxFormat;
begin
  if (Args.GridCol = 2) then
  begin
    fm := Args.CellFormat;
    fm.Format:='##.00';
    Args.CellFormat := fm;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DataGrid.LoadFromCSVData('..\..\populations.txt');
  DataGrid.AutoSizeColumns;
end;

end.
