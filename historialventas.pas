unit historialventas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  Tfhistorialventas = class(TForm)
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    Panel1: TPanel;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    LabeledEdit1: TLabeledEdit;
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
  private
    procedure filtroVentas;

    { Private declarations }
  public
    { Public declarations }
    procedure eliminarVenta(id: integer);
  end;

var
  fhistorialventas: Tfhistorialventas;

implementation

uses datamodule, venta;
{$R *.dfm}

procedure Tfhistorialventas.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tfhistorialventas.Button3Click(Sender: TObject);
begin
 if MessageDlg('¿Eliminar la venta? Esta operación no se puede deshacer!', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin
    self.eliminarVenta(DataModule1.Qventa.FieldByName('id_venta').AsInteger);
    self.filtroVentas;
  end;

  button3.Enabled:=false;
end;

procedure Tfhistorialventas.DateTimePicker1Change(Sender: TObject);
begin
  self.filtroVentas;
end;

procedure Tfhistorialventas.DateTimePicker2Change(Sender: TObject);
begin
  self.filtroVentas;
end;

procedure Tfhistorialventas.DBGrid1CellClick(Column: TColumn);
begin
button3.Enabled:=true;
end;

procedure Tfhistorialventas.DBGrid1DblClick(Sender: TObject);
begin
  fventa.generarRemito(datamodule1.Qventa.FieldByName('id_venta').AsInteger);
end;

procedure Tfhistorialventas.RadioGroup1Click(Sender: TObject);
begin
  filtroVentas;
end;

procedure tfhistorialventas.eliminarVenta(id: integer);
begin
  //elimino venta actual
  datamodule1.venta.Locate('id_venta',id,[]);
  datamodule1.venta.Edit;
  datamodule1.venta.Delete;
  ShowMessage('Venta n°'+ inttostr(id) + ' eliminada!');



end;


procedure Tfhistorialventas.filtroVentas;
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    // buscar sin filtro
    datamodule1.Qventa.Active := false;
    datamodule1.Qventa.SQL.Clear;
    datamodule1.Qventa.SQL.Add('select * from venta v ' +
        'inner join detalle_venta d on v.id_venta = d.id_venta ' +
        'inner join cliente c on v.id_cliente = c.id_cliente ' +
        'group by v.id_venta order by v.fecha_venta desc');
    datamodule1.Qventa.open;
    datamodule1.Qventa.Active := true;
  end
  else
  begin
    if RadioGroup1.ItemIndex = 1 then
    begin
      // buscar con filtro fechas
      { datamodule1.Qventa.Active := false;
        datamodule1.Qventa.SQL.Clear;
        datamodule1.Qventa.SQL.Add(
        'select * from venta v inner join detalle_venta d on v.id_venta = d.id_venta '
        + 'inner join cliente c on v.id_cliente = c.id_cliente ' +
        'where v.fecha_venta between desde and hasta ' +
        'group by v.id_venta order by v.fecha_venta desc');
        datamodule1.Qventa.Parameters.ParamByName('desde').Value := formatdatetime
        ('c', DateTimePicker1.Datetime);
        datamodule1.Qventa.Parameters.ParamByName('hasta').Value := formatdatetime
        ('c', DateTimePicker2.Datetime);
        datamodule1.Qventa.open;
        datamodule1.Qventa.Active := true; }
    end
    else
    begin
      if RadioGroup1.ItemIndex = 2 then
      begin
        // buscar con filtro cliente
        datamodule1.Qventa.Active := false;
        datamodule1.Qventa.SQL.Clear;
        datamodule1.Qventa.SQL.Add('select * from venta v ' +
            'inner join detalle_venta d on v.id_venta = d.id_venta ' +
            'inner join cliente c on v.id_cliente = c.id_cliente ' +
            'where nombre_cli like ' + QuotedStr('%' + LabeledEdit1.Text + '%')
            + ' group by v.id_venta order by v.fecha_venta desc');
        datamodule1.Qventa.open;
        datamodule1.Qventa.Active := true;
      end;
    end;
  end;
end;

procedure Tfhistorialventas.FormShow(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
  self.filtroVentas;

end;

procedure Tfhistorialventas.LabeledEdit1Change(Sender: TObject);
begin
  self.filtroVentas;
end;

end.
