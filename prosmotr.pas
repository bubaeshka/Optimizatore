unit prosmotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button1: TButton;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    Edit2: TEdit;
    Label14: TLabel;
    Button2: TButton;
    Memo2: TMemo;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Button4: TButton;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pokazat(x:integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure viewop(z:integer);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  index:integer;
  index2:integer;

implementation

uses main, secnew;

{$R *.dfm}

procedure TForm2.pokazat(x:integer);
begin
    Memo1.Clear;
    Memo1.Lines:=(Btl.progs[x-1] as Tprogs).data;
    Label6.Caption:=inttostr((Btl.progs[x-1] as Tprogs).idf);
    Label7.Caption:=inttostr((Btl.progs[x-1] as Tprogs).col);
    Label8.Caption:=inttostr((Btl.progs[x-1] as Tprogs).idprv);
    Label9.Caption:=(Btl.progs[x-1] as Tprogs).comment;
    Label11.Caption:=(Btl.progs[x-1] as Tprogs).idcnststr;
    Label13.Caption:=floattostr((Btl.progs[x-1] as Tprogs).long/10);
    label21.Caption:=floattostr((Btl.progs[x-1] as Tprogs).h/10);
    if TProgs(Btl.progs[x-1]).obrs.Count>0 then begin
      BitBtn3.Enabled:=true;
      index2:=0;
      Edit2.Text:=inttostr(index2);
      if index>0 then viewop(index2);
    end;
end;

procedure TForm2.viewop(z:integer);
var j:integer;
    sx:string;
begin
  if assigned(TProgs(Btl.progs[index-1]).obrs) then
    if TProgs(Btl.progs[index-1]).obrs.Count>0 then begin
      Memo2.Clear;
      label16.Caption:=inttostr(Tobrs(TProgs(Btl.progs[index-1]).obrs[z]).opgr)
      +'/'+inttostr(Tobrs(TProgs(Btl.progs[index-1]).obrs[z]).opkey);
      label18.Caption:=inttostr(Tobrs(TProgs(Btl.progs[index-1]).obrs[z]).side);
      sx:='';
      for j:=1 to 21 do begin
        if Tobrs(TProgs(Btl.progs[index-1]).obrs[z]).p[j]>=0 then
         sx:=sx+' P'+inttostr(j)+':'+
         inttostr(Tobrs(TProgs(Btl.progs[index-1]).obrs[z]).p[j])+' ';
      end;
      label19.Caption:=sx;
      Memo2.Lines:=Tobrs(TProgs(Btl.progs[index-1]).obrs[z]).data;
      Edit2.Text:=inttostr(z);
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
var z:integer;
begin
  z:=0;   //инициализация несуществующего элемента
  if edit1.Text<>'' then z:=strtoint(edit1.Text);
  if (z>0) and (assigned(Btl)) and (assigned(Btl.progs)) and (z<=(Btl.progs.Count))
  then begin
    pokazat(z);
    index:=z;
    viewop(0);
  end else ShowMessage('неверный номер программы или ошибка программы');
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  if (assigned(Btl)) and (assigned(Btl.progs)) then
  if index=-1 then begin
    index:=1;
    pokazat(index);
    index:=1;
    BitBtn1.Enabled:=false;
  end else if index>0 then begin
    index:=index-1;
    pokazat(index);
    if index=1 then BitBtn1.Enabled:=false;
    if index<Btl.progs.Count+1 then BitBtn2.Enabled:=true;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  index:=-1;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  if (assigned(Btl)) and (assigned(Btl.progs)) then
  if index=-1 then begin
    index:=1;
    pokazat(index);
    BitBtn1.Enabled:=false;
  end else if index<Btl.progs.Count+1 then begin
    index:=index+1;
    pokazat(index);
    if index=Btl.progs.Count then BitBtn2.Enabled:=false;
    if index>1 then BitBtn1.Enabled:=true;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var oprind:integer;
begin
  if TryStrToInt(edit2.Text,oprind) then begin
    viewop(oprind);
  end else showmessage('Неверный номер операции');
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Form6.Show;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  if (TProgs(Btl.progs[index-1]).obrs.Count-1)>index2 then begin
    index2:=index2+1;
    Form2.viewop(index2);
  end;
  if index2>0 then BitBtn4.Enabled:=true;
  if (TProgs(Btl.progs[index-1]).obrs.Count-1)=index2 then BitBtn3.Enabled:=false;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
  if index2>0 then begin
    index2:=index2-1;
    Form2.viewop(index2);
  end;
  if index2=0 then BitBtn4.Enabled:=false;
  if (TProgs(Btl.progs[index-1]).obrs.Count-1)>index2 then BitBtn3.Enabled:=true;
end;

end.
