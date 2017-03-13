unit productonuevo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ExtDlgs, jpeg, DBCtrls, ComCtrls;

type
  Tproductonuevof = class(TForm)
    LabeledEdit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    LabeledEdit2: TLabeledEdit;
    ComboBox1: TComboBox;
    OpenPictureDialog1: TOpenPictureDialog;
    Button1: TButton;
    Image1: TImage;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit1Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabeledEdit4KeyPress(Sender: TObject; var Key: Char);

  private
    procedure guardarsexo;
    procedure guardarstock(id_producto: integer);
    procedure guardarimagen();
    procedure limpiarformulario();
    procedure guardartipoproducto;
    procedure verificarCambios();
    procedure cargarfoto;
  public
    { Public declarations }
    procedure cargarproducto(idproducto: integer);

  var
    esModificacion: boolean;
    hayCambiosDetalle: boolean;
  end;

var
  productonuevof: Tproductonuevof;
  cargofoto: boolean;

implementation

uses datamodule, cargarstockcinturon, cargarstockpantalon, cargarstockremeras,
  consultarstock, cargarstockmedia, cargarstockbolsa, cargarstockninos;
{$R *.dfm}

procedure Tproductonuevof.Button1Click(Sender: TObject);

begin
  // OpenPictureDialog1.Filter := 'Imagenes|*.jpg|Imagenes|*.jpeg';
  cargofoto := true;
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    Image1.Stretch := true;
    // hayCambiosDetalle := true;
  end;
end;

procedure Tproductonuevof.cargarproducto(idproducto: integer);
begin
  datamodule1.producto.Locate('id_prod', idproducto, []);
  LabeledEdit1.Text := datamodule1.producto.FieldByName('nombre_prod').AsString;
  LabeledEdit2.Text := datamodule1.producto.FieldByName('descripcion_prod')
    .AsString;
  cargarfoto;
  LabeledEdit3.Text := floattostr(datamodule1.producto.FieldByName
      ('precio_unitario').AsFloat);
  LabeledEdit4.Text := floattostr(datamodule1.producto.FieldByName
      ('precio_xmayor').AsFloat);
  LabeledEdit5.Text := inttostr(datamodule1.producto.FieldByName('num_prod')
      .AsInteger);
  // cargar tipo de prenda
  if datamodule1.producto.FieldByName('tipo_prod').AsString = 'pantalon' then
  begin
    ComboBox1.ItemIndex := 1;
    fcargarstockpantalon.cargardatos(idproducto);
  end
  else
  begin
    if datamodule1.producto.FieldByName('tipo_prod').AsString = 'remera' then
    begin
      ComboBox1.ItemIndex := 2;
      fcargarstockremeras.cargardatos(idproducto);
    end
    else
    begin
      if datamodule1.producto.FieldByName('tipo_prod')
        .AsString = 'cinturon' then
      begin
        ComboBox1.ItemIndex := 3;
        fcargarstockcinturon.cargardatos(idproducto);
      end
      else
      begin
        if datamodule1.producto.FieldByName('tipo_prod').AsString = 'media' then
        begin
          ComboBox1.ItemIndex := 4;
          fcargarstockmedia.cargardatos(idproducto);
        end
        else
        begin
          if datamodule1.producto.FieldByName('tipo_prod')
            .AsString = 'bolsa' then
          begin
            ComboBox1.ItemIndex := 5;
            fcargarstockbolsa.cargardatos(idproducto);

          end
          else
          begin
            if datamodule1.producto.FieldByName('tipo_prod')
              .AsString = 'ninos' then
            begin
              ComboBox1.ItemIndex := 6;
              fcargarstockninos.cargardatos(idproducto);
            end;
          end;
        end;
      end;
    end;
  end;
  // cargar sexo
  if datamodule1.producto.FieldByName('sexo_prod').AsString = 'hombre' then
  begin
    RadioButton1.Checked := true;
    RadioButton2.Checked := false;
  end
  else
  begin
    RadioButton1.Checked := false;
    RadioButton2.Checked := true;
  end;
end;

