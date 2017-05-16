unit venta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids;

type
  Tfventa = class(TForm)
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Button4: TButton;
    panelpantalon: TPanel;
    panelcinturon: TPanel;
    panelremera: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    ComboBox1: TComboBox;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    panelninos: TPanel;
    RadioGroup4: TRadioGroup;
    LabeledEdit6: TLabeledEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabeledEdit1Click(Sender: TObject);
    procedure LabeledEdit2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure guardarventa();
    procedure limpiarformulario();
    procedure activarRadioButtons();
    procedure completarStringGrid();
    procedure agregarRemeraAlGrid();
    procedure agregarPantalonAlGrid();
    procedure agregarCinturonAlGrid();
    procedure agregarNinosAlGrid();
    procedure verificarTalle(hayTalle: boolean; cantidad: integer);
    procedure agregarProductoVenta;
    procedure limpiarProducto();
    procedure cumpleCondicionesVenta;
    procedure incrementarStock();
    procedure decrementarStock();
    procedure cancelarVenta();
    procedure limpiarStringgrid();
    procedure actualizartotal();
    procedure eliminarProducto;
    procedure calcularTotal;
    procedure venderCuentaCorriente;
    procedure controlarDeuda;
  public
    { Public declarations }
    procedure generarRemito(venta: integer);
  end;

var
  fventa: Tfventa;
  idprodactual: integer;
  esfranquicia: boolean;

implementation

uses verclientes, datamodule, consultarstock, remito, reporteSaldoTalleres;
{$R *.dfm}

procedure Tfventa.guardarventa;
var
  venta_actual: integer;
  i: integer;
begin

  // guarda la venta en la base de datos

  datamodule1.venta.Append;
  datamodule1.venta.FieldByName('id_cliente').AsInteger :=
    datamodule1.cliente.FieldByName('id_cliente').AsInteger;
  datamodule1.venta.FieldByName('subtotal').AsFloat := strtofloat
    (LabeledEdit4.Text);
  // verificar si es cuenta corriente
  if ComboBox1.ItemIndex = 2 then
    venderCuentaCorriente;

  datamodule1.venta.Post;

  venta_actual := datamodule1.venta.FieldByName('id_venta').AsInteger;
  datamodule1.venta.Last;
  // detalle de la venta
  for i := 1 to StringGrid1.RowCount - 2 do
  begin
    datamodule1.detalle_venta.Append;
    datamodule1.detalle_venta.FieldByName('id_venta').AsInteger := venta_actual;
    // OJO! EL PRECIO DEBERIA LEVANTARLO DE LA STRING GRID????
    datamodule1.detalle_venta.FieldByName('precio_unitario').AsFloat :=
      strtofloat(StringGrid1.Cells[3, i]);
    datamodule1.producto.Locate('nombre_prod', StringGrid1.Cells[0, i], []);
    datamodule1.detalle_venta.FieldByName('id_producto').AsInteger :=
      datamodule1.producto.FieldByName('id_prod').AsInteger;
    datamodule1.detalle_venta.FieldByName('talle').AsString := StringGrid1.Cells
      [1, i];
    datamodule1.detalle_venta.FieldByName('cantidad').AsInteger := StrToInt
      (StringGrid1.Cells[2, i]);
    datamodule1.detalle_venta.Post;

  end;
  self.controlarDeuda;
  generarRemito(venta_actual);

end;

procedure Tfventa.controlarDeuda;
begin
  if datamodule1.cliente.FieldByName('saldo').AsFloat > 0 then
  // si el cliente tiene saldo positivo
  begin
    // si el remito es mayor que el saldo
    if datamodule1.venta.FieldByName('deuda')
      .AsFloat > datamodule1.cliente.FieldByName('saldo').AsFloat then
    begin
      datamodule1.venta.Edit;
      datamodule1.venta.FieldByName('deuda').AsFloat :=
        datamodule1.venta.FieldByName('deuda')
        .AsFloat - datamodule1.cliente.FieldByName('saldo').AsFloat;
      datamodule1.venta.Post;
      datamodule1.cliente.Edit;
      datamodule1.cliente.FieldByName('saldo').AsFloat := 0;
      datamodule1.cliente.Post;
    end
    else
    begin
      // si el remito es menor o igual que el saldo
      datamodule1.cliente.Edit;
      datamodule1.cliente.FieldByName('saldo').AsFloat :=
        datamodule1.cliente.FieldByName('saldo')
        .AsFloat - datamodule1.venta.FieldByName('deuda').AsFloat;
      datamodule1.cliente.Post;
      datamodule1.venta.Edit;
      datamodule1.venta.FieldByName('deuda').AsFloat := 0;
      datamodule1.venta.Post;

    end;
  end;

