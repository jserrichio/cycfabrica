unit consultarStockAvio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, jpeg;

type
  TfconsultarStockAvio = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Image1: TImage;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    GridStockAvio: TDBGrid;
    ProgressBar1: TProgressBar;
    GroupBox3: TGroupBox;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit4Change(Sender: TObject);
    procedure LabeledEdit4Click(Sender: TObject);
    procedure GridStockAvioCellClick(Column: TColumn);
    procedure GridStockAvioDblClick(Sender: TObject);
  private
    { Private declarations }

    // procedure cargarfoto;
    procedure actualizarPunteroAvio;

    procedure seleccionarAvio;
    procedure cargarinfo;
    procedure filtrarPorNombre;
    procedure buscoSinFiltro;

    procedure modificarAvioActual;
    procedure accionDobleClick;
    procedure cargarfoto;

  public
    { Public declarations }

    procedure limpiarFormulario;
    procedure activarGrid;
    procedure setConfeccion;
    procedure setModificar;
    procedure setConsultar;

  var
    entrePorModificar: boolean;
    entrePorConsultar: boolean;

  end;

var
  fconsultarStockAvio: TfconsultarStockAvio;
  entreporgrid: boolean;

implementation

uses datamodule, avioNuevo;
{$R *.dfm}


procedure TfconsultarStockAvio.setModificar;
begin
  entrePorModificar := true;
  entrePorConsultar := false;
  self.Caption := 'Modificar stock de avios en fábrica';

end;

procedure TfconsultarStockAvio.setConsultar;
begin
  entrePorModificar := false;
  entrePorConsultar := true;
  self.Caption := 'Consultar stock de avios en fábrica';
end;

procedure TfconsultarStockAvio.setConfeccion;
begin
  entrePorModificar := false;
  entrePorConsultar := false;
  self.Caption := 'Seleccionar avio';
end;




procedure TfconsultarStockAvio.limpiarFormulario;
begin
  LabeledEdit1.Text := '';
  LabeledEdit2.Text := '';
  LabeledEdit4.Text := '';
  LabeledEdit5.Text := '';
  GridStockAvio.Visible := true;
  Image1.Picture := nil;

end;

procedure TfconsultarStockAvio.Button1Click(Sender: TObject);
begin
  favioNuevo.hayCambios := false;
  modificarAvioActual;
end;

procedure TfconsultarStockAvio.filtrarPorNombre;
begin

  if GridStockAvio.Visible = true then
  begin
    datamodule1.QstockAvio.SQL.Clear;
    datamodule1.QstockAvio.SQL.Add
      ('select * from avio where nombre_avio like ' + QuotedStr('%' + LabeledEdit4.Text + '%'));
    datamodule1.QstockAvio.Open;
    datamodule1.QstockAvio.Active := true;
  end;
end;

procedure TfconsultarStockAvio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  limpiarFormulario;
end;

procedure TfconsultarStockAvio.FormShow(Sender: TObject);
begin
  limpiarFormulario;
  datamodule1.QstockAvio.Active := false;
  datamodule1.QstockAvio.Active := true;
  Image1.Picture.LoadFromFile('sin imagen.jpg');
end;

procedure TfconsultarStockAvio.GridStockAvioCellClick(Column: TColumn);
begin
  entreporgrid := true;
  seleccionarAvio;
end;

procedure TfconsultarStockAvio.GridStockAvioDblClick(Sender: TObject);
begin
self.accionDobleClick;
end;

procedure TfconsultarStockAvio.LabeledEdit4Change(Sender: TObject);
begin
  if not entreporgrid then
  begin
    if LabeledEdit4.Text <> '' then
    begin
      filtrarPorNombre;
    end
    else
    begin
      limpiarFormulario;
      buscoSinFiltro;
    end;
  end;
end;

procedure TfconsultarStockAvio.LabeledEdit4Click(Sender: TObject);
begin
  entreporgrid := false;
end;

procedure TfconsultarStockAvio.buscoSinFiltro;
begin
  if GridStockAvio.Visible = true then
  begin
    datamodule1.QstockAvio.SQL.Clear;
    datamodule1.QstockAvio.SQL.Add('select * from avio');
    datamodule1.QstockAvio.Open;
    datamodule1.QstockAvio.Active := true;
  end;
end;

procedure TfconsultarStockAvio.actualizarPunteroAvio;
begin
  if GridStockAvio.Visible then
  begin
    datamodule1.avio.Locate('id_avio',
      datamodule1.QstockAvio.FieldByName('id_avio').AsInteger, []);
  end;
end;

procedure TfconsultarStockAvio.activarGrid;
begin
  GridStockAvio.Visible := true;
end;

procedure TfconsultarStockAvio.seleccionarAvio;
begin
  // pone el puntero en la tabla avio, carga la foto y la info
  Button1.Enabled := true;
  actualizarPunteroAvio;
  cargarinfo;
end;

procedure TfconsultarStockAvio.cargarinfo;
begin
  // carga nombre, tipo de prenda, sexo, descripcion y foto

  // cargo nombre
  LabeledEdit4.Text := datamodule1.avio.FieldByName('nombre_avio').AsString;
  // cargo descripcion
  LabeledEdit2.Text := datamodule1.avio.FieldByName('descripcion_avio')
    .AsString;
  // cargar precio unitario
  LabeledEdit5.Text := FloatToStr(datamodule1.avio.FieldByName('precio_avio')
      .AsFloat);
  // cargar Stock
  LabeledEdit1.Text := FloatToStr(datamodule1.avio.FieldByName('stock_avio')
      .AsFloat);
  // #### cargo la foto
  cargarfoto;
end;

procedure TfconsultarStockAvio.cargarfoto;
var
  fs: TMemoryStream;
  imgJPG: TJpegImage;
begin
  // me posiciono en el avio necesario en la tabla foto
  if datamodule1.foto_avio.Locate('id_avio',
    datamodule1.avio.FieldByName('id_avio').AsInteger, []) then
  begin
    if not datamodule1.foto_avio.FieldByName('foto_avio').IsNull then
    begin
      imgJPG := TJpegImage.create;
      fs := TMemoryStream.create();
      datamodule1.foto_aviofoto_avio.SaveToStream(fs);
      fs.Seek(0, soFromBeginning);
      imgJPG.LoadFromStream(fs);
      try
        Image1.Picture.Assign(imgJPG);
        Image1.Stretch := true;
      finally
        fs.free;
      end;
    end
    else
    begin
      Image1.Picture.LoadFromFile('Sin imagen.jpg');
    end;
  end
  else
  begin
    Image1.Picture.LoadFromFile('Sin imagen.jpg');
  end;
end;

procedure TfconsultarStockAvio.modificarAvioActual;
begin
  favioNuevo.esModificacion := true;
  favioNuevo.cargarproducto(datamodule1.avio.FieldByName('id_avio').AsInteger);
  favioNuevo.ShowModal;
  ProgressBar1.Position := 0;
end;

procedure TfconsultarStockAvio.accionDobleClick;
begin
  if entrePorModificar then
  begin
    self.modificarAvioActual;
  end
  else
  begin
    self.Close;
  end;
end;

end.
