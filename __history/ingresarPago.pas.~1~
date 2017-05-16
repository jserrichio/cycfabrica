unit ingresarPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TfingresarPago = class(TForm)
    Panel1: TPanel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    LabeledEdit4: TLabeledEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    LabeledEdit5: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    procedure registrarPago;
    procedure registrarCobro;
    procedure limpiarFormulario;

    { Private declarations }
  public
    { Public declarations }
    procedure setPago;
    procedure setCobro;
    procedure imprimirRemitoPago(id_pago: integer);
    procedure imprimirRemitoCobro(id_cobro: integer);
  end;

var
  fingresarPago: TfingresarPago;
  pago: boolean;

implementation

uses datamodule, cuentaCorriente, remitoPago, remitoCobro;
{$R *.dfm}

procedure TfingresarPago.setPago;
begin
  pago := true;
end;

procedure TfingresarPago.setCobro;
begin
  pago := false;
end;

procedure TfingresarPago.Button1Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex <> 0 then
  begin
    if pago then
      registrarPago
    else
      registrarCobro
  end
  else
  begin
    ShowMessage('Ingrese la forma de pago');
  end;
end;

procedure TfingresarPago.Button2Click(Sender: TObject);
begin
  self.limpiarFormulario;
  self.close;
end;

procedure TfingresarPago.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex = 2 then
  begin
    LabeledEdit1.Enabled := true;
    LabeledEdit2.Enabled := true;
    LabeledEdit4.Enabled := true;
  end;
end;

procedure TfingresarPago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.limpiarFormulario;
end;

procedure TfingresarPago.limpiarFormulario;
begin
  ComboBox1.ItemIndex := 0;
  LabeledEdit3.Text := '0';
  LabeledEdit2.Text := '';
  LabeledEdit1.Text := '';
  LabeledEdit4.Text := '';
  LabeledEdit1.Enabled := false;
  LabeledEdit2.Enabled := false;
  LabeledEdit4.Enabled := false;

end;

procedure TfingresarPago.registrarPago;
var
  clienteActual: integer;
begin
  try
    // GUARDO UN PAGO EN LA TABLA PAGOS  --> DEL CLIENTE A LA EMPRESA
    clienteActual := datamodule1.cliente.FieldByName('id_cliente').AsInteger;
    datamodule1.pago.Append;
    if ComboBox1.ItemIndex = 1 then
    begin
      datamodule1.pago.FieldByName('forma_de_pago').Asstring := 'efectivo';
    end
    else
    begin
      datamodule1.pago.FieldByName('forma_de_pago').Asstring := 'cheque';

      datamodule1.pago.FieldByName('fecha_cheque').AsDateTime :=
        DateTimePicker1.Date;
      datamodule1.pago.FieldByName('dias').AsInteger := strtoint
        (LabeledEdit4.Text);
      datamodule1.pago.FieldByName('banco').Asstring := LabeledEdit1.Text;
      datamodule1.pago.FieldByName('num_cheque').Asstring := LabeledEdit2.Text;
    end;
    datamodule1.pago.FieldByName('monto').AsFloat := strtofloat
      (LabeledEdit3.Text);
    datamodule1.pago.FieldByName('fecha').AsDateTime := Date;
    datamodule1.pago.FieldByName('id_cliente').AsInteger := clienteActual;
    datamodule1.pago.FieldByName('descripcion').Asstring := LabeledEdit5.Text;
    datamodule1.pago.Post;

    // ACTUALIZO EL SALDO DEL CLIENTE
    fcuentaCorriente.cargarCliente;
    datamodule1.pago.Last;
    self.imprimirRemitoPago(datamodule1.pago.FieldByName('id_pago').AsInteger);
    self.close;
  except
    on EConvertError do
      begin
      ShowMessage('Verifique los datos ingresados');
      //datamodule1.pago.Close;

      end;
  end;

end;

procedure TfingresarPago.imprimirRemitoPago(id_pago: integer);
begin

  datamodule1.qRemitoPago.Active := false;
  datamodule1.qRemitoPago.SQL.Clear;
  datamodule1.qRemitoPago.SQL.Add(
    'select * from pago p inner join cliente c on p.id_cliente = c.id_cliente where id_pago = ' + inttostr(id_pago));
  datamodule1.qRemitoPago.Active := true;
  if MessageDlg('¿Imprimir comprobante de pago', mtCustom, [mbYes, mbCancel],
    0) = mrYes then
  begin
    fremitopago.QuickRep1.PrinterSettings.Copies := 1;
    fremitopago.QuickRep1.Print;
  end;
  fremitopago.QuickRep1.Preview;
end;

procedure TfingresarPago.imprimirRemitoCobro(id_cobro: integer);
begin

  datamodule1.qRemitoPago.Active := false;
  datamodule1.qRemitoPago.SQL.Clear;
  datamodule1.qRemitoPago.SQL.Add(
    'select * from cobro c inner join taller t on t.id_taller = c.id_taller where id_cobro = ' + inttostr(id_cobro));
  datamodule1.qRemitoPago.Active := true;
  if MessageDlg('¿Imprimir comprobante de pago', mtCustom, [mbYes, mbCancel],
    0) = mrYes then
  begin
    fremitocobro.QuickRep1.PrinterSettings.Copies := 1;
    fremitocobro.QuickRep1.Print;
  end;
  fremitocobro.QuickRep1.Preview;
end;

procedure TfingresarPago.registrarCobro;
begin
  // GUARDO UN COBRO EN LA TABLA COBROS --> DE LA EMPRESA AL TALLER
  datamodule1.cobro.Append;
  if ComboBox1.ItemIndex = 1 then
  begin
    datamodule1.cobro.FieldByName('forma_de_pago').Asstring := 'efectivo';

  end
  else
  begin
    datamodule1.cobro.FieldByName('forma_de_pago').Asstring := 'cheque';
    datamodule1.cobro.FieldByName('banco').Asstring := LabeledEdit1.Text;
    datamodule1.cobro.FieldByName('fecha_cheque').AsDateTime :=
      DateTimePicker1.Date;
    datamodule1.cobro.FieldByName('num_cheque').Asstring := LabeledEdit2.Text;
    datamodule1.cobro.FieldByName('dias').AsInteger := strtoint
      (LabeledEdit4.Text);
  end;
  datamodule1.cobro.FieldByName('monto').AsFloat := strtofloat
    (LabeledEdit3.Text);
  datamodule1.cobro.FieldByName('fecha').AsDateTime := Date;
  datamodule1.cobro.FieldByName('id_taller').AsInteger :=
    datamodule1.taller.FieldByName('id_taller').AsInteger;
  datamodule1.cobro.FieldByName('descripcion').Asstring := LabeledEdit5.Text;
  datamodule1.cobro.Post;

  fcuentaCorriente.cargarTaller;
  fcuentaCorriente.cargarCobros;
  self.close;
end;

end.
