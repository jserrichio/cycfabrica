unit confeccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, ExtCtrls, CheckLst;

type
  Tfconfeccion = class(TForm)
    Panel_avios: TPanel;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Button1: TButton;
    Button4: TButton;
    botones: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    StringGrid1: TStringGrid;
    Panel_productos: TPanel;
    GroupBox3: TGroupBox;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    Button7: TButton;
    Button8: TButton;
    LabeledEdit4: TLabeledEdit;
    GroupBox2: TGroupBox;
    CheckListBox1: TCheckListBox;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LabeledEdit6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LabeledEdit2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure LabeledEdit4Exit(Sender: TObject);
    procedure LabeledEdit7Exit(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure cancelarConfeccion;
    procedure confirmarConfeccion;
    procedure eliminarAvio;
    procedure agregarAvioAlGrid;
    procedure completarStringGridAvio;

    procedure limpiarstringgrid;
    procedure cumpleCondicionesConfeccion;
    procedure guardarconfeccion;
    procedure guardarDetallesCorte(producto_actual: Integer;
      corte_actual: Integer);
    procedure calcularTotal;
    procedure guardarCheckBox;
    procedure decrementarStockAvio;
    procedure cargarAviosDeCorte(corte: Integer);
    procedure cargarCheckBox(corte: Integer);
    procedure setTipoDeCorte(Tipo: integer);
  public
    { Public declarations }
    procedure limpiarFormulario;
    procedure generarRemitoCorte(corte: Integer);
    procedure setModificar;
    procedure setNuevo;
    procedure setCortePendiente;
    procedure cargarCorte(corte: Integer);
    procedure cargarCortePendiente(ncorte: integer; idprod: integer; cantidad: integer);
  end;

var
  fconfeccion: Tfconfeccion;
  idprodactual: Integer;
  //esModificar: boolean;
  TipoDeCorte: integer;

implementation

uses consultarstock, datamodule, consultarStockAvio, vertalleres, observaciones,
  costura, remitoCorte, historialcortes, verCortePendiente;
{$R *.dfm}

procedure tfconfeccion.setCortePendiente;
begin
 setTipoDeCorte(3);
end;

procedure tfconfeccion.setTipoDeCorte(Tipo: Integer);
begin
  //1 es nuevo, 2 es modificacion, 3 es corte pendiente
  TipoDeCorte:= tipo;
end;

procedure Tfconfeccion.setModificar;
begin
  //esModificar := true;
  setTipoDeCorte(2);
  stringgrid1.Enabled:=false;
  labelededit2.enabled:=false;
  labelededit3.Enabled:=false;
  button1.Enabled:=false;
  button4.Enabled:=false;
end;

procedure Tfconfeccion.setNuevo;
begin
  //esModificar := false;
  setTipoDeCorte(1);
    stringgrid1.Enabled:=true;
  labelededit2.enabled:=true;
  labelededit3.Enabled:=true;
  button1.Enabled:=true;
  button4.Enabled:=true;
end;

procedure Tfconfeccion.cargarCorte(corte: Integer);
begin
  // completar todos los campos con el corte seleccionado para modificarlo
  self.completarStringGridAvio;
  self.limpiarFormulario;

  datamodule1.corte.Locate('id_corte', corte, []);
  idprodactual:=datamodule1.corte.FieldByName('id_producto').AsInteger;
  datamodule1.producto.Locate('id_prod',
    datamodule1.corte.FieldByName('id_producto').Asinteger, []);
  LabeledEdit6.Text := datamodule1.producto.FieldByName('nombre_prod').AsString;
  LabeledEdit8.Text := inttostr(datamodule1.producto.FieldByName('num_prod')
      .Asinteger);
  datamodule1.taller.Locate('id_taller',
    datamodule1.corte.FieldByName('id_taller').Asinteger, []);
  LabeledEdit1.Text := datamodule1.taller.FieldByName('nombre_taller').AsString;
  LabeledEdit9.Text := inttostr(datamodule1.corte.FieldByName('num_corte')
      .Asinteger);
  LabeledEdit4.Text := floattostr(datamodule1.corte.FieldByName('costo_unidad')
      .AsFloat);
  LabeledEdit7.Text := inttostr(datamodule1.corte.FieldByName('cantidad')
      .Asinteger);
  LabeledEdit5.Text := floattostr(datamodule1.corte.FieldByName('costo_total')
      .AsFloat);
  fcostura.cargarCostura(datamodule1.corte.FieldByName('costura_corte')
      .AsString);
  fobservaciones.cargarObservaciones(datamodule1.corte.FieldByName
      ('observacion_corte').AsString);

  self.cargarAviosDeCorte(corte);
  self.cargarCheckBox(corte);
end;

procedure Tfconfeccion.Button1Click(Sender: TObject);
begin
  try
    if (strtoint(LabeledEdit3.Text) > 0) then
    begin
      if LabeledEdit2.Text <> '' then
      begin
        self.decrementarStockAvio;
        self.agregarAvioAlGrid;
      end
      else
      begin
        ShowMessage('Verifique los datos ingresados');
      end;
    end
    else
    begin
      ShowMessage('Verifique los datos ingresados');
    end;

  except
    on EConvertError do
      ShowMessage('Verifique los datos ingresados');
  end;

end;

procedure Tfconfeccion.cargarAviosDeCorte(corte: Integer);
begin
  // cargar todos los avios correspondientes al corte en la stringgrid
end;

procedure Tfconfeccion.cargarCheckBox(corte: Integer);
begin
  // completar los checkbox como corresponda
  if datamodule1.corte.FieldByName('fliselina').Asinteger = 1 then
    CheckListBox1.State[0] := cbchecked;
  if datamodule1.corte.FieldByName('tira').Asinteger = 1 then
    CheckListBox1.State[1] := cbchecked;
  if datamodule1.corte.FieldByName('muestra').Asinteger = 1 then
    CheckListBox1.State[2] := cbchecked;
end;

procedure Tfconfeccion.completarStringGridAvio;
begin
  with StringGrid1 do
  begin
    Cells[0, 0] := '';
    colwidths[0] := 60;
    Cells[1, 0] := 'Cantidad';
    colwidths[1] := 60;
    Cells[2, 0] := 'Avio';
    colwidths[2] := 350;

  end;
end;

procedure Tfconfeccion.agregarAvioAlGrid;
var
  avio: string;
  i: Integer;
  encontrado: boolean;
begin
  encontrado := false;
  avio := datamodule1.avio.FieldByName('nombre_avio').AsString;
  // pregunto si el avio ya esta en el stringgrid
  for i := 1 to StringGrid1.RowCount - 2 do
  begin
    if StringGrid1.Cells[2, i] = avio then
    begin
      // el nombre del avio fue encontrado
      encontrado := true;
      // incremento la cantidad
      StringGrid1.Cells[1, i] := inttostr(strtoint(StringGrid1.Cells[1, i])
          + strtoint(LabeledEdit3.Text));
    end;
  end;
  if not(encontrado) then
  // agregar el avio al string grid
  begin
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    With StringGrid1 do
    begin
      Cells[2, RowCount - 2] := avio;
      Cells[1, RowCount - 2] := LabeledEdit3.Text;
    end;
  end;
end;

procedure Tfconfeccion.Button2Click(Sender: TObject);
begin
  // confirmarConfeccion;
  self.cumpleCondicionesConfeccion;

end;

procedure Tfconfeccion.cumpleCondicionesConfeccion;
begin
  if LabeledEdit1.Text <> '' then
  begin
    if ((StringGrid1.RowCount > 2) or (TipoDeCorte=2)) then
    begin
      if LabeledEdit6.Text <> '' then
      begin
        if MessageDlg('¿Desea confirmar el corte?', mtCustom,
          [mbYes, mbCancel], 0) = mrYes then
        begin
          self.guardarconfeccion;
          self.limpiarFormulario;
          self.Close;
        end;
      end
      else
      begin
        ShowMessage('Debe seleccionar un producto para confirmar el corte');
      end;
    end
    else
    begin
      ShowMessage('Debe agregar avios para confirmar el corte');
    end;
  end
  else
  begin
    ShowMessage('Debe seleccionar un taller para confirmar el corte');
  end;
end;

procedure Tfconfeccion.guardarconfeccion;
var
  corte_actual: Integer;

begin

  // guarda la confeccion en la base de datos
  if TipoDeCorte=2 then
  begin
    // stored procedure para modificar corte
    datamodule1.modificarCorte.Parameters.ParamByName('prod').Value :=
      idprodactual;
    datamodule1.modificarCorte.Parameters.ParamByName('tall').Value :=
      datamodule1.taller.FieldByName('id_taller').Asinteger;
    datamodule1.modificarCorte.Parameters.ParamByName('cant').Value := strtoint
      (LabeledEdit7.Text);
    datamodule1.modificarCorte.Parameters.ParamByName('uni').Value := strtofloat
      (formatfloat('#####0.00', strtofloat(LabeledEdit4.Text)));
    datamodule1.modificarCorte.Parameters.ParamByName('tot').Value := strtofloat
      (formatfloat('#####0.00', strtofloat(LabeledEdit5.Text)));
    datamodule1.modificarCorte.Parameters.ParamByName('observa').Value :=
      fobservaciones.getObservacion;
    datamodule1.modificarCorte.Parameters.ParamByName('costura')
      .Value := fcostura.getCostura;

    if CheckListBox1.Checked[0] then
    begin
      datamodule1.modificarCorte.Parameters.ParamByName('f').Value := 1;
    end
    else
    begin
      datamodule1.modificarCorte.Parameters.ParamByName('f').Value := 0;
    end;
    if CheckListBox1.Checked[1] then
    begin
      datamodule1.modificarCorte.Parameters.ParamByName('t').Value := 1;
    end
    else
    begin
      datamodule1.modificarCorte.Parameters.ParamByName('t').Value := 0;
    end;
    if CheckListBox1.Checked[2] then
    begin
      datamodule1.modificarCorte.Parameters.ParamByName('m').Value := 1;
    end
    else
    begin
      datamodule1.modificarCorte.Parameters.ParamByName('m').Value := 0;
    end;
    datamodule1.modificarCorte.Parameters.ParamByName('num').Value := strtoint
      (LabeledEdit9.Text);
    datamodule1.modificarCorte.Parameters.ParamByName('idcorte').Value :=
      datamodule1.corte.FieldByName('id_corte').Asinteger;

    datamodule1.modificarCorte.ExecProc;
    datamodule1.corte.Refresh;
    fhistorialcortes.filtrocortes;
  end
  else
  begin
    // stored procedure para crear nuevo corte
    datamodule1.corte.Append;
    datamodule1.corte.FieldByName('id_taller').Asinteger :=
      datamodule1.taller.FieldByName('id_taller').Asinteger;
    // producto_actual := datamodule1.producto.FieldByName('id_prod').AsInteger;
    datamodule1.corte.FieldByName('id_producto').Asinteger := idprodactual;
    datamodule1.corte.FieldByName('num_corte').Asinteger := strtoint
      (LabeledEdit9.Text);
    datamodule1.corte.FieldByName('fecha').AsDateTime := now;
    datamodule1.corte.FieldByName('cantidad').Asinteger := strtoint
      (LabeledEdit7.Text);
    datamodule1.corte.FieldByName('cantidad_restante').Asinteger := strtoint
      (LabeledEdit7.Text);
    datamodule1.corte.FieldByName('costo_total').AsFloat := strtofloat
      (formatfloat('#####0.00', strtofloat(LabeledEdit5.Text)));
    datamodule1.corte.FieldByName('costo_unidad').AsFloat := strtofloat
      (formatfloat('#####0.00', strtofloat(LabeledEdit4.Text)));
    datamodule1.corte.FieldByName('tipo').AsString := 'C';
    guardarCheckBox;

    fobservaciones.guardarenbd;
    fcostura.guardarenbd;
    datamodule1.corte.Post;
    corte_actual := datamodule1.corte.FieldByName('id_corte').Asinteger;
    guardarDetallesCorte(idprodactual, corte_actual);
    if TipoDeCorte=3 then
    begin
     //#### set confeccion en corte pendiente como true, para evitar volver a confeccionar el mismo corte pendiente    ###
       Corte_pendiente.confirmar_corte(strtoint(labelededit9.Text));
    end;

  end;
  corte_actual := datamodule1.corte.FieldByName('id_corte').Asinteger;
  generarRemitoCorte(corte_actual);

end;

procedure Tfconfeccion.generarRemitoCorte(corte: Integer);
begin
  // genera remito para el corte pasado por parametro.
  datamodule1.QRemito.SQL.Clear;
  datamodule1.QRemito.SQL.Add(

    'select  c.cantidad, c.id_producto, p.nombre_prod, da.id_avio, da.cantidad, c.fecha, c.costo_unidad, '
      + 'c.costo_total, c.costo_unidad, c.observacion_corte, c.costura_corte, c.fliselina, c.tira, c.muestra, p.num_prod, p.nombre_prod, a.nombre_avio, a.descripcion_avio from producto p inner join corte c ' + 'on p.id_prod = c.id_producto inner join detalle_corte_avio da on da.id_corte=c.id_corte ' + 'join avio a on a.id_avio=da.id_avio where c.id_corte = ' + inttostr(corte));

  datamodule1.QRemito.Open;
  datamodule1.QRemito.Active := true;
  // completar datos del taller en el reporte
  datamodule1.corte.Locate('id_corte', corte, []);
  datamodule1.taller.Locate('id_taller',
    datamodule1.corte.FieldByName('id_taller').Asinteger, []);
  fremitocorte.QRLabel6.Caption := datamodule1.taller.FieldByName
    ('nombre_taller').AsString;
  datamodule1.producto.Locate('id_prod',
    datamodule1.corte.FieldByName('id_producto').Asinteger, []);
  // Carga los precios

  fremitocorte.QRLabel28.Caption := formatfloat('#####0.00',
    datamodule1.corte.FieldByName('costo_unidad').AsFloat);
  fremitocorte.QRLabel29.Caption := formatfloat('#####0.00',
    datamodule1.corte.FieldByName('costo_total').AsFloat);

  // Carga los checkbox
  if datamodule1.corte.FieldByName('fliselina').Asinteger = 1 then
    fremitocorte.QRLabel15.Caption := 'Si';
  if datamodule1.corte.FieldByName('tira').Asinteger = 1 then
    fremitocorte.QRLabel14.Caption := 'Si';
  if datamodule1.corte.FieldByName('muestra').Asinteger = 1 then
    fremitocorte.QRLabel12.Caption := 'Si';
  // fremitocorte.QRLabel27.Caption := LabeledEdit9.Text;
  fremitocorte.qrlabel27.Caption := inttostr
    (datamodule1.corte.FieldByName('num_corte').Asinteger);
  // Cargar observaciones

  // Cargar costura

  datamodule1.QRemito.First;
  /// //////// imprime dos copias de cada remito   /////////////////7
  if MessageDlg('¿Desea imprimir el remito del corte?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin

    if MessageDlg('¿Desea imprimir un duplicado del remito?', mtCustom,
      [mbYes, mbCancel], 0) = mrYes then
    begin
      fremitocorte.QuickRep1.PrinterSettings.Copies := 2;
    end
    else
    begin
      fremitocorte.QuickRep1.PrinterSettings.Copies := 1;
    end;
    fremitocorte.QuickRep1.print;

  end;
  /// VER EL REMITO

  fremitocorte.QuickRep1.Preview;

end;

procedure Tfconfeccion.decrementarStockAvio();
begin
  if datamodule1.avio.FieldByName('stock_avio').AsFloat - strtofloat
    (LabeledEdit3.Text) < 0 then
    ShowMessage('El stock del avio que está agregando es menor a 0');
  datamodule1.avio.Edit;
  datamodule1.avio.FieldByName('stock_avio').AsFloat :=
    datamodule1.avio.FieldByName('stock_avio').AsFloat - strtofloat
    (LabeledEdit3.Text);
  datamodule1.avio.Post;
end;

procedure Tfconfeccion.guardarCheckBox;
begin
  if CheckListBox1.Checked[0] then
  begin
    datamodule1.corte.FieldByName('fliselina').Asinteger := 1;
  end
  else
  begin
    datamodule1.corte.FieldByName('fliselina').Asinteger := 0;
  end;
  if CheckListBox1.Checked[1] then
  begin
    datamodule1.corte.FieldByName('tira').Asinteger := 1;
  end
  else
  begin
    datamodule1.corte.FieldByName('tira').Asinteger := 0;
  end;
  if CheckListBox1.Checked[2] then
  begin
    datamodule1.corte.FieldByName('muestra').Asinteger := 1;
  end
  else
  begin
    datamodule1.corte.FieldByName('muestra').Asinteger := 0;
  end;
end;

procedure Tfconfeccion.Button3Click(Sender: TObject);
begin

  if MessageDlg('¿Desea salir sin guardar los cambios?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin
    if StringGrid1.RowCount > 1 then
      self.cancelarConfeccion;
    self.limpiarFormulario;
    self.Close;
  end;

end;

procedure Tfconfeccion.Button4Click(Sender: TObject);
begin
  self.eliminarAvio;
end;

procedure Tfconfeccion.Button5Click(Sender: TObject);
begin
  try
    strtoint(LabeledEdit7.Text);
  except
    on EConvertError do
      ShowMessage('Verifique la cantidad ingresada');

  end;

end;

procedure Tfconfeccion.Button7Click(Sender: TObject);
begin
  fobservaciones.ShowModal;
end;

procedure Tfconfeccion.Button8Click(Sender: TObject);
begin
  fcostura.ShowModal;
end;

procedure Tfconfeccion.limpiarFormulario;
begin
  LabeledEdit1.Text := '';
  LabeledEdit2.Text := '';
  LabeledEdit3.Text := '1';
  LabeledEdit4.Text := '1';
  LabeledEdit5.Text := '1';
  LabeledEdit6.Text := '';
  LabeledEdit6.Enabled := true;
  LabeledEdit7.Text := '1';
  LabeledEdit8.Text := '';
  LabeledEdit9.Text := '0';
  limpiarstringgrid;
  CheckListBox1.Checked[0] := false;
  CheckListBox1.Checked[1] := false;
  CheckListBox1.Checked[2] := false;

  fobservaciones.limpiarFormulario;
  fcostura.limpiarFormulario;




  end;

procedure Tfconfeccion.guardarDetallesCorte(producto_actual: Integer;
  corte_actual: Integer);
var
  i: Integer;
begin
  // detalle del corte - avio
  for i := 1 to StringGrid1.RowCount - 2 do
  begin
    datamodule1.detalle_corte_avio.Append;
    datamodule1.detalle_corte_avio.FieldByName('id_corte').Asinteger :=
      corte_actual;
    datamodule1.avio.Locate('nombre_avio', StringGrid1.Cells[2, i], []);
    datamodule1.detalle_corte_avio.FieldByName('id_avio').Asinteger :=
      datamodule1.avio.FieldByName('id_avio').Asinteger;
    datamodule1.detalle_corte_avio.FieldByName('cantidad').AsFloat := strtofloat
      (StringGrid1.Cells[1, i]);
    datamodule1.detalle_corte_avio.Post;
  end;
end;

procedure Tfconfeccion.limpiarstringgrid;
var
  cont, cont1: Integer;

begin
  // dejar el stringgrid limpio

  for cont := 0 to StringGrid1.ColCount - 1 do
    for cont1 := 1 to StringGrid1.RowCount - 1 do
      StringGrid1.Cells[cont, cont1] := '';
  StringGrid1.RowCount := 2;

end;

procedure Tfconfeccion.eliminarAvio;
var
  h, j: Integer;
begin
  for h := 1 to StringGrid1.RowCount - 2 do
  begin
    for j := 0 to StringGrid1.ColCount - 1 do
    begin
      StringGrid1.Cells[j, h] := StringGrid1.Cells[j, h + 1];
    end;
  end;
  StringGrid1.RowCount := StringGrid1.RowCount - 1;
end;

procedure Tfconfeccion.StringGrid1Click(Sender: TObject);
begin
  Button4.Enabled := true;
  // stringgrid1.
end;

procedure Tfconfeccion.cancelarConfeccion;
// Recorrer el stringgrid incrementando el stock de los productos

var
  i: Integer;
  // tipoProductoActual: string;
  idact: Integer;
begin
  try
    for i := 1 to StringGrid1.RowCount - 2 do
    begin
      datamodule1.avio.Locate('nombre_avio', StringGrid1.Cells[2, i], []);
      idact := datamodule1.avio.FieldByName('id_avio').Asinteger;
      datamodule1.avio.Edit;
      // incremento el stock
      datamodule1.avio.FieldByName('stock_avio').AsFloat :=
        datamodule1.avio.FieldByName('stock_avio').AsFloat + strtoint
        (StringGrid1.Cells[1, i]);
      datamodule1.avio.Post;
    end;

  except
    on EConvertError do
      ShowMessage('Verifique los datos ingresados');
  end;
end;

procedure Tfconfeccion.confirmarConfeccion;
begin
  // guardar confeccion en la base de datos
  datamodule1.corte.Append;
  datamodule1.corte.FieldByName('id_producto').Asinteger := idprodactual;
  datamodule1.corte.FieldByName('fecha').AsDateTime := now;
  datamodule1.corte.FieldByName('cantidad').Asinteger := strtoint
    (LabeledEdit7.Text);
  // datamodule1.corte.FieldByName('costo_unidad').AsFloat:='';
  // datamodule1.corte.FieldByName('costo_total').AsFloat:=labelededit7.Text*;
  // datamodule1.corte.FieldByName('observaciones').AsString:=;
  // datamodule1.corte.FieldByName('costura').AsString:=;
  datamodule1.corte.Post;
  // pararse en la ultima posicion de la tabla cortes (corte recien guardado) para guardar avios
  datamodule1.corte.Last;
  // guardar detalles de los avios para el corte
  datamodule1.detalle_corte_avio.Append;
  datamodule1.detalle_corte_avio.FieldByName('id_corte').Asinteger :=
    datamodule1.corte.FieldByName('id_corte').Asinteger;
  // datamodule1.detalle_corte_avio.FieldByName()
  datamodule1.detalle_corte_avio.Post;
  // cerrar formulario
  self.Close;
end;

procedure Tfconfeccion.FormShow(Sender: TObject);
begin
  if TipoDeCorte=1 then
  begin
    self.completarStringGridAvio;
    self.limpiarFormulario;
  end;
end;

procedure Tfconfeccion.calcularTotal;
begin
  // calcular total del corte

  LabeledEdit5.Text := formatfloat('#####0.00',
    strtofloat(LabeledEdit7.Text) * strtofloat(LabeledEdit4.Text));

end;

procedure Tfconfeccion.LabeledEdit1Click(Sender: TObject);
begin
  fvertalleres.setConfeccion;
  fvertalleres.ShowModal;
  self.LabeledEdit1.Text := datamodule1.taller.FieldByName('nombre_taller')
    .AsString;
end;

procedure Tfconfeccion.LabeledEdit2Click(Sender: TObject);
begin
  fconsultarstockavio.setConfeccion;
  fconsultarstockavio.ShowModal;
  LabeledEdit2.Text := datamodule1.avio.FieldByName('nombre_avio').AsString;

end;

procedure Tfconfeccion.LabeledEdit4Exit(Sender: TObject);
begin
  calcularTotal;
end;

procedure Tfconfeccion.LabeledEdit6Click(Sender: TObject);
begin
  fconsultarstock.ShowModal;
  idprodactual := datamodule1.producto.FieldByName('id_prod').Asinteger;
  LabeledEdit6.Text := datamodule1.producto.FieldByName('nombre_prod').AsString;
  LabeledEdit8.Text := inttostr(datamodule1.producto.FieldByName('num_prod')
      .Asinteger);
end;

procedure Tfconfeccion.LabeledEdit7Exit(Sender: TObject);
begin
  calcularTotal;
end;


procedure tfconfeccion.cargarCortePendiente(ncorte: integer; idprod: integer; cantidad: integer);
begin

  self.limpiarFormulario;

  idprodactual:=idprod;
  datamodule1.producto.Locate('id_prod', idprod, []);
  LabeledEdit6.Text := datamodule1.producto.FieldByName('nombre_prod').AsString;
  LabeledEdit8.Text := inttostr(datamodule1.producto.FieldByName('num_prod')
      .Asinteger);
  LabeledEdit9.Text := inttostr(ncorte);
  LabeledEdit7.Text := inttostr(cantidad);


end;



end.