procedure Tproductonuevof.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex = 5 then
  begin
    RadioGroup1.Visible := false;
    RadioButton1.Visible := false;
    RadioButton1.Checked := true;
    RadioButton2.Visible := false;
  end
  else
  begin

    RadioGroup1.Visible := true;
    RadioButton1.Visible := true;
    RadioButton1.Checked := false;
    RadioButton2.Visible := true;

  end;
end;

procedure Tproductonuevof.cargarfoto;
var
  fs: TMemoryStream;
  imgJPG: TJpegImage;
begin
  if not datamodule1.producto.FieldByName('foto_prod').IsNull then
  begin
    imgJPG := TJpegImage.create;
    fs := TMemoryStream.create();
    datamodule1.productofoto_prod.SaveToStream(fs);
    fs.Seek(0, soFromBeginning);
    imgJPG.LoadFromStream(fs);
    try
      Image1.Picture.Assign(imgJPG);
      Image1.Stretch := true;
    finally
      fs.free;
    end;
  end;

end;

procedure Tproductonuevof.Button2Click(Sender: TObject);
begin
  // Segun el tipo de prenda abre el formulario de carga de stock correspondiente
  // si es modificacion cargar datos antes de hacer el showmodal
  if ComboBox1.ItemIndex = 0 then
  begin
    ShowMessage('Debe seleccionar el tipo de prenda');
  end
  else
  begin
    if ComboBox1.ItemIndex = 1 then
    begin
      if esModificacion then
        // ShowMessage('es modificacion');
        fcargarstockpantalon.cargardatos(datamodule1.producto.FieldByName
            ('id_prod').AsInteger);
      fcargarstockpantalon.ShowModal;
    end
    else
    begin
      if ComboBox1.ItemIndex = 2 then
      begin
        if esModificacion then
          fcargarstockremeras.cargardatos(datamodule1.producto.FieldByName
              ('id_prod').AsInteger);

        fcargarstockremeras.ShowModal;
      end
      else
      begin
        if ComboBox1.ItemIndex = 3 then
        begin
          if esModificacion then
            fcargarstockcinturon.cargardatos
              (datamodule1.producto.FieldByName('id_prod').AsInteger);

          fcargarstockcinturon.ShowModal;
        end
        else
        begin
          if ComboBox1.ItemIndex = 4 then
          begin
            if esModificacion then
              fcargarstockmedia.cargardatos
                (datamodule1.producto.FieldByName('id_prod').AsInteger);

            fcargarstockmedia.ShowModal;
          end
          else
          begin
            if ComboBox1.ItemIndex = 5 then
            begin
              if esModificacion then
                fcargarstockbolsa.cargardatos
                  (datamodule1.producto.FieldByName('id_prod').AsInteger);

              fcargarstockbolsa.ShowModal;

            end
            else
            begin
              if ComboBox1.ItemIndex = 6 then
              begin
                if esModificacion then
                  fcargarstockninos.cargardatos
                    (datamodule1.producto.FieldByName('id_prod')
                      .AsInteger);
                fcargarstockninos.ShowModal;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tproductonuevof.Button3Click(Sender: TObject);
var
  productoActual: integer;
  valor: Double;
