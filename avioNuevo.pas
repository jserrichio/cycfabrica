unit avioNuevo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, ExtDlgs;

type
  TfAvioNuevo = class(TForm)
    GroupBox1: TGroupBox;
    Image1: TImage;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    LabeledEdit3: TLabeledEdit;
    GroupBox2: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    LabeledEdit4: TLabeledEdit;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit1Exit(Sender: TObject);
  private
    { Private declarations }
    // procedure guardarimagen();
    procedure limpiarformulario();
    procedure verificarCambios();
    // procedure cargarfoto;
    procedure guardarimagen(avioActual: integer);
  public
    { Public declarations }
    procedure cargarproducto(idproducto: integer);

  var
    esModificacion: boolean;
    hayCambios: boolean;

  end;

var
  fAvioNuevo: TfAvioNuevo;
  cargofoto: boolean;

implementation

uses datamodule, consultarstock;
{$R *.dfm}

procedure TfAvioNuevo.Button1Click(Sender: TObject);
begin
  // OpenPictureDialog1.Filter := 'Imagenes|*.jpg|Imagenes|*.jpeg';
  cargofoto := true;
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    Image1.Stretch := true;
  end;
end;

procedure TfAvioNuevo.Button3Click(Sender: TObject);
var
  avioActual: integer;
begin

  if esModificacion then
  begin
    avioActual := datamodule1.avio.FieldByName('id_avio').AsInteger;
    if cargofoto then
    begin
      guardarimagen(avioActual);
    end;
  end;
  // verificar que estan todos los datos obligatorios
  if LabeledEdit1.Text = '' then
  begin
    ShowMessage('Debe ingresar el nombre del avio');
  end
  else
  begin
    if LabeledEdit3.Text = '' then
    begin
      ShowMessage('Debe ingresar el precio unitario del avio');
    end
    else
    begin
      // guardar en base de datos
      if self.esModificacion then
      begin
        verificarCambios;
        if hayCambios then
        begin
          datamodule1.avio.Edit;
        end;
      end
      else
      begin
        datamodule1.avio.append;
      end;
      if ((esModificacion and hayCambios) or (not esModificacion)) then
      begin

        datamodule1.avio.FieldByName('nombre_avio').AsString :=
          LabeledEdit1.Text;
        datamodule1.avio.FieldByName('descripcion_avio').AsString :=
          LabeledEdit2.Text;
        datamodule1.avio.FieldByName('precio_avio').AsFloat := strtofloat
          (LabeledEdit3.Text);
        datamodule1.avio.FieldByName('stock_avio').AsFloat := strtofloat
          (LabeledEdit4.Text);
        datamodule1.avio.post;
        avioActual := datamodule1.avio.FieldByName('id_avio').AsInteger;
        if not(esModificacion) then
        begin
          if cargofoto then
          begin
            guardarimagen(avioActual);
          end;
        end;

      end;

      limpiarformulario();
      // TfAvioNuevo.activarGrid;
      self.Close
    end;

  end;
  datamodule1.QstockAvio.Active := false;
  datamodule1.QstockAvio.Active := true;

end;

procedure TfAvioNuevo.guardarimagen(avioActual: integer);
var
  fs: TMemoryStream;
  imgJPG: TJpegImage;

begin
  if datamodule1.foto_avio.Locate('id_avio', avioActual, []) then
  begin
    // ShowMessage('Avio encontrado!');
    datamodule1.foto_avio.Edit;
  end
  else
  begin
    // ShowMessage('Avio no encontrado!');
    datamodule1.foto_avio.append;
    datamodule1.foto_avio.FieldByName('id_avio').AsInteger := avioActual;
  end;

  fs := TMemoryStream.create;
  imgJPG := TJpegImage.create;
  try
    imgJPG.LoadFromFile(OpenPictureDialog1.FileName);
    imgJPG.SaveToStream(fs);
    fs.Seek(0, soFromBeginning);
    try
      datamodule1.foto_aviofoto_avio.LoadFromStream(fs);
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
  datamodule1.foto_avio.post;
end;

procedure TfAvioNuevo.Button4Click(Sender: TObject);
begin
  if MessageDlg('¿Desea salir sin guardar los cambios?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin
    self.Close;
  end;

end;

procedure TfAvioNuevo.verificarCambios;
begin
  hayCambios := false;
  if ((LabeledEdit1.Text <> datamodule1.avio.FieldByName('nombre_avio')
        .AsString) or (LabeledEdit2.Text <> datamodule1.avio.FieldByName
        ('descripcion_avio').AsString) or ((LabeledEdit3.Text) <> floattostr
        (datamodule1.avio.FieldByName('precio_avio').AsFloat)) or
      ((LabeledEdit4.Text) <> floattostr(datamodule1.avio.FieldByName
          ('stock_avio').AsFloat))) then
  begin
    // ShowMessage('Hay cambios');
    hayCambios := true;
  end
  else
  begin
    // ShowMessage('No hay cambios');
    hayCambios := false;
  end;

end;

procedure TfAvioNuevo.cargarproducto(idproducto: integer);
begin
  datamodule1.avio.Locate('id_avio', idproducto, []);
  LabeledEdit1.Text := datamodule1.avio.FieldByName('nombre_avio').AsString;
  LabeledEdit2.Text := datamodule1.avio.FieldByName('descripcion_avio')
    .AsString;
  // cargarfoto;
  LabeledEdit3.Text := floattostr(datamodule1.avio.FieldByName('precio_avio')
      .AsFloat);

  LabeledEdit4.Text := floattostr(datamodule1.avio.FieldByName('stock_avio')
      .AsFloat);
  
end;

procedure TfAvioNuevo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  limpiarformulario;

end;

procedure TfAvioNuevo.FormShow(Sender: TObject);
begin
  cargofoto := false;
end;

procedure TfAvioNuevo.LabeledEdit1Exit(Sender: TObject);
begin
  if not esModificacion then
  begin
    if datamodule1.avio.Locate('nombre_avio', LabeledEdit1.Text, []) then
    begin
      ShowMessage('El avio ingresado ya existe, ingrese otro nombre');
      LabeledEdit1.SetFocus;

    end;
  end;
end;

procedure TfAvioNuevo.limpiarformulario();
begin
  LabeledEdit1.Text := '';
  LabeledEdit2.Text := '';
  LabeledEdit3.Text := '';
  LabeledEdit4.Text := '';
  Image1.Picture.LoadFromFile('sin imagen.jpg');
  esModificacion := false;
end;

{ procedure TfAvioNuevo.cargarfoto;
  var
  fs: TMemoryStream;
  imgJPG: TJpegImage;
  begin
  if not datamodule1.avio.FieldByName('foto_prod').IsNull then
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

  end; }

{ procedure TfAvioNuevo.guardarimagen;
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
  datamodule1.avio.foto_prod.LoadFromStream(fs);
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
}

end.
