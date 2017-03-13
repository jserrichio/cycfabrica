unit cargarstockcinturon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfcargarstockcinturon = class(TForm)
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    GroupBox2: TGroupBox;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure guardardatos(id_prod: integer);
    procedure limpiarformulario();
    procedure cargardatos(id_prod: integer);
    procedure verificarCambios();
    procedure incrementarStockCinturon();
  end;

var
  fcargarstockcinturon: Tfcargarstockcinturon;
  hayCambios: boolean;

implementation

uses datamodule, productonuevo;
{$R *.dfm}

procedure Tfcargarstockcinturon.cargardatos(id_prod: integer);
begin
  // hacer locate para pararme en el producto
  datamodule1.talle_cinturon.Locate('id_prod', id_prod, []);
  // cargar el stock en todos los labeled edit
  LabeledEdit1.Text := IntToStr(datamodule1.talle_cinturon.FieldByName('90')
      .AsInteger);
  LabeledEdit2.Text := IntToStr(datamodule1.talle_cinturon.FieldByName('95')
      .AsInteger);
  LabeledEdit3.Text := IntToStr(datamodule1.talle_cinturon.FieldByName('100')
      .AsInteger);
  LabeledEdit4.Text := IntToStr(datamodule1.talle_cinturon.FieldByName('105')
      .AsInteger);
  LabeledEdit5.Text := IntToStr(datamodule1.talle_cinturon.FieldByName('110')
      .AsInteger);

end;

procedure Tfcargarstockcinturon.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tfcargarstockcinturon.Button2Click(Sender: TObject);
begin
  self.limpiarformulario;
end;

procedure tfcargarstockcinturon.incrementarStockCinturon;
begin
   datamodule1.incrementarStockCinturon.Parameters.ParamByName('t1').Value := strtoint(labelededit1.Text);
   datamodule1.incrementarStockCinturon.Parameters.ParamByName('t2').Value := strtoint(labelededit2.Text);
   datamodule1.incrementarStockCinturon.Parameters.ParamByName('t3').Value := strtoint(labelededit3.Text);
   datamodule1.incrementarStockCinturon.Parameters.ParamByName('t4').Value := strtoint(labelededit4.Text);
   datamodule1.incrementarStockCinturon.Parameters.ParamByName('t5').Value := strtoint(labelededit5.Text);
   datamodule1.incrementarStockCinturon.Parameters.ParamByName('cinturon').Value := datamodule1.producto.FieldByName('id_prod').AsInteger;
   datamodule1.incrementarStockCinturon.ExecProc;
end;



procedure Tfcargarstockcinturon.guardardatos(id_prod: integer);
begin
  datamodule1.talle_cinturon.Locate('id_prod', id_prod, []);
  if productonuevof.esModificacion then
  begin
    verificarCambios;
    if hayCambios then
    begin
      datamodule1.talle_cinturon.Edit;
    end;
  end
  else
  begin
    datamodule1.talle_cinturon.Append;
  end;

  if ((productonuevof.esModificacion and hayCambios) or
      (not productonuevof.esModificacion)) then
  begin
    datamodule1.talle_cinturon.FieldByName('id_prod').AsInteger := id_prod;
    datamodule1.talle_cinturon.FieldByName('90').AsInteger := strtoint
      (LabeledEdit1.Text);
    datamodule1.talle_cinturon.FieldByName('95').AsInteger := strtoint
      (LabeledEdit2.Text);
    datamodule1.talle_cinturon.FieldByName('100').AsInteger := strtoint
      (LabeledEdit3.Text);
    datamodule1.talle_cinturon.FieldByName('105').AsInteger := strtoint
      (LabeledEdit4.Text);
    datamodule1.talle_cinturon.FieldByName('110').AsInteger := strtoint
      (LabeledEdit5.Text);
    datamodule1.talle_cinturon.Post;
  end;
end;

procedure Tfcargarstockcinturon.verificarCambios;
begin
  hayCambios := false;
  if ((LabeledEdit1.Text <> datamodule1.talle_cinturon.FieldByName('90')
        .AsString) or (LabeledEdit2.Text <>
        datamodule1.talle_cinturon.FieldByName('95').AsString) or
      (LabeledEdit3.Text <> datamodule1.talle_cinturon.FieldByName
        ('100').AsString) or
      (LabeledEdit4.Text <> datamodule1.talle_cinturon.FieldByName('105')
        .AsString) or (LabeledEdit5.Text <>
        datamodule1.talle_cinturon.FieldByName('110').AsString)) then
  begin
    //ShowMessage('Hay cambios stock cinturon ');
    hayCambios := true;
  end
  else
  begin
    //ShowMessage('No hay cambios stock cinturon');

  end;

end;

procedure Tfcargarstockcinturon.limpiarformulario;
begin
  LabeledEdit1.Text := '0';
  LabeledEdit2.Text := '0';
  LabeledEdit3.Text := '0';
  LabeledEdit4.Text := '0';
  LabeledEdit5.Text := '0';
end;

end.
