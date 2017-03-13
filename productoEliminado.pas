unit productoEliminado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TrecuperarProducto = class(TForm)
    DBGrid1: TDBGrid;
    QEliminados: TADOQuery;
    dsqeliminados: TDataSource;
    Button1: TButton;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure buscarEliminados();
    procedure limpiarFormulario();
  public
    { Public declarations }
  end;

var
  recuperarProducto: TrecuperarProducto;

implementation

uses datamodule;

{$R *.dfm}

procedure TrecuperarProducto.buscarEliminados;
begin
    QEliminados.SQL.Clear;
    QEliminados.SQL.Add(
      'select * from producto p where p.activo=0 order by p.nombre_prod');
    QEliminados.Open;
    QEliminados.Active := true;

end;

procedure TrecuperarProducto.limpiarFormulario;
begin
   Button1.Enabled:=false;
   self.buscarEliminados;
end;

procedure TrecuperarProducto.Button1Click(Sender: TObject);
begin
if MessageDlg('¿Recuperar el producto '+datamodule1.producto.FieldByName('nombre_prod').AsString+'?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin
  datamodule1.producto.Edit;
  datamodule1.producto.FieldByName('activo').AsInteger:=1;
  datamodule1.producto.Post;
  self.limpiarFormulario;
  end;
end;

procedure TrecuperarProducto.DBGrid1CellClick(Column: TColumn);
begin
Button1.Enabled:=true;
datamodule1.producto.locate('id_prod',
      QEliminados.FieldByName('id_prod').AsInteger, []);

end;

procedure TrecuperarProducto.FormShow(Sender: TObject);
begin
self.limpiarFormulario;
end;

end.
