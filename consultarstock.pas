unit consultarstock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, jpeg, ComCtrls;

type
  Tfconsultarstock = class(TForm)
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    GroupBox2: TGroupBox;
    LabeledEdit2: TLabeledEdit;
    Image1: TImage;
    Button1: TButton;
    Panel1: TPanel;
    GridTotal: TDBGrid;
    GridRemera: TDBGrid;
    GridPantalon: TDBGrid;
    GridCinturon: TDBGrid;
    LabeledEdit3: TLabeledEdit;
    GridMedia: TDBGrid;
    GridBolsa: TDBGrid;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    GridNinos: TDBGrid;
    GroupBox3: TGroupBox;
    Button2: TButton;
    procedure GridTotalCellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure GridTotalDblClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure GridRemeraCellClick(Column: TColumn);
    procedure GridPantalonCellClick(Column: TColumn);
    procedure GridCinturonCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure GridTotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridTotalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure GridCinturonDblClick(Sender: TObject);
    procedure GridPantalonDblClick(Sender: TObject);
    procedure GridRemeraDblClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure LabeledEdit5Change(Sender: TObject);
    procedure LabeledEdit5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure GridBolsaCellClick(Column: TColumn);
    procedure GridMediaCellClick(Column: TColumn);
  private
    { Private declarations }
    procedure cargarfoto;
    procedure actualizarPunteroProducto;

    procedure seleccionarProducto;
    procedure cargarinfo;
    procedure filtrarPorNombre;
    procedure buscoSinFiltro;
    procedure filtroPorSexoHombre;
    procedure filtroPorSexoDama;
    procedure filtrarPorArticulo;
    procedure sexo;
    procedure modificarProductoActual;
    procedure cargarStock;
    procedure accionDobleClick;
    procedure eliminarProducto;
  public
    { Public declarations }
    procedure limpiarFormulario;
    procedure activarGrid;
    procedure setModificar;
    procedure setConsultar;
    procedure setVenta;

  var
    entrePorModificar: boolean;
    entrePorConsultar: boolean;
  end;

var
  fconsultarstock: Tfconsultarstock;
  entreporgrid: boolean;

implementation

uses datamodule, productonuevo, cargarstockcinturon, cargarstockremeras,
  cargarstockpantalon, cargarstockmedia, cargarstockbolsa;
{$R *.dfm}

procedure Tfconsultarstock.setModificar;
begin
  entrePorModificar := true;
  entrePorConsultar := false;
  self.Caption := 'Modificar stock en f�brica';

end;

procedure Tfconsultarstock.setConsultar;
begin
  entrePorModificar := false;
  entrePorConsultar := true;
  self.Caption := 'Consultar stock en f�brica';
end;

procedure Tfconsultarstock.setVenta;
begin
  entrePorModificar := false;
  entrePorConsultar := false;
  self.Caption := 'Seleccionar producto';
end;

procedure Tfconsultarstock.limpiarFormulario;
begin
  LabeledEdit1.Text := '';
  LabeledEdit5.Text := '';
  ComboBox1.ItemIndex := 0;
  RadioGroup1.ItemIndex := 2;
  GridTotal.Visible := true;
  GridRemera.Visible := false;
  GridPantalon.Visible := false;
  GridCinturon.Visible := false;
  GridMedia.Visible := false;
  GridBolsa.Visible := false;
  LabeledEdit2.Text := '';
  Image1.Picture := nil;
  activarGrid;
  buscoSinFiltro;
end;

