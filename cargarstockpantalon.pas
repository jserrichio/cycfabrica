unit cargarstockpantalon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfcargarstockpantalon = class(TForm)
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    GroupBox2: TGroupBox;
    Button1: TButton;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    LabeledEdit14: TLabeledEdit;
    LabeledEdit15: TLabeledEdit;
    LabeledEdit16: TLabeledEdit;
    LabeledEdit17: TLabeledEdit;
    LabeledEdit18: TLabeledEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure guardardatos(id_prod: integer);
    procedure limpiarformulario();
    procedure cargardatos(id_prod: integer);
    procedure verificarCambio();
    procedure incrementarStockPantalon();
  end;

var
  fcargarstockpantalon: Tfcargarstockpantalon;
  hayCambios: boolean;

implementation

uses datamodule, productonuevo;
{$R *.dfm}

procedure Tfcargarstockpantalon.cargardatos(id_prod: integer);
begin
  // hacer locate para pararme en el producto
  datamodule1.talle_pantalon.Locate('id_prod', id_prod, []);
  // cargar el stock en todos los labeled edit
  LabeledEdit1.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('26')
      .AsInteger);
  LabeledEdit2.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('28')
      .AsInteger);
  LabeledEdit3.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('30')
      .AsInteger);
  LabeledEdit4.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('32')
      .AsInteger);
  LabeledEdit5.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('34')
      .AsInteger);
  LabeledEdit6.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('26')
      .AsInteger);
  LabeledEdit12.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('38')
      .AsInteger);
  LabeledEdit11.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('40')
      .AsInteger);
  LabeledEdit10.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('42')
      .AsInteger);
  LabeledEdit7.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('44')
      .AsInteger);
  LabeledEdit14.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('46')
      .AsInteger);
  LabeledEdit15.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('48')
      .AsInteger);
  LabeledEdit16.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('50')
      .AsInteger);
  LabeledEdit17.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('52')
      .AsInteger);
  LabeledEdit18.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('54')
      .AsInteger);
  LabeledEdit13.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('56')
      .AsInteger);
  LabeledEdit9.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('58')
      .AsInteger);
  LabeledEdit8.Text := IntToStr(datamodule1.talle_pantalon.FieldByName('60')
      .AsInteger);

end;

