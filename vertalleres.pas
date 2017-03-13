unit vertalleres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  Tfvertalleres = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure limpiarFormulario;
  public
    { Public declarations }
    procedure actualizarConsulta;
    procedure cargarTallerEnComponente;
    procedure actualizarPunteroTaller;
    procedure setConfeccion;
    procedure setPlancha;
    procedure setTodos;
  end;

var
  fvertalleres: Tfvertalleres;
  tipoActual: string;

implementation

uses datamodule, ftallernuevo;
{$R *.dfm}

procedure Tfvertalleres.setConfeccion;
begin
  tipoActual := 'C';
  self.Caption := 'Talleres de confección';
end;

procedure Tfvertalleres.setPlancha;
begin
  tipoActual := 'P';
  self.Caption := 'Talleres de planchado';
end;

procedure Tfvertalleres.setTodos;
begin
  tipoActual := 'T';
  self.Caption := 'Talleres de confección y planchado';
end;

procedure Tfvertalleres.actualizarConsulta;
begin
  datamodule1.Qtaller.SQL.Clear;
  if tipoActual = 'T' then
  begin
    datamodule1.Qtaller.SQL.Add('select * from taller');
  end
  else
  begin
    datamodule1.Qtaller.SQL.Add('select * from taller where tipo=' + QuotedStr
        (tipoActual));
  end;
  datamodule1.Qtaller.Open;
  datamodule1.Qtaller.Active := true;

end;

procedure Tfvertalleres.Button1Click(Sender: TObject);
begin
   if tipoActual = 'P' then
  begin
    tallernuevo.setPlancha
  end
  else
  begin
    tallernuevo.setConfeccion;
  end;
  tallernuevo.setModificacion;
  tallernuevo.ShowModal;
  self.actualizarConsulta;
end;

procedure Tfvertalleres.Button2Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tfvertalleres.Button3Click(Sender: TObject);
begin
  tallernuevo.setNuevo;
  if tipoActual = 'P' then
  begin
    tallernuevo.setPlancha
  end
  else
  begin
    tallernuevo.setConfeccion;
  end;
  tallernuevo.ShowModal;
  self.actualizarConsulta;
end;

procedure Tfvertalleres.DBGrid1CellClick(Column: TColumn);
begin
  actualizarPunteroTaller;
  self.cargarTallerEnComponente;
  Button1.Enabled:=true;
end;

procedure Tfvertalleres.DBGrid1DblClick(Sender: TObject);
begin
  self.Close;
end;

procedure Tfvertalleres.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.limpiarFormulario;
end;

procedure tfvertalleres.limpiarFormulario;
begin
Button1.Enabled:=false;
LabeledEdit1.Text:='';
LabeledEdit2.Text:='';
LabeledEdit4.Text:='';
LabeledEdit5.Text:='';

end;

procedure Tfvertalleres.FormShow(Sender: TObject);
begin
  self.actualizarConsulta;
end;

procedure Tfvertalleres.actualizarPunteroTaller;
begin
  datamodule1.taller.Locate('nombre_taller',
    datamodule1.Qtaller.FieldByName('nombre_taller').AsString, []);

end;

procedure Tfvertalleres.cargarTallerEnComponente;
begin
  // cargar taller seleccionado en labelededit
  LabeledEdit1.Text := datamodule1.taller.FieldByName('nombre_taller').AsString;
  LabeledEdit2.Text := datamodule1.taller.FieldByName('telefono_taller')
    .AsString;
  LabeledEdit4.Text := datamodule1.taller.FieldByName('direccion_taller')
    .AsString;
  LabeledEdit5.Text := datamodule1.taller.FieldByName('mail_taller').AsString;
end;

end.
