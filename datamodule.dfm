object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 717
  Width = 2130
  object producto: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'producto'
    Left = 224
    Top = 48
    object productoid_prod: TAutoIncField
      FieldName = 'id_prod'
      ReadOnly = True
    end
    object productonombre_prod: TStringField
      FieldName = 'nombre_prod'
      Size = 255
    end
    object productodescripcion_prod: TStringField
      FieldName = 'descripcion_prod'
      Size = 255
    end
    object productotipo_prod: TStringField
      FieldName = 'tipo_prod'
      Size = 255
    end
    object productosexo_prod: TStringField
      FieldName = 'sexo_prod'
      Size = 255
    end
    object productoprecio_unitario: TBCDField
      FieldName = 'precio_unitario'
      Precision = 5
      Size = 2
    end
    object productoprecio_xmayor: TBCDField
      FieldName = 'precio_xmayor'
      Precision = 5
      Size = 2
    end
    object productofoto_prod: TBlobField
      FieldName = 'foto_prod'
    end
    object productonum_prod: TIntegerField
      FieldName = 'num_prod'
    end
    object productoactivo: TIntegerField
      FieldName = 'activo'
    end
  end
  object talle_remera: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'talle_remera'
    Left = 296
    Top = 48
  end
  object talle_pantalon: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'talle_pantalon'
    Left = 376
    Top = 48
  end
  object talle_cinturon: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'talle_cinturon'
    Left = 464
    Top = 48
  end
  object dsproducto: TDataSource
    DataSet = producto
    Left = 224
    Top = 128
  end
  object dstalle_remera: TDataSource
    DataSet = talle_remera
    Left = 296
    Top = 128
  end
  object dstalle_pantalon: TDataSource
    DataSet = talle_pantalon
    Left = 384
    Top = 128
  end
  object dstalle_cinturon: TDataSource
    DataSet = talle_cinturon
    Left = 472
    Top = 128
  end
  object QstockTotal: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select p.id_prod, p.nombre_prod, p.sexo_prod, tp.26, tp.28,'
      'tp.30, tp.32, tp.34, tp.36, tp.38, tp.40, tp.42, tp.44, tp.46,'
      'tp.48, tp.50, tp.52, tp.54, tp.56, tp.58, tp.60, tr.xs, tr.s,'
      
        'tr.m, tr.l, tr.xl, tr.xxl, tr.xxxl, tc.90, tc.95, tc.100, tc.105' +
        ', tc.110'
      'from producto p '
      'left join talle_pantalon tp on p.id_prod = tp.id_prod'
      'left join talle_remera tr on p.id_prod = tr.id_prod'
      'left join talle_cinturon tc on p.id_prod = tc.id_prod'
      'where p.activo=1'
      'order by p.nombre_prod')
    Left = 224
    Top = 208
  end
  object dsQstockTotal: TDataSource
    DataSet = QstockTotal
    Left = 224
    Top = 264
  end
  object cliente: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'cliente'
    Left = 544
    Top = 48
  end
  object dscliente: TDataSource
    DataSet = cliente
    Left = 544
    Top = 128
  end
  object Qcliente: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cliente')
    Left = 216
    Top = 336
  end
  object dsqcliente: TDataSource
    DataSet = Qcliente
    Left = 216
    Top = 392
  end
  object QstockRemera: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select p.nombre_prod,p.id_prod, p.descripcion_prod, p.tipo_prod,' +
        ' p.sexo_prod, '
      
        'p.precio_unitario, tr.xs, tr.s, tr.m, tr.l, tr.xl, tr.xxl, tr.xx' +
        'xl, (tr.xs + tr.s + tr.m + tr.l + tr.xl + tr.xxl + tr.xxxl) as t' +
        'otal from producto p '
      'left join talle_remera tr on p.id_prod = tr.id_prod'
      'where p.tipo_prod="remera" and p.activo=1'
      'order by p.nombre_prod'
      '')
    Left = 296
    Top = 208
  end
  object dsQstockRemera: TDataSource
    DataSet = QstockRemera
    Left = 296
    Top = 264
  end
  object QstockPantalon: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select p.nombre_prod,p.id_prod,  p.descripcion_prod, p.tipo_prod' +
        ', p.sexo_prod, '
      
        'p.precio_unitario, tp.26, tp.28, tp.30, tp.32, tp.34, tp.36, tp.' +
        '38, tp.40, '
      'tp.42, tp.44, tp.46, tp.48, tp.50, tp.52, tp.54, '
      
        ' (tp.26 + tp.28 + tp.30 + tp.32 + tp.34 + tp.36 + tp.38 + tp.40 ' +
        '+ tp.42 '
      
        '+ tp.44 + tp.46 + tp.48 + tp.50 + tp.52 + tp.54) as total from p' +
        'roducto p'
      ' left join talle_pantalon tp on p.id_prod = tp.id_prod'
      'where p.tipo_prod="pantalon" and p.activo=1'
      'order by p.nombre_prod')
    Left = 384
    Top = 208
  end
  object dsQstockPantalon: TDataSource
    DataSet = QstockPantalon
    Left = 384
    Top = 264
  end
  object QstockCinturon: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select p.nombre_prod, p.id_prod, p.descripcion_prod, p.tipo_prod' +
        ', p.sexo_prod, '
      
        'p.precio_unitario, tc.90, tc.95, tc.100, tc.105, tc.110, (tc.90 ' +
        '+ tc.95 + tc.100 + tc.105 + tc.110) as total from producto p '
      'left join talle_cinturon tc on p.id_prod = tc.id_prod'
      'where p.tipo_prod="cinturon" and p.activo=1'
      'order by p.nombre_prod')
    Left = 472
    Top = 208
  end
  object dsQstockCinturon: TDataSource
    DataSet = QstockCinturon
    Left = 472
    Top = 264
  end
  object venta: TADOTable
    Connection = ADOConnection1
    TableName = 'venta'
    Left = 616
    Top = 48
  end
  object detalle_venta: TADOTable
    Connection = ADOConnection1
    TableName = 'detalle_venta'
    Left = 688
    Top = 48
  end
  object dsVenta: TDataSource
    DataSet = venta
    Left = 616
    Top = 120
  end
  object dsDetalle_Venta: TDataSource
    DataSet = detalle_venta
    Left = 688
    Top = 120
  end
  object QRemito: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  c.cantidad, c.id_producto, p.nombre_prod, da.id_avio, da' +
        '.cantidad, c.fecha, c.fecha_entrega, c.costo_unidad,'
      
        'c.costo_total, c.costo_unidad, c.observacion_corte, c.costura_co' +
        'rte, c.fliselina, c.tira, c.muestra, p.nombre_prod, p.num_prod, ' +
        'a.nombre_avio, a.descripcion_avio from producto p inner join cor' +
        'te c'
      
        'on p.id_prod = c.id_producto inner join detalle_corte_avio da on' +
        ' da.id_corte=c.id_corte '
      'join avio a on a.id_avio=da.id_avio where c.id_corte = 1')
    Left = 568
    Top = 208
  end
  object dsRemito: TDataSource
    DataSet = QRemito
    Left = 568
    Top = 264
  end
  object Qventa: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from venta v'
      'inner join detalle_venta d on v.id_venta = d.id_venta'
      'inner join cliente c on v.id_cliente = c.id_cliente'
      'group by v.id_venta')
    Left = 296
    Top = 336
  end
  object dsqventa: TDataSource
    DataSet = Qventa
    Left = 296
    Top = 392
  end
  object QreportePantalonH: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from producto p '
      'inner join talle_pantalon tp on p.id_prod = tp.id_prod'
      'where p.tipo_prod="pantalon" and p.sexo_prod="hombre"')
    Left = 216
    Top = 456
  end
  object QreporteRemeraH: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from producto p '
      'left join talle_remera tr on p.id_prod = tr.id_prod'
      'where p.tipo_prod="remera" and p.sexo_prod="hombre"')
    Left = 336
    Top = 456
  end
  object QreporteCinturonH: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from producto p '
      'left join talle_cinturon tc on p.id_prod = tc.id_prod'
      'where p.tipo_prod="cinturon" and p.sexo_prod="hombre"')
    Left = 464
    Top = 456
  end
  object dsreportePantalonH: TDataSource
    DataSet = QreportePantalonH
    Left = 216
    Top = 520
  end
  object dsreporteRemeraH: TDataSource
    DataSet = QreporteRemeraH
    Left = 336
    Top = 520
  end
  object dsreporteCinturonH: TDataSource
    DataSet = QreporteCinturonH
    Left = 464
    Top = 520
  end
  object QreportePantalonM: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from producto p '
      'left join talle_pantalon tp on p.id_prod = tp.id_prod'
      'where p.tipo_prod="pantalon" and p.sexo_prod="dama"')
    Left = 216
    Top = 584
  end
  object dsreportePantalonM: TDataSource
    DataSet = QreportePantalonM
    Left = 216
    Top = 644
  end
  object QreporteRemeraM: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from producto p '
      'left join talle_remera tr on p.id_prod = tr.id_prod'
      'where p.tipo_prod="remera" and p.sexo_prod="dama"')
    Left = 336
    Top = 584
  end
  object dsreporteRemeraM: TDataSource
    DataSet = QreporteRemeraM
    Left = 336
    Top = 640
  end
  object QreporteCinturonM: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from producto p '
      'left join talle_cinturon tc on p.id_prod = tc.id_prod'
      'where p.tipo_prod="cinturon" and p.sexo_prod="dama"')
    Left = 464
    Top = 584
  end
  object dsreporteCinturonM: TDataSource
    DataSet = QreporteCinturonM
    Left = 464
    Top = 640
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 48
    Top = 48
  end
  object talle_media: TADOTable
    Connection = ADOConnection1
    TableName = 'talle_media'
    Left = 784
    Top = 48
  end
  object dstalle_media: TDataSource
    DataSet = talle_media
    Left = 784
    Top = 120
  end
  object talle_bolsa: TADOTable
    Connection = ADOConnection1
    TableName = 'talle_bolsa'
    Left = 872
    Top = 48
  end
  object dstalle_bolsa: TDataSource
    DataSet = talle_bolsa
    Left = 872
    Top = 120
  end
  object QstockMedia: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select p.nombre_prod, p.descripcion_prod, p.tipo_prod, p.sexo_pr' +
        'od, '
      
        'p.precio_unitario, tm.negro, tm.gris, tm.azul, tm.aero, tm.blanc' +
        'a, (tm.negro + tm.gris + tm.azul + tm.aero + tm.blanca) as total' +
        ' from producto p '
      'left join talle_media tm on p.id_prod = tm.id_prod'
      'where p.tipo_prod="media" and p.activo=1'
      'order by p.nombre_prod')
    Left = 664
    Top = 208
  end
  object QstockBolsa: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select p.nombre_prod, p.descripcion_prod, p.tipo_prod, p.sexo_pr' +
        'od, '
      
        'p.precio_unitario, tb.1, tb.2, tb.3, tb.4, (tb.1 + tb.2 + tb.3 +' +
        ' tb.4) as total from producto p '
      'left join talle_bolsa tb on p.id_prod = tb.id_prod'
      'where p.tipo_prod="bolsa" and p.activo=1'
      'order by p.nombre_prod')
    Left = 752
    Top = 208
  end
  object dsQstockMedia: TDataSource
    DataSet = QstockMedia
    Left = 664
    Top = 264
  end
  object dsQstockBolsa: TDataSource
    DataSet = QstockBolsa
    Left = 752
    Top = 264
  end
  object QCCCliente: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from venta v inner join detalle_venta d on v.id_venta =' +
        ' d.id_venta'
      'inner join cliente c on v.id_cliente = c.id_cliente'
      'where v.cc = 1 group by v.id_venta order by v.fecha_venta desc')
    Left = 392
    Top = 336
  end
  object dsqcccliente: TDataSource
    DataSet = QCCCliente
    Left = 392
    Top = 392
  end
  object pago: TADOTable
    Connection = ADOConnection1
    TableName = 'pago'
    Left = 960
    Top = 48
  end
  object dspago: TDataSource
    DataSet = pago
    Left = 960
    Top = 120
  end
  object Qpagos: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from pago p inner join cliente c on p.id_cliente = c.id' +
        '_cliente')
    Left = 472
    Top = 336
  end
  object dsQpagos: TDataSource
    DataSet = Qpagos
    Left = 472
    Top = 392
  end
  object taller: TADOTable
    Connection = ADOConnection1
    TableName = 'taller'
    Left = 1040
    Top = 48
  end
  object dstaller: TDataSource
    DataSet = taller
    Left = 1040
    Top = 120
  end
  object Qtaller: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from taller')
    Left = 560
    Top = 344
  end
  object dsqtaller: TDataSource
    DataSet = Qtaller
    Left = 560
    Top = 400
  end
  object avio: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'avio'
    Left = 1112
    Top = 48
  end
  object dsavio: TDataSource
    DataSet = avio
    Left = 1112
    Top = 120
  end
  object QstockAvio: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from avio')
    Left = 912
    Top = 208
  end
  object dsQstockAvio: TDataSource
    DataSet = QstockAvio
    Left = 904
    Top = 264
  end
  object foto_avio: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'foto_avio'
    Left = 1176
    Top = 48
    object foto_avioid_foto_avio: TAutoIncField
      FieldName = 'id_foto_avio'
      ReadOnly = True
    end
    object foto_avioid_avio: TIntegerField
      FieldName = 'id_avio'
    end
    object foto_aviofoto_avio: TBlobField
      FieldName = 'foto_avio'
    end
  end
  object dsfoto_avio: TDataSource
    DataSet = foto_avio
    Left = 1176
    Top = 120
  end
  object QreporteBolsa: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = dsQstockBolsa
    Parameters = <>
    SQL.Strings = (
      'select * from producto p '
      'left join talle_bolsa tb on p.id_prod = tb.id_prod'
      'where p.tipo_prod="bolsa"')
    Left = 752
    Top = 336
  end
  object QreporteMedia: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = dsreporteMedia
    Parameters = <>
    SQL.Strings = (
      'select * from producto p '
      'left join talle_media tm on p.id_prod = tm.id_prod'
      'where p.tipo_prod="media" ')
    Left = 664
    Top = 336
  end
  object dsreporteMedia: TDataSource
    Left = 664
    Top = 400
  end
  object dsreporteBolsa: TDataSource
    DataSet = QreporteBolsa
    Left = 752
    Top = 400
  end
  object QreporteAvio: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from avio ')
    Left = 1112
    Top = 208
  end
  object QreporteTaller: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from taller')
    Left = 560
    Top = 456
  end
  object dsreporteAvio: TDataSource
    DataSet = QreporteAvio
    Left = 1112
    Top = 264
  end
  object dsreporteTaller: TDataSource
    DataSet = QreporteTaller
    Left = 560
    Top = 520
  end
  object corte: TADOTable
    Connection = ADOConnection1
    TableName = 'corte'
    Left = 1248
    Top = 64
  end
  object dscorte: TDataSource
    DataSet = corte
    Left = 1256
    Top = 128
  end
  object detalle_corte_avio: TADOTable
    Connection = ADOConnection1
    TableName = 'detalle_corte_avio'
    Left = 1320
    Top = 72
  end
  object dsdetalle_corte: TDataSource
    DataSet = detalle_corte_avio
    Left = 1320
    Top = 144
  end
  object detalle_corte_producto: TADOTable
    Connection = ADOConnection1
    TableName = 'detalle_corte_producto'
    Left = 1424
    Top = 48
  end
  object dsdetalle_corte_producto: TDataSource
    DataSet = detalle_corte_producto
    Left = 1432
    Top = 136
  end
  object Qcorte: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from corte c'
      'inner join taller t on c.id_taller = t.id_taller'
      'inner join producto p on p.id_prod = c.id_producto '
      'group by c.id_corte')
    Left = 840
    Top = 352
  end
  object dsqcorte: TDataSource
    DataSet = Qcorte
    Left = 856
    Top = 416
  end
  object QMercaderia: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from corte c inner join taller t'
      'on c.id_taller = t.id_taller inner join producto p'
      'on p.id_prod = c.id_producto group by c.id_corte')
    Left = 960
    Top = 352
  end
  object dsqmercaderia: TDataSource
    DataSet = QMercaderia
    Left = 976
    Top = 432
  end
  object corte_entrega: TADOTable
    Connection = ADOConnection1
    TableName = 'corte_entrega'
    Left = 1552
    Top = 64
  end
  object dscorte_entrega: TDataSource
    DataSet = corte_entrega
    Left = 1552
    Top = 152
  end
  object foto_producto: TADOTable
    Left = 168
    Top = 56
  end
  object dsfoto_producto: TDataSource
    DataSet = foto_producto
    Left = 152
    Top = 120
  end
  object talle_ninos: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'talle_ninos'
    Left = 80
    Top = 144
  end
  object dsninos: TDataSource
    DataSet = talle_ninos
    Left = 80
    Top = 216
  end
  object QreporteNinosH: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from producto p '
      'inner join talle_ninos tn on p.id_prod = tn.id_prod'
      'where p.tipo_prod="ninos" and p.sexo_prod="hombre"')
    Left = 664
    Top = 464
  end
  object dsreporteNinosH: TDataSource
    DataSet = QreporteNinosH
    Left = 664
    Top = 528
  end
  object QreporteNinosM: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from producto p '
      'inner join talle_ninos tn on p.id_prod = tn.id_prod'
      'where p.tipo_prod="ninos" and p.sexo_prod="mujer"')
    Left = 736
    Top = 464
  end
  object dsreporteNinosM: TDataSource
    DataSet = QreporteNinosM
    Left = 736
    Top = 528
  end
  object QstockNinos: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select p.nombre_prod,p.id_prod, p.descripcion_prod, p.tipo_prod,' +
        ' p.sexo_prod, '
      
        'p.precio_unitario, tn.1, tn.2, tn.4, tn.6, tn.8, tn.10, tn.12, t' +
        'n.14, tn.16, (tn.1 + tn.2 + tn.4 + tn.6 + tn.8 + tn.10 + tn.12 +' +
        ' tn.14 + tn.16) as total from producto p '
      'left join talle_ninos tn on p.id_prod = tn.id_prod'
      'where p.tipo_prod="ninos" and p.activo=1'
      'order by p.nombre_prod')
    Left = 824
    Top = 208
  end
  object dsQstockNinos: TDataSource
    DataSet = QstockNinos
    Left = 824
    Top = 264
  end
  object QCCTaller: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select c.id_corte, c.num_corte, p.num_prod, c.costo_unidad, t.id' +
        '_taller,t.nombre_taller, p.id_prod,p.nombre_prod, e.id_corte_ent' +
        'rega,e.controlado_por, e.fecha, e.cantidad_entregada, e.cantidad' +
        '_fallada, e.pagar, e.deuda'
      'from corte c'
      'inner join taller t on c.id_taller = t.id_taller'
      'inner join corte_entrega e on c.id_corte = e.id_corte'
      'inner join producto p on p.id_prod = c.id_producto')
    Left = 144
    Top = 336
  end
  object dsqcctaller: TDataSource
    DataSet = QCCTaller
    Left = 144
    Top = 392
  end
  object cobro: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'cobro'
    Left = 144
    Top = 208
  end
  object dscobro: TDataSource
    DataSet = cobro
    Left = 144
    Top = 272
  end
  object decrementarSaldoTaller: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'decrementarSaldoTaller'
    Parameters = <
      item
        Name = 'idtaller'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'saldo'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = Null
      end>
    Left = 944
    Top = 560
  end
  object incrementarSaldoTaller: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'incrementarSaldoTaller'
    Parameters = <
      item
        Name = 'idtaller'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'saldo'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = Null
      end>
    Left = 944
    Top = 616
  end
  object incrementarSaldoCliente: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'incrementarSaldoCliente'
    Parameters = <
      item
        Name = 'sumar'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 10
        Value = Null
      end
      item
        Name = 'idcliente'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1072
    Top = 624
  end
  object incrementarStockRemera: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'incrementarStockRemera'
    Parameters = <
      item
        Name = 't1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't3'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't4'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't5'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't6'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't7'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'remera'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1072
    Top = 552
  end
  object incrementarStockPantalon: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'incrementarStockPantalon'
    Parameters = <
      item
        Name = 't1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't3'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't4'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't5'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't6'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't7'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't8'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't9'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't10'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't11'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't12'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't13'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't14'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't15'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't16'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't17'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't18'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'pantalon'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1216
    Top = 528
  end
  object incrementarStockNino: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'incrementarStockNinos'
    Parameters = <
      item
        Name = 't1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't3'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't4'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't5'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't6'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'nino'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1344
    Top = 560
  end
  object incrementarStockCinturon: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'incrementarStockCinturon'
    Parameters = <
      item
        Name = 't1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't3'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't4'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't5'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'cinturon'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1488
    Top = 560
  end
  object QCobros: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cobro c inner join taller t'
      'on c.id_taller = t.id_taller')
    Left = 1056
    Top = 352
  end
  object dsQCobros: TDataSource
    DataSet = QCobros
    Left = 1128
    Top = 360
  end
  object modificarCliente: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'modificarCliente'
    Parameters = <
      item
        Name = 'tip'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'nom'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'doc'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'tel'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'dom'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'ciu'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'mail'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'cli'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1208
    Top = 640
  end
  object nuevoCliente: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'nuevoCliente'
    Parameters = <
      item
        Name = 'tip'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'nom'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'doc'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'tel'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'dom'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'ciu'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'mail'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end>
    Left = 1296
    Top = 656
  end
  object QreporteSaldoTalleres: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select t.id_taller, t.nombre_taller, sum(e.deuda) as total '
      'from corte c inner join taller t on c.id_taller = t.id_taller '
      'inner join corte_entrega e on e.id_corte = c.id_corte '
      'where e.deuda > 0 group by id_taller')
    Left = 1232
    Top = 216
  end
  object dsQreporteSaldoTalleres: TDataSource
    DataSet = QreporteSaldoTalleres
    Left = 1232
    Top = 288
  end
  object QreporteDeudaClientes: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select v.id_cliente, c.nombre_cli, sum(v.Subtotal) as total from' +
        ' venta v inner join cliente c on v.id_cliente = c.id_cliente'
      'where v.cc = 1 and v.deuda > 0 group by id_cliente')
    Left = 1408
    Top = 232
  end
  object dsQreporteDeudaClientes: TDataSource
    DataSet = QreporteDeudaClientes
    Left = 1408
    Top = 312
  end
  object qRemitoPago: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from cobro c inner join taller t on t.id_taller = c.id_' +
        'taller where id_cobro = 1')
    Left = 1528
    Top = 248
  end
  object dsqremitopago: TDataSource
    DataSet = qRemitoPago
    Left = 1520
    Top = 312
  end
  object modificarCorte: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'modificarCorte'
    Parameters = <
      item
        Name = 'prod'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'tall'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'cant'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'uni'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = Null
      end
      item
        Name = 'tot'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = Null
      end
      item
        Name = 'observa'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'costura'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'f'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 't'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'm'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'idcorte'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1456
    Top = 640
  end
  object QCCTaller2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select c.id_corte, c.num_corte, p.num_prod, c.costo_unidad, t.id' +
        '_taller,t.nombre_taller, p.id_prod,p.nombre_prod, e.id_corte_ent' +
        'rega,e.controlado_por, e.fecha, e.cantidad_entregada, e.cantidad' +
        '_fallada, e.pagar, e.deuda from corte c'
      'inner join taller t on c.id_taller = t.id_taller'
      'inner join corte_entrega e on c.id_corte = e.id_corte'
      'inner join producto p on p.id_prod = c.id_producto')
    Left = 80
    Top = 336
  end
  object dsqcctaller2: TDataSource
    DataSet = QCCTaller2
    Left = 80
    Top = 392
  end
  object corte_pendiente: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'corte_pend'
    Left = 1736
    Top = 56
  end
  object dscorte_pendiente: TDataSource
    DataSet = corte_pendiente
    Left = 1736
    Top = 144
  end
  object corte_color_capas: TADOTable
    Connection = ADOConnection1
    TableName = 'corte_color_capas'
    Left = 1832
    Top = 56
  end
  object dscorte_color_capas: TDataSource
    DataSet = corte_color_capas
    Left = 1848
    Top = 136
  end
  object talle_corte_pendiente_n: TADOTable
    Connection = ADOConnection1
    TableName = 'talle_corte_pendiente_n'
    Left = 1928
    Top = 24
  end
  object talle_corte_pendiente_p: TADOTable
    Connection = ADOConnection1
    TableName = 'talle_corte_pendiente_p'
    Left = 2016
    Top = 80
  end
  object talle_corte_pendiente_r: TADOTable
    Connection = ADOConnection1
    TableName = 'talle_corte_pendiente_r'
    Left = 2032
    Top = 136
  end
  object dstalle_corte_pendiente_n: TDataSource
    DataSet = talle_corte_pendiente_n
    Left = 1936
    Top = 200
  end
  object dstalle_corte_pendiente_p: TDataSource
    DataSet = talle_corte_pendiente_p
    Left = 1928
    Top = 272
  end
  object dstalle_corte_pendiente_r: TDataSource
    DataSet = talle_corte_pendiente_r
    Left = 1944
    Top = 360
  end
  object QCorte_pendiente: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select c.id_corte_pend, c.operador, c.fecha_corte_pendiente, c.c' +
        'onfeccion, n.id_producto as idn, n.4, n.6, n.8, n.10, n.12, n.14' +
        ','
      
        'p.id_producto as idp, p.26, p.28, p.30, p.32, p.34, p.36, p.38, ' +
        'p.40, p.42, p.44, p.46, p.48, p.50, p.52, p.54, p.56, p.58, p.60' +
        ','
      
        'r.id_producto as idr, r.xs, r.s, r.m, r.l, r.xl, r.xxl, r.xxl, r' +
        '.xxxl,'
      
        '(p.26 + p.28 + p.30 + p.32 + p.34 + p.36 + p.38 + p.40 + p.42 + ' +
        'p.44 + p.46 + p.48 + p.50 + p.52 + p.54 + p.56 + p.58 + p.60) as' +
        ' totalp,'
      
        '(r.xs + r.s + r.m + r.l + r.xl + r.xxl + r.xxl + r.xxxl) as tota' +
        'lr,'
      '(n.4 + n.6 + n.8 + n.10 + n.12 + n.14) as totaln'
      
        'from corte_pend c left join talle_corte_pendiente_n n on c.id_co' +
        'rte_pend=n.id_corte_pendiente'
      
        'left join talle_corte_pendiente_p p on c.id_corte_pend=p.id_cort' +
        'e_pendiente'
      
        ' left join talle_corte_pendiente_r r on c.id_corte_pend=r.id_cor' +
        'te_pendiente '
      'where c.confeccion=0'
      'order by c.id_corte_pend')
    Left = 1760
    Top = 248
  end
  object DSQCorte_pendiente: TDataSource
    DataSet = QCorte_pendiente
    Left = 1776
    Top = 336
  end
  object setSaldoTaller: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'setSaldoTaller'
    Parameters = <
      item
        Name = 'valor'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = Null
      end
      item
        Name = 'idtaller'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1392
    Top = 504
  end
  object setSaldoCliente: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'setSaldoCliente'
    Parameters = <
      item
        Name = 'idcliente'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'valor'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 7
        Value = Null
      end>
    Left = 1480
    Top = 504
  end
end
