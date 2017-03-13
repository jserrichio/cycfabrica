unit datamodule;

interface

uses
  SysUtils, Classes, DB, ADODB, inifiles, forms, dialogs, WideStrings, SqlExpr;

type
  TDataModule1 = class(TDataModule)
    producto: TADOTable;
    talle_remera: TADOTable;
    talle_pantalon: TADOTable;
    talle_cinturon: TADOTable;
    dsproducto: TDataSource;
    dstalle_remera: TDataSource;
    dstalle_pantalon: TDataSource;
    dstalle_cinturon: TDataSource;
    QstockTotal: TADOQuery;
    dsQstockTotal: TDataSource;
    cliente: TADOTable;
    dscliente: TDataSource;
    Qcliente: TADOQuery;
    dsqcliente: TDataSource;
    QstockRemera: TADOQuery;
    dsQstockRemera: TDataSource;
    QstockPantalon: TADOQuery;
    dsQstockPantalon: TDataSource;
    QstockCinturon: TADOQuery;
    dsQstockCinturon: TDataSource;
    venta: TADOTable;
    detalle_venta: TADOTable;
    dsVenta: TDataSource;
    dsDetalle_Venta: TDataSource;
    QRemito: TADOQuery;
    dsRemito: TDataSource;
    Qventa: TADOQuery;
    dsqventa: TDataSource;
    QreportePantalonH: TADOQuery;
    QreporteRemeraH: TADOQuery;
    QreporteCinturonH: TADOQuery;
    dsreportePantalonH: TDataSource;
    dsreporteRemeraH: TDataSource;
    dsreporteCinturonH: TDataSource;
    QreportePantalonM: TADOQuery;
    dsreportePantalonM: TDataSource;
    QreporteRemeraM: TADOQuery;
    dsreporteRemeraM: TDataSource;
    QreporteCinturonM: TADOQuery;
    dsreporteCinturonM: TDataSource;
    ADOConnection1: TADOConnection;
    talle_media: TADOTable;
    dstalle_media: TDataSource;
    talle_bolsa: TADOTable;
    dstalle_bolsa: TDataSource;
    QstockMedia: TADOQuery;
    QstockBolsa: TADOQuery;
    dsQstockMedia: TDataSource;
    dsQstockBolsa: TDataSource;
    QCCCliente: TADOQuery;
    dsqcccliente: TDataSource;
    pago: TADOTable;
    dspago: TDataSource;
    Qpagos: TADOQuery;
    dsQpagos: TDataSource;
    taller: TADOTable;
    dstaller: TDataSource;
    Qtaller: TADOQuery;
    dsqtaller: TDataSource;
    avio: TADOTable;
    dsavio: TDataSource;
    QstockAvio: TADOQuery;
    dsQstockAvio: TDataSource;
    foto_avio: TADOTable;
    foto_avioid_foto_avio: TAutoIncField;
    foto_avioid_avio: TIntegerField;
    foto_aviofoto_avio: TBlobField;
    dsfoto_avio: TDataSource;
    QreporteBolsa: TADOQuery;
    QreporteMedia: TADOQuery;
    dsreporteMedia: TDataSource;
    dsreporteBolsa: TDataSource;
    QreporteAvio: TADOQuery;
    QreporteTaller: TADOQuery;
    dsreporteAvio: TDataSource;
    dsreporteTaller: TDataSource;
    corte: TADOTable;
    dscorte: TDataSource;
    detalle_corte_avio: TADOTable;
    dsdetalle_corte: TDataSource;
    detalle_corte_producto: TADOTable;
    dsdetalle_corte_producto: TDataSource;
    Qcorte: TADOQuery;
    dsqcorte: TDataSource;
    QMercaderia: TADOQuery;
    dsqmercaderia: TDataSource;
    corte_entrega: TADOTable;
    dscorte_entrega: TDataSource;
    foto_producto: TADOTable;
    dsfoto_producto: TDataSource;
    productoid_prod: TAutoIncField;
    productonombre_prod: TStringField;
    productodescripcion_prod: TStringField;
    productotipo_prod: TStringField;
    productosexo_prod: TStringField;
    productoprecio_unitario: TBCDField;
    productoprecio_xmayor: TBCDField;
    productofoto_prod: TBlobField;
    talle_ninos: TADOTable;
    dsninos: TDataSource;
    QreporteNinosH: TADOQuery;
    dsreporteNinosH: TDataSource;
    QreporteNinosM: TADOQuery;
    dsreporteNinosM: TDataSource;
    productonum_prod: TIntegerField;
    QstockNinos: TADOQuery;
    dsQstockNinos: TDataSource;
    QCCTaller: TADOQuery;
    dsqcctaller: TDataSource;
    cobro: TADOTable;
    dscobro: TDataSource;
    decrementarSaldoTaller: TADOStoredProc;
    incrementarSaldoTaller: TADOStoredProc;
    incrementarSaldoCliente: TADOStoredProc;
    incrementarStockRemera: TADOStoredProc;
    incrementarStockPantalon: TADOStoredProc;
    incrementarStockNino: TADOStoredProc;
    incrementarStockCinturon: TADOStoredProc;
    QCobros: TADOQuery;
    dsQCobros: TDataSource;
    modificarCliente: TADOStoredProc;
    nuevoCliente: TADOStoredProc;
    QreporteSaldoTalleres: TADOQuery;
    dsQreporteSaldoTalleres: TDataSource;
    QreporteDeudaClientes: TADOQuery;
    dsQreporteDeudaClientes: TDataSource;
    qRemitoPago: TADOQuery;
    dsqremitopago: TDataSource;
    modificarCorte: TADOStoredProc;
    QCCTaller2: TADOQuery;
    dsqcctaller2: TDataSource;
    corte_pendiente: TADOTable;
    dscorte_pendiente: TDataSource;
    corte_color_capas: TADOTable;
    dscorte_color_capas: TDataSource;
    talle_corte_pendiente_n: TADOTable;
    talle_corte_pendiente_p: TADOTable;
    talle_corte_pendiente_r: TADOTable;
    dstalle_corte_pendiente_n: TDataSource;
    dstalle_corte_pendiente_p: TDataSource;
    dstalle_corte_pendiente_r: TDataSource;
    QCorte_pendiente: TADOQuery;
    DSQCorte_pendiente: TDataSource;
    setSaldoTaller: TADOStoredProc;
    setSaldoCliente: TADOStoredProc;
    productoactivo: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure activartablas();

    procedure cargarConnectionString();

  public
    { Public declarations }

  end;

