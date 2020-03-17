unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin,
  dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinValentine,
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxTextEdit, cxCurrencyEdit;

type
  EErroNumero = class(Exception);     //0
  EErroNumeroPositivo = class(EErroNumero);  //> 0
  EErroNumeroPar = class(EErroNumeroPositivo); // 2/0
  EErroNumeroNegativo = class(EErroNumero);  //<0


  TForm5 = class(TForm)
    btnValidar: TButton;
    edtNumero: TEdit;
    procedure btnValidarClick(Sender: TObject);
    procedure ValidarNumero;

  private
    { Private declarations }
  public
  function GetValor:Integer;
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.btnValidarClick(Sender: TObject);
begin
 ValidarNumero;
end;

function TForm5.GetValor: Integer;
var
  Valor: Integer;

begin
  Valor:= StrToInt(edtNumero.Text);
  try
    try
     if edtNumero.Text = '' then
     raise EErroNumero.Create('O campo não pode ser vazio');

     if ((Valor mod 2)= 0)  then
     raise EErroNumeroPar.Create('Numero par');

     if Valor <0 then
     raise EErroNumeroNegativo.Create('Numero Negativo');

     if Valor >0 then
     raise EErroNumeroPositivo.Create('Numero Positivo');

    except
      on E: EErroNumero do
        ShowMessage(E.Message);

      on E: EErroNumeroPar do
      ShowMessage(E.Message);

      on E: EErroNumeroNegativo do
        ShowMessage(E.Message);

      on E: EErroNumeroPositivo do
        ShowMessage(E.Message);
    end;

  finally

  end;
end;

procedure TForm5.ValidarNumero;

begin
 GetValor;
end;

end.
