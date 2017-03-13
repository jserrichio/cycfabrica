unit confirmarCorte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfConfirmarCorte = class(TForm)
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LabeledEdit2: TLabeledEdit;
    GroupBox3: TGroupBox;
    LabeledEdit3: TLabeledEdit;
    GroupBox4: TGroupBox;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
    procedure confirmarCorte;
    procedure limpiarFormulario;
    procedure cargarInfo;
    procedure crearOrdenPlancha;
    procedure incrementarStock;
    procedure validarDatos(var ok: Boolean);

  public
    { Public declarations }

    procedure setCorte(corte: integer);
  end;

var
  fConfirmarCorte: TfConfirmarCorte;
  corteActual: integer;

implementation

uses datamodule, ordenPlancha, cargarstockremeras, cargarstockpantalon,
  cargarstockcinturon, cargarstockninos, cargarstockbolsa, cargarstockmedia,
  cuentaCorriente;
{$R *.dfm}

procedure TfConfirmarCorte.setCorte(corte: integer);
begin
  corteActual := corte;
end;

procedure TfConfirmarCorte.validarDatos(var ok: Boolean);
begin
  ok := false;
  if ((LabeledEdit1.Text <> '') and (LabeledEdit2.Text <> '') and (LabeledEdit3.Text <> '')) then
  begin
    if (strtoint(LabeledEdit1.Text) + strtoint(LabeledEdit3.Text) <= strtoint(LabeledEdit9.Text)) then
      ok := true;
  end;
end;

procedure TfConfirmarCorte.crearOrdenPlancha;
begin
  fordenplancha.setCantidad(strtoint(LabeledEdit1.Text));
  fordenplancha.setNombreProd(labelededit7.Text);
  datamodule1.corte.Locate('id_corte', corteActual, []);
  fordenplancha.setIdProd(datamodule1.corte.FieldByName('id_producto')
      .AsInteger);
  fordenplancha.ShowModal;
end;

procedure TfConfirmarCorte.Button1Click(Sender: TObject);
var
  ok: boolean;
begin
  validarDatos(ok);

  if ok then
  begin
    if MessageDlg('¿Desea confirmar el corte?', mtConfirmation, mbYesNo, 0)
      = mryes then
    begin
      // ##### VERIFICAR QUE LOS CAMPOS OBLIGATORIOS ESTEN COMPLETOS
      if CheckBox1.Checked then
        crearOrdenPlancha;
      if CheckBox2.Checked then
        incrementarStock;
      self.confirmarCorte;

      self.Close;
    end;
  end
  else
  begin
    ShowMessage('verifique los datos ingresados');
  end;
end;

procedure TfConfirmarCorte.incrementarStock;
var
  tipo_actual: string;
begin
  datamodule1.producto.Locate('id_prod',
    datamodule1.corte.FieldByName('id_producto').AsInteger, []);
  tipo_actual := datamodule1.producto.FieldByName('tipo_prod').AsString;
  if tipo_actual = 'remera' then
  begin
    fcargarstockremeras.ShowModal;
    fcargarstockremeras.incrementarStockRemera;
    fcargarstockremeras.limpiarFormulario;
  end
  else
  begin
    if tipo_actual = 'pantalon' then
    begin
      fcargarstockpantalon.ShowModal;
      fcargarstockpantalon.incrementarStockPantalon;
      fcargarstockpantalon.limpiarformulario;
    end
    else
    begin
      if tipo_actual = 'cinturon' then
      begin
        fcargarstockcinturon.ShowModal;
      end
      else
      begin
        if tipo_actual = 'ninos' then
        begin
          fcargarstockninos.ShowModal;
          fcargarstockninos.incrementarStockNinos;
          fcargarstockninos.limpiarformulario;
        end
        else
        begin
          if tipo_actual = 'bolsa' then
          begin
            fcargarstockbolsa.ShowModal;
          end
          else
          begin
            if tipo_actual = 'media' then
            begin
              fcargarstockmedia.ShowModal;
            end;
          end;

        end;
      end;

    end;
  end;

end;

procedure TfConfirmarCorte.limpiarFormulario;
begin
  // vuelve todas las componentes al valor predeterminado
  LabeledEdit1.Text := '0';
  LabeledEdit2.Text := '';
  LabeledEdit3.Text := '0';
end;

