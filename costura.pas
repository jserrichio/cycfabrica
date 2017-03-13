unit costura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfcostura = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    fobservaciones: TButton;
    procedure fobservacionesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure limpiarFormulario;
    procedure guardarenbd;
    procedure cargarCostura(texto: string);
    function getCostura: string;
  end;

var
  fcostura: Tfcostura;

implementation

uses datamodule;

{$R *.dfm}

procedure Tfcostura.Button1Click(Sender: TObject);
begin
self.Close;

end;

function tfcostura.getCostura;
begin
  Result:= memo1.Lines.GetText;
end;

procedure tfcostura.guardarenbd;
begin
  //
  datamodule1.corte.FieldByName('costura_corte').AsString:=memo1.Lines.GetText;
end;

procedure tfcostura.cargarCostura(texto: string);
begin
  memo1.Lines.Add(texto);
end;

procedure tfcostura.limpiarFormulario;
begin
  Memo1.Lines.Clear;
end;


procedure Tfcostura.fobservacionesClick(Sender: TObject);
begin
  limpiarFormulario;

end;

end.
