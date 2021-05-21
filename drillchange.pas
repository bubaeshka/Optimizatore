unit drillchange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm9 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses main;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
var i,nd,pr_count:integer;
begin
  if assigned(Btl) then if assigned(Btl.progs) then
   if Btl.progs.Count>0 then if TryStrToInt(edit1.Text,nd) then begin
     pr_count:=0;
     for i:=0 to Btl.progs.Count-1 do begin
       if TProgs(Btl.progs[i]).reducedrill(nd) then inc(pr_count);
     end;
     Label5.Caption:=inttostr(pr_count);
  end;
end;

end.
