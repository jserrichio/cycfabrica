program cycfabrica;

uses
  Forms,
  principal in 'principal.pas' {Form1},
  productonuevo in 'productonuevo.pas' {productonuevof},
  datamodule in 'datamodule.pas' {DataModule1: TDataModule},
  cargarstockremeras in 'cargarstockremeras.pas' {fcargarstockremeras},
  cargarstockpantalon in 'cargarstockpantalon.pas' {fcargarstockpantalon},
  cargarstockcinturon in 'cargarstockcinturon.pas' {fcargarstockcinturon},
  venta in 'venta.pas' {fventa},
  consultarstock in 'consultarstock.pas' {fconsultarstock},
  clientenuevo in 'clientenuevo.pas' {fclientenuevo},
  verclientes in 'verclientes.pas' {fverclientes},
  remito in 'remito.pas' {fRemito},
  historialventas in 'historialventas.pas' {fhistorialventas},
  freporteClientes in 'freporteClientes.pas' {freporteCliente},
  reportePantalonHombre in 'reportePantalonHombre.pas' {freportePantalonHombre},
  reportePantalonMujer in 'reportePantalonMujer.pas' {freportePantalonMujer},
  reporteRemeraHombre in 'reporteRemeraHombre.pas' {freporteRemeraHombre},
  reporteRemeraMujer in 'reporteRemeraMujer.pas' {freporteRemeraMujer},
  reporteCinturonHombre in 'reporteCinturonHombre.pas' {freporteCinturonHombre},
  reporteCinturonMujer in 'reporteCinturonMujer.pas' {freporteCinturonMujer},
  devolucion in 'devolucion.pas' {fdevolucion},
  cargarstockbolsa in 'cargarstockbolsa.pas' {fcargarstockbolsa},
  cargarstockmedia in 'cargarstockmedia.pas' {fcargarstockmedia},
  cuentaCorriente in 'cuentaCorriente.pas' {fcuentaCorriente},
  ingresarPago in 'ingresarPago.pas' {fingresarPago},
  confeccion in 'confeccion.pas' {fconfeccion},
  avioNuevo in 'avioNuevo.pas' {fAvioNuevo},
  ftallernuevo in 'ftallernuevo.pas' {tallerNuevo},
  vertalleres in 'vertalleres.pas' {fvertalleres},
  consultarStockAvio in 'consultarStockAvio.pas' {fconsultarStockAvio},
  reporteBolsa in 'reporteBolsa.pas' {Form2},
  reporteMedias in 'reporteMedias.pas' {freporteMedias},
  reporteAvio in 'reporteAvio.pas' {freporteAvio},
  reporteTaller in 'reporteTaller.pas' {freporteTaller},
  costura in 'costura.pas' {fcostura},
  observaciones in 'observaciones.pas' {fobservaciones},
  remitoCorte in 'remitoCorte.pas' {fremitocorte},
  historialcortes in 'historialcortes.pas' {fhistorialcortes},
  mercaderiaEnTalleres in 'mercaderiaEnTalleres.pas' {FMercaderiaEnTaller},
  confirmarCorte in 'confirmarCorte.pas' {fConfirmarCorte},
  cargarstockninos in 'cargarstockninos.pas' {fcargarstockninos},
  reporteNinosHombre in 'reporteNinosHombre.pas' {freporteNinosH},
  reporteNinosMujer in 'reporteNinosMujer.pas' {fReporteNinosMujer},
  ordenPlancha in 'ordenPlancha.pas' {fOrdenPlancha},
  remitoPago in 'remitoPago.pas' {fremitoPago},
  reporteSaldoTalleres in 'reporteSaldoTalleres.pas' {fReporteSaldoTalleres},
  reporteDeudaClientes in 'reporteDeudaClientes.pas' {fReporteDeudaClientes},
  reporteMercaderiaEnTalleres in 'reporteMercaderiaEnTalleres.pas' {fReporteMercaderiaTalleres},
  remitoCobro in 'remitoCobro.pas' {FRemitoCobro},
  reporteCCTaller in 'reporteCCTaller.pas' {fReporteCCTaller},
  verCortePendiente in 'verCortePendiente.pas' {Corte_pendiente},
  acerca in 'acerca.pas' {acercade},
  reportePagosTaller in 'reportePagosTaller.pas' {FReportePagosTaller};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'C&C - Fabrica';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfcargarstockremeras, fcargarstockremeras);
  Application.CreateForm(Tfcargarstockpantalon, fcargarstockpantalon);
  Application.CreateForm(Tfcargarstockcinturon, fcargarstockcinturon);
  Application.CreateForm(Tfventa, fventa);
  Application.CreateForm(Tproductonuevof, productonuevof);
  Application.CreateForm(Tfconsultarstock, fconsultarstock);
  Application.CreateForm(Tfclientenuevo, fclientenuevo);
  Application.CreateForm(Tfverclientes, fverclientes);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfRemito, fRemito);
  Application.CreateForm(Tfhistorialventas, fhistorialventas);
  Application.CreateForm(TfreporteCliente, freporteCliente);
  Application.CreateForm(TfreportePantalonHombre, freportePantalonHombre);
  Application.CreateForm(TfreportePantalonMujer, freportePantalonMujer);
  Application.CreateForm(TfreporteRemeraHombre, freporteRemeraHombre);
  Application.CreateForm(TfreporteRemeraMujer, freporteRemeraMujer);
  Application.CreateForm(TfreporteCinturonHombre, freporteCinturonHombre);
  Application.CreateForm(TfreporteCinturonMujer, freporteCinturonMujer);
  Application.CreateForm(Tfdevolucion, fdevolucion);
  Application.CreateForm(Tfcargarstockbolsa, fcargarstockbolsa);
  Application.CreateForm(Tfcargarstockmedia, fcargarstockmedia);
  Application.CreateForm(TfcuentaCorriente, fcuentaCorriente);
  Application.CreateForm(TfingresarPago, fingresarPago);
  Application.CreateForm(Tfconfeccion, fconfeccion);
  Application.CreateForm(TfAvioNuevo, fAvioNuevo);
  Application.CreateForm(TtallerNuevo, tallerNuevo);
  Application.CreateForm(Tfvertalleres, fvertalleres);
  Application.CreateForm(TfconsultarStockAvio, fconsultarStockAvio);
  Application.CreateForm(TfreporteBolsa, freporteBolsa);
  Application.CreateForm(TfreporteMedias, freporteMedias);
  Application.CreateForm(TfreporteAvio, freporteAvio);
  Application.CreateForm(TfreporteTaller, freporteTaller);
  Application.CreateForm(Tfcostura, fcostura);
  Application.CreateForm(Tfobservaciones, fobservaciones);
  Application.CreateForm(Tfremitocorte, fremitocorte);
  Application.CreateForm(Tfhistorialcortes, fhistorialcortes);
  Application.CreateForm(TFMercaderiaEnTaller, FMercaderiaEnTaller);
  Application.CreateForm(TfConfirmarCorte, fConfirmarCorte);
  Application.CreateForm(Tfcargarstockninos, fcargarstockninos);
  Application.CreateForm(TfreporteNinosH, freporteNinosH);
  Application.CreateForm(TfReporteNinosMujer, fReporteNinosMujer);
  Application.CreateForm(TfOrdenPlancha, fOrdenPlancha);
  Application.CreateForm(TfremitoPago, fremitoPago);
  Application.CreateForm(TfReporteSaldoTalleres, fReporteSaldoTalleres);
  Application.CreateForm(TfReporteDeudaClientes, fReporteDeudaClientes);
  Application.CreateForm(TfReporteMercaderiaTalleres, fReporteMercaderiaTalleres);
  Application.CreateForm(TFRemitoCobro, FRemitoCobro);
  Application.CreateForm(TfReporteCCTaller, fReporteCCTaller);
  Application.CreateForm(TCorte_pendiente, Corte_pendiente);
  Application.CreateForm(Tacercade, acercade);
  Application.CreateForm(TFReportePagosTaller, FReportePagosTaller);
  Application.Run;
end.
