unit principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, pngimage, ExtCtrls, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Inicio1: TMenuItem;
    Productos1: TMenuItem;
    Ingresarproductonuevo1: TMenuItem;
    Stock1: TMenuItem;
    Consultarstock1: TMenuItem;
    Ventas1: TMenuItem;
    Nuevaventa1: TMenuItem;
    Historial1: TMenuItem;
    Salir1: TMenuItem;
    Clientes1: TMenuItem;
    Agregarclientenuevo1: TMenuItem;
    Verclientes1: TMenuItem;
    Informes1: TMenuItem;
    Stock2: TMenuItem;
    Clientes2: TMenuItem;
    Ventas2: TMenuItem;
    Image1: TImage;
    Hombre1: TMenuItem;
    Mujer1: TMenuItem;
    Pantalon1: TMenuItem;
    Remera1: TMenuItem;
    Cinturon1: TMenuItem;
    Pantalon2: TMenuItem;
    Remera2: TMenuItem;
    Cinturon2: TMenuItem;
    Cuentacorriente1: TMenuItem;
    DeudasSaldos1: TMenuItem;
    Pagos1: TMenuItem;
    Avios1: TMenuItem;
    alleres1: TMenuItem;
    Confecciones1: TMenuItem;
    Nuevoavio1: TMenuItem;
    Modificaravio1: TMenuItem;
    Consultarstockavio1: TMenuItem;
    Agregartallernuevo1: TMenuItem;
    Vertalleres1: TMenuItem;
    Nuevaconfeccion1: TMenuItem;
    Historial2: TMenuItem;
    alleres2: TMenuItem;
    Cobros1: TMenuItem;
    Mercaderiaentalleres1: TMenuItem;
    Bolsa1: TMenuItem;
    Medias1: TMenuItem;
    Avios2: TMenuItem;
    alleres3: TMenuItem;
    Nios1: TMenuItem;
    Nios2: TMenuItem;
    Agregartallernuevo2: TMenuItem;
    Vertalleres2: TMenuItem;
    Agregartallernuevo3: TMenuItem;
    Vertalleres3: TMenuItem;
    CuentaCorriente2: TMenuItem;
    Saldodetalleres1: TMenuItem;
    Deudadeclientes1: TMenuItem;
    Mercaderiaentalleres2: TMenuItem;
    Nuevaordendeplanchado1: TMenuItem;
    Cortespendientes1: TMenuItem;
    Acercade1: TMenuItem;
    procedure Ingresarproductonuevo1Click(Sender: TObject);
    procedure Nuevaventa1Click(Sender: TObject);
    procedure Stock1Click(Sender: TObject);
    procedure Agregarclientenuevo1Click(Sender: TObject);
    procedure Verclientes1Click(Sender: TObject);
    procedure Historial1Click(Sender: TObject);
    procedure Consultarstock1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Pantalon1Click(Sender: TObject);
    procedure Pantalon2Click(Sender: TObject);
    procedure Remera1Click(Sender: TObject);
    procedure Remera2Click(Sender: TObject);
    procedure Cinturon1Click(Sender: TObject);
    procedure Cinturon2Click(Sender: TObject);
    procedure DeudasSaldos1Click(Sender: TObject);
    procedure Pagos1Click(Sender: TObject);
    procedure Nuevaconfeccion1Click(Sender: TObject);
    procedure Nuevoavio1Click(Sender: TObject);
    procedure Consultarstockavio1Click(Sender: TObject);
    procedure Modificaravio1Click(Sender: TObject);
    procedure Bolsa1Click(Sender: TObject);
    procedure Medias1Click(Sender: TObject);
    procedure Avios2Click(Sender: TObject);
    procedure alleres3Click(Sender: TObject);
    procedure Historial2Click(Sender: TObject);
    procedure Mercaderiaentalleres1Click(Sender: TObject);
    procedure Nios1Click(Sender: TObject);
    procedure Nios2Click(Sender: TObject);
    procedure Agregartallernuevo2Click(Sender: TObject);
    procedure Vertalleres2Click(Sender: TObject);
    procedure Agregartallernuevo3Click(Sender: TObject);
    procedure Vertalleres3Click(Sender: TObject);
    procedure alleres2Click(Sender: TObject);
    procedure Cobros1Click(Sender: TObject);
    procedure Saldodetalleres1Click(Sender: TObject);
    procedure Deudadeclientes1Click(Sender: TObject);
    procedure Mercaderiaentalleres2Click(Sender: TObject);
    procedure Nuevaordendeplanchado1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cortespendientes1Click(Sender: TObject);
    procedure Acercade1Click(Sender: TObject);
  private
    { Private declarations }
    procedure reporteSaldoTalleres;
    procedure reporteSaldoCLientes;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses productonuevo, datamodule, venta, consultarstock, clientenuevo,
  verclientes, historialventas, freporteClientes, reportePantalonHombre,
  reportePantalonMujer, reporteRemeraHombre, reporteRemeraMujer,
  reporteCinturonHombre, reporteCinturonMujer, cuentaCorriente, confeccion,
  avioNuevo, ftallernuevo, vertalleres, consultarStockAvio, reporteBolsa,
  cargarstockmedia, reporteMedias, reporteAvio, reporteTaller, historialcortes,
  mercaderiaEnTalleres, reporteNinosHombre, reporteNinosMujer,
  cargarstockremeras, reporteSaldoTalleres, reporteDeudaClientes,
  reporteMercaderiaEnTalleres, ordenPlancha, verCortePendiente, acerca;
{$R *.dfm}

