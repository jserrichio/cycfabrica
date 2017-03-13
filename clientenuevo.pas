unit clientenuevo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tfclientenuevo = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure guardarCliente;
    procedure limpiarFormulario;

  public
    { Public declarations }
    procedure cargarCliente;
    procedure setModificacion;
    procedure setNuevo;

  end;

var
  fclientenuevo: Tfclientenuevo;
  modificacion: boolean;
  hayCambios: boolean;

implementation

uses datamodule;
{$R *.dfm}

procedure Tfclientenuevo.setModificacion;
begin
  modificacion := true;
end;

procedure Tfclientenuevo.setNuevo;
begin
  modificacion := false;
end;

procedure Tfclientenuevo.cargarCliente;
begin
  LabeledEdit1.Text := datamodule1.cliente.FieldByName('dni_cli').AsString;
  LabeledEdit2.Text := datamodule1.cliente.FieldByName('nombre_cli').AsString;
  LabeledEdit3.Text := datamodule1.cliente.FieldByName('telefono_cli').AsString;
  LabeledEdit4.Text := datamodule1.cliente.FieldByName('direccion_cli')
    .AsString;
  LabeledEdit5.Text := datamodule1.cliente.FieldByName('localidad_cli')
    .AsString;
  LabeledEdit6.Text := datamodule1.cliente.FieldByName('email_cli').AsString;
  if datamodule1.cliente.FieldByName('tipo').AsString = 'S' then
  begin
    RadioGroup1.ItemIndex := 0;
  end
  else
  begin
    RadioGroup1.ItemIndex := 1;
  end;

end;

procedure Tfclientenuevo.FormShow(Sender: TObject);
begin
  if modificacion then
    self.cargarCliente;
end;

procedure Tfclientenuevo.Button1Click(Sender: TObject);
begin
  guardarCliente;
  limpiarFormulario;
  self.Close;
end;

procedure Tfclientenuevo.limpiarFormulario;
begin
  LabeledEdit1.Text := '';
  LabeledEdit2.Text := '';
  LabeledEdit3.Text := '';
  LabeledEdit4.Text := '';
  LabeledEdit5.Text := '';
  LabeledEdit6.Text := '';
end;

procedure Tfclientenuevo.guardarCliente;
begin

  if modificacion then
  begin
    datamodule1.modificarCliente.Parameters.ParamByName('cli').Value :=
      datamodule1.cliente.FieldByName('id_cliente').AsInteger;
    datamodule1.modificarCliente.Parameters.ParamByName('nom').Value :=
      LabeledEdit2.Text;
    datamodule1.modificarCliente.Parameters.ParamByName('doc').Value :=
      LabeledEdit1.Text;
    datamodule1.modificarCliente.Parameters.ParamByName('tel').Value :=
      LabeledEdit3.Text;
    datamodule1.modificarCliente.Parameters.ParamByName('dom').Value :=
      LabeledEdit4.Text;
    datamodule1.modificarCliente.Parameters.ParamByName('ciu').Value :=
      LabeledEdit5.Text;
    datamodule1.modificarCliente.Parameters.ParamByName('mail').Value :=
      LabeledEdit6.Text;
    if RadioGroup1.ItemIndex = 0 then
    begin
      datamodule1.modificarCliente.Parameters.ParamByName('tip').Value := 'S';
    end
    else
    begin
      datamodule1.modificarCliente.Parameters.ParamByName('tip').Value := 'F';
    end;
    datamodule1.modificarCliente.ExecProc;
    datamodule1.cliente.Refresh;

  end
  else
  begin
    datamodule1.nuevoCliente.Parameters.ParamByName('nom').Value :=
      LabeledEdit2.Text;
    datamodule1.nuevoCliente.Parameters.ParamByName('doc').Value :=
      LabeledEdit1.Text;
    datamodule1.nuevoCliente.Parameters.ParamByName('tel').Value :=
      LabeledEdit3.Text;
    datamodule1.nuevoCliente.Parameters.ParamByName('dom').Value :=
      LabeledEdit4.Text;
    datamodule1.nuevoCliente.Parameters.ParamByName('ciu').Value :=
      LabeledEdit5.Text;
    datamodule1.nuevoCliente.Parameters.ParamByName('mail').Value :=
      LabeledEdit6.Text;
    if RadioGroup1.ItemIndex = 0 then
    begin
      datamodule1.nuevoCliente.Parameters.ParamByName('tip').Value := 'S';
    end
    else
    begin
      datamodule1.nuevoCliente.Parameters.ParamByName('tip').Value := 'F';
    end;
    datamodule1.nuevoCliente.ExecProc;
    datamodule1.cliente.Refresh;
  end;

end;

procedure Tfclientenuevo.Button2Click(Sender: TObject);
begin
  if MessageDlg('¿Desea salir sin guardar los cambios?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin
    limpiarFormulario;
    self.Close;
  end;

end;

end.