end;

procedure Tfventa.venderCuentaCorriente;
begin
  datamodule1.venta.FieldByName('cc').AsInteger := 1;
  datamodule1.venta.FieldByName('deuda').AsFloat := strtofloat
    (LabeledEdit4.Text);

end;

procedure Tfventa.generarRemito(venta: integer);
begin
  // genera remito para la venta actual.
  datamodule1.QRemito.SQL.Clear;
  datamodule1.QRemito.SQL.Add(
    'select p.nombre_prod, d.talle, d.precio_unitario, d.cantidad, d.cantidad * d.precio_unitario as subtotal from detalle_venta d inner join producto p on p.id_prod = d.id_producto where id_venta=' + inttostr(venta));
  datamodule1.QRemito.Open;
  datamodule1.QRemito.Active := true;

  // completar datos del cliente en el reporte
  datamodule1.venta.Locate('id_venta', venta, []);
  datamodule1.cliente.Locate('id_cliente',
    datamodule1.venta.FieldByName('id_cliente').AsInteger, []);

  fremito.QRLabel1.Caption := datamodule1.cliente.FieldByName('nombre_cli')
    .AsString;
  fremito.QRLabel4.Caption := datamodule1.cliente.FieldByName('direccion_cli')
    .AsString;
  fremito.QRLabel6.Caption := datamodule1.cliente.FieldByName('localidad_cli')
    .AsString;
  fremito.QRLabel2.Caption := datetostr(datamodule1.venta.FieldByName
      ('fecha_venta').AsDateTime);
  fremito.QRLabel3.Caption := datamodule1.cliente.FieldByName('dni_cli')
    .AsString;

  datamodule1.QRemito.First;
  calcularTotal;
  /// //////// imprime dos copias de cada remito   /////////////////7
  if MessageDlg('¿Desea imprimir el remito de la venta?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin

    if MessageDlg('¿Desea imprimir un duplicado del remito?', mtCustom,
      [mbYes, mbCancel], 0) = mrYes then
    begin
      fremito.QuickRep1.PrinterSettings.Copies := 2;
    end
    else
    begin
      fremito.QuickRep1.PrinterSettings.Copies := 1;
    end;
    fremito.QuickRep1.print;

  end;
  /// VER EL REMITO
  fremito.QuickRep1.Preview;

end;

procedure Tfventa.calcularTotal;
var
  total: Double;
begin
  total := 0;
  while not datamodule1.QRemito.Eof do
  begin
    total := total + datamodule1.QRemito.FieldByName('subtotal').AsFloat;
    datamodule1.QRemito.Next;
  end;
  fremito.qrlabel19.Caption := floattostr(total);
end;

procedure Tfventa.eliminarProducto;
var
  j: integer;
  h: integer;
  encontrado: boolean;
  i: integer;
begin
  datamodule1.producto.Locate('nombre_prod', LabeledEdit2.Text, []);
  encontrado := false;
  for i := 1 to StringGrid1.RowCount - 2 do
  begin
    if (StringGrid1.Cells[0, i] = LabeledEdit2.Text) then
    begin
      if StringGrid1.Cells[1, i] = RadioGroup1.Items[RadioGroup1.ItemIndex] then
      begin
        encontrado := true;
        if (strtofloat(StringGrid1.Cells[2, i]) > 1) then
        begin
          StringGrid1.Cells[2, i] := floattostr
            (strtofloat(StringGrid1.Cells[2, i]) - 1);
          // incremento el stock nuevamente
          incrementarStock;
        end
        else
        begin
          // eliminar el producto de la stringgrid
          for h := 1 to StringGrid1.RowCount - 2 do
          begin
            for j := 0 to StringGrid1.ColCount - 1 do
            begin
              StringGrid1.Cells[j, h] := StringGrid1.Cells[j, h + 1];
            end;
          end;
          StringGrid1.RowCount := StringGrid1.RowCount - 1;
          // incremento el stock nuevamente
          incrementarStock;
        end;
      end;
    end;
  end;
  if not(encontrado) then
  begin
    ShowMessage(
      'El producto que intenta eliminar no se encuentra en la venta actual');
  end;
end;

procedure Tfventa.LabeledEdit1Click(Sender: TObject);
begin
  fverclientes.ShowModal;
  LabeledEdit1.Text := datamodule1.cliente.FieldByName('nombre_cli').AsString;
  if datamodule1.cliente.FieldByName('tipo').AsString = 'F' then
  begin
    esfranquicia := true;
    ComboBox1.ItemIndex:=2;
    // ShowMessage('es franquicia');
  end
  else
  begin
    esfranquicia := false;
    ComboBox1.ItemIndex:=1;
  end;
  Button1.Enabled := true;
end;

procedure Tfventa.activarRadioButtons();
begin
  // activa los radio button correspondientes para los talles segun el tipo de producto
  if datamodule1.producto.FieldByName('tipo_prod').AsString = 'pantalon' then
  begin
    panelpantalon.Visible := true;
    panelcinturon.Visible := false;
    panelremera.Visible := false;
    panelninos.Visible := false;
  end
  else
  begin
    if datamodule1.producto.FieldByName('tipo_prod').AsString = 'remera' then
    begin
      panelpantalon.Visible := false;
      panelcinturon.Visible := false;
      panelremera.Visible := true;
      panelninos.Visible := false;
    end
    else
    begin
      if datamodule1.producto.FieldByName('tipo_prod')
        .AsString = 'cinturon' then
      begin
        panelpantalon.Visible := false;
        panelcinturon.Visible := true;
        panelremera.Visible := false;
        panelninos.Visible := false;
      end
      else
      begin
        if datamodule1.producto.FieldByName('tipo_prod').AsString = 'ninos' then
        begin
          panelpantalon.Visible := false;
          panelcinturon.Visible := false;
          panelremera.Visible := false;
          panelninos.Visible := true;

        end;
      end;
    end;
  end;
end;

procedure Tfventa.LabeledEdit2Click(Sender: TObject);
begin
  fconsultarstock.setVenta;
  fconsultarstock.ShowModal;
  idprodactual := datamodule1.producto.FieldByName('id_prod').AsInteger;
  LabeledEdit2.Text := datamodule1.producto.FieldByName('nombre_prod').AsString;
  self.activarRadioButtons;
  // ########## OJO ##########
  LabeledEdit5.Text := floattostr(datamodule1.producto.FieldByName
      ('precio_unitario').AsFloat);
  LabeledEdit6.Text := floattostr(datamodule1.producto.FieldByName
      ('precio_xmayor').AsFloat);
end;

procedure Tfventa.limpiarformulario;
begin
  // limpia todos los componentes
  LabeledEdit1.Text := '';
  LabeledEdit2.Text := '';
  LabeledEdit3.Text := '1';
  LabeledEdit4.Text := '0';
  LabeledEdit5.Text := '0';
  LabeledEdit6.Text := '0';
  ComboBox1.ItemIndex := 0;
  self.limpiarStringgrid;
  Button1.Enabled := false;
  LabeledEdit1.Enabled := true;

end;

procedure Tfventa.Button1Click(Sender: TObject);
begin

  agregarProductoVenta;
  LabeledEdit1.Enabled := false;
  actualizartotal;
  //limpiarProducto;
end;

procedure Tfventa.verificarTalle(hayTalle: boolean; cantidad: integer);

begin

  // verifico el stock del producto y talle seleccionado y devuelvo true
  // si es mayor o igual a la cantidad pedida
  hayTalle := false;
  if datamodule1.producto.FieldByName('tipo_prod').AsString = 'remera' then
  begin
    datamodule1.talle_remera.Locate('id_prod', idprodactual, []);
    if datamodule1.talle_remera.FieldByName
      (RadioGroup1.Items[RadioGroup1.ItemIndex]).AsInteger > cantidad then
    begin
      hayTalle := true;
    end;
  end
  else
  begin
    if datamodule1.producto.FieldByName('tipo_prod').AsString = 'pantalon' then
    begin
      datamodule1.talle_pantalon.Locate('id_prod', idprodactual, []);
      if datamodule1.talle_pantalon.FieldByName
        (RadioGroup3.Items[RadioGroup3.ItemIndex]).AsInteger > cantidad then
      begin
        hayTalle := true;
      end;
    end
    else
    begin
      if datamodule1.producto.FieldByName('tipo_prod')
        .AsString = 'cinturon' then
      begin
        datamodule1.talle_cinturon.Locate('id_prod', idprodactual, []);
        if datamodule1.talle_cinturon.FieldByName
          (RadioGroup2.Items[RadioGroup2.ItemIndex]).AsInteger > cantidad then
        begin
          hayTalle := true;
        end;
      end
      else
      begin
        if datamodule1.producto.FieldByName('tipo_prod').AsString = 'ninos' then
        begin
          datamodule1.talle_ninos.Locate('id_prod', idprodactual, []);
          if datamodule1.talle_ninos.FieldByName
            (RadioGroup4.Items[RadioGroup4.ItemIndex])
            .AsInteger > cantidad then
          begin
            hayTalle := true;
          end;
        end;
      end;
    end;
  end;
  if not hayTalle then
  begin
    ShowMessage('Este producto tiene stock menor a 0');
  end;

end;

procedure Tfventa.agregarProductoVenta;
var
  tipoProductoActual: string;
  hayTalle: boolean;
begin
  try
    if (LabeledEdit2.Text <> '') then
    begin
      datamodule1.producto.Locate('id_prod', idprodactual, []);
      // ShowMessage('agregando ' + datamodule1.producto.FieldByName('nombre_prod')
      // .AsString);
      tipoProductoActual := datamodule1.producto.FieldByName('tipo_prod')
        .AsString;
      // verifico que esten todos los campos seleccionados
      // controlo cantidad mayor a 0
      if strtofloat(LabeledEdit3.Text) > 0 then
      begin
        if tipoProductoActual = 'remera' then
        begin
          if RadioGroup1.ItemIndex <> -1 then
          // agregar remera;
          begin
            verificarTalle(hayTalle, StrToInt(LabeledEdit3.Text));
            agregarRemeraAlGrid;
            decrementarStock;
          end
          else
          begin
            ShowMessage('Seleccione el talle');
          end;
        end
        else
        begin
          if tipoProductoActual = 'pantalon' then
          begin
            if RadioGroup3.ItemIndex <> -1 then
            // agregar pantalon;
            begin
              verificarTalle(hayTalle, StrToInt(LabeledEdit3.Text));
              agregarPantalonAlGrid;
              decrementarStock;
            end
            else
            begin
              ShowMessage('Seleccione el talle');
            end;
          end
          else
          begin
            if tipoProductoActual = 'cinturon' then
            begin
              if RadioGroup2.ItemIndex <> -1 then
              // agregar cinturon;
              begin
                verificarTalle(hayTalle, StrToInt(LabeledEdit3.Text));
                agregarCinturonAlGrid;
                decrementarStock;
              end
              else
              begin
                ShowMessage('Seleccione el talle');
              end;
            end
            else
            begin
              if tipoProductoActual = 'ninos' then
              begin
                if RadioGroup4.ItemIndex <> -1 then
                // agregar niños
                begin
                  verificarTalle(hayTalle, StrToInt(LabeledEdit3.Text));
                  agregarNinosAlGrid;
                  decrementarStock;
                end
                else
                begin
                  ShowMessage('Seleccione el talle');
                end;
              end;
            end;
          end;
        end;
      end
      else
      begin
        ShowMessage('La cantidad debe ser mayor a 0');
      end;
    end
    else
    begin
      ShowMessage('Debe seleccionar un producto para agregar a la venta');
    end;
  except
    on econverterror do
      ShowMessage('Verifique los datos ingresados');
  end;
end;

procedure Tfventa.incrementarStock;
var
  tipo_producto: string;

begin
  try
    tipo_producto := datamodule1.producto.FieldByName('tipo_prod').AsString;
    if (tipo_producto = 'remera') then
    begin
      datamodule1.talle_remera.Edit;
      datamodule1.talle_remera.FieldByName
        (RadioGroup1.Items[RadioGroup1.ItemIndex]).AsInteger :=
        datamodule1.talle_remera.FieldByName
        (RadioGroup1.Items[RadioGroup1.ItemIndex]).AsInteger + 1;
      datamodule1.talle_remera.Post;
    end
    else
    begin

      if (tipo_producto = 'pantalon') then
      begin
        datamodule1.talle_pantalon.Edit;
        datamodule1.talle_pantalon.FieldByName
          (RadioGroup3.Items[RadioGroup3.ItemIndex]).AsInteger :=
          datamodule1.talle_pantalon.FieldByName
          (RadioGroup3.Items[RadioGroup3.ItemIndex]).AsInteger + 1;
        datamodule1.talle_pantalon.Post;

      end
      else
      begin
        if (tipo_producto = 'cinturon') then
        begin
          datamodule1.talle_cinturon.Edit;
          datamodule1.talle_cinturon.FieldByName
            (RadioGroup2.Items[RadioGroup2.ItemIndex]).AsInteger :=
            datamodule1.talle_cinturon.FieldByName
            (RadioGroup2.Items[RadioGroup2.ItemIndex]).AsInteger + 1;
          datamodule1.talle_cinturon.Post;
        end;
      end;

    end;

  except
    on econverterror do
      ShowMessage('Verifique los datos ingresados');

  end;
end;

procedure Tfventa.decrementarStock;
var
  tipo_producto: string;

begin
  try
    tipo_producto := datamodule1.producto.FieldByName('tipo_prod').AsString;
    if (tipo_producto = 'remera') then
    begin
      datamodule1.talle_remera.Locate('id_prod', idprodactual, []);
      datamodule1.talle_remera.Edit;
      datamodule1.talle_remera.FieldByName
        (RadioGroup1.Items[RadioGroup1.ItemIndex]).AsInteger :=
        datamodule1.talle_remera.FieldByName
        (RadioGroup1.Items[RadioGroup1.ItemIndex]).AsInteger - StrToInt
        (LabeledEdit3.Text);
      datamodule1.talle_remera.Post;
    end
    else
    begin

      if (tipo_producto = 'pantalon') then
      begin
        datamodule1.talle_pantalon.Locate('id_prod', idprodactual, []);
        datamodule1.talle_pantalon.Edit;
        datamodule1.talle_pantalon.FieldByName
          (RadioGroup3.Items[RadioGroup3.ItemIndex]).AsInteger :=
          datamodule1.talle_pantalon.FieldByName
          (RadioGroup3.Items[RadioGroup3.ItemIndex]).AsInteger - StrToInt
          (LabeledEdit3.Text);
        datamodule1.talle_pantalon.Post;

      end
      else
      begin
        if (tipo_producto = 'cinturon') then
        begin
          datamodule1.talle_cinturon.Locate('id_prod', idprodactual, []);
          datamodule1.talle_cinturon.Edit;
          datamodule1.talle_cinturon.FieldByName
            (RadioGroup2.Items[RadioGroup2.ItemIndex]).AsInteger :=
            datamodule1.talle_cinturon.FieldByName
            (RadioGroup2.Items[RadioGroup2.ItemIndex]).AsInteger - StrToInt
            (LabeledEdit3.Text);
          datamodule1.talle_cinturon.Post;
        end
        else
        begin
          if (tipo_producto = 'ninos') then
          begin
            datamodule1.talle_ninos.Locate('id_prod', idprodactual, []);
            datamodule1.talle_ninos.Edit;
            datamodule1.talle_ninos.FieldByName
              (RadioGroup4.Items[RadioGroup4.ItemIndex]).AsInteger :=
              datamodule1.talle_ninos.FieldByName
              (RadioGroup4.Items[RadioGroup4.ItemIndex]).AsInteger - StrToInt
              (LabeledEdit3.Text);
            datamodule1.talle_ninos.Post;
          end;
        end;
      end;

    end;

  except
    on econverterror do
      ShowMessage('Verifique los datos ingresados');

  end;
end;

procedure Tfventa.Button2Click(Sender: TObject);
begin
  cumpleCondicionesVenta;

end;

procedure Tfventa.agregarRemeraAlGrid;
var
  producto: string;
  i: integer;
  encontrado: boolean;
begin
  encontrado := false;
  producto := datamodule1.producto.FieldByName('nombre_prod').AsString;
  // pregunto si el producto ya esta en el stringgrid
  for i := 1 to StringGrid1.RowCount - 2 do
  begin
    if StringGrid1.Cells[0, i] = producto then
    begin
      // el nombre del producto fue encontrado
      // busco si el talle a agregar es el que ya tengo en el stringgrid
      if StringGrid1.Cells[1, i] = RadioGroup1.Items[RadioGroup1.ItemIndex] then
      begin
        encontrado := true;
        // incremento la cantidad
        StringGrid1.Cells[2, i] := inttostr
          (StrToInt(StringGrid1.Cells[2, i]) + StrToInt(LabeledEdit3.Text));
        // actualizo el precio
        if esfranquicia then
        begin
          StringGrid1.Cells[3, i] := LabeledEdit6.Text;
        end
        else
        begin
          StringGrid1.Cells[3, i] := LabeledEdit5.Text;

        end;
        // calculo el subtotal
        StringGrid1.Cells[4, i] := floattostr
          (strtofloat(StringGrid1.Cells[2, i]) * strtofloat
            (StringGrid1.Cells[3, i]));
      end;
    end;
  end;
  if not(encontrado) then
  // agregar el producto al string grid
  begin
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    With StringGrid1 do
    begin
      Cells[0, RowCount - 2] := producto;
      Cells[1, RowCount - 2] := RadioGroup1.Items[RadioGroup1.ItemIndex];
      Cells[2, RowCount - 2] := LabeledEdit3.Text;
      if esfranquicia then
      begin
        Cells[3, RowCount - 2] := LabeledEdit6.Text;
      end
      else
      begin
        Cells[3, RowCount - 2] := LabeledEdit5.Text;
      end;
      Cells[4, RowCount - 2] := floattostr(strtofloat(Cells[2, RowCount - 2])
          * strtofloat(Cells[3, RowCount - 2]));
    end;
  end;
end;

procedure Tfventa.agregarNinosAlGrid;
var
  producto: string;
  i: integer;
  encontrado: boolean;
begin
  encontrado := false;
  producto := datamodule1.producto.FieldByName('nombre_prod').AsString;
  // pregunto si el producto ya esta en el stringgrid
  for i := 1 to StringGrid1.RowCount - 2 do
  begin
    if StringGrid1.Cells[0, i] = producto then
    begin
      // el nombre del producto fue encontrado
      // busco si el talle a agregar es el que ya tengo en el stringgrid
      if StringGrid1.Cells[1, i] = RadioGroup4.Items[RadioGroup4.ItemIndex] then
      begin
        encontrado := true;
        // incremento la cantidad
        StringGrid1.Cells[2, i] := inttostr
          (StrToInt(StringGrid1.Cells[2, i]) + StrToInt(LabeledEdit3.Text));
        // actualizo el precio
        if esfranquicia then
        begin
          StringGrid1.Cells[3, i] := LabeledEdit6.Text;
        end
        else
        begin
          StringGrid1.Cells[3, i] := LabeledEdit5.Text;

        end;
        // calculo el subtotal
        StringGrid1.Cells[4, i] := floattostr
          (strtofloat(StringGrid1.Cells[2, i]) * strtofloat
            (StringGrid1.Cells[3, i]));
      end;
    end;
  end;
  if not(encontrado) then
  // agregar el producto al string grid
  begin
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    With StringGrid1 do
    begin
      Cells[0, RowCount - 2] := producto;
      Cells[1, RowCount - 2] := RadioGroup4.Items[RadioGroup4.ItemIndex];
      Cells[2, RowCount - 2] := LabeledEdit3.Text;
      if esfranquicia then
      begin
        Cells[3, RowCount - 2] := LabeledEdit6.Text;
      end
      else
      begin
        Cells[3, RowCount - 2] := LabeledEdit5.Text;
      end;
      Cells[4, RowCount - 2] := floattostr(strtofloat(Cells[2, RowCount - 2])
          * strtofloat(Cells[3, RowCount - 2]));
    end;
  end;
end;

procedure Tfventa.agregarPantalonAlGrid;
var
  producto: string;
  i: integer;
  encontrado: boolean;
begin
  encontrado := false;
  producto := datamodule1.producto.FieldByName('nombre_prod').AsString;
  // pregunto si el producto ya esta en el stringgrid
  for i := 1 to StringGrid1.RowCount - 2 do
  begin
    if StringGrid1.Cells[0, i] = producto then
    begin
      // el nombre del producto fue encontrado
      // busco si el talle a agregar es el que ya tengo en el stringgrid
      if StringGrid1.Cells[1, i] = RadioGroup3.Items[RadioGroup3.ItemIndex] then
      begin
        encontrado := true;
        // incremento la cantidad
        StringGrid1.Cells[2, i] := inttostr
          (StrToInt(StringGrid1.Cells[2, i]) + StrToInt(LabeledEdit3.Text));
        if esfranquicia then
        begin
          StringGrid1.Cells[3, i] := LabeledEdit6.Text;
        end
        else
        begin
          StringGrid1.Cells[3, i] := LabeledEdit5.Text;

        end;
        // calculo el subtotal
        StringGrid1.Cells[4, i] := floattostr
          (strtofloat(StringGrid1.Cells[2, i]) * strtofloat
            (StringGrid1.Cells[3, i]));
      end;
    end;
  end;
  if not(encontrado) then
  // agregar el producto al string grid
  begin
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    With StringGrid1 do
    begin
      Cells[0, RowCount - 2] := producto;
      Cells[1, RowCount - 2] := RadioGroup3.Items[RadioGroup3.ItemIndex];
      Cells[2, RowCount - 2] := LabeledEdit3.Text;
      if esfranquicia then
      begin
        Cells[3, RowCount - 2] := LabeledEdit6.Text;
      end
      else
      begin
        Cells[3, RowCount - 2] := LabeledEdit5.Text;
      end;

      Cells[4, RowCount - 2] := floattostr(strtofloat(Cells[2, RowCount - 2])
          * strtofloat(Cells[3, RowCount - 2]));

    end;
  end;
end;

procedure Tfventa.agregarCinturonAlGrid;
var
  producto: string;
  i: integer;
  encontrado: boolean;
begin
  encontrado := false;
  producto := datamodule1.producto.FieldByName('nombre_prod').AsString;
  // pregunto si el producto ya esta en el stringgrid
  for i := 1 to StringGrid1.RowCount - 2 do
  begin
    if StringGrid1.Cells[0, i] = producto then
    begin
      // el nombre del producto fue encontrado
      // busco si el talle a agregar es el que ya tengo en el stringgrid
      if StringGrid1.Cells[1, i] = RadioGroup2.Items[RadioGroup2.ItemIndex] then
      begin
        encontrado := true;
        // incremento la cantidad
        StringGrid1.Cells[2, i] := inttostr
          (StrToInt(StringGrid1.Cells[2, i]) + StrToInt(LabeledEdit3.Text));
        // actualizo el precio
        if esfranquicia then
        begin
          StringGrid1.Cells[3, i] := LabeledEdit6.Text;
        end
        else
        begin
          StringGrid1.Cells[3, i] := LabeledEdit5.Text;

        end;
        // calculo el subtotal
        StringGrid1.Cells[4, i] := floattostr
          (strtofloat(StringGrid1.Cells[2, i]) * strtofloat
            (StringGrid1.Cells[3, i]));
      end;
    end;
  end;
  if not(encontrado) then
  // agregar el producto al string grid
  begin
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    With StringGrid1 do
    begin
      Cells[0, RowCount - 2] := producto;
      Cells[1, RowCount - 2] := RadioGroup2.Items[RadioGroup2.ItemIndex];
      Cells[2, RowCount - 2] := LabeledEdit3.Text;
      if esfranquicia then
      begin
        Cells[3, RowCount - 2] := LabeledEdit6.Text;
      end
      else
      begin
        Cells[3, RowCount - 2] := LabeledEdit5.Text;
      end;

     Cells[4, RowCount - 2] := floattostr(strtofloat(Cells[2, RowCount - 2])
          * strtofloat(Cells[3, RowCount - 2]));

    end;
  end;
end;

procedure Tfventa.Button3Click(Sender: TObject);
begin
  if MessageDlg('¿Desea salir sin guardar los cambios?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin
    if StringGrid1.RowCount > 1 then
      self.cancelarVenta;
    self.limpiarformulario;
    self.Close;
  end;

end;

procedure Tfventa.Button4Click(Sender: TObject);

begin
  eliminarProducto;

end;

procedure Tfventa.limpiarProducto;
begin
  LabeledEdit2.Text := '';
  RadioGroup1.ItemIndex := -1;
  RadioGroup2.ItemIndex := -1;
  RadioGroup3.ItemIndex := -1;
  LabeledEdit3.Text := '1';
  LabeledEdit5.Text := '0';
  LabeledEdit6.Text := '0';

end;

procedure Tfventa.actualizartotal;
var
  i: integer;
  total: Double;
begin
  total := 0;
  for i := 1 to StringGrid1.RowCount - 2 do
  begin
    total := total + strtofloat(StringGrid1.Cells[4, i]);
  end;
  LabeledEdit4.Text := formatfloat('#####0.00', total);
end;

procedure Tfventa.cumpleCondicionesVenta;
begin
  if LabeledEdit1.Text <> '' then
  begin
    if ComboBox1.ItemIndex <> 0 then
    begin
      if (StringGrid1.RowCount > 2) then
      begin
        if MessageDlg('¿Desea confirmar la venta?', mtCustom,
          [mbYes, mbCancel], 0) = mrYes then
        begin
          self.guardarventa;
          self.limpiarformulario;
          self.Close;
        end;
      end
      else
      begin
        ShowMessage('Debe agregar productos para confirmar la venta');
      end;
    end
    else
    begin
      ShowMessage('Debe seleccionar una forma de pago para confirmar la venta');
    end;
  end
  else
  begin
    ShowMessage('Debe seleccionar un cliente para confirmar la venta');
  end;
end;

procedure Tfventa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.limpiarformulario;
end;

procedure Tfventa.cancelarVenta;

// Recorrer el stringgrid incrementando el stock de los productos

var
  i: integer;
  tipoProductoActual: string;
  idact: integer;
begin
  try
    for i := 1 to StringGrid1.RowCount - 2 do
    begin
      datamodule1.producto.Locate('nombre_prod', StringGrid1.Cells[0, i], []);
      idact := datamodule1.producto.FieldByName('id_prod').AsInteger;
      tipoProductoActual := datamodule1.producto.FieldByName('tipo_prod')
        .AsString;
      // verifico que tipo de prenda es
      if tipoProductoActual = 'remera' then
      begin
        // me paro en la remera que corresponde en la tabla de talles
        datamodule1.talle_remera.Locate('id_prod', idact, []);
        datamodule1.talle_remera.Edit;
        // incremento el stock
        datamodule1.talle_remera.FieldByName(StringGrid1.Cells[1, i])
          .AsInteger := datamodule1.talle_remera.FieldByName
          (StringGrid1.Cells[1, i]).AsInteger + StrToInt
          (StringGrid1.Cells[2, i]);
        datamodule1.talle_remera.Post;
      end
      else
      begin
        if tipoProductoActual = 'pantalon' then
        begin
          // me paro en el pantalon que corresponde en la tabla de talles
          datamodule1.talle_pantalon.Locate('id_prod', idact, []);
          datamodule1.talle_pantalon.Edit;
          // incremento el stock
          datamodule1.talle_pantalon.FieldByName(StringGrid1.Cells[1, i])
            .AsInteger := datamodule1.talle_pantalon.FieldByName
            (StringGrid1.Cells[1, i]).AsInteger + StrToInt
            (StringGrid1.Cells[2, i]);
          datamodule1.talle_pantalon.Post;
        end
        else
        begin
          if tipoProductoActual = 'cinturon' then
          begin
            // me paro en el cinturon que corresponde en la tabla de talles
            datamodule1.talle_cinturon.Locate('id_prod', idact, []);
            datamodule1.talle_cinturon.Edit;
            // incremento el stock
            datamodule1.talle_cinturon.FieldByName(StringGrid1.Cells[1, i])
              .AsInteger := datamodule1.talle_cinturon.FieldByName
              (StringGrid1.Cells[1, i]).AsInteger + StrToInt
              (StringGrid1.Cells[2, i]);
            datamodule1.talle_cinturon.Post;
          end;
        end;
      end;
    end;

  except
    on econverterror do
      ShowMessage('Verifique los datos ingresados');
  end;
end;

procedure Tfventa.FormShow(Sender: TObject);
begin
  completarStringGrid;
end;

procedure Tfventa.completarStringGrid;
begin
  with StringGrid1 do
  begin
    Cells[0, 0] := 'Producto';
    colwidths[0] := 180;

    Cells[1, 0] := 'Talle';
    colwidths[1] := 60;

    Cells[2, 0] := 'Cantidad';
    colwidths[2] := 80;

    Cells[3, 0] := 'Precio unitario';
    colwidths[3] := 100;

    Cells[4, 0] := 'Subtotal';
    colwidths[4] := 80;

  end;
end;

procedure Tfventa.limpiarStringgrid;
var
  cont, cont1: integer;

begin
  // dejar el stringgrid limpio

  StringGrid1.RowCount := 2;

  for cont := 0 to StringGrid1.ColCount - 1 do
    for cont1 := 1 to StringGrid1.RowCount - 1 do
      StringGrid1.Cells[cont, cont1] := ''

end;

end.