begin
  try
    strtofloat(LabeledEdit3.Text);
    strtofloat(LabeledEdit4.Text);

    if esModificacion then
    begin
      productoActual := datamodule1.producto.FieldByName('id_prod').AsInteger;
    end;
    // verificar que estan todos los datos obligatorios
    if ComboBox1.ItemIndex = 0 then
    begin
      ShowMessage('Debe seleccionar el tipo de prenda');
    end
    else
    begin
      if LabeledEdit1.Text = '' then
      begin
        ShowMessage('Debe ingresar el nombre de producto');
      end
      else
      begin
        if (not(RadioButton1.Checked) and not(RadioButton2.Checked)) then
        begin
          ShowMessage('Debe seleccionar el sexo de la prenda');
        end
        else
        begin
          if LabeledEdit3.Text = '' then
          begin
            ShowMessage(
              'Debe ingresar el precio de venta al público de la prenda');
          end
          else if LabeledEdit4.Text = '' then

          begin
            ShowMessage('Debe ingresar el precio de venta por mayor');
          end
          else
          begin
            // guardar en base de datos
            if self.esModificacion then
            begin
              verificarCambios;
              if ((hayCambiosDetalle) or (cargofoto)) then
              begin
                datamodule1.producto.Edit;
              end;
            end
            else
            begin
              datamodule1.producto.append;
            end;

            if ((esModificacion and hayCambiosDetalle) or (not esModificacion)
                or (cargofoto)) then
            begin

              datamodule1.producto.FieldByName('nombre_prod').AsString :=
                LabeledEdit1.Text;
              datamodule1.producto.FieldByName('descripcion_prod').AsString :=
                LabeledEdit2.Text;
              datamodule1.producto.FieldByName('precio_unitario').AsFloat :=
                strtofloat(LabeledEdit3.Text);
              guardartipoproducto;
              guardarsexo;

              datamodule1.producto.FieldByName('precio_unitario').AsFloat :=
                strtofloat(LabeledEdit3.Text);
              datamodule1.producto.FieldByName('precio_xmayor').AsFloat :=
                strtofloat(LabeledEdit4.Text);
              if LabeledEdit5.Text <> '' then
                datamodule1.producto.FieldByName('num_prod').AsInteger :=
                  strtoint(LabeledEdit5.Text);

              if cargofoto then
              begin
                guardarimagen;
              end;
              datamodule1.producto.post;
              productoActual := datamodule1.producto.FieldByName('id_prod')
                .AsInteger;
            end;

            { ShowMessage('guardar stock para producto id: ' + inttostr
              (productoActual)); }
            guardarstock(productoActual);
            fconsultarstock.limpiarformulario;
            // fconsultarstock.activarGrid;
            self.Close
          end;
        end;
      end;
    end;
  except
    on econverterror do
      ShowMessage('Verifique los precios ingresados');

  end;
end;

procedure Tproductonuevof.verificarCambios;
begin
  hayCambiosDetalle := false;
  if ((LabeledEdit1.Text <> datamodule1.producto.FieldByName('nombre_prod')
        .AsString) or (LabeledEdit2.Text <> datamodule1.producto.FieldByName
        ('descripcion_prod').AsString) or ((LabeledEdit3.Text) <>
        (floattostr(datamodule1.producto.FieldByName('precio_unitario')
            .AsFloat))) or ((LabeledEdit4.Text) <>
        (floattostr(datamodule1.producto.FieldByName('precio_xmayor').AsFloat))
      ) or (strtoint(LabeledEdit5.Text) <> datamodule1.producto.FieldByName
        ('num_prod').AsInteger)) then
  begin
    // ShowMessage('Hay cambios detalle');
    hayCambiosDetalle := true;
  end
  else
  begin
    // ShowMessage('No hay cambios');
    hayCambiosDetalle := false;
  end;

end;

procedure Tproductonuevof.guardarimagen;
var
  fs: TMemoryStream;
  imgJPG: TJpegImage;

begin
  fs := TMemoryStream.create;
  imgJPG := TJpegImage.create;
  try
    imgJPG.LoadFromFile(OpenPictureDialog1.FileName);
    imgJPG.SaveToStream(fs);
    fs.Seek(0, soFromBeginning);
    try
      datamodule1.productofoto_prod.LoadFromStream(fs);
    finally
      fs.free;
    end;
  except
    on e: exception do
    begin
      MessageDlg('Asegúrese de que la imagen seleccionada es de ' +
          ' tipo JPEG con formato correcto. ' + chr(13) + chr(13)
          + 'El error concreto: ' + e.ClassName + ': ' + e.Message, mtError,
        [mbOK], 0);
    end;
  end;
end;

procedure Tproductonuevof.guardarsexo;
begin
  // guarda el sexo
  if RadioButton1.Checked then
  begin
    datamodule1.producto.FieldByName('sexo_prod').AsString := 'hombre';
  end
  else
  begin
    datamodule1.producto.FieldByName('sexo_prod').AsString := 'dama';
  end;
end;

procedure Tproductonuevof.guardarstock(id_producto: integer);
var
  productoActual: integer;