procedure TForm1.Acercade1Click(Sender: TObject);
begin
acercade.ShowModal;
end;

procedure TForm1.Agregarclientenuevo1Click(Sender: TObject);
begin
  fclientenuevo.setNuevo;
  fclientenuevo.ShowModal;
end;

procedure TForm1.Agregartallernuevo2Click(Sender: TObject);
begin
  tallernuevo.setConfeccion;
  tallernuevo.ShowModal;
end;

procedure TForm1.Agregartallernuevo3Click(Sender: TObject);
begin
  tallernuevo.setPlancha;
  tallernuevo.ShowModal;
end;

procedure TForm1.alleres2Click(Sender: TObject);
begin
  fcuentaCorriente.PageControl1.ActivePageIndex := 2;
  fcuentaCorriente.ShowModal;
end;

procedure TForm1.alleres3Click(Sender: TObject);
begin
  datamodule1.QreporteTaller.Active := false;
  datamodule1.QreporteTaller.Active := true;
  freporteTaller.QuickRep1.preview;
end;

procedure TForm1.Avios2Click(Sender: TObject);
begin
  datamodule1.QreporteAvio.Active := false;
  datamodule1.QreporteAvio.Active := true;
  freporteAvio.QuickRep1.preview;
end;

procedure TForm1.Bolsa1Click(Sender: TObject);
begin
  datamodule1.QreporteBolsa.Active := false;
  datamodule1.QreporteBolsa.Active := true;
  freporteBolsa.QuickRep1.preview;
end;

procedure TForm1.Cinturon1Click(Sender: TObject);
begin
  datamodule1.QreporteCinturonH.Active := false;
  datamodule1.QreporteCinturonH.Active := true;
  freporteCinturonHombre.QuickRep1.preview;
end;

procedure TForm1.Cinturon2Click(Sender: TObject);
begin
  datamodule1.QreporteCinturonM.Active := false;
  datamodule1.QreporteCinturonM.Active := true;
  freporteCinturonMujer.QuickRep1.preview;
end;

procedure TForm1.Clientes2Click(Sender: TObject);
begin
  freportecliente.QuickRep1.preview;
end;

procedure TForm1.Cobros1Click(Sender: TObject);
begin
  fcuentaCorriente.PageControl1.ActivePageIndex := 3;
  fcuentaCorriente.ShowModal;

end;

procedure TForm1.Consultarstock1Click(Sender: TObject);
begin
  fconsultarstock.setConsultar;
  fconsultarstock.ShowModal;
end;

