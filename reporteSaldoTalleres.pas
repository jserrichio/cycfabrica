unit reporteSaldoTalleres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, pngimage, QuickRpt, ExtCtrls;

type
  TfReporteSaldoTalleres = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText16: TQRDBText;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReporteSaldoTalleres: TfReporteSaldoTalleres;

implementation

uses datamodule;

{$R *.dfm}

end.
