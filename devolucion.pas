unit devolucion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tfdevolucion = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LabeledEdit1Click(Sender: TObject);
    procedure LabeledEdit2Click(Sender: TObject);
  private
    { Private declarations }
    procedure devolverprod();
    procedure ingresarCantidades;
  public
    { Public declarations }
  end;

var
  fdevolucion: Tfdevolucion;
  prodactual: string;

implementation

uses datamodule, verclientes, consultarstock, cargarstockcinturon,
  cargarstockpantalon, cargarstockremeras;
{$R *.dfm}

procedure Tfdevolucion.Button1Click(Sender: TObject);
begin
  if ((LabeledEdit1.Text <> '') and (LabeledEdit2.Text <> '')) then
  begin
    self.devolverprod;
  end
  else
  begin
    ShowMessage('Debe ingresar cliente y producto para devolver mercaderia');
  end;
end;

procedure Tfdevolucion.Button2Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tfdevolucion.devolverprod;
begin
  datamodule1.producto.Locate('nombre_prod', prodactual, []);
  ingresarCantidades;

end;

procedure Tfdevolucion.ingresarCantidades;
begin
  if datamodule1.producto.FieldByName('tipo_prod').AsString = 'remera' then
  begin
    fcargarstockremeras.limpiarformulario;
    fcargarstockremeras.ShowModal;
  end
  else
  begin
    if datamodule1.producto.FieldByName('tipo_prod').AsString = 'pantalon' then
    begin
       fcargarstockpantalon.limpiarformulario;
      fcargarstockpantalon.ShowModal;
    end
    else
    begin
       fcargarstockcinturon.limpiarformulario;
      fcargarstockcinturon.ShowModal;
    end;
  end;
end;

procedure Tfdevolucion.LabeledEdit1Click(Sender: TObject);
begin
  fverclientes.ShowModal;
  LabeledEdit1.Text := datamodule1.cliente.FieldByName('nombre_cli').AsString;

end;

procedure Tfdevolucion.LabeledEdit2Click(Sender: TObject);
begin
  fconsultarstock.ShowModal;
  prodactual := datamodule1.producto.FieldByName('nombre_prod').AsString;
  LabeledEdit2.Text := prodactual;

end;

end.