var
  DataModule1: TDataModule1;

implementation

uses principal;
{$R *.dfm}

procedure TDataModule1.activartablas;
begin
  producto.Active := true;
  talle_remera.Active := true;
  talle_pantalon.Active := true;
  talle_cinturon.Active := true;
  talle_bolsa.Active := true;
  talle_media.Active := true;
  talle_ninos.Active:=true;
  cliente.Active := true;
  venta.Active := true;
  detalle_venta.Active := true;
  pago.Active := true;
  taller.Active := true;
  avio.Active := true;
  foto_avio.Active := true;
  corte.Active := true;
  detalle_corte_avio.Active := true;
  corte_entrega.Active:=true;
  cobro.Active:=true;
  corte_pendiente.Active:=true;
  corte_color_capas.Active:=true;
  talle_corte_pendiente_n.Active:=true;
  talle_corte_pendiente_r.Active:=true;
talle_corte_pendiente_p.Active:=true;

end;

procedure TDataModule1.cargarConnectionString;
var
  BaseDeDatos: string;
  IniFile: TIniFile;
begin

  // Obtiene la ruta y el nombre de la base de datos
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conf.ini');
  BaseDeDatos := IniFile.ReadString('BD', 'Path', '');
  If BaseDeDatos = '' then
    ShowMessage('Error al cargar Base de Datos');

  ADOConnection1.Connected := false;
  ADOConnection1.ConnectionString := BaseDeDatos;
  ADOConnection1.Connected := true;

end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  self.cargarConnectionString;
  self.activartablas;
  // self.activarconsultas;
end;

end.