procedure tfconsultarstock.filtrarPorArticulo;
begin

  RadioGroup1.ItemIndex := 2;
  if GridTotal.Visible = true then
  begin
    datamodule1.QstockTotal.SQL.Clear;
    datamodule1.QstockTotal.SQL.Add(
      'select * from producto p left join talle_pantalon tp on p.id_prod = tp.id_prod '
        + 'left join talle_remera tr on p.id_prod = tr.id_prod left join talle_cinturon tc on p.id_prod = tc.id_prod ' + 'where p.num_prod like ' + QuotedStr('%' + LabeledEdit5.Text + '%'));
    datamodule1.QstockTotal.Open;
    datamodule1.QstockTotal.Active := true;
  end
  else
  begin
    if GridRemera.Visible = true then
    begin
      datamodule1.QstockRemera.SQL.Clear;
      datamodule1.QstockRemera.SQL.Add(
        'select * from producto p left join talle_remera tr on p.id_prod = tr.id_prod where p.tipo_prod="remera" and ' + 'p.num_prod like ' + QuotedStr('%' + LabeledEdit5.Text + '%'));
      datamodule1.QstockRemera.Open;
      datamodule1.QstockRemera.Active := true;
    end
    else
    begin
      if GridPantalon.Visible = true then
      begin
        datamodule1.QstockRemera.SQL.Clear;
        datamodule1.QstockRemera.SQL.Add(
          'select * from producto p left join talle_pantalon tp on p.id_prod = tp.id_prod where p.tipo_prod="pantalon" and ' + 'p.num_prod like ' + QuotedStr('%' + LabeledEdit5.Text + '%'));
        datamodule1.QstockRemera.Open;
        datamodule1.QstockRemera.Active := true;
      end
      else
      begin
        if GridCinturon.Visible = true then
        begin
          datamodule1.QstockRemera.SQL.Clear;
          datamodule1.QstockRemera.SQL.Add(
            'select * from producto p left join talle_cinturon tc on p.id_prod = tc.id_prod where p.tipo_prod="cinturon" and ' + 'p.num_prod like ' + QuotedStr('%' + LabeledEdit5.Text + '%'));
          datamodule1.QstockRemera.Open;
          datamodule1.QstockRemera.Active := true;
        end
        else
        begin
          if GridMedia.Visible = true then
          begin
            datamodule1.QstockMedia.SQL.Clear;
            datamodule1.QstockMedia.SQL.Add(
              'select * from producto p left join talle_media tm on p.id_prod = tm.id_prod where p.tipo_prod="media" and ' + 'p.num_prod like ' + QuotedStr('%' + LabeledEdit5.Text + '%'));
            datamodule1.QstockMedia.Open;
            datamodule1.QstockMedia.Active := true;
          end
          else
          begin
            if GridBolsa.Visible = true then
            begin
              datamodule1.QstockBolsa.SQL.Clear;
              datamodule1.QstockBolsa.SQL.Add(
                'select * from producto p left join talle_bolsa tb on p.id_prod = tb.id_prod where p.tipo_prod="bolsa" and ' + 'p.num_prod like ' + QuotedStr('%' + LabeledEdit5.Text + '%'));
              datamodule1.QstockBolsa.Open;
              datamodule1.QstockBolsa.Active := true;

            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfconsultarstock.filtrarPorNombre;
begin
  // saco la busqueda por sexo

  RadioGroup1.ItemIndex := 2;
  if GridTotal.Visible = true then
  begin
    datamodule1.QstockTotal.SQL.Clear;
    datamodule1.QstockTotal.SQL.Add(
      'select * from producto p left join talle_pantalon tp on p.id_prod = tp.id_prod '
        + 'left join talle_remera tr on p.id_prod = tr.id_prod left join talle_cinturon tc on p.id_prod = tc.id_prod ' + 'where p.nombre_prod like ' + QuotedStr('%' + LabeledEdit1.Text + '%'));
    datamodule1.QstockTotal.Open;
    datamodule1.QstockTotal.Active := true;
  end
  else
  begin
    if GridRemera.Visible = true then
    begin
      datamodule1.QstockRemera.SQL.Clear;
      datamodule1.QstockRemera.SQL.Add(
        'select * from producto p left join talle_remera tr on p.id_prod = tr.id_prod where p.tipo_prod="remera" and ' + 'p.nombre_prod like ' + QuotedStr('%' + LabeledEdit1.Text + '%'));
      datamodule1.QstockRemera.Open;
      datamodule1.QstockRemera.Active := true;
    end
    else
    begin
      if GridPantalon.Visible = true then
      begin
        datamodule1.QstockRemera.SQL.Clear;
        datamodule1.QstockRemera.SQL.Add(
          'select * from producto p left join talle_pantalon tp on p.id_prod = tp.id_prod where p.tipo_prod="pantalon" and ' + 'p.nombre_prod like ' + QuotedStr('%' + LabeledEdit1.Text + '%'));
        datamodule1.QstockRemera.Open;
        datamodule1.QstockRemera.Active := true;
      end
      else
      begin
        if GridCinturon.Visible = true then
        begin
          datamodule1.QstockRemera.SQL.Clear;
          datamodule1.QstockRemera.SQL.Add(
            'select * from producto p left join talle_cinturon tc on p.id_prod = tc.id_prod where p.tipo_prod="cinturon" and ' + 'p.nombre_prod like ' + QuotedStr('%' + LabeledEdit1.Text + '%'));
          datamodule1.QstockRemera.Open;
          datamodule1.QstockRemera.Active := true;
        end
        else
        begin
          if GridMedia.Visible = true then
          begin
            datamodule1.QstockMedia.SQL.Clear;
            datamodule1.QstockMedia.SQL.Add(
              'select * from producto p left join talle_media tm on p.id_prod = tm.id_prod where p.tipo_prod="media" and ' + 'p.nombre_prod like ' + QuotedStr('%' + LabeledEdit1.Text + '%'));
            datamodule1.QstockMedia.Open;
            datamodule1.QstockMedia.Active := true;
          end
          else
          begin
            if GridBolsa.Visible = true then
            begin
              datamodule1.QstockBolsa.SQL.Clear;
              datamodule1.QstockBolsa.SQL.Add(
                'select * from producto p left join talle_bolsa tb on p.id_prod = tb.id_prod where p.tipo_prod="bolsa" and ' + 'p.nombre_prod like ' + QuotedStr('%' + LabeledEdit1.Text + '%'));
              datamodule1.QstockBolsa.Open;
              datamodule1.QstockBolsa.Active := true;

            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfconsultarstock.buscoSinFiltro;
