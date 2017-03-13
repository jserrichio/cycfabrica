unit cargarstockbolsa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfcargarstockbolsa = class(TForm)
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
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
  fcargarstockbolsa: Tfcargarstockbolsa;
  hayCambios: boolean;

implementation

uses datamodule, productonuevo;
{$R *.dfm}

procedure Tfcargarstockbolsa.Button1Click(Sender: TObject);
begin
 self.Close;
end;

procedure Tfcargarstockbolsa.cargardatos(id_prod: integer);
begin
  // hacer locate para pararme en el producto
  datamodule1.talle_bolsa.Locate('id_prod', id_prod, []);
  // cargar el stock en todos los labeled edit
  LabeledEdit1.Text := IntToStr(datamodule1.talle_bolsa.FieldByName('1')
      .AsInteger);
  LabeledEdit2.Text := IntToStr(datamodule1.talle_bolsa.FieldByName('2')
      .AsInteger);
  LabeledEdit3.Text := IntToStr(datamodule1.talle_bolsa.FieldByName('3')
      .AsInteger);
  LabeledEdit4.Text := IntToStr(datamodule1.talle_bolsa.FieldByName('4')
      .AsInteger);

end;

{
procedure Tfcargarstockbolsa.Button2Click(Sender: TObject);
begin
  self.limpiarformulario;
end;
 }
procedure Tfcargarstockbolsa.guardardatos(id_prod: integer);
begin
  datamodule1.talle_bolsa.Locate('id_prod', id_prod, []);
  if productonuevof.esModificacion then
  begin
    verificarCambios;
    if hayCambios then
    begin
      datamodule1.talle_bolsa.Edit;
    end;
  end
  else
  begin
    datamodule1.talle_bolsa.Append;
  end;

  if ((productonuevof.esModificacion and hayCambios) or
      (not productonuevof.esModificacion)) then
  begin
    datamodule1.talle_bolsa.FieldByName('id_prod').AsInteger := id_prod;
    datamodule1.talle_bolsa.FieldByName('1').AsInteger := strtoint
      (LabeledEdit1.Text);
    datamodule1.talle_bolsa.FieldByName('2').AsInteger := strtoint
      (LabeledEdit2.Text);
    datamodule1.talle_bolsa.FieldByName('3').AsInteger := strtoint
      (LabeledEdit3.Text);
    datamodule1.talle_bolsa.FieldByName('4').AsInteger := strtoint
      (LabeledEdit4.Text);
    datamodule1.talle_bolsa.Post;
  end;
end;

procedure Tfcargarstockbolsa.verificarCambios;
begin
  hayCambios := false;
  if ((LabeledEdit1.Text <> datamodule1.talle_bolsa.FieldByName('1').AsString)
      or (LabeledEdit2.Text <> datamodule1.talle_bolsa.FieldByName('2')
        .AsString) or
      (LabeledEdit3.Text <> datamodule1.talle_bolsa.FieldByName('3').AsString)
      or (LabeledEdit4.Text <> datamodule1.talle_bolsa.FieldByName('4')
        .AsString)) then
  begin
    // ShowMessage('Hay cambios stock bolsa ');
    hayCambios := true;
  end
  else
  begin
    // ShowMessage('No hay cambios stock BOLSA');

  end;

end;

procedure Tfcargarstockbolsa.limpiarformulario;
begin
  LabeledEdit1.Text := '0';
  LabeledEdit2.Text := '0';
  LabeledEdit3.Text := '0';
  LabeledEdit4.Text := '0';

end;

end.
