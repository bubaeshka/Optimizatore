unit saveX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses main;

{$R *.dfm}

procedure TForm5.Button2Click(Sender: TObject);
begin
  Form5.Close;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  if assigned(Btl) then if assigned(btl.progs) then if btl.progs.Count>0 then
    Button1.Enabled:=true else Button1.Enabled:=false;
end;

procedure TForm5.Button1Click(Sender: TObject);
var code:integer;
begin
  if TryStrToInt(edit1.Text,code) then
    if savedialog1.Execute then
      btl.writeXprog(code,savedialog1.FileName);
end;

end.
