unit cuentaCorriente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TfcuentaCorriente = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    LabeledEdit1: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Panel3: TPanel;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    GroupBox7: TGroupBox;
    LabeledEdit5: TLabeledEdit;
    GroupBox8: TGroupBox;
    LabeledEdit6: TLabeledEdit;
    Panel4: TPanel;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel5: TPanel;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    GroupBox11: TGroupBox;
    LabeledEdit8: TLabeledEdit;
    Button3: TButton;
    Panel6: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    DBGrid3: TDBGrid;
    Panel7: TPanel;
    DBGrid4: TDBGrid;
    Panel8: TPanel;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    DateTimePicker7: TDateTimePicker;
    DateTimePicker8: TDateTimePicker;
    GroupBox15: TGroupBox;
    LabeledEdit11: TLabeledEdit;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    LabeledEdit13: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure LabeledEdit1Change(Sender: TObject);
    procedure LabeledEdit1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure LabeledEdit8Click(Sender: TObject);
    procedure LabeledEdit8Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure LabeledEdit5Change(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);

    procedure Button5Click(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Button6Click(Sender: TObject);

  private
    { Private declarations }
    procedure limpiarFormulario;

    function calcularCobradoTaller: double;
    function calcularFacturadoTaller: double;
    function calcularPagadoCliente: double;
    function calcularAdeudadoCliente: double;
    procedure eliminarCobro;
    procedure eliminarPago;

  public
    { Public declarations }
    procedure actualizarSaldoTallerres;
    procedure actualizarSaldoClientes;
    procedure cargarCliente;
    procedure cargarPagos;
    procedure cargarCobros;
    procedure cargarTaller;
    procedure pagarRemitos(var clienteActual: integer);
    procedure pagarEntregas(tallerActual: integer);

  end;

var
  fcuentaCorriente: TfcuentaCorriente;

implementation

uses datamodule, verclientes, ingresarPago, vertalleres, reporteCCTaller,
  reportePagosTaller;
{$R *.dfm}

procedure TfcuentaCorriente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  limpiarFormulario;
end;

procedure TfcuentaCorriente.FormShow(Sender: TObject);
begin
  self.limpiarFormulario;
end;

procedure TfcuentaCorriente.LabeledEdit1Change(Sender: TObject);
begin
  cargarCliente;
  Button1.Enabled := true;
end;

procedure TfcuentaCorriente.limpiarFormulario;
begin
  LabeledEdit1.Text := 'Todos los clientes';
  Label1.Caption := 'Todos los clientes';
  // Cargar todos los remitos pendientes de todos los clientes
  datamodule1.QCCCliente.Active := false;
  datamodule1.QCCCliente.SQL.Clear;
  datamodule1.QCCCliente.SQL.Add('select * from venta v ' +
      'inner join detalle_venta d on v.id_venta = d.id_venta ' +
      'inner join cliente c on v.id_cliente = c.id_cliente ' +
      'where v.cc = 1 group by v.id_venta order by v.fecha_venta desc');
  datamodule1.QCCCliente.open;
  datamodule1.QCCCliente.Active := true;
  // cargar todos los pagos de todos los clientes
  datamodule1.Qpagos.Active := false;
  datamodule1.Qpagos.SQL.Clear;
  datamodule1.Qpagos.SQL.Add('select * from pago p ' +
      'inner join cliente c on p.id_cliente = c.id_cliente order by p.id_pago desc');
  datamodule1.Qpagos.open;
  datamodule1.Qpagos.Active := true;


  LabeledEdit2.Text := '0';

  //Deshabilito boton de ingresar pago / cobro
  Button1.Enabled := false;
  Button3.Enabled := false;
  button9.Enabled:= false;

  // Cargo todos los remitos pendientes de todos los talleres
  DBGrid3.DataSource := datamodule1.dsqcctaller;
  labelededit13.Text:= '0';
  labelededit7.Text:='0';
  labelededit8.Text:= 'Todos los talleres';
  labelededit11.Text:= 'Todos los talleres';
  Label9.Caption := LabeledEdit8.Text;
  datamodule1.QCCTaller.Active := false;
  datamodule1.QCCTaller.SQL.Clear;
  datamodule1.QCCTaller.SQL.Add('select c.id_corte, c.num_corte, c.costo_unidad, t.id_taller,t.nombre_taller, p.num_prod, p.id_prod,p.nombre_prod, e.id_corte_entrega,e.controlado_por, e.fecha, e.cantidad_entregada, e.cantidad_fallada, e.pagar, e.deuda from corte c ' +
      'inner join taller t on c.id_taller = t.id_taller ' +
      'inner join producto p on p.id_prod = c.id_producto ' +
      'inner join corte_entrega e on c.id_corte = e.id_corte order by e.fecha asc');
  datamodule1.QCCTaller.open;
  datamodule1.QCCTaller.Active := true;


  // Cargo todos los cobros de todos los talleres

  datamodule1.qcobros.Active := false;
  datamodule1.qcobros.SQL.Clear;
  datamodule1.qcobros.SQL.Add('select * from cobro c ' +
      'inner join taller t on t.id_taller = c.id_taller order by c.id_cobro desc');
  datamodule1.qcobros.open;
  datamodule1.qcobros.Active := true;
   Button5.Enabled:=false;
   Button6.Enabled:=false;


  end;

procedure tfcuentacorriente.actualizarSaldoTallerres;
var
aux: double;
begin
 datamodule1.taller.First;
 while not(datamodule1.taller.Eof) do
 begin
 labelededit8.Text:= datamodule1.taller.FieldByName('nombre_taller').AsString;
 //ShowMessage('Actualizando taller: '+datamodule1.taller.FieldByName('nombre_taller').AsString);
 aux:= (Self.calcularFacturadoTaller - Self.calcularCobradoTaller);
 //ShowMessage('Saldo: '+floattostr(aux));
 datamodule1.setSaldoTaller.Parameters.ParamByName('valor').Value := aux;
 datamodule1.setSaldoTaller.Parameters.ParamByName('idtaller').Value:=datamodule1.taller.FieldByName('id_taller').AsInteger;
 datamodule1.setSaldoTaller.ExecProc;
 datamodule1.taller.Refresh;
 //ShowMessage('Taller actualizado: '+datamodule1.taller.FieldByName('nombre_taller').AsString);
 datamodule1.taller.Next;
 end;
end;

procedure tfcuentacorriente.actualizarsaldoclientes;
var
aux: double;
begin
 datamodule1.cliente.First;
 while not(datamodule1.cliente.Eof) do
 begin
 labelededit1.Text:= datamodule1.cliente.FieldByName('nombre_cli').AsString;
 //ShowMessage('Actualizando taller: '+datamodule1.taller.FieldByName('nombre_taller').AsString);
 aux:= (Self.calcularAdeudadoCliente - Self.calcularPagadoCliente);
 //ShowMessage('Saldo: '+floattostr(aux));
 datamodule1.setSaldoCliente.Parameters.ParamByName('valor').Value := aux;
 datamodule1.setSaldoCliente.Parameters.ParamByName('idcliente').Value:=datamodule1.cliente.FieldByName('id_cliente').AsInteger;
 datamodule1.setSaldoCliente.ExecProc;
 datamodule1.cliente.Refresh;
 //ShowMessage('Taller actualizado: '+datamodule1.taller.FieldByName('nombre_taller').AsString);
 datamodule1.cliente.Next;
 end;
end;

procedure TfcuentaCorriente.Button1Click(Sender: TObject);
begin
  fingresarPago.setPago;
  fingresarPago.ShowModal;
end;

procedure TfcuentaCorriente.cargarPagos;
begin
  datamodule1.Qpagos.Active := false;
  datamodule1.Qpagos.SQL.Clear;
  datamodule1.Qpagos.SQL.Add('select * from pago p ' +
      'inner join cliente c on p.id_cliente = c.id_cliente where c.nombre_cli ='
      + quotedstr(LabeledEdit1.Text) + ' order by p.id_pago desc');
  datamodule1.Qpagos.open;
  datamodule1.Qpagos.Active := true;
end;

procedure TfcuentaCorriente.cargarCobros;
begin
  datamodule1.qcobros.Active := false;
  datamodule1.qcobros.SQL.Clear;
  datamodule1.qcobros.SQL.Add(
    'select * from cobro c inner join taller t on c.id_taller = t.id_taller' +
      ' where t.nombre_taller like' + quotedstr(LabeledEdit8.Text)
      + ' order by c.id_cobro desc');
  datamodule1.qcobros.open;
  datamodule1.qcobros.Active := true;
end;




procedure TfcuentaCorriente.cargarTaller;
begin
  // buscar con filtro cliente
  datamodule1.QCCTaller.Active := false;
  datamodule1.QCCTaller.SQL.Clear;
  datamodule1.QCCTaller.SQL.Add('select c.id_corte, c.num_corte, c.costo_unidad, t.id_taller,t.nombre_taller, p.num_prod, p.id_prod,p.nombre_prod, e.id_corte_entrega,e.controlado_por, e.fecha, e.cantidad_entregada, e.cantidad_fallada, e.pagar, e.deuda from corte c ' +
      'inner join taller t on c.id_taller = t.id_taller ' +
      'inner join producto p on p.id_prod = c.id_producto ' +
      'inner join corte_entrega e on c.id_corte = e.id_corte where nombre_taller = ' + quotedstr(LabeledEdit8.Text) +' order by e.fecha asc');
  datamodule1.QCCTaller.open;
  datamodule1.QCCTaller.Active := true;
  label9.Caption := LabeledEdit8.Text;
  self.cargarCobros;
  //ShowMessage('el taller facturo $ ' +floattostr(calcularFacturadoTaller));
  //ShowMessage('el taller cobro $ ' +floattostr(calcularCobradoTaller));
  labelededit13.Text:= floattostr(Self.calcularFacturadoTaller - Self.calcularCobradoTaller);
  labelededit7.Text:= labelededit13.Text;
  button3.Enabled:=true;
  button8.enabled:=true;
end;

procedure TfcuentaCorriente.DBGrid2CellClick(Column: TColumn);
begin
Button9.Enabled:=true;
end;

procedure TfcuentaCorriente.DBGrid2DblClick(Sender: TObject);
begin
  fingresarPago.imprimirRemitoPago(datamodule1.Qpagos.FieldByName('id_pago')
      .AsInteger);
end;

procedure TfcuentaCorriente.DBGrid4CellClick(Column: TColumn);
begin
button7.Enabled:=true;
end;

procedure TfcuentaCorriente.DBGrid4DblClick(Sender: TObject);
begin
  fingresarPago.imprimirRemitoCobro(datamodule1.qcobros.FieldByName('id_cobro')
      .AsInteger);

end;

procedure TfcuentaCorriente.Button3Click(Sender: TObject);
begin
  fingresarPago.setCobro;
  fingresarPago.ShowModal;
end;

procedure TfcuentaCorriente.Button5Click(Sender: TObject);
begin
 fReporteCCTaller.QRLabel11.Caption:=floattostr(self.calcularFacturadoTaller);
 if MessageDlg('¿Desea imprimir el informe?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin

    if MessageDlg('¿Desea imprimir un duplicado del informe?', mtCustom,
      [mbYes, mbCancel], 0) = mrYes then
    begin
      fReporteCCTaller.QuickRep1.PrinterSettings.Copies := 2;
    end
    else
    begin
      fReporteCCTaller.QuickRep1.PrinterSettings.Copies := 1;
    end;
    fReporteCCTaller.QuickRep1.print;
 end;
 fReporteCCTaller.QuickRep1.Preview;

end;

procedure TfcuentaCorriente.Button6Click(Sender: TObject);
begin
 FReportePagosTaller.QRLabel6.Caption:=floattostr(self.calcularCobradoTaller);
 if MessageDlg('¿Desea imprimir el informe?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin

    if MessageDlg('¿Desea imprimir un duplicado del informe?', mtCustom,
      [mbYes, mbCancel], 0) = mrYes then
    begin
      fReportePagosTaller.QuickRep1.PrinterSettings.Copies := 2;
    end
    else
    begin
      fReportePagosTaller.QuickRep1.PrinterSettings.Copies := 1;
    end;

    fReportePagosTaller.QuickRep1.print;
 end;
 fReportePagosTaller.QuickRep1.Preview;

end;

procedure TfcuentaCorriente.Button7Click(Sender: TObject);
begin
if MessageDlg('¿Eliminar el cobro? Esta operación no se puede deshacer!', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin
    self.eliminarCobro;
    self.cargarTaller;
  end;
end;

procedure TfcuentaCorriente.Button9Click(Sender: TObject);
begin
if MessageDlg('¿Eliminar el pago? Esta operación no se puede deshacer!', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin
    self.eliminarPago;
    self.cargarCliente;
  end;

end;

procedure tfcuentacorriente.eliminarPago;
begin

  DataModule1.pago.Locate('id_pago',DataModule1.Qpagos.FieldByName('id_pago').AsInteger,[]);
  datamodule1.pago.Edit;
  datamodule1.pago.Delete;

  ShowMessage('pago eliminado!');

end;

procedure tfcuentacorriente.eliminarCobro;
begin

  DataModule1.cobro.Locate('id_cobro',DataModule1.QCobros.FieldByName('id_cobro').AsInteger,[]);
  datamodule1.cobro.Edit;
  datamodule1.cobro.Delete;

  ShowMessage('cobro eliminado!');
end;

procedure TfcuentaCorriente.cargarCliente;
begin
  // buscar con filtro cliente
  datamodule1.QCCCliente.Active := false;
  datamodule1.QCCCliente.SQL.Clear;
  datamodule1.QCCCliente.SQL.Add('select * from venta v ' +
      'inner join detalle_venta d on v.id_venta = d.id_venta ' +
      'inner join cliente c on v.id_cliente = c.id_cliente ' +
      'where nombre_cli = ' + quotedstr(LabeledEdit1.Text) +
      'and v.cc = 1 group by v.id_venta order by v.fecha_venta desc');
  datamodule1.QCCCliente.open;
  datamodule1.QCCCliente.Active := true;
  self.cargarPagos;
  Label2.Caption := LabeledEdit1.Text;
  // completar saldo cliente
  //ShowMessage('el cliente adeuda $ ' +floattostr(calcularAdeudadoCliente));
  //ShowMessage('el taller pago $ ' +floattostr(calcularPagadoCliente));

  labelededit2.Text:=   formatfloat('#####0.00', self.calcularAdeudadoCliente-self.calcularPagadoCliente);
  LabeledEdit6.Text := LabeledEdit2.Text;

end;

function TfcuentaCorriente.calcularFacturadoTaller;
var total: double;
begin
// Suma todos los remitos entregados del taller
  total:=0;


  if not(datamodule1.QCCTaller.IsEmpty) then
  begin
    datamodule1.QCCTaller.First;
    while not datamodule1.QCCTaller.Eof do
    begin
      total := total
          + datamodule1.QCCTaller.FieldByName('pagar').AsFloat;
      datamodule1.QCCTaller.Next;

    end;

  end;
  Result:= total;
end;

function Tfcuentacorriente.calcularPagadoCliente;
// Suma todos los pagos realizados del cliente
var
  total: double;
begin
    total:=0;


  if not(datamodule1.Qpagos.IsEmpty) then
  begin
    datamodule1.Qpagos.First;
    while not datamodule1.Qpagos.Eof do
    begin
      total := total
          + datamodule1.Qpagos.FieldByName('monto').AsFloat;
      datamodule1.Qpagos.Next;

    end;

  end;
  Result:= total;
end;

function tfcuentacorriente.calcularAdeudadoCliente;
var total: double;
begin
// Suma todos los remitos del cliente
  total:=0;


  if not(datamodule1.QCCCliente.IsEmpty) then
  begin
    datamodule1.QCCCliente.First;
    while not datamodule1.QCCCliente.Eof do
    begin
      total := total
          + datamodule1.QCCCliente.FieldByName('subtotal').AsFloat;
      datamodule1.QCCCliente.Next;

    end;

  end;
  Result:= total;
end;



function TfcuentaCorriente.calcularCobradoTaller;
// Suma todos los pagos realizados al taller
var
  total: double;
begin
    total:=0;


  if not(datamodule1.Qcobros.IsEmpty) then
  begin
    datamodule1.Qcobros.First;
    while not datamodule1.Qcobros.Eof do
    begin
      total := total
          + datamodule1.Qcobros.FieldByName('monto').AsFloat;
      datamodule1.Qcobros.Next;

    end;

  end;
  Result:= total;
end;



procedure TfcuentaCorriente.LabeledEdit1Click(Sender: TObject);
begin
  fverclientes.ShowModal;
  LabeledEdit1.Text := datamodule1.cliente.FieldByName('nombre_cli').AsString;
  LabeledEdit5.Text := LabeledEdit1.Text;
end;

procedure TfcuentaCorriente.LabeledEdit5Change(Sender: TObject);
begin
  cargarPagos;
end;

procedure TfcuentaCorriente.LabeledEdit8Change(Sender: TObject);
begin
  cargarTaller;
end;

procedure TfcuentaCorriente.LabeledEdit8Click(Sender: TObject);
begin
  fvertalleres.setTodos;
  fvertalleres.ShowModal;
  LabeledEdit8.Text := datamodule1.taller.FieldByName('nombre_taller').AsString;
  labelededit11.Text:= labelededit8.text;
  button5.Enabled:=true;
  button6.Enabled:=true;

end;

procedure TfcuentaCorriente.pagarRemitos(var clienteActual: integer);
begin
  // METODO NO UTILIZADO A PARTIR DEL 27/5/15
  // AHORA SE CALCULA EN EJECUCION

  { ##########################

    Al ingresar un pago sala las facturas que son posibles y deja en positivo el saldo en caso
    de no exisitir mas facturas.-

    ##########################
    Metodo extraido de "la colina"

    }
  datamodule1.cliente.Refresh;
  datamodule1.cliente.Locate('id_cliente', clienteActual, []);
  if not datamodule1.QCCCliente.IsEmpty then
  begin
    // hay remitos pendientes
    datamodule1.QCCCliente.First;
    // ShowMessage('pagar remitos del cliente '+ datamodule1.cliente.FieldByName('nombre_cli').AsString);
    // showmessage('saldo del cliente: '+ floattostr(datamodule1.cliente.FieldByName('saldo').AsFloat));
    while ((datamodule1.cliente.FieldByName('saldo').AsFloat > 0) and
        (not datamodule1.QCCCliente.Eof)) do
    begin
      // el cliente tiene saldo positivo
      datamodule1.venta.Locate('id_venta',
        datamodule1.QCCCliente.FieldByName('id_venta').AsInteger, []);
      if datamodule1.cliente.FieldByName('saldo')
        .AsFloat > datamodule1.venta.FieldByName('deuda').AsFloat then
      // se salda por completo un remito
      begin
        datamodule1.cliente.Edit;
        datamodule1.cliente.FieldByName('saldo').AsFloat :=
          datamodule1.cliente.FieldByName('saldo')
          .AsFloat - datamodule1.venta.FieldByName('deuda').AsFloat;
        datamodule1.cliente.Post;
        datamodule1.venta.Edit;
        datamodule1.venta.FieldByName('deuda').AsFloat := 0;
        datamodule1.venta.Post;
      end
      else
      begin
        // cliente con saldo menor que deuda de remito actual
        datamodule1.venta.Edit;
        datamodule1.venta.FieldByName('deuda').AsFloat :=
          datamodule1.venta.FieldByName('deuda')
          .AsFloat - datamodule1.cliente.FieldByName('saldo').AsFloat;
        datamodule1.venta.Post;
        datamodule1.cliente.Edit;
        datamodule1.cliente.FieldByName('saldo').AsFloat := 0;
        datamodule1.cliente.Post;
      end;
      datamodule1.QCCCliente.Next;
    end;

  end;
end;

procedure TfcuentaCorriente.pagarEntregas(tallerActual: integer);
begin
  // METODO NO UTILIZADO A PARTIR DEL 27/5/15
  // AHORA SE CALCULA EN EJECUCION

  { ##########################

    Al ingresar un pago sala las facturas que son posibles y deja en positivo el saldo en caso
    de no exisitir mas facturas.-

    ##########################
    Metodo extraido de "la colina"

    }
  datamodule1.taller.Refresh;
  datamodule1.taller.Locate('id_taller', tallerActual, []);
  if not datamodule1.QCCTaller.IsEmpty then
  begin
    // hay remitos pendientes
    datamodule1.QCCTaller.First;
    // ShowMessage('pagar remitos del cliente '+ datamodule1.cliente.FieldByName('nombre_cli').AsString);
    // showmessage('saldo del cliente: '+ floattostr(datamodule1.cliente.FieldByName('saldo').AsFloat));
    while ((datamodule1.taller.FieldByName('saldo_afavor_empresa').AsFloat > 0)
        and (not datamodule1.QCCTaller.Eof)) do
    begin
      // el cliente tiene saldo positivo
      datamodule1.corte_entrega.Locate('id_corte_entrega',
        datamodule1.QCCTaller.FieldByName('id_corte_entrega')
          .AsInteger, []);
      if datamodule1.taller.FieldByName('saldo_afavor_empresa')
        .AsFloat > datamodule1.corte_entrega.FieldByName('deuda').AsFloat then
      // se salda por completo un remito
      begin
        datamodule1.taller.Edit;
        datamodule1.taller.FieldByName('saldo_afavor_empresa').AsFloat :=
          datamodule1.taller.FieldByName('saldo_afavor_empresa')
          .AsFloat - datamodule1.corte_entrega.FieldByName('deuda').AsFloat;
        datamodule1.taller.Post;
        datamodule1.corte_entrega.Edit;
        datamodule1.corte_entrega.FieldByName('deuda').AsFloat := 0;
        datamodule1.corte_entrega.Post;
      end
      else
      begin
        // cliente con saldo menor que deuda de remito actual
        datamodule1.corte_entrega.Edit;
        datamodule1.corte_entrega.FieldByName('deuda').AsFloat :=
          datamodule1.corte_entrega.FieldByName('deuda')
          .AsFloat - datamodule1.taller.FieldByName('saldo_afavor_empresa')
          .AsFloat;
        datamodule1.corte_entrega.Post;
        datamodule1.taller.Edit;
        datamodule1.taller.FieldByName('saldo_afavor_empresa').AsFloat := 0;
        datamodule1.taller.Post;
      end;
      datamodule1.QCCTaller.Next;
    end;

  end;
end;

end.
