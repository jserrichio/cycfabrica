unit historialcortes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  Tfhistorialcortes = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    LabeledEdit1: TLabeledEdit;
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }

    procedure eliminarCorte(corte: integer);
    procedure modificarCorte(corte: integer);
  public
    { Public declarations }
  procedure filtroCortes;
  end;

var
  fhistorialcortes: Tfhistorialcortes;

implementation

uses datamodule, confeccion;
{$R *.dfm}

procedure Tfhistorialcortes.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tfhistorialcortes.Button2Click(Sender: TObject);
begin

  if MessageDlg('¿Desea eliminar el corte? Esta acción no se podrá deshacer',
    mtCustom, [mbYes, mbCancel], 0) = mrYes then
  begin
    self.eliminarCorte(datamodule1.Qcorte.FieldByName('id_corte').AsInteger);

  end;

end;

procedure Tfhistorialcortes.Button3Click(Sender: TObject);
begin
self.modificarCorte(datamodule1.Qcorte.FieldByName('id_corte').asinteger);

end;

procedure Tfhistorialcortes.eliminarCorte(corte: integer);
begin
  datamodule1.corte.Locate('id_corte', corte, []);
  if datamodule1.corte.FieldByName('cantidad').AsInteger=datamodule1.corte.FieldByName('cantidad_restante').AsInteger then
  begin
    datamodule1.corte.Delete;
    self.filtroCortes;
  end else begin
    ShowMessage('Este corte no se puede borrar porque fue confirmado o está en proceso de confirmación');
  end;

end;

procedure tfhistorialcortes.modificarCorte(corte: Integer);
begin
  fconfeccion.setmodificar;
  fconfeccion.cargarcorte(corte);
  fconfeccion.ShowModal;
end;

procedure Tfhistorialcortes.DBGrid1CellClick(Column: TColumn);
begin
  Button2.Enabled := true;
  button3.Enabled:=true;
end;

procedure Tfhistorialcortes.DBGrid1DblClick(Sender: TObject);
begin
  fconfeccion.generarRemitocorte(datamodule1.Qcorte.FieldByName('id_corte')
      .AsInteger);

end;

procedure Tfhistorialcortes.filtroCortes;
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    // buscar sin filtro
    datamodule1.Qcorte.Active := false;
    datamodule1.Qcorte.SQL.Clear;
    datamodule1.Qcorte.SQL.Add('select * from corte c ' +
        'inner join taller t on c.id_taller = t.id_taller ' +
        'inner join producto p on p.id_prod = c.id_producto ' +
        'group by c.id_corte order by c.fecha desc');
    datamodule1.Qcorte.open;
    datamodule1.Qcorte.Active := true;
  end
  else
  begin
    if RadioGroup1.ItemIndex = 1 then
    begin
      // buscar con filtro fechas
      { datamodule1.Qcorte.Active := false;
        datamodule1.Qcorte.SQL.Clear;
        datamodule1.Qcorte.SQL.Add(
        'select * from venta v inner join detalle_venta d on v.id_venta = d.id_venta '
        + 'inner join cliente c on v.id_cliente = c.id_cliente ' +
        'where v.fecha_venta between desde and hasta ' +
        'group by v.id_venta order by v.fecha_venta desc');
        datamodule1.Qcorte.Parameters.ParamByName('desde').Value := formatdatetime
        ('c', DateTimePicker1.Datetime);
        datamodule1.Qcorte.Parameters.ParamByName('hasta').Value := formatdatetime
        ('c', DateTimePicker2.Datetime);
        datamodule1.Qcorte.open;
        datamodule1.Qcorte.Active := true; }
    end
    else
    begin
      if RadioGroup1.ItemIndex = 2 then
      begin
        // buscar con filtro taller
        datamodule1.Qcorte.Active := false;
        datamodule1.Qcorte.SQL.Clear;
        datamodule1.Qcorte.SQL.Add('select * from corte c ' +
            'inner join taller t on c.id_taller = t.id_taller ' +
            'inner join producto p on p.id_prod = c.id_producto '+
            'where nombre_taller like ' + QuotedStr
            ('%' + LabeledEdit1.Text + '%') + ' group by c.id_corte');
        datamodule1.Qcorte.open;
        datamodule1.Qcorte.Active := true;
      end;
    end;
  end;

end;

procedure Tfhistorialcortes.FormShow(Sender: TObject);
begin
  Button2.Enabled := false;
  self.filtroCortes;
end;

procedure Tfhistorialcortes.LabeledEdit1Change(Sender: TObject);
begin
  self.filtroCortes;
end;

procedure Tfhistorialcortes.RadioGroup1Click(Sender: TObject);
begin
  self.filtroCortes;
end;

end.
