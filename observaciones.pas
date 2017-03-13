unit observaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfobservaciones = class(TForm)
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
      procedure cargarObservaciones(texto: string);
    function getObservacion:string;
  end;

var
  fobservaciones: Tfobservaciones;

implementation

uses datamodule;

{$R *.dfm}

procedure tfobservaciones.limpiarFormulario;
begin
  Memo1.Lines.Clear;
end;

procedure Tfobservaciones.Button1Click(Sender: TObject);
begin
self.Close;
end;

procedure tfobservaciones.cargarObservaciones(texto: string);
begin
  memo1.Lines.Add(texto);
end;


procedure tfobservaciones.guardarenbd;
begin
  //
  datamodule1.corte.FieldByName('observacion_corte').AsString:=memo1.Lines.GetText;
end;

function Tfobservaciones.getObservacion;
begin
  result:= memo1.Lines.GetText;
end;

procedure Tfobservaciones.fobservacionesClick(Sender: TObject);
begin
  limpiarFormulario;
end;

end.
