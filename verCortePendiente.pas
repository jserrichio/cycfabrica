unit verCortePendiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TCorte_pendiente = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    LabeledEdit1: TLabeledEdit;
    CheckBox1: TCheckBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    LabeledEdit5: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure cargarCorte;
    procedure limpiarFormulario;
    procedure confeccionarCorteSeleccionado;
  public
    { Public declarations }
    procedure buscar_cortes;
    procedure confirmar_corte(num: integer);
  end;

var
  Corte_pendiente: TCorte_pendiente;

implementation

uses datamodule, confeccion;
{$R *.dfm}

procedure TCorte_pendiente.buscar_cortes;
begin
  if LabeledEdit1.Text = '' then
  begin
    // busco sin filtro
    datamodule1.QCorte_pendiente.SQL.Clear;
    datamodule1.QCorte_pendiente.SQL.Add(
      'select c.id_corte_pend, c.operador, c.fecha_corte_pendiente, c.confeccion, n.id_producto as idn, n.4, n.6, n.8, n.10, n.12, n.14, '
        + 'p.id_producto as idp, p.26, p.28, p.30, p.32, p.34, p.36, p.38, p.40, p.42, p.44, p.46, p.48, p.50, p.52, p.54, p.56, p.58, p.60, ' +
        'r.id_producto as idr, r.xs, r.s, r.m, r.l, r.xl, r.xxl, r.xxl, r.xxxl, '
        +
        '(p.26 + p.28 + p.30 + p.32 + p.34 + p.36 + p.38 + p.40 + p.42 + p.44 + p.46 + p.48 + p.50 + p.52 + p.54 + p.56 + p.58 + p.60) as totalp, '
        +
        '(r.xs + r.s + r.m + r.l + r.xl + r.xxl + r.xxl + r.xxxl) as totalr, '
        +
        '(n.4 + n.6 + n.8 + n.10 + n.12 + n.14) as totaln ' + 'from corte_pend c left join talle_corte_pendiente_n n on c.id_corte_pend=n.id_corte_pendiente ' + 'left join talle_corte_pendiente_p p on c.id_corte_pend=p.id_corte_pendiente ' + 'left join talle_corte_pendiente_r r on c.id_corte_pend=r.id_corte_pendiente ' + 'where c.confeccion=0 ' + 'order by c.id_corte_pend');
    datamodule1.QCorte_pendiente.Open;
    datamodule1.QCorte_pendiente.Active := true;
  end
  else
  begin
    // busco con filtro num de corte
    datamodule1.QCorte_pendiente.SQL.Clear;
    datamodule1.QCorte_pendiente.SQL.Add(
      'select c.id_corte_pend, c.operador, c.fecha_corte_pendiente, c.confeccion, n.id_producto as idn, n.4, n.6, n.8, n.10, n.12, n.14, '
        + 'p.id_producto as idp, p.26, p.28, p.30, p.32, p.34, p.36, p.38, p.40, p.42, p.44, p.46, p.48, p.50, p.52, p.54, p.56, p.58, p.60, ' +
        'r.id_producto as idr, r.xs, r.s, r.m, r.l, r.xl, r.xxl, r.xxl, r.xxxl, '
        +
        '(p.26 + p.28 + p.30 + p.32 + p.34 + p.36 + p.38 + p.40 + p.42 + p.44 + p.46 + p.48 + p.50 + p.52 + p.54 + p.56 + p.58 + p.60) as totalp, '
        +
        '(r.xs + r.s + r.m + r.l + r.xl + r.xxl + r.xxl + r.xxxl) as totalr, '
        +
        '(n.4 + n.6 + n.8 + n.10 + n.12 + n.14) as totaln ' + 'from corte_pend c left join talle_corte_pendiente_n n on c.id_corte_pend=n.id_corte_pendiente ' + 'left join talle_corte_pendiente_p p on c.id_corte_pend=p.id_corte_pendiente ' + 'left join talle_corte_pendiente_r r on c.id_corte_pend=r.id_corte_pendiente ' + 'where c.confeccion=0 and c.id_corte_pend = ' + quotedstr(LabeledEdit1.Text) + 'order by c.id_corte_pend');
    datamodule1.QCorte_pendiente.Open;
    datamodule1.QCorte_pendiente.Active := true;

  end;

