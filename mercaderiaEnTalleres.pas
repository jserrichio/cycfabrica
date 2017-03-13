unit mercaderiaEnTalleres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  TFMercaderiaEnTaller = class(TForm)
    fmercaderiaEnTalleres: TDBGrid;
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
    RadioGroup2: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure fmercaderiaEnTalleresDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure confirmarCorte;
    procedure filtroMercaderia;
  public
    { Public declarations }
  end;

var
  FMercaderiaEnTaller: TFMercaderiaEnTaller;

implementation

uses datamodule, confirmarCorte;

{$R *.dfm}


procedure TFMercaderiaEnTaller.Button1Click(Sender: TObject);
begin
self.Close;
end;

procedure TFMercaderiaEnTaller.Button2Click(Sender: TObject);
begin
self.confirmarCorte;

end;

procedure TFMercaderiaEnTaller.confirmarCorte;
begin
    fConfirmarCorte.setCorte(datamodule1.QMercaderia.FieldByName('id_corte').Asinteger);
    fConfirmarCorte.ShowModal;
    self.filtroMercaderia;
end;


procedure TFMercaderiaEnTaller.filtroMercaderia;
begin
    if RadioGroup1.ItemIndex = 0 then
  begin
    // buscar sin filtro
    datamodule1.QMercaderia.Active := false;
    datamodule1.QMercaderia.SQL.Clear;
    datamodule1.QMercaderia.SQL.Add('select * from corte c ' +
        'inner join taller t on c.id_taller = t.id_taller ' +
        'inner join producto p on p.id_prod = c.id_producto '+
        'where c.cantidad_restante > 0 group by c.id_corte');
    datamodule1.QMercaderia.open;
    datamodule1.QMercaderia.Active := true;
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
        datamodule1.QMercaderia.Active := false;
        datamodule1.QMercaderia.SQL.Clear;
        datamodule1.QMercaderia.SQL.Add('select * from corte c ' +
            'inner join taller t on c.id_taller = t.id_taller ' +
            'inner join producto p on p.id_prod = c.id_producto ' +
            'where c.cantidad_restante > 0 and nombre_taller like ' + QuotedStr('%' + LabeledEdit1.Text + '%')
            + ' group by c.id_corte');
        datamodule1.QMercaderia.open;
        datamodule1.QMercaderia.Active := true;
      end;
    end;
  end;

end;



procedure TFMercaderiaEnTaller.fmercaderiaEnTalleresDblClick(Sender: TObject);
begin
self.confirmarCorte;
end;

procedure TFMercaderiaEnTaller.FormShow(Sender: TObject);
begin
filtroMercaderia;
end;

procedure TFMercaderiaEnTaller.LabeledEdit1Change(Sender: TObject);
begin
self.filtroMercaderia;
end;

procedure TFMercaderiaEnTaller.RadioGroup1Click(Sender: TObject);
begin
self.filtroMercaderia;
end;

end.
