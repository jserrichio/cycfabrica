unit cargarstockninos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfcargarstockninos = class(TForm)
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    GroupBox2: TGroupBox;
    Button1: TButton;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure guardardatos(id_prod: integer);
    procedure limpiarformulario();
    procedure cargardatos(id_prod: integer);
    procedure verificarCambio();
    procedure incrementarStockNinos();
  end;

var
  fcargarstockninos: Tfcargarstockninos;
  hayCambios: boolean;

implementation

uses datamodule, productonuevo;
{$R *.dfm}

procedure Tfcargarstockninos.Button1Click(Sender: TObject);
begin
self.Close;
end;

procedure Tfcargarstockninos.cargardatos(id_prod: integer);
begin
  // hacer locate para pararme en el producto
  datamodule1.talle_ninos.Locate('id_prod', id_prod, []);
  // cargar el stock en todos los labeled edit
  labelededit9.Text:=  IntToStr(datamodule1.talle_ninos.FieldByName('1')
      .AsInteger);
  LabeledEdit8.Text := IntToStr(datamodule1.talle_ninos.FieldByName('2')
      .AsInteger);
  LabeledEdit1.Text := IntToStr(datamodule1.talle_ninos.FieldByName('4')
      .AsInteger);
  LabeledEdit2.Text := IntToStr(datamodule1.talle_ninos.FieldByName('6')
      .AsInteger);
  LabeledEdit3.Text := IntToStr(datamodule1.talle_ninos.FieldByName('8')
      .AsInteger);
  LabeledEdit4.Text := IntToStr(datamodule1.talle_ninos.FieldByName('10')
      .AsInteger);
  LabeledEdit5.Text := IntToStr(datamodule1.talle_ninos.FieldByName('12')
      .AsInteger);
  LabeledEdit6.Text := IntToStr(datamodule1.talle_ninos.FieldByName('14')
      .AsInteger);
  LabeledEdit7.Text := IntToStr(datamodule1.talle_ninos.FieldByName('16')
      .AsInteger);
end;

procedure tfcargarstockninos.incrementarStockNinos;
begin
   datamodule1.incrementarStockNino.Parameters.ParamByName('t1').Value := strtoint(labelededit1.Text);
   datamodule1.incrementarStockNino.Parameters.ParamByName('t2').Value := strtoint(labelededit2.Text);
   datamodule1.incrementarStockNino.Parameters.ParamByName('t3').Value := strtoint(labelededit3.Text);
   datamodule1.incrementarStockNino.Parameters.ParamByName('t4').Value := strtoint(labelededit4.Text);
   datamodule1.incrementarStockNino.Parameters.ParamByName('t5').Value := strtoint(labelededit5.Text);
   datamodule1.incrementarStockNino.Parameters.ParamByName('t6').Value := strtoint(labelededit6.Text);
   datamodule1.incrementarStockNino.Parameters.ParamByName('t7').Value := strtoint(labelededit7.Text);
   datamodule1.incrementarStockNino.Parameters.ParamByName('t8').Value := strtoint(labelededit8.Text);
   datamodule1.incrementarStockNino.Parameters.ParamByName('t9').Value := strtoint(labelededit9.Text);

   datamodule1.incrementarStockNino.Parameters.ParamByName('nino').Value := datamodule1.producto.FieldByName('id_prod').AsInteger;
   datamodule1.incrementarStockNino.ExecProc;
end;



procedure Tfcargarstockninos.guardardatos(id_prod: integer);
begin
  datamodule1.talle_ninos.Locate('id_prod', id_prod, []);
  if productonuevof.esModificacion then
  begin
    verificarCambio;
    if hayCambios then
    begin
      datamodule1.talle_ninos.Edit;
    end;
  end
  else
  begin
    datamodule1.talle_ninos.Append;
  end;
  if ((productonuevof.esModificacion and hayCambios) or
      (not productonuevof.esModificacion)) then
  begin
    datamodule1.talle_ninos.FieldByName('id_prod').AsInteger := id_prod;
    datamodule1.talle_ninos.FieldByName('1').AsInteger := strtoint
      (LabeledEdit9.Text);
    datamodule1.talle_ninos.FieldByName('2').AsInteger := strtoint
      (LabeledEdit8.Text);
    datamodule1.talle_ninos.FieldByName('4').AsInteger := strtoint
      (LabeledEdit1.Text);
    datamodule1.talle_ninos.FieldByName('6').AsInteger := strtoint
      (LabeledEdit2.Text);
    datamodule1.talle_ninos.FieldByName('8').AsInteger := strtoint
      (LabeledEdit3.Text);
    datamodule1.talle_ninos.FieldByName('10').AsInteger := strtoint
      (LabeledEdit4.Text);
    datamodule1.talle_ninos.FieldByName('12').AsInteger := strtoint
      (LabeledEdit5.Text);
    datamodule1.talle_ninos.FieldByName('14').AsInteger := strtoint
      (LabeledEdit6.Text);
    datamodule1.talle_ninos.FieldByName('16').AsInteger := strtoint
      (LabeledEdit7.Text);
    datamodule1.talle_ninos.Post;
  end;
end;

procedure Tfcargarstockninos.verificarCambio;
begin
  hayCambios := false;

  if ((datamodule1.talle_ninos.FieldByName('2').AsInteger <> strtoint
        (LabeledEdit8.Text)) or (datamodule1.talle_ninos.FieldByName('4').AsInteger <> strtoint
        (LabeledEdit1.Text)) or (datamodule1.talle_ninos.FieldByName('6')
        .AsInteger <> strtoint(LabeledEdit2.Text)) or
      (datamodule1.talle_ninos.FieldByName('8').AsInteger <> strtoint
        (LabeledEdit3.Text)) or (datamodule1.talle_ninos.FieldByName('10')
        .AsInteger <> strtoint(LabeledEdit4.Text)) or
      (datamodule1.talle_ninos.FieldByName('12').AsInteger <> strtoint
        (LabeledEdit5.Text)) or (datamodule1.talle_ninos.FieldByName('14')
        .AsInteger <> strtoint(LabeledEdit6.Text))or (datamodule1.talle_ninos.FieldByName('16').AsInteger <> strtoint
        (LabeledEdit7.Text))or(datamodule1.talle_ninos.FieldByName('1').AsInteger <> strtoint
        (LabeledEdit9.Text))) then
  begin
    // ShowMessage('Hay cambios stock pantalon');
    hayCambios := true;
  end
  else
  begin
    // ShowMessage('No hay cambios stock pantalon');

  end;

end;

procedure Tfcargarstockninos.limpiarformulario;
begin
  //
  LabeledEdit1.Text := '0';
  LabeledEdit2.Text := '0';
  LabeledEdit3.Text := '0';
  LabeledEdit4.Text := '0';
  LabeledEdit5.Text := '0';
  LabeledEdit6.Text := '0';
  LabeledEdit7.Text := '0';
  LabeledEdit8.Text := '0';
  LabeledEdit9.Text := '0';

end;

end.