procedure Tfcargarstockpantalon.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure tfcargarstockpantalon.incrementarStockPantalon;
begin
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t1').Value := strtoint(labelededit1.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t2').Value := strtoint(labelededit2.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t3').Value := strtoint(labelededit3.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t4').Value := strtoint(labelededit4.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t5').Value := strtoint(labelededit5.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t6').Value := strtoint(labelededit6.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t7').Value := strtoint(labelededit12.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t8').Value := strtoint(labelededit11.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t9').Value := strtoint(labelededit10.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t10').Value := strtoint(labelededit7.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t11').Value := strtoint(labelededit14.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t12').Value := strtoint(labelededit15.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t13').Value := strtoint(labelededit16.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t14').Value := strtoint(labelededit17.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t15').Value := strtoint(labelededit18.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t16').Value := strtoint(labelededit13.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t17').Value := strtoint(labelededit9.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('t18').Value := strtoint(labelededit8.Text);
   datamodule1.incrementarstockpantalon.Parameters.ParamByName('pantalon').Value := datamodule1.producto.FieldByName('id_prod').AsInteger;
   datamodule1.incrementarstockpantalon.ExecProc;
end;



procedure Tfcargarstockpantalon.Button2Click(Sender: TObject);
begin
  self.limpiarformulario;
end;

procedure Tfcargarstockpantalon.guardardatos(id_prod: integer);
begin
  datamodule1.talle_pantalon.Locate('id_prod', id_prod, []);
  if productonuevof.esModificacion then
  begin
    verificarCambio;
    if hayCambios then
    begin
      datamodule1.talle_pantalon.Edit;
    end;
  end
  else
  begin
    datamodule1.talle_pantalon.Append;
  end;
  if ((productonuevof.esModificacion and hayCambios) or
      (not productonuevof.esModificacion)) then
  begin
    datamodule1.talle_pantalon.FieldByName('id_prod').AsInteger := id_prod;
    datamodule1.talle_pantalon.FieldByName('26').AsInteger := strtoint
      (LabeledEdit1.Text);
    datamodule1.talle_pantalon.FieldByName('28').AsInteger := strtoint
      (LabeledEdit2.Text);
    datamodule1.talle_pantalon.FieldByName('30').AsInteger := strtoint
      (LabeledEdit3.Text);
    datamodule1.talle_pantalon.FieldByName('32').AsInteger := strtoint
      (LabeledEdit4.Text);
    datamodule1.talle_pantalon.FieldByName('34').AsInteger := strtoint
      (LabeledEdit5.Text);
    datamodule1.talle_pantalon.FieldByName('36').AsInteger := strtoint
      (LabeledEdit6.Text);
    datamodule1.talle_pantalon.FieldByName('38').AsInteger := strtoint
      (LabeledEdit12.Text);
    datamodule1.talle_pantalon.FieldByName('40').AsInteger := strtoint
      (LabeledEdit11.Text);
    datamodule1.talle_pantalon.FieldByName('42').AsInteger := strtoint
      (LabeledEdit10.Text);
    datamodule1.talle_pantalon.FieldByName('44').AsInteger := strtoint
      (LabeledEdit7.Text);
    datamodule1.talle_pantalon.FieldByName('46').AsInteger := strtoint
      (LabeledEdit14.Text);
    datamodule1.talle_pantalon.FieldByName('48').AsInteger := strtoint
      (LabeledEdit15.Text);
    datamodule1.talle_pantalon.FieldByName('50').AsInteger := strtoint
      (LabeledEdit16.Text);
    datamodule1.talle_pantalon.FieldByName('52').AsInteger := strtoint
      (LabeledEdit17.Text);
    datamodule1.talle_pantalon.FieldByName('54').AsInteger := strtoint
      (LabeledEdit18.Text);
    datamodule1.talle_pantalon.FieldByName('56').AsInteger := strtoint
      (LabeledEdit13.Text);
    datamodule1.talle_pantalon.FieldByName('58').AsInteger := strtoint
      (LabeledEdit9.Text);
    datamodule1.talle_pantalon.FieldByName('60').AsInteger := strtoint
      (LabeledEdit8.Text);
    datamodule1.talle_pantalon.Post;
  end;
end;

procedure Tfcargarstockpantalon.verificarCambio;
begin
  hayCambios := false;

  if ((datamodule1.talle_pantalon.FieldByName('26').AsInteger <> strtoint
        (LabeledEdit1.Text)) or (datamodule1.talle_pantalon.FieldByName('28')
        .AsInteger <> strtoint(LabeledEdit2.Text)) or
      (datamodule1.talle_pantalon.FieldByName('30').AsInteger <> strtoint
        (LabeledEdit3.Text)) or (datamodule1.talle_pantalon.FieldByName('32')
        .AsInteger <> strtoint(LabeledEdit4.Text)) or
      (datamodule1.talle_pantalon.FieldByName('34').AsInteger <> strtoint
        (LabeledEdit5.Text)) or (datamodule1.talle_pantalon.FieldByName('36')
        .AsInteger <> strtoint(LabeledEdit6.Text)) or
      (datamodule1.talle_pantalon.FieldByName('38').AsInteger <> strtoint
        (LabeledEdit12.Text)) or (datamodule1.talle_pantalon.FieldByName('40')
        .AsInteger <> strtoint(LabeledEdit11.Text)) or
      (datamodule1.talle_pantalon.FieldByName('42').AsInteger <> strtoint
        (LabeledEdit10.Text)) or (datamodule1.talle_pantalon.FieldByName('44')
        .AsInteger <> strtoint(LabeledEdit7.Text)) or
      (datamodule1.talle_pantalon.FieldByName('46').AsInteger <> strtoint
        (LabeledEdit14.Text)) or (datamodule1.talle_pantalon.FieldByName('48')
        .AsInteger <> strtoint(LabeledEdit15.Text)) or
      (datamodule1.talle_pantalon.FieldByName('50').AsInteger <> strtoint
        (LabeledEdit16.Text)) or (datamodule1.talle_pantalon.FieldByName('52')
        .AsInteger <> strtoint(LabeledEdit17.Text)) or
      (datamodule1.talle_pantalon.FieldByName('54').AsInteger <> strtoint
        (LabeledEdit18.Text)) or (datamodule1.talle_pantalon.FieldByName('56')
        .AsInteger <> strtoint(LabeledEdit13.Text)) or
      (datamodule1.talle_pantalon.FieldByName('58').AsInteger <> strtoint
        (LabeledEdit9.Text)) or (datamodule1.talle_pantalon.FieldByName('60')
        .AsInteger <> strtoint(LabeledEdit8.Text))) then
  begin
    //ShowMessage('Hay cambios stock pantalon');
    hayCambios := true;
  end
  else
  begin
    //ShowMessage('No hay cambios stock pantalon');

  end;

end;

procedure Tfcargarstockpantalon.limpiarformulario;
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
  LabeledEdit10.Text := '0';
  LabeledEdit11.Text := '0';
  LabeledEdit12.Text := '0';
  LabeledEdit13.Text := '0';
  LabeledEdit14.Text := '0';
  LabeledEdit15.Text := '0';
  LabeledEdit16.Text := '0';
  LabeledEdit17.Text := '0';
  LabeledEdit18.Text := '0';

end;

end.