procedure TForm1.Consultarstockavio1Click(Sender: TObject);
begin
  fconsultarstockavio.setConsultar;
  fconsultarstockavio.ShowModal;
end;

procedure TForm1.Cortespendientes1Click(Sender: TObject);
begin
Corte_pendiente.ShowModal;
end;

procedure TForm1.Deudadeclientes1Click(Sender: TObject);
begin
  reporteSaldoClientes;

end;

procedure TForm1.DeudasSaldos1Click(Sender: TObject);
begin
  fcuentaCorriente.PageControl1.ActivePageIndex := 0;
  fcuentaCorriente.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//DecimalSeparator := ',';
end;

procedure TForm1.Historial1Click(Sender: TObject);
begin
  fhistorialventas.ShowModal;
end;

procedure TForm1.Historial2Click(Sender: TObject);
begin
  fhistorialcortes.ShowModal;
end;

procedure TForm1.Ingresarproductonuevo1Click(Sender: TObject);
begin
  fconsultarstock.entrePorConsultar := false;
  fconsultarstock.entrePorModificar := false;
  productonuevof.ShowModal;
end;

procedure TForm1.Medias1Click(Sender: TObject);
begin
  datamodule1.QreporteMedia.Active := false;
  datamodule1.QreporteMedia.Active := true;
  freporteMedias.QuickRep1.preview;
end;

procedure TForm1.Mercaderiaentalleres1Click(Sender: TObject);
begin
  FMercaderiaEnTaller.ShowModal;
end;

procedure TForm1.Mercaderiaentalleres2Click(Sender: TObject);
begin
  datamodule1.QMercaderia.Active := false;
  datamodule1.QMercaderia.SQL.Clear;
  datamodule1.QMercaderia.SQL.Add('select * from corte c ' +
      'inner join taller t on c.id_taller = t.id_taller ' +
      'inner join producto p on p.id_prod = c.id_producto ' +
      'where c.cantidad_restante > 0 group by c.id_corte order by t.nombre_taller asc');
  datamodule1.QMercaderia.open;
  datamodule1.QMercaderia.Active := true;
  fReporteMercaderiaTalleres.QuickRep1.preview;
end;

procedure TForm1.Modificaravio1Click(Sender: TObject);
begin
  fconsultarstockavio.setModificar;
  fconsultarstockavio.ShowModal;
end;

procedure TForm1.Nios1Click(Sender: TObject);
begin
  datamodule1.QreporteninosH.Active := false;
  datamodule1.QreporteninosH.Active := true;
  freporteNinosH.QuickRep1.preview;
end;

procedure TForm1.reporteSaldoTalleres;
var
  aux: double;
begin
  fcuentaCorriente.actualizarSaldoTallerres;
  datamodule1.QreporteSaldoTalleres.Active := false;
  datamodule1.QreporteSaldoTalleres.SQL.Clear;
  datamodule1.QreporteSaldoTalleres.SQL.Add(
     'select id_taller, nombre_taller, saldo_taller from taller t '
     + 'where t.saldo_taller <> 0 and t.nombre_taller <> '+ quotedstr('Incrementar CC'));
  datamodule1.QreporteSaldoTalleres.open;
  datamodule1.QreporteSaldoTalleres.Active := true;

  if not(datamodule1.QreporteSaldoTalleres.IsEmpty) then
  begin
    aux := 0;
    while (not datamodule1.QreporteSaldoTalleres.Eof) do
    begin
      aux := aux + datamodule1.QreporteSaldoTalleres.FieldByName('saldo_taller')
        .AsFloat;
      datamodule1.QreporteSaldoTalleres.Next;
    end;
    freportesaldotalleres.QRLabel17.Caption :=
      'Cuenta corriente: talleres';
    freportesaldotalleres.qrlabel3.caption:= '$ '+floattostr(aux);
    freportesaldotalleres.QuickRep1.preview;
  end
  else
  begin
    ShowMessage('No existen talleres con cuenta corriente activa');
  end;
end;

procedure tform1.reporteSaldoCLientes;
var
  aux: double;
