unit ftallernuevo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TtallerNuevo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure guardarTaller;
    procedure limpiarFormulario;
    procedure verificarModificacion;
  public
    { Public declarations }
    procedure cargarTaller;
    procedure setModificacion;
    procedure setNuevo;
    procedure setConfeccion;
    procedure setPlancha;
  end;

var
  tallerNuevo: TtallerNuevo;
  modificacion: boolean;
  hayCambios: boolean;
  tipoActual: string;

implementation

uses datamodule;
{$R *.dfm}

procedure TtallerNuevo.setConfeccion;
begin
  tipoActual := 'C';
  self.Caption := 'Agregar taller de confección';
end;

procedure TtallerNuevo.setPlancha;
begin
  tipoActual := 'P';
  self.Caption := 'Agregar taller de planchado';
end;

procedure TtallerNuevo.FormShow(Sender: TObject);
begin

  if modificacion then
    self.cargarTaller;
end;

procedure TtallerNuevo.setModificacion;
begin
  modificacion := true;
end;

procedure TtallerNuevo.setNuevo;
begin
  modificacion := false;
end;

procedure TtallerNuevo.Button1Click(Sender: TObject);
begin
  guardarTaller;
  limpiarFormulario;
  self.Close;
end;

procedure TtallerNuevo.Button2Click(Sender: TObject);
begin
  if MessageDlg('¿Desea salir sin guardar los cambios?', mtCustom,
    [mbYes, mbCancel], 0) = mrYes then
  begin
    limpiarFormulario;
    self.Close;
  end;
end;

procedure TtallerNuevo.cargarTaller;
begin
  LabeledEdit1.Text := datamodule1.taller.FieldByName('dni_taller').AsString;
  LabeledEdit2.Text := datamodule1.taller.FieldByName('nombre_taller').AsString;
  LabeledEdit3.Text := datamodule1.taller.FieldByName('telefono_taller')
    .AsString;
  LabeledEdit4.Text := datamodule1.taller.FieldByName('direccion_taller')
    .AsString;
  LabeledEdit5.Text := datamodule1.taller.FieldByName('localidad_taller')
    .AsString;
  LabeledEdit6.Text := datamodule1.taller.FieldByName('mail_taller').AsString;
end;

procedure TtallerNuevo.limpiarFormulario;
begin
  LabeledEdit1.Text := '';
  LabeledEdit2.Text := '';
  LabeledEdit3.Text := '';
  LabeledEdit4.Text := '';
  LabeledEdit5.Text := '';
  LabeledEdit6.Text := '';
end;

procedure TtallerNuevo.guardarTaller;
begin

  if modificacion then
  begin
    verificarModificacion;
    if hayCambios then
    begin
      datamodule1.taller.Edit;
    end;
  end
  else
  begin
    datamodule1.taller.Append;
  end;
  if ((modificacion and hayCambios) or (not modificacion)) then
  begin
    datamodule1.taller.FieldByName('dni_taller').AsString := LabeledEdit1.Text;
    datamodule1.taller.FieldByName('nombre_taller').AsString :=
      LabeledEdit2.Text;
    datamodule1.taller.FieldByName('telefono_taller').AsString :=
      LabeledEdit3.Text;
    datamodule1.taller.FieldByName('direccion_taller').AsString :=
      LabeledEdit4.Text;
    datamodule1.taller.FieldByName('localidad_taller').AsString :=
      LabeledEdit5.Text;
    datamodule1.taller.FieldByName('mail_taller').AsString := LabeledEdit6.Text;
    datamodule1.taller.FieldByName('tipo').AsString := tipoActual;
    datamodule1.taller.Post;
  end;
end;

procedure TtallerNuevo.verificarModificacion;
begin
  hayCambios := false;
  // verificar si se modifico algun campo, si no se modifico cambiar a false "hayCambios"
  if ((LabeledEdit1.Text <> datamodule1.taller.FieldByName('dni_taller')
        .AsString) or (LabeledEdit2.Text <> datamodule1.taller.FieldByName
        ('nombre_taller').AsString) or
      (LabeledEdit3.Text <> datamodule1.taller.FieldByName
        ('telefono_taller').AsString) or
      (LabeledEdit4.Text <> datamodule1.taller.FieldByName('direccion_taller')
        .AsString) or (LabeledEdit5.Text <> datamodule1.taller.FieldByName
        ('localidad_taller').AsString) or
      (LabeledEdit6.Text <> datamodule1.taller.FieldByName('mail_taller')
        .AsString)) then
  begin
    hayCambios := true;
    // ShowMessage('Hay modificacion');
  end
  else
  begin
    hayCambios := false;
    // ShowMessage('No hay modificacion');
  end;

end;

end.
