unit verclientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  Tfverclientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    Button1: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure actualizarConsulta;
    procedure cargarClienteEnComponente;
    procedure actualizarPunteroCliente;
  public

    { Public declarations }
  end;

var
  fverclientes: Tfverclientes;

implementation

uses clientenuevo, datamodule;
{$R *.dfm}

procedure Tfverclientes.actualizarConsulta;
begin
  datamodule1.Qcliente.SQL.Clear;
  datamodule1.Qcliente.SQL.Add('select * from cliente');

  datamodule1.Qcliente.Open;
  datamodule1.Qcliente.Active := true;
end;

procedure Tfverclientes.Button1Click(Sender: TObject);
begin
    fclientenuevo.setModificacion;
  fclientenuevo.ShowModal;
  self.actualizarConsulta;
end;

procedure Tfverclientes.Button2Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tfverclientes.Button3Click(Sender: TObject);
begin
  fclientenuevo.setNuevo;
  fclientenuevo.ShowModal;
  self.actualizarConsulta;
end;

procedure Tfverclientes.DBGrid1CellClick(Column: TColumn);
begin
  actualizarPunteroCliente;
  self.cargarClienteEnComponente;

end;

procedure tfverclientes.actualizarPunteroCliente;
begin
  datamodule1.cliente.Locate('nombre_cli',datamodule1.Qcliente.FieldByName('nombre_cli').AsString,[]);
end;

procedure Tfverclientes.cargarClienteEnComponente;
begin
  // cargar cliente seleccionado en labelededit
  LabeledEdit1.Text := datamodule1.cliente.FieldByName('nombre_cli').AsString;
  LabeledEdit2.Text := datamodule1.cliente.FieldByName('telefono_cli').AsString;
  LabeledEdit4.Text := datamodule1.cliente.FieldByName('direccion_cli')
    .AsString;
  LabeledEdit5.Text := datamodule1.cliente.FieldByName('email_cli').AsString;

end;

procedure Tfverclientes.DBGrid1DblClick(Sender: TObject);
begin
  self.Close;
end;

procedure Tfverclientes.FormShow(Sender: TObject);
begin
  self.actualizarConsulta;
end;

end.