end;

procedure TCorte_pendiente.FormShow(Sender: TObject);
begin
  self.limpiarFormulario;
end;

procedure TCorte_pendiente.LabeledEdit1Change(Sender: TObject);
begin
  self.buscar_cortes;
end;

procedure TCorte_pendiente.Button3Click(Sender: TObject);
begin
  self.confeccionarCorteSeleccionado;
end;

procedure TCorte_pendiente.cargarCorte;
begin
  // Carga el N° de corte pendiente
  LabeledEdit4.Text := inttostr(datamodule1.QCorte_pendiente.FieldByName
      ('id_corte_pend').AsInteger);

  // Identifica el tipo de corte
  if datamodule1.QCorte_pendiente.FieldByName('totalp').AsInteger <> 0 then
  begin
    // si es pantalon
    LabeledEdit3.Text := inttostr(datamodule1.QCorte_pendiente.FieldByName
        ('totalp').AsInteger);
    datamodule1.producto.Locate('id_prod',
      datamodule1.QCorte_pendiente.FieldByName('idp').AsInteger, []);
  end
  else
  begin
    // si es remera
    if datamodule1.QCorte_pendiente.FieldByName('totalr').AsInteger <> 0 then
    begin
      LabeledEdit3.Text := inttostr(datamodule1.QCorte_pendiente.FieldByName
          ('totalr').AsInteger);
      datamodule1.producto.Locate('id_prod',
        datamodule1.QCorte_pendiente.FieldByName('idr').AsInteger, []);
    end
    else
    begin
      if datamodule1.QCorte_pendiente.FieldByName('totaln').AsInteger <> 0 then
      begin
        // si es ninños
        LabeledEdit3.Text := inttostr(datamodule1.QCorte_pendiente.FieldByName
            ('totaln').AsInteger);
        datamodule1.producto.Locate('id_prod',
          datamodule1.QCorte_pendiente.FieldByName('idn').AsInteger, []);
      end
    end;
  end;

  // Completa con id y nombre de producto
  LabeledEdit2.Text := datamodule1.producto.FieldByName('nombre_prod').AsString;
  LabeledEdit5.Text := datamodule1.producto.FieldByName('id_prod').AsString;

end;

procedure TCorte_pendiente.DBGrid1CellClick(Column: TColumn);
begin
  cargarCorte;
end;

procedure TCorte_pendiente.DBGrid1DblClick(Sender: TObject);
begin
  self.confeccionarCorteSeleccionado;
end;

procedure TCorte_pendiente.confirmar_corte(num: integer);
begin
  datamodule1.Corte_pendiente.Locate('id_corte_pend', num, []);
  datamodule1.Corte_pendiente.Edit;
  datamodule1.Corte_pendiente.FieldByName('confeccion').AsInteger := 1;
  datamodule1.Corte_pendiente.Post;
  self.buscar_cortes;
end;

procedure TCorte_pendiente.limpiarFormulario;
begin
  LabeledEdit1.Text := '';
  LabeledEdit2.Text := '';
  LabeledEdit3.Text := '';
  LabeledEdit4.Text := '';
  LabeledEdit5.Text := '';
  self.buscar_cortes;

end;

procedure TCorte_pendiente.confeccionarCorteSeleccionado;
begin
  fconfeccion.setCortePendiente;
  fconfeccion.cargarCortePendiente(strtoint(LabeledEdit4.Text),
    strtoint(LabeledEdit5.Text), strtoint(LabeledEdit3.Text));
  fconfeccion.ShowModal;

end;

end.
