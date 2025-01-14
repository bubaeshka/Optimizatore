unit addlong;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses main;

{$R *.dfm}

procedure TForm4.Button2Click(Sender: TObject);
begin
  Form4.Close;
end;

procedure TForm4.Button1Click(Sender: TObject);
var add:integer;
    f:textfile;
begin
  assignfile(f,'optilong.txt');
  if TryStrToInt(edit1.Text,add) then
    if FileExists('optilong.txt') then begin
      append(f);
      writeln(f,IntToStr(add));
      closefile(f);
      Form4.Close;
      Form1.readlong;
    end else begin
      rewrite(f);
      writeln(f,IntToStr(add));
      closefile(f);
      Form4.Close;
      Form1.readlong;
    end;
end;

end.