begin
  if GridTotal.Visible = true then
  begin
    datamodule1.QstockTotal.SQL.Clear;
    datamodule1.QstockTotal.SQL.Add(
      'select * from producto p left join talle_pantalon tp on p.id_prod = tp.id_prod ' + 'left join talle_remera tr on p.id_prod = tr.id_prod left join talle_cinturon tc on p.id_prod = tc.id_prod where p.activo=1 order by p.nombre_prod');
    datamodule1.QstockTotal.Open;
    datamodule1.QstockTotal.Active := true;
  end
  else
  begin
    if GridRemera.Visible = true then
    begin
      datamodule1.QstockRemera.SQL.Clear;
      datamodule1.QstockRemera.SQL.Add(
        'select * from producto p left join talle_remera tr on p.id_prod = tr.id_prod where p.tipo_prod="remera" where p.activo=1 order by p.nombre_prod');
      datamodule1.QstockRemera.Open;
      datamodule1.QstockRemera.Active := true;
    end
    else
    begin
      if GridPantalon.Visible = true then
      begin
        datamodule1.Qstockpantalon.SQL.Clear;
        datamodule1.Qstockpantalon.SQL.Add(
          'select * from producto p left join talle_pantalon tp on p.id_prod = tp.id_prod where p.tipo_prod="pantalon" where p.activo=1 order by p.nombre_prod');
        datamodule1.Qstockpantalon.Open;
        datamodule1.Qstockpantalon.Active := true;
      end
      else
      begin
        if GridCinturon.Visible = true then
        begin
          datamodule1.Qstockcinturon.SQL.Clear;
          datamodule1.Qstockcinturon.SQL.Add(
            'select * from producto p left join talle_cinturon tc on p.id_prod = tc.id_prod where p.tipo_prod="cinturon" where p.activo=1 order by p.nombre_prod');
          datamodule1.Qstockcinturon.Open;
          datamodule1.Qstockcinturon.Active := true;
        end
        else
        begin
          if GridMedia.Visible = true then
          begin
            datamodule1.QstockMedia.SQL.Clear;
            datamodule1.QstockMedia.SQL.Add(
              'select * from producto p left join talle_media tm on p.id_prod = tm.id_prod where p.tipo_prod="media" where p.activo=1 order by p.nombre_prod');
            datamodule1.QstockMedia.Open;
            datamodule1.QstockMedia.Active := true;
          end
          else
          begin
            if GridBolsa.Visible = true then
            begin
              datamodule1.QstockBolsa.SQL.Clear;
              datamodule1.QstockBolsa.SQL.Add(
                'select * from producto p left join talle_bolsa tb on p.id_prod = tb.id_prod where p.tipo_prod="bolsa" where p.activo=1 order by p.nombre_prod');
              datamodule1.QstockBolsa.Open;
              datamodule1.QstockBolsa.Active := true;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfconsultarstock.Button1Click(Sender: TObject);
begin
  // productonuevof.hayCambios := false;
  modificarProductoActual;
end;

