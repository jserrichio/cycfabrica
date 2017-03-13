unit reporteAvio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, pngimage, QuickRpt, ExtCtrls;

type
  TfreporteAvio = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText19: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  freporteAvio: TfreporteAvio;

implementation

uses datamodule;

{$R *.dfm}

end.
