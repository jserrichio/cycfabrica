unit ordenPlancha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfOrdenPlancha = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Button1: TButton;
    LabeledEdit5: TLabeledEdit;
    procedure LabeledEdit2Change(Sender: TObject);
    procedure LabeledEdit1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LabeledEdit5Click(Sender: TObject);
  private
    procedure guardarOrdenPlancha;
    { Private declarations }
  public
    { Public declarations }
    procedure setCantidad(cant: integer);
    procedure setIdProd(id: integer);
    procedure limpiarFormulario();
    procedure setNombreProd(prod: string);
  end;

var
  fOrdenPlancha: TfOrdenPlancha;
  id_prod_actual: integer;

implementation

uses vertalleres, datamodule, consultarstock;
{$R *.dfm}

procedure TfOrdenPlancha.limpiarFormulario;
begin
  LabeledEdit1.Text := '0';
  LabeledEdit2.Text := '0';
  LabeledEdit3.Text := '0';
  LabeledEdit4.Text := '0';
  labelededit5.Text:='';
  labelededit5.Enabled:=false;
end;

procedure TfOrdenPlancha.setIdProd(id: integer);
begin
  id_prod_actual := id;
end;

procedure tfordenplancha.setNombreProd(prod: string);
begin
   labelededit5.Text:=prod;
end;

procedure TfOrdenPlancha.Button1Click(Sender: TObject);
begin
  if ((labelededit1.Text<>'') and (labelededit2.Text<>'') and (labelededit3.Text<>'') and (labelededit4.Text<>'')) then
     begin
  guardarOrdenPlancha
     end else begin
       ShowMessage('Verifique los datos ingresados, ninguno puede estar vacio');
     end;
end;

procedure TfOrdenPlancha.LabeledEdit1Click(Sender: TObject);
begin
  fvertalleres.setPlancha;
  fvertalleres.ShowModal;
  LabeledEdit1.Text := datamodule1.taller.FieldByName('nombre_taller').AsString;
end;

procedure TfOrdenPlancha.LabeledEdit2Change(Sender: TObject);
begin
  LabeledEdit4.Text := floattostr(strtofloat(LabeledEdit3.Text) * strtofloat
      (LabeledEdit2.Text));
end;

procedure TfOrdenPlancha.LabeledEdit5Click(Sender: TObject);
begin
 fconsultarstock.ShowModal;
  id_prod_actual := datamodule1.producto.FieldByName('id_prod').AsInteger;
  LabeledEdit5.Text := datamodule1.producto.FieldByName('nombre_prod').AsString;
end;

procedure TfOrdenPlancha.setCantidad(cant: integer);
begin
  LabeledEdit3.Text := inttostr(cant);
end;

procedure TfOrdenPlancha.guardarOrdenPlancha;
begin
  datamodule1.corte.Append;
  datamodule1.corte.FieldByName('tipo').AsString := 'P';
  datamodule1.corte.FieldByName('costo_unidad').AsFloat := strtofloat
    (LabeledEdit2.Text);
  datamodule1.corte.FieldByName('costo_total').AsFloat := strtofloat
    (LabeledEdit4.Text);
  datamodule1.corte.FieldByName('cantidad').asinteger := strtoint
    (LabeledEdit3.Text);
  datamodule1.corte.FieldByName('cantidad_restante').asinteger := strtoint
    (LabeledEdit3.Text);
  datamodule1.corte.FieldByName('fecha').AsDateTime := now;
  datamodule1.corte.FieldByName('id_taller').asinteger :=
    datamodule1.taller.FieldByName('id_taller').asinteger;
  datamodule1.corte.FieldByName('id_producto').asinteger := id_prod_actual;
  datamodule1.corte.Post;
  self.Close;
  self.limpiarFormulario;
end;

end.