begin
  // almacena el stock en la tabla correspondiente
  if not(datamodule1.producto.Locate('id_prod', id_producto, [])) then
  begin
    ShowMessage('ERROR AL GUARDAR EL STOCK!');
  end;
  if datamodule1.producto.FieldByName('tipo_prod').AsString = 'pantalon' then
  begin
    fcargarstockpantalon.guardardatos(productoActual);
  end
  else
  begin
    if datamodule1.producto.FieldByName('tipo_prod').AsString = 'remera' then
    begin
      fcargarstockremeras.guardardatos(productoActual);

    end
    else
    begin
      if datamodule1.producto.FieldByName('tipo_prod')
        .AsString = 'cinturon' then
      begin
        fcargarstockcinturon.guardardatos(productoActual);

      end
      else
      begin
        if datamodule1.producto.FieldByName('tipo_prod').AsString = 'media' then
        begin
          fcargarstockmedia.guardardatos(id_producto);

        end
        else
        begin
          if datamodule1.producto.FieldByName('tipo_prod')
            .AsString = 'bolsa' then
          begin
            fcargarstockbolsa.guardardatos(id_producto);

          end
          else
          begin
            if datamodule1.producto.FieldByName('tipo_prod')
              .AsString = 'ninos' then
            begin
              fcargarstockninos.guardardatos(id_producto);
            end;
          end;
        end;
      end;
    end;

  end;
end;

procedure Tproductonuevof.Button4Click(Sender: TObject);
begin
  if MessageDlg('¿Desea salir sin guardar los cambios?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin
    fconsultarstock.limpiarformulario;
    self.Close;
  end;

end;

procedure Tproductonuevof.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  limpiarformulario;
  fcargarstockremeras.limpiarformulario;
  fcargarstockpantalon.limpiarformulario;
  fcargarstockcinturon.limpiarformulario;
  fcargarstockmedia.limpiarformulario;
  fcargarstockbolsa.limpiarformulario;
end;

procedure Tproductonuevof.FormCreate(Sender: TObject);
begin
  DecimalSeparator := '.';
end;

procedure Tproductonuevof.FormShow(Sender: TObject);
begin
  cargofoto := false;
end;

procedure Tproductonuevof.limpiarformulario();
begin
  LabeledEdit1.Text := '';
  LabeledEdit2.Text := '';
  LabeledEdit3.Text := '';
  LabeledEdit4.Text := '';
  LabeledEdit5.Text := '';
  RadioGroup1.Visible := true;
  RadioButton1.Checked := false;
  RadioButton1.Visible := true;
  RadioButton2.Checked := false;
  RadioButton2.Visible := true;
  ComboBox1.ItemIndex := 0;
  Image1.Picture.LoadFromFile('sin imagen.jpg');
  esModificacion := false;
end;

procedure Tproductonuevof.guardartipoproducto;
begin
  // guarda el tipo de producto
  if ComboBox1.ItemIndex = 1 then
  begin
    datamodule1.producto.FieldByName('tipo_prod').AsString := 'pantalon';
  end
  else
  begin
    if ComboBox1.ItemIndex = 2 then
    begin
      datamodule1.producto.FieldByName('tipo_prod').AsString := 'remera';
    end
    else
    begin
      if ComboBox1.ItemIndex = 3 then
      begin
        datamodule1.producto.FieldByName('tipo_prod').AsString := 'cinturon';
      end
      else
      begin
        if ComboBox1.ItemIndex = 4 then
        begin
          datamodule1.producto.FieldByName('tipo_prod').AsString := 'media';
        end
        else
        begin
          if ComboBox1.ItemIndex = 5 then
          begin
            datamodule1.producto.FieldByName('tipo_prod').AsString := 'bolsa';

          end
          else
          begin
            if ComboBox1.ItemIndex = 6 then
            begin
              datamodule1.producto.FieldByName('tipo_prod').AsString := 'ninos';
            end;
          end;
        end;
      end;
    end;

  end;
end;

procedure Tproductonuevof.LabeledEdit1Exit(Sender: TObject);
begin
  if not esModificacion then
  begin
    if datamodule1.producto.Locate('nombre_prod', LabeledEdit1.Text, []) then
    begin
      ShowMessage('El producto ingresado ya existe, ingrese otro nombre');
      LabeledEdit1.SetFocus;

    end;
  end;
end;

procedure Tproductonuevof.LabeledEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ',' then
    Key := '.';

end;

end.
