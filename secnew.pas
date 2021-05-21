unit secnew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm6 = class(TForm)
    Edit1: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Button3: TButton;
    Label5: TLabel;
    Label4: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses main;

{$R *.dfm}

procedure TForm6.Button2Click(Sender: TObject);
begin
  Form6.Close;
end;


procedure TForm6.FormShow(Sender: TObject);
begin
  label4.Caption:=floattostr(TProgs(Btl.progs[0]).h/10);
end;

procedure TForm6.Button3Click(Sender: TObject);
var i:integer;
    cc:extended;
begin
  cc:=-1;
  if assigned(btl) then if assigned(btl.progs) then
  if TryStrToFloat(edit1.Text,cc) then
  begin
    if cc>0 then for i:=0 to Btl.progs.Count-1 do
      TProgs(Btl.progs[i]).newh(cc);
    showmessage('операции пересчитаны');
    Form6.Close;
  end;
end;

end.