procedure Tfconsultarstock.Button2Click(Sender: TObject);
begin
 if MessageDlg('�Eliminar el producto? Esta operaci�n no se puede deshacer!', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin


//    self.filtroVentas;
  end;
  //####

  if GridTotal.Visible then
  begin
    // total
    datamodule1.producto.Locate('id_prod',
      datamodule1.QstockTotal.FieldByName('id_prod').AsInteger, []);
  end
  else
  begin
    if GridPantalon.Visible then
    begin
      // pantalon
      datamodule1.producto.Locate('id_prod',
        datamodule1.Qstockpantalon.FieldByName('id_prod').AsInteger, []);
    end
    else
    begin
      if GridRemera.Visible then
      begin
        // remera
        datamodule1.producto.Locate('id_prod',
          datamodule1.QstockRemera.FieldByName('id_prod').AsInteger, []);
      end
      else
      begin
        if GridCinturon.Visible then
        begin
          // cinturon
          datamodule1.producto.Locate('id_prod',
            datamodule1.Qstockcinturon.FieldByName('id_prod').AsInteger, []);
        end
        else
        begin
          if GridMedia.Visible then
          begin
            // media
            datamodule1.producto.Locate('id_prod',
              datamodule1.QstockMedia.FieldByName('id_prod').AsInteger, []);
          end
          else
          begin
            if GridBolsa.Visible then
            begin
              // bolsa
              datamodule1.producto.Locate('id_prod',
                datamodule1.QstockBolsa.FieldByName('id_prod').AsInteger, []);
            end
            else
            begin
              if GridNinos.Visible then
              begin
                // ni�os
                datamodule1.producto.Locate('id_prod',
                  datamodule1.QstockNinos.FieldByName('id_prod').AsInteger,
                  []);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
   self.eliminarProducto;
   self.activarGrid;
  //####
  button2.Enabled:=false;
end;

procedure tfconsultarstock.eliminarProducto;
begin
  datamodule1.producto.Edit;
  datamodule1.producto.FieldByName('activo').AsInteger:=0;
  DataModule1.producto.Post;
end;

procedure Tfconsultarstock.cargarfoto;
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
  end
  else
  begin
    Image1.Picture.LoadFromFile('\Maiser\sistema\Sin imagen.jpg');
  end;
end;

procedure Tfconsultarstock.ComboBox1Change(Sender: TObject);
begin
  if not entreporgrid then
  begin
    activarGrid;
  end;
end;

procedure Tfconsultarstock.ComboBox1Click(Sender: TObject);
begin
  entreporgrid := false;
end;

procedure Tfconsultarstock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  limpiarFormulario;
end;

procedure Tfconsultarstock.FormShow(Sender: TObject);
begin
  // ShowMessage('show!');
  limpiarFormulario;
  self.activarGrid;
  Image1.Picture.LoadFromFile('sin imagen.jpg');

end;

procedure Tfconsultarstock.actualizarPunteroProducto;
begin
  if GridTotal.Visible then
  begin
    // total
    datamodule1.producto.Locate('id_prod',
      datamodule1.QstockTotal.FieldByName('id_prod').AsInteger, []);
  end
  else
  begin
    if GridPantalon.Visible then
    begin
      // pantalon
      datamodule1.producto.Locate('id_prod',
        datamodule1.Qstockpantalon.FieldByName('id_prod').AsInteger, []);
    end
    else
    begin
      if GridRemera.Visible then
      begin
        // remera
        datamodule1.producto.Locate('id_prod',
          datamodule1.QstockRemera.FieldByName('id_prod').AsInteger, []);
      end
      else
      begin
        if GridCinturon.Visible then
        begin
          // cinturon
          datamodule1.producto.Locate('id_prod',
            datamodule1.Qstockcinturon.FieldByName('id_prod').AsInteger, []);
        end
        else
        begin
          if GridMedia.Visible then
          begin
            // media
            datamodule1.producto.Locate('id_prod',
              datamodule1.QstockMedia.FieldByName('id_prod').AsInteger, []);
          end
          else
          begin
            if GridBolsa.Visible then
            begin
              // bolsa
              datamodule1.producto.Locate('id_prod',
                datamodule1.QstockBolsa.FieldByName('id_prod').AsInteger, []);
            end
            else
            begin
              if GridNinos.Visible then
              begin
                // ni�os
                datamodule1.producto.Locate('id_prod',
                  datamodule1.QstockNinos.FieldByName('id_prod').AsInteger,
                  []);
              end;
            end;
          end;
        end;
      end;
    end;
  end;

end;

procedure Tfconsultarstock.activarGrid;
begin
  if ComboBox1.ItemIndex = 0 then
  begin
    GridTotal.Visible := true;
    GridRemera.Visible := false;
    GridPantalon.Visible := false;
    GridCinturon.Visible := false;
    GridMedia.Visible := false;
    GridBolsa.Visible := false;
    GridNinos.Visible := false;
    datamodule1.QstockTotal.Active := false;
    datamodule1.QstockTotal.Active := true;
  end
  else
  begin
    if ComboBox1.ItemIndex = 1 then
    begin
      GridTotal.Visible := false;
      GridRemera.Visible := false;
      GridPantalon.Visible := true;
      GridCinturon.Visible := false;
      GridMedia.Visible := false;
      GridBolsa.Visible := false;
      GridNinos.Visible := false;
      datamodule1.Qstockpantalon.Active := false;
      datamodule1.Qstockpantalon.Active := true;
    end
    else
    begin
      if ComboBox1.ItemIndex = 2 then
      begin
        GridTotal.Visible := false;
        GridRemera.Visible := true;
        GridPantalon.Visible := false;
        GridCinturon.Visible := false;
        GridMedia.Visible := false;
        GridBolsa.Visible := false;
        GridNinos.Visible := false;
        datamodule1.QstockRemera.Active := false;
        datamodule1.QstockRemera.Active := true;
      end
      else
      begin
        if ComboBox1.ItemIndex = 3 then
        begin
          GridTotal.Visible := false;
          GridRemera.Visible := false;
          GridPantalon.Visible := false;
          GridCinturon.Visible := true;
          GridMedia.Visible := false;
          GridBolsa.Visible := false;
          GridNinos.Visible := false;
          datamodule1.Qstockcinturon.Active := false;
          datamodule1.Qstockcinturon.Active := true;
        end
        else
        begin
          if ComboBox1.ItemIndex = 4 then
          begin
            GridTotal.Visible := false;
            GridRemera.Visible := false;
            GridPantalon.Visible := false;
            GridCinturon.Visible := false;
            GridMedia.Visible := true;
            GridBolsa.Visible := false;
            GridNinos.Visible := false;
            datamodule1.QstockMedia.Active := false;
            datamodule1.QstockMedia.Active := true;
          end
          else
          begin
            if ComboBox1.ItemIndex = 5 then
            begin
              GridTotal.Visible := false;
              GridRemera.Visible := false;
              GridPantalon.Visible := false;
              GridCinturon.Visible := false;
              GridMedia.Visible := false;
              GridBolsa.Visible := true;
              GridNinos.Visible := false;
              datamodule1.QstockBolsa.Active := false;
              datamodule1.QstockBolsa.Active := true;
            end
            else
            begin
              if ComboBox1.ItemIndex = 6 then
              begin
                // ACA HAY QUE PONER QUE HACER CUANDO ES NI�OS!

                GridTotal.Visible := false;
                GridRemera.Visible := false;
                GridPantalon.Visible := false;
                GridCinturon.Visible := false;
                GridMedia.Visible := false;
                GridBolsa.Visible := false;
                GridNinos.Visible := true;
                datamodule1.QstockNinos.Active := false;
                datamodule1.QstockNinos.Active := true;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfconsultarstock.seleccionarProducto;
begin
  // pone el puntero en la tabla producto, carga la foto y la info
  Button1.Enabled := true;
  actualizarPunteroProducto;
  cargarinfo;
end;

procedure Tfconsultarstock.cargarinfo;
begin
  // carga nombre, tipo de prenda, sexo, descripcion y foto

  // cargo nombre
  LabeledEdit1.Text := datamodule1.producto.FieldByName('nombre_prod').AsString;
  // cargo numero de producto
  LabeledEdit5.Text := inttostr(datamodule1.producto.FieldByName('num_prod')
      .AsInteger);
  // cargo tipo de prenda
  if datamodule1.producto.FieldByName('tipo_prod').AsString = 'pantalon' then
  begin
    ComboBox1.ItemIndex := 1;
  end
  else
  begin
    if datamodule1.producto.FieldByName('tipo_prod').AsString = 'remera' then
    begin
      ComboBox1.ItemIndex := 2;
    end
    else
    begin
      if datamodule1.producto.FieldByName('tipo_prod')
        .AsString = 'cinturon' then
      begin
        ComboBox1.ItemIndex := 3;
      end
      else
      begin
        if datamodule1.producto.FieldByName('tipo_prod').AsString = 'media' then
        begin
          ComboBox1.ItemIndex := 4;
        end
        else
        begin
          if datamodule1.producto.FieldByName('tipo_prod')
            .AsString = 'bolsa' then
          begin
            ComboBox1.ItemIndex := 5;
          end
          else
          begin
            if datamodule1.producto.FieldByName('tipo_prod')
              .AsString = 'ninos' then
            begin
              ComboBox1.ItemIndex := 6;
            end
            else
            begin
              ComboBox1.ItemIndex := 0;
            end;
          end;
        end;
      end;
    end;
  end;
  { // cargo sexo
    if datamodule1.producto.FieldByName('sexo_prod').AsString = 'hombre' then
    begin
    RadioGroup1.ItemIndex := 0;
    end
    else
    begin
    if datamodule1.producto.FieldByName('sexo_prod').AsString = 'dama' then
    begin
    RadioGroup1.ItemIndex := 1;
    end
    else
    begin
    RadioGroup1.ItemIndex := 2;
    end;
    end; }
  // cargo descripcion
  LabeledEdit2.Text := datamodule1.producto.FieldByName('descripcion_prod')
    .AsString;
  // cargar precios
  LabeledEdit3.Text := FloatToStr(datamodule1.producto.FieldByName
      ('precio_unitario').AsFloat);
  LabeledEdit4.Text := FloatToStr(datamodule1.producto.FieldByName
      ('precio_xmayor').AsFloat);
  // #### cargo la foto
  cargarfoto;

end;

procedure Tfconsultarstock.GridBolsaCellClick(Column: TColumn);
begin
Button2.Enabled:=true;
end;

procedure Tfconsultarstock.GridCinturonCellClick(Column: TColumn);
begin
  entreporgrid := true;
  seleccionarProducto;
  Button2.Enabled:=true;
end;

procedure Tfconsultarstock.GridCinturonDblClick(Sender: TObject);
begin
  accionDobleClick;
end;

procedure Tfconsultarstock.GridMediaCellClick(Column: TColumn);
begin
Button2.Enabled:=true;
end;

procedure Tfconsultarstock.GridPantalonCellClick(Column: TColumn);
begin
  entreporgrid := true;
  seleccionarProducto;
  Button2.Enabled:=true;
end;

procedure Tfconsultarstock.GridPantalonDblClick(Sender: TObject);
begin
  accionDobleClick;
end;

procedure Tfconsultarstock.GridRemeraCellClick(Column: TColumn);
begin
  entreporgrid := true;
  seleccionarProducto;
  Button2.Enabled:=true;

end;

procedure Tfconsultarstock.GridRemeraDblClick(Sender: TObject);
begin
  accionDobleClick;
end;

procedure Tfconsultarstock.GridTotalCellClick(Column: TColumn);
begin
  entreporgrid := true;
  seleccionarProducto;
  Button2.Enabled:=true;
end;

procedure Tfconsultarstock.GridTotalDblClick(Sender: TObject);
begin
  accionDobleClick;
end;

procedure Tfconsultarstock.GridTotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  seleccionarProducto;
end;

procedure Tfconsultarstock.GridTotalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  seleccionarProducto;
end;

procedure Tfconsultarstock.LabeledEdit1Change(Sender: TObject);
begin
  if not entreporgrid then
  begin
    if LabeledEdit1.Text <> '' then
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

procedure Tfconsultarstock.LabeledEdit1Click(Sender: TObject);
begin
  entreporgrid := false;
end;

procedure Tfconsultarstock.LabeledEdit5Change(Sender: TObject);
begin
  if not entreporgrid then
  begin
    if LabeledEdit5.Text <> '' then
    begin
      filtrarPorArticulo;
    end
    else
    begin
      limpiarFormulario;
      buscoSinFiltro;
    end;
  end;
end;

procedure Tfconsultarstock.LabeledEdit5Click(Sender: TObject);
begin
  entreporgrid := false;
end;

procedure Tfconsultarstock.RadioButton1Click(Sender: TObject);
begin
  LabeledEdit1.Text := '';
  ComboBox1.ItemIndex := 0;
  LabeledEdit2.Text := '';
  Image1.Picture := nil;
  entreporgrid := false;
  sexo;
end;

procedure Tfconsultarstock.RadioButton2Click(Sender: TObject);
begin
  LabeledEdit1.Text := '';
  ComboBox1.ItemIndex := 0;
  LabeledEdit2.Text := '';
  Image1.Picture := nil;
  entreporgrid := false;
  sexo;
end;

procedure Tfconsultarstock.RadioButton3Click(Sender: TObject);
begin
  LabeledEdit1.Text := '';
  ComboBox1.ItemIndex := 0;
  LabeledEdit2.Text := '';
  Image1.Picture := nil;
  entreporgrid := false;
  sexo;
end;

procedure Tfconsultarstock.RadioGroup1Click(Sender: TObject);
begin
  entreporgrid := false;
  sexo;
end;

procedure Tfconsultarstock.sexo;
begin
  if not entreporgrid then
  begin
    if RadioGroup1.ItemIndex = 0 then
    begin
      // filtra solo hombres
      filtroPorSexoHombre;
    end
    else
    begin
      if RadioGroup1.ItemIndex = 1 then
      begin
        // filtra solo damas
        filtroPorSexoDama;
      end
      else
      begin
        // filtra todos
        buscoSinFiltro;
      end;
    end;
  end;
end;

procedure Tfconsultarstock.modificarProductoActual;
begin
  productonuevof.esModificacion := true;
  productonuevof.cargarproducto(datamodule1.producto.FieldByName('id_prod')
      .AsInteger);
  productonuevof.ShowModal;


end;

procedure Tfconsultarstock.cargarStock;
var
  tipoprod: string;
  idprod: integer;
begin
  tipoprod := datamodule1.producto.FieldByName('tipo_prod').AsString;
  idprod := datamodule1.producto.FieldByName('id_prod').AsInteger;
  if tipoprod = 'remera' then
  begin
    // llamo formulario stock remera
    fcargarstockremeras.cargardatos(idprod);
    fcargarstockremeras.ShowModal;
  end
  else
  begin
    if tipoprod = 'pantalon' then
    begin
      // llamo al formulario stock pantalon
      fcargarstockpantalon.cargardatos(idprod);
      fcargarstockpantalon.ShowModal;
    end
    else
    begin
      if tipoprod = 'cinturon' then
      begin
        // llamo al formulario stock pantalon
        fcargarstockcinturon.cargardatos(idprod);
        fcargarstockcinturon.ShowModal;
      end
      else
      begin
        if tipoprod = 'media' then
        begin
          // llamo al formulario stock media
          fcargarstockmedia.cargardatos(idprod);
          fcargarstockmedia.ShowModal;
        end
        else
        begin
          if tipoprod = 'bolsa' then
          begin
            // llamo al formulario stock bolsa
            fcargarstockbolsa.cargardatos(idprod);
            fcargarstockbolsa.ShowModal;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfconsultarstock.accionDobleClick;
begin
  if entrePorModificar then
  begin
    self.modificarProductoActual;
  end
  else
  begin
    if entrePorConsultar then
    begin
      cargarStock;
    end
    else
    begin
      self.Close;
    end;
  end;
end;

procedure Tfconsultarstock.filtroPorSexoHombre();
begin
  if GridTotal.Visible = true then
  begin
    datamodule1.QstockTotal.SQL.Clear;
    datamodule1.QstockTotal.SQL.Add(
      'select * from producto p left join talle_pantalon tp on p.id_prod = tp.id_prod ' + 'left join talle_remera tr on p.id_prod = tr.id_prod left join talle_cinturon tc on p.id_prod = tc.id_prod where p.sexo_prod="hombre"');
    datamodule1.QstockTotal.Open;
    datamodule1.QstockTotal.Active := true;
  end
  else
  begin
    if GridRemera.Visible = true then
    begin
      datamodule1.QstockRemera.SQL.Clear;
      datamodule1.QstockRemera.SQL.Add(
        'select * from producto p left join talle_remera tr on p.id_prod = tr.id_prod where p.tipo_prod="remera" and p.sexo_prod="hombre"');
      datamodule1.QstockRemera.Open;
      datamodule1.QstockRemera.Active := true;
    end
    else
    begin
      if GridPantalon.Visible = true then
      begin
        datamodule1.Qstockpantalon.SQL.Clear;
        datamodule1.Qstockpantalon.SQL.Add(
          'select * from producto p left join talle_pantalon tp on p.id_prod = tp.id_prod where p.tipo_prod="pantalon" and p.sexo_prod="hombre"');
        datamodule1.Qstockpantalon.Open;
        datamodule1.Qstockpantalon.Active := true;
      end
      else
      begin
        if GridCinturon.Visible = true then
        begin
          datamodule1.Qstockcinturon.SQL.Clear;
          datamodule1.Qstockcinturon.SQL.Add(
            'select * from producto p left join talle_cinturon tc on p.id_prod = tc.id_prod where p.tipo_prod="cinturon" and p.sexo_prod="hombre"');
          datamodule1.Qstockcinturon.Open;
          datamodule1.Qstockcinturon.Active := true;
        end
        else
        begin
          if GridMedia.Visible = true then
          begin
            datamodule1.QstockMedia.SQL.Clear;
            datamodule1.QstockMedia.SQL.Add(
              'select * from producto p left join talle_media tm on p.id_prod = tm.id_prod where p.tipo_prod="media" and p.sexo_prod="hombre"');
            datamodule1.QstockMedia.Open;
            datamodule1.QstockMedia.Active := true;
          end
          else
          begin
            if GridBolsa.Visible = true then
            begin
              datamodule1.QstockBolsa.SQL.Clear;
              datamodule1.QstockBolsa.SQL.Add(
                'select * from producto p left join talle_bolsa tb on p.id_prod = tb.id_prod where p.tipo_prod="bolsa" and p.sexo_prod="hombre"');
              datamodule1.QstockBolsa.Open;
              datamodule1.QstockBolsa.Active := true;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfconsultarstock.filtroPorSexoDama;
begin
  if GridTotal.Visible = true then
  begin
    datamodule1.QstockTotal.SQL.Clear;
    datamodule1.QstockTotal.SQL.Add(
      'select * from producto p left join talle_pantalon tp on p.id_prod = tp.id_prod ' + 'left join talle_remera tr on p.id_prod = tr.id_prod left join talle_cinturon tc on p.id_prod = tc.id_prod where p.sexo_prod="dama"');
    datamodule1.QstockTotal.Open;
    datamodule1.QstockTotal.Active := true;
  end
  else
  begin
    if GridRemera.Visible = true then
    begin
      datamodule1.QstockRemera.SQL.Clear;
      datamodule1.QstockRemera.SQL.Add(
        'select * from producto p left join talle_remera tr on p.id_prod = tr.id_prod where p.tipo_prod="remera" and p.sexo_prod="dama"');
      datamodule1.QstockRemera.Open;
      datamodule1.QstockRemera.Active := true;
    end
    else
    begin
      if GridPantalon.Visible = true then
      begin
        datamodule1.Qstockpantalon.SQL.Clear;
        datamodule1.Qstockpantalon.SQL.Add(
          'select * from producto p left join talle_pantalon tp on p.id_prod = tp.id_prod where p.tipo_prod="pantalon" and p.sexo_prod="dama"');
        datamodule1.Qstockpantalon.Open;
        datamodule1.Qstockpantalon.Active := true;
      end
      else
      begin
        if GridCinturon.Visible = true then
        begin
          datamodule1.Qstockcinturon.SQL.Clear;
          datamodule1.Qstockcinturon.SQL.Add(
            'select * from producto p left join talle_cinturon tc on p.id_prod = tc.id_prod where p.tipo_prod="cinturon" and p.sexo_prod="dama"');
          datamodule1.Qstockcinturon.Open;
          datamodule1.Qstockcinturon.Active := true;
        end
        else
        begin
          if GridMedia.Visible = true then
          begin
            datamodule1.QstockMedia.SQL.Clear;
            datamodule1.QstockMedia.SQL.Add(
              'select * from producto p left join talle_media tm on p.id_prod = tm.id_prod where p.tipo_prod="media" and p.sexo_prod="dama"');
            datamodule1.QstockMedia.Open;
            datamodule1.QstockMedia.Active := true;
          end
          else
          begin
            if GridBolsa.Visible = true then
            begin
              datamodule1.QstockBolsa.SQL.Clear;
              datamodule1.QstockBolsa.SQL.Add(
                'select * from producto p left join talle_bolsa tb on p.id_prod = tb.id_prod where p.tipo_prod="bolsa" and p.sexo_prod="dama"');
              datamodule1.QstockBolsa.Open;
              datamodule1.QstockBolsa.Active := true;
            end;
          end;
        end;
      end;
    end;
  end;
end;

end.