procedure TfConfirmarCorte.confirmarCorte;
begin
  // guarda las modificaciones del corte en la BD
  datamodule1.corte.Locate('id_corte', corteActual, []);
  datamodule1.corte_entrega.Append;
  datamodule1.corte_entrega.FieldByName('id_corte').AsInteger := corteActual;
  datamodule1.corte_entrega.FieldByName('controlado_por').AsString :=
    LabeledEdit2.Text;
  datamodule1.corte_entrega.FieldByName('fecha').AsDateTime := Now;
  datamodule1.corte_entrega.FieldByName('cantidad_entregada').AsInteger :=
    strtoint(LabeledEdit1.Text);
  datamodule1.corte_entrega.FieldByName('cantidad_fallada').AsInteger :=
    strtoint(LabeledEdit3.Text);
  datamodule1.corte_entrega.FieldByName('pagar').AsFloat:=strtoint(LabeledEdit1.Text)*datamodule1.corte.FieldByName('costo_unidad').AsFloat;
  datamodule1.corte_entrega.FieldByName('deuda').AsFloat:=strtoint(LabeledEdit1.Text)*datamodule1.corte.FieldByName('costo_unidad').AsFloat;
  datamodule1.corte_entrega.Post;
  datamodule1.corte.Edit;
  datamodule1.corte.FieldByName('cantidad_restante').AsInteger :=
    datamodule1.corte.FieldByName('cantidad_restante').AsInteger - strtoint
    (LabeledEdit1.Text) - strtoint(LabeledEdit3.Text);
  datamodule1.taller.Locate('id_taller',
    datamodule1.corte.FieldByName('id_taller').AsInteger, []);
  datamodule1.corte.Post;
  if datamodule1.taller.FieldByName('saldo_afavor_empresa').AsFloat>0 then
  begin
    fcuentacorriente.cargarTaller;
    fcuentaCorriente.pagarEntregas(datamodule1.taller.FieldByName('id_taller').AsInteger);
  end;

  // ######### STORED PROCEDURE ############
  datamodule1.corte.Locate('id_corte', corteActual, []);
  // Taller al que se le debe actualizar el saldo
  datamodule1.incrementarSaldoTaller.Parameters.ParamByName('idtaller')
    .Value := datamodule1.corte.FieldByName('id_taller').AsInteger;
  // Valor a sumar al saldo actual
  datamodule1.incrementarSaldoTaller.Parameters.ParamByName('saldo').Value :=
    (strtofloat(LabeledEdit1.Text) * datamodule1.corte.FieldByName
      ('costo_unidad').AsFloat);
  datamodule1.incrementarSaldoTaller.ExecProc;
  datamodule1.taller.Refresh;

end;

procedure TfConfirmarCorte.FormShow(Sender: TObject);
begin
  self.cargarInfo;
end;

procedure TfConfirmarCorte.Button2Click(Sender: TObject);
begin
  if MessageDlg('¿Desea salir sin guardar los cambios?', mtConfirmation,
    mbYesNo, 0) = mryes then
  begin

    self.Close;
  end;
end;

procedure TfConfirmarCorte.cargarInfo;
begin
  self.limpiarFormulario;
  datamodule1.corte.Locate('id_corte', corteActual, []);
  datamodule1.taller.Locate('id_taller',
    datamodule1.corte.FieldByName('id_taller').AsInteger, []);
  LabeledEdit4.Text := datamodule1.taller.FieldByName('nombre_taller').AsString;
  datamodule1.producto.Locate('id_prod',
    datamodule1.corte.FieldByName('id_producto').AsInteger, []);
  LabeledEdit7.Text := datamodule1.producto.FieldByName('nombre_prod').AsString;
  LabeledEdit5.Text := DateToStr(datamodule1.corte.FieldByName('fecha')
      .AsDateTime);
  LabeledEdit8.Text := inttostr(datamodule1.corte.FieldByName('cantidad')
      .AsInteger);
  LabeledEdit9.Text := inttostr(datamodule1.corte.FieldByName
      ('cantidad_restante').AsInteger);
end;

procedure TfConfirmarCorte.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    CheckBox2.Checked := false;
    CheckBox2.Enabled := false;
  end
  else
  begin
    CheckBox2.Enabled := true;

  end;
end;

procedure TfConfirmarCorte.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    CheckBox1.Checked := false;
    CheckBox1.Enabled := false;
  end
  else
  begin
    CheckBox1.Enabled := true;

  end;
end;

end.