begin
  fcuentaCorriente.actualizarSaldoClientes;
  datamodule1.QreporteDeudaClientes.Active := false;
  datamodule1.QreporteDeudaClientes.SQL.Clear;
  datamodule1.QreporteDeudaClientes.SQL.Add(
     'select id_cliente, nombre_cli, saldo from cliente c '
     + 'where saldo <> 0 and nombre_cli <> '+ quotedstr('Incrementar CC'));
  datamodule1.QreporteDeudaClientes.open;
  datamodule1.QreporteDeudaClientes.Active := true;

  if not(datamodule1.QreporteDeudaClientes.IsEmpty) then
  begin
    aux := 0;
    while (not datamodule1.QreporteDeudaClientes.Eof) do
    begin
      aux := aux + datamodule1.QreporteDeudaClientes.FieldByName('saldo')
        .AsFloat;
      datamodule1.QreporteDeudaClientes.Next;
    end;
    freportedeudaclientes.QRLabel17.Caption :=
      'Cuenta corriente: clientes';
    freportedeudaclientes.qrlabel3.caption:= '$ '+floattostr(aux);
    freportedeudaclientes.QuickRep1.preview;
  end
  else
  begin
    ShowMessage('No existen clientes con cuenta corriente activa');
  end;
end;



procedure TForm1.Nios2Click(Sender: TObject);
begin
  datamodule1.QreporteninosM.Active := false;
  datamodule1.QreporteninosM.Active := true;
  fReporteNinosMujer.QuickRep1.preview;
end;

procedure TForm1.Nuevaconfeccion1Click(Sender: TObject);
begin
  fconfeccion.setNuevo;
  fconfeccion.ShowModal;
end;

procedure TForm1.Nuevaordendeplanchado1Click(Sender: TObject);
begin
  fordenplancha.LabeledEdit5.Enabled := true;
  fordenplancha.ShowModal;
end;

procedure TForm1.Nuevaventa1Click(Sender: TObject);
begin

  fventa.ShowModal;
end;

procedure TForm1.Nuevoavio1Click(Sender: TObject);
begin
  fAvioNuevo.ShowModal;
end;

procedure TForm1.Pagos1Click(Sender: TObject);
begin
  fcuentaCorriente.PageControl1.ActivePageIndex := 1;
  fcuentaCorriente.ShowModal;
end;

procedure TForm1.Pantalon1Click(Sender: TObject);
begin
  datamodule1.QreportePantalonH.Active := false;
  datamodule1.QreportePantalonH.Active := true;
  freportePantalonHombre.QuickRep1.preview;
end;

procedure TForm1.Pantalon2Click(Sender: TObject);
begin
  datamodule1.QreportePantalonM.Active := false;
  datamodule1.QreportePantalonM.Active := true;
  freportePantalonMujer.QuickRep1.preview;
end;

procedure TForm1.Remera1Click(Sender: TObject);
begin
  datamodule1.QreporteRemeraH.Active := false;
  datamodule1.QreporteRemeraH.Active := true;
  freporteRemeraHombre.QuickRep1.preview;
end;

procedure TForm1.Remera2Click(Sender: TObject);
begin
  datamodule1.QreporteRemeraM.Active := false;
  datamodule1.QreporteRemeraM.Active := true;

  freporteRemeraMujer.QuickRep1.preview;
end;

procedure TForm1.Saldodetalleres1Click(Sender: TObject);
begin
  self.reporteSaldoTalleres;
end;

procedure TForm1.Stock1Click(Sender: TObject);
begin
  fconsultarstock.setModificar;
  fconsultarstock.ShowModal;
end;

procedure TForm1.Verclientes1Click(Sender: TObject);
begin
  fverclientes.ShowModal;
end;

procedure TForm1.Vertalleres2Click(Sender: TObject);
begin
  fvertalleres.setConfeccion;
  fvertalleres.ShowModal;
end;

procedure TForm1.Vertalleres3Click(Sender: TObject);
begin
  fvertalleres.setPlancha;
  fvertalleres.ShowModal;
end;

end.
