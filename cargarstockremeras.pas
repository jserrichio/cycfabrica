unit cargarstockremeras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfcargarstockremeras = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    GroupBox1: TGroupBox;
    Button1: TButton;
    GroupBox2: TGroupBox;
    LabeledEdit7: TLabeledEdit;
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
    procedure incrementarStockRemera();
  end;

var
  fcargarstockremeras: Tfcargarstockremeras;
  hayCambiosStock: boolean;

implementation

uses datamodule, productonuevo;
{$R *.dfm}

procedure tfcargarstockremeras.incrementarStockRemera;
begin
   datamodule1.incrementarStockRemera.Parameters.ParamByName('t1').Value := strtoint(labelededit1.Text);
   datamodule1.incrementarStockRemera.Parameters.ParamByName('t2').Value := strtoint(labelededit2.Text);
   datamodule1.incrementarStockRemera.Parameters.ParamByName('t3').Value := strtoint(labelededit3.Text);
   datamodule1.incrementarStockRemera.Parameters.ParamByName('t4').Value := strtoint(labelededit4.Text);
   datamodule1.incrementarStockRemera.Parameters.ParamByName('t5').Value := strtoint(labelededit5.Text);
   datamodule1.incrementarStockRemera.Parameters.ParamByName('t6').Value := strtoint(labelededit6.Text);
   datamodule1.incrementarStockRemera.Parameters.ParamByName('t7').Value := strtoint(labelededit7.Text);
   datamodule1.incrementarStockRemera.Parameters.ParamByName('remera').Value := datamodule1.producto.FieldByName('id_prod').AsInteger;
   datamodule1.incrementarStockRemera.ExecProc;
end;

procedure Tfcargarstockremeras.cargardatos(id_prod: integer);
begin
  // hacer locate para pararme en el producto
  datamodule1.talle_remera.Locate('id_prod', id_prod, []);
  // cargar el stock en todos los labeled edit
  LabeledEdit1.Text := IntToStr(datamodule1.talle_remera.FieldByName('xs')
      .AsInteger);
  LabeledEdit2.Text := IntToStr(datamodule1.talle_remera.FieldByName('s')
      .AsInteger);
  LabeledEdit3.Text := IntToStr(datamodule1.talle_remera.FieldByName('m')
      .AsInteger);
  LabeledEdit4.Text := IntToStr(datamodule1.talle_remera.FieldByName('l')
      .AsInteger);
  LabeledEdit5.Text := IntToStr(datamodule1.talle_remera.FieldByName('xl')
      .AsInteger);
  LabeledEdit6.Text := IntToStr(datamodule1.talle_remera.FieldByName('xxl')
      .AsInteger);
  LabeledEdit7.Text := IntToStr(datamodule1.talle_remera.FieldByName('xxxl')
      .AsInteger)
end;

procedure Tfcargarstockremeras.Button1Click(Sender: TObject);
begin
   self.Close;
end;

procedure Tfcargarstockremeras.Button2Click(Sender: TObject);
begin
  self.limpiarformulario;
end;

procedure Tfcargarstockremeras.guardardatos(id_prod: integer);
begin
  datamodule1.talle_remera.Locate('id_prod', id_prod, []);
  if productonuevof.esModificacion then
  begin
    verificarCambios;
    if hayCambiosStock then
    begin
      datamodule1.talle_remera.Edit;
    end;
  end
  else
  begin
    datamodule1.talle_remera.Append;
  end;
  if ((productonuevof.esModificacion and hayCambiosStock) or
      (not productonuevof.esModificacion)) then
  begin
    datamodule1.talle_remera.FieldByName('id_prod').AsInteger := id_prod;
    datamodule1.talle_remera.FieldByName('xs').AsInteger := strtoint
      (LabeledEdit1.Text);
    datamodule1.talle_remera.FieldByName('s').AsInteger := strtoint
      (LabeledEdit2.Text);
    datamodule1.talle_remera.FieldByName('m').AsInteger := strtoint
      (LabeledEdit3.Text);
    datamodule1.talle_remera.FieldByName('l').AsInteger := strtoint
      (LabeledEdit4.Text);
    datamodule1.talle_remera.FieldByName('xl').AsInteger := strtoint
      (LabeledEdit5.Text);
    datamodule1.talle_remera.FieldByName('xxl').AsInteger := strtoint
      (LabeledEdit6.Text);
    datamodule1.talle_remera.FieldByName('xxxl').AsInteger := strtoint
      (LabeledEdit7.Text);
    datamodule1.talle_remera.Post;
  end;
end;

procedure Tfcargarstockremeras.verificarCambios;
begin
  hayCambiosStock := false;
  if ((LabeledEdit1.Text <> datamodule1.talle_remera.FieldByName('xs')
        .AsString) or (LabeledEdit2.Text <>
        datamodule1.talle_remera.FieldByName('s').AsString) or
      (LabeledEdit3.Text <> datamodule1.talle_remera.FieldByName('m')
        .AsString) or (LabeledEdit4.Text <>
        datamodule1.talle_remera.FieldByName('l').AsString) or
      (LabeledEdit5.Text <> datamodule1.talle_remera.FieldByName('xl')
        .AsString) or
      (LabeledEdit6.Text <> datamodule1.talle_remera.FieldByName('xxl')
        .AsString) or (LabeledEdit7.Text <>
        datamodule1.talle_remera.FieldByName('xxxl').AsString)) then
  begin
    // ShowMessage('Hay cambios stock remera');
    hayCambiosStock := true;
  end
  else
  begin
    // ShowMessage('No hay cambios stock remera');

  end;

end;

procedure Tfcargarstockremeras.limpiarformulario;
begin
  LabeledEdit1.Text := '0';
  LabeledEdit2.Text := '0';
  LabeledEdit3.Text := '0';
  LabeledEdit4.Text := '0';
  LabeledEdit5.Text := '0';
  LabeledEdit6.Text := '0';
  LabeledEdit7.Text := '0';
end;

end.
