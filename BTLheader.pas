unit BTLheader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses main;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  if (assigned(Btl)) and (assigned(Btl.header)) then begin
    Memo1.Clear;
    Memo1.Lines:=Btl.header;
  end else begin
    ShowMessage('ошибка открытия файла');
    Form3.Close;
  end;
end;

end.
