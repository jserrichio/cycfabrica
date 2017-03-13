unit cargarstockmedia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfcargarstockmedia = class(TForm)
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    GroupBox2: TGroupBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure guardardatos(id_prod: integer);
    procedure limpiarformulario();
    procedure cargardatos(id_prod: integer);
    procedure verificarCambios();
  end;

var
  fcargarstockmedia: Tfcargarstockmedia;
  hayCambios: boolean;

implementation

uses datamodule, productonuevo;
{$R *.dfm}

procedure Tfcargarstockmedia.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tfcargarstockmedia.cargardatos(id_prod: integer);
begin
  // hacer locate para pararme en el producto
  datamodule1.talle_media.Locate('id_prod', id_prod, []);
  // cargar el stock en todos los labeled edit
  LabeledEdit1.Text := IntToStr(datamodule1.talle_media.FieldByName('negro')
      .AsInteger);
  LabeledEdit2.Text := IntToStr(datamodule1.talle_media.FieldByName('gris')
      .AsInteger);
  LabeledEdit3.Text := IntToStr(datamodule1.talle_media.FieldByName('azul')
      .AsInteger);
  LabeledEdit4.Text := IntToStr(datamodule1.talle_media.FieldByName('aero')
      .AsInteger);
  LabeledEdit5.Text := IntToStr(datamodule1.talle_media.FieldByName('blanca')
      .AsInteger);

end;

{
  procedure Tfcargarstockmedia.Button2Click(Sender: TObject);
  begin
  self.limpiarformulario;
  end; }

procedure Tfcargarstockmedia.guardardatos(id_prod: integer);
begin
  datamodule1.talle_media.Locate('id_prod', id_prod, []);
  if productonuevof.esModificacion then
  begin
    verificarCambios;
    if hayCambios then
    begin
      datamodule1.talle_media.Edit;
    end;
  end
  else
  begin
    datamodule1.talle_media.Append;
  end;

  if ((productonuevof.esModificacion and hayCambios) or
      (not productonuevof.esModificacion)) then
  begin
    datamodule1.talle_media.FieldByName('id_prod').AsInteger := id_prod;
    datamodule1.talle_media.FieldByName('negro').AsInteger := strtoint
      (LabeledEdit1.Text);
    datamodule1.talle_media.FieldByName('gris').AsInteger := strtoint
      (LabeledEdit2.Text);
    datamodule1.talle_media.FieldByName('azul').AsInteger := strtoint
      (LabeledEdit3.Text);
    datamodule1.talle_media.FieldByName('aero').AsInteger := strtoint
      (LabeledEdit4.Text);
    datamodule1.talle_media.FieldByName('blanca').AsInteger := strtoint
      (LabeledEdit5.Text);
    datamodule1.talle_media.Post;
  end;
end;

procedure Tfcargarstockmedia.verificarCambios;
begin
  hayCambios := false;
  if ((LabeledEdit1.Text <> datamodule1.talle_media.FieldByName('negro')
        .AsString) or (LabeledEdit2.Text <> datamodule1.talle_media.FieldByName
        ('gris').AsString) or
      (LabeledEdit3.Text <> datamodule1.talle_media.FieldByName('azul')
        .AsString) or (LabeledEdit4.Text <> datamodule1.talle_media.FieldByName
        ('aero').AsString) or
      (LabeledEdit5.Text <> datamodule1.talle_media.FieldByName('blanca')
        .AsString)) then
  begin
    // ShowMessage('Hay cambios stock media ');
    hayCambios := true;
  end
  else
  begin
    // ShowMessage('No hay cambios stock media');

  end;
end;

procedure Tfcargarstockmedia.limpiarformulario;
begin
  LabeledEdit1.Text := '0';
  LabeledEdit2.Text := '0';
  LabeledEdit3.Text := '0';
  LabeledEdit4.Text := '0';
  LabeledEdit5.Text := '0';
end;

end.
