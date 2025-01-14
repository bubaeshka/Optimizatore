unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Contnrs, Menus, StdCtrls, ComCtrls, Math, ExtCtrls, Grids,
  ValEdit, Buttons, commctrl;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    N4: TMenuItem;
    N5: TMenuItem;
    BTL1: TMenuItem;
    CadWork1: TMenuItem;
    OpenDialog2: TOpenDialog;
    N6: TMenuItem;
    ListView1: TListView;
    SaveDialog1: TSaveDialog;
    N7: TMenuItem;
    N8: TMenuItem;
    Button3: TButton;
    Edit3: TEdit;
    Label5: TLabel;
    Memo1: TMemo;
    N9: TMenuItem;
    ListView2: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    N10: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    Button4: TButton;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    CheckBox1: TCheckBox;
    N29: TMenuItem;
    N30: TMenuItem;
    SaveDialog2: TSaveDialog;
    procedure N3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BTL1Click(Sender: TObject);
    procedure CadWork1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure listprog;
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure readlong;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N10Click(Sender: TObject);
    procedure ListView2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure perestavka(cases:byte;polubrus:boolean);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Tprogs = class        //����� ����������� ��������� �������
    idf:integer;        //�� - ���������� ����� ��������� �� �����
    col:integer;        //���������� ������� � ���������
    idprv:integer;      //����� ������������
    long:integer;       //������ �������
    zg:integer;         //����� ���������            
    comment:string;     //����������� �� ���������
    idcnststr:string;   //������ ������ � ������ � ����� ������������
    data:TStringList;   //����� ���������
    optilong:integer;   //������ ���������
    h:integer;          //������ �����
    sh:integer;         //������ �����
    sorted:boolean;     //������� ����������������� ��������
    obrs:TObjectList;   //������ ���������
    procedure newh(nn:extended); //����� ����� ������ �����
    procedure reprog;   //��������� ����� ��������� ������� ��� �� ���������
    //������������ ������� ����� ����� ������� ���, ����� ����
    procedure perestanovka;
    //������������ ������� ����� ����� �������
    function perestanovkaCadWork(aaax:byte;bbbx:boolean):integer;
    //������ ������� ����������� � 1 �� 3
    procedure changesidecut;
    //��������� ������� ���� ��������� �� �������� ���������
    function reducedrill(newdepth:integer):boolean;
    //������� �������� ������, ���������� ���������� �������� ��������
    function removebadcut:integer;

  end;

  Tobrs = class //������� ��������� � ���������
    data:TStringList; //������ ��������
    opkey:integer;    //��� ��������
    side:integer;     //������� ��������
    opgr:integer;     //������ ��������
    p:array[1..21] of integer; //������ ����������
    //��������� ���������� ���� �������� � ����������� �� ��������� ����������
    procedure newparam;
    //��������� ���������� ���� ���� �������� ���� �� ���������
    procedure newopparam;
  end;

  TBtl = class          //����� ������������ btl �����
    header:TStringList; //��������� ������������ btl �����
    progs:TObjectList;  //������ �������� ������������ btl �����
    //����������� ������ ���� � ������ ������� ������ � ������������ ������
    constructor Create(filename:TFileName);  //��� ������������ btl �����
    //������� ������ ���� ������������ � ���������� ������ ������ � ������
    function attachCADWorkSpec(filename:TFileName):boolean;
    //��������� ������������� ��������� �� ������� ������ ��� ������ ������
    //����� ��������, �� ���� ������� - ���� ���������
    procedure prepare;
    //������ ��������� �����
    procedure writeprog(filename:TFileName);
    //��������� �����������
    //��������� ��������� ������� BTl �����
    procedure nprz(venci:integer);
    //���������� ��������� �����������
    procedure optimize(a:TObjectList;rez:integer);
    //��������� ���������� ����������
    procedure writeXprog(ax:integer;filename:TFileName);
    //��������� ������� �����, ����������� ������������ ��� ���������� �����. 
    procedure load(filename:TFileName);
  end;

  //����� ��������� �����������
  Topt = class
    id:integer;
    long:integer;
    idbrev:integer;
    ostatok:integer;
    optilong:integer;
  end;

  //����� ��������� �����������
  Tolong = class
    l:integer;        //������� ������
    col:integer;      //������� ��������� ���������
    opticol:integer;  //������� ����������� ���������
  end;

  //����� ��������� �����������
  TKart = class
    ostatok:integer;    //�������
    optilong:integer;   //������ ��������� ��� �������� �������
    inl:TObjectList;    //������� ������ �������
    oul:TObjectList;    //�������� ������ �������
  end;

var
  Form1: TForm1;
  Btl:TBtl;
  Sub:integer;
  Item:TListItem;

implementation

uses prosmotr, BTLheader, addlong, saveX, secnew, help, print, drillchange;

{$R *.dfm}

/////////////TProgs/////////////////////////////////////////////
////��������� ������� ���� ��������� �� �������� ���������
function Tprogs.reducedrill(newdepth:integer):boolean;
var recalc,recalcop,recalcopp:boolean;
    i:integer;
begin
  Result:=false;
  //��������� ���� �� ������ �������� � ���� �� ��������
  if assigned(obrs) then if obrs.Count>0 then begin
    //���� �� ���� �������� �����������
    recalc:=false;
    //��������� ��� ��������
    for i:=0 to obrs.Count-1 do begin
      //�������� �� ���������������
      recalcop:=false;
      recalcopp:=false;
      //���������, drilling �� ������� 3 ��� ������� 1, � ������ 90�
      //� �������� ����� newdepth
      if (Tobrs(obrs[i]).opkey=40) and ((Tobrs(obrs[i]).opgr=3) or
      (Tobrs(obrs[i]).opgr=4)) and (Tobrs(obrs[i]).p[3]=0) and
      (Tobrs(obrs[i]).p[6]=900) and (Tobrs(obrs[i]).p[7]=900) and
      ((Tobrs(obrs[i]).side=3) or (Tobrs(obrs[i]).side=1)) and
      (Tobrs(obrs[i]).p[11]>(newdepth*10)) then begin
         Tobrs(obrs[i]).p[11]:=newdepth*10;
         //���� ������� ��������� 1, �� ������ � �� 3
         if Tobrs(obrs[i]).side=1 then begin
           Tobrs(obrs[i]).side:=3;
           recalcopp:=true;
         end;
         recalcop:=true;
      end;
      if recalcop then begin recalc:=true; Tobrs(obrs[i]).newparam; end;
      if recalcopp then begin recalc:=true; Tobrs(obrs[i]).newopparam; end;
    end;
    if recalc then begin Result:=true; reprog; end;
  end;
end;

/////////////////������ ������//////////////////////////////////
function TProgs.removebadcut:integer;
var recalc,recalcop:boolean;
    i:integer;
begin
  /////////////////////////////////
  Result:=0;
  //��������� ���� �� ������ �������� � ���� �� ��������
  if assigned(obrs) then if obrs.Count>0 then begin
    //���� �� ���� �������� �����������
    recalc:=false;
    //��������� ��� ��������
    i:=0;
    repeat
      //�������� �� ���������������
      recalcop:=false;
      //���������, drilling �� ������� 3 ��� ������� 1, � ������ 90�
      //� �������� ����� newdepth
      if (Tobrs(obrs[i]).opkey=16) and ((Tobrs(obrs[i]).opgr=4) or
      (Tobrs(obrs[i]).side=3) or (Tobrs(obrs[i]).side=1)) then begin
         obrs.Delete(i);
         Result:=Result+1;
         recalcop:=true;
      end;
      if recalcop then recalc:=true;
      if not recalcop then inc(i);
    until i>(obrs.Count-1);
    if recalc then reprog;
  end;

end;

////////////////////////////////////////////////////////////////

procedure Tprogs.newh(nn:extended);
var old_h,i,j,hdx,nh:integer;
    s,s1,s2:string;
    recalc,recalcall:boolean;
begin
  nh:=round(nn*10);
  old_h:=h; //���������� ������ ������
  //���������� ���������� ������
  hdx:=nh-h;
  //�������� ������� � ��������� ���������-������� � � ������ ���������
  h:=nh;
  for i:=0 to data.Count-1 do begin
    s:=data.Strings[i];
    if pos('BP',s)=1 then
      if pos('P02',s)<>0 then begin
        s2:=copy(s,pos('P02',s),12);
        s1:=inttostr(nh);
        if length(s1)<8 then for j:=length(s1) to 7 do s1:='0'+s1;
        s1:='P02:'+s1;
        s:=StringReplace(s,s2,s1,[]);
        data.Strings[i]:=s;
        break;
      end;
  end;
  //�������� ��������
  //���� �� ���� �������� �� ����������
  recalcall:=false;
  //���������� ��� ��������
  for i:=0 to obrs.Count-1 do begin
    //�������� �� �����������
    recalc:=false;
    //////////������ ������� �������� ���������////////////////////////
    //���������, drilling �� ������� 3 ��� ������� 1, � ������ 90�
    if (Tobrs(obrs[i]).opkey=40) and ((Tobrs(obrs[i]).opgr=3) or
      (Tobrs(obrs[i]).opgr=4)) and (Tobrs(obrs[i]).p[3]=0) and
      (Tobrs(obrs[i]).p[6]=900) and (Tobrs(obrs[i]).p[7]=900) and
      ((Tobrs(obrs[i]).side=3) or (Tobrs(obrs[i]).side=1)) then begin
        //�������� �����������
        recalc:=true;
        //����������� ������� ��������� �� hdx
        Tobrs(obrs[i]).p[11]:=Tobrs(obrs[i]).p[11]+hdx;
    end;
    //������ � ���������, Lap Joint, ������ ������ �� �������� 2 � 4, ���� 7=90�
    if (Tobrs(obrs[i]).opkey=30) and ((Tobrs(obrs[i]).opgr=3) or
      (Tobrs(obrs[i]).opgr=4)) and (Tobrs(obrs[i]).p[7]=900) and
      ((Tobrs(obrs[i]).side=2) or (Tobrs(obrs[i]).side=4)) then begin
        //�������� �����������
        recalc:=true;
        //����������� ������� ������� �� hdx
        Tobrs(obrs[i]).p[14]:=Tobrs(obrs[i]).p[14]+hdx;
    end;
    //������ � ���������, Lap Joint, ������ ������ �� ������� 3, ���� 90�
    if (Tobrs(obrs[i]).opkey=30) and ((Tobrs(obrs[i]).opgr=3) or
      (Tobrs(obrs[i]).opgr=4)) and
      (Tobrs(obrs[i]).p[6]=900) and (Tobrs(obrs[i]).p[7]=900) and
      (Tobrs(obrs[i]).side=3) then begin
        //�������� �����������
        recalc:=true;
        //����������� ������� ������ ��� ����. ����� � ��. �������. �� hdx
        Tobrs(obrs[i]).p[11]:=Tobrs(obrs[i]).p[11]+hdx;
    end;
  {  //������ � ���������, Lap Joint, ������ ������ �� ������� 1, ���� 90�
    if (Tobrs(obrs[i]).opkey=30) and ((Tobrs(obrs[i]).opgr=3) or
      (Tobrs(obrs[i]).opgr=4)) and
      (Tobrs(obrs[i]).p[6]=900) and (Tobrs(obrs[i]).p[7]=900) and
      (Tobrs(obrs[i]).side=1) then begin
        //�������� �����������
        recalc:=true;
        //����������� ������� ������ ��� ����. ����� � ��. �������. �� hdx
        Tobrs(obrs[i]).p[11]:=Tobrs(obrs[i]).p[11]+hdx;
    end;   }
    //������� ����� �����, Seathing Cut, �� ������� 3
    if (Tobrs(obrs[i]).opkey=34) and ((Tobrs(obrs[i]).opgr=3) or
      (Tobrs(obrs[i]).opgr=4)) and (Tobrs(obrs[i]).side=3) then begin
        //�������� �����������
        recalc:=true;
        //����������� ������� ������ ��� ����. ����� � ��. �������. �� hdx
        Tobrs(obrs[i]).p[11]:=Tobrs(obrs[i]).p[11]+hdx;
    end;
    //��������� ����� ������, Mortise Front, ���� p7 � p8 90�, ������� 3
    if (Tobrs(obrs[i]).opkey=51) and ((Tobrs(obrs[i]).opgr=3) or
      (Tobrs(obrs[i]).opgr=4)) and (Tobrs(obrs[i]).p[3]=0) and
      (Tobrs(obrs[i]).p[7]=900) and
      (Tobrs(obrs[i]).p[8]=900) and (Tobrs(obrs[i]).side=3) then begin
        //�������� �����������
        recalc:=true;
        //����������� ������� ������� �� hdx
        Tobrs(obrs[i]).p[14]:=Tobrs(obrs[i]).p[14]+hdx;
    end;
    //��������� ����� ������, Mortise Front, ���� �8 90�, ������� 2,4
    if (Tobrs(obrs[i]).opkey=51) and ((Tobrs(obrs[i]).opgr=3) or
      (Tobrs(obrs[i]).opgr=4)) and (Tobrs(obrs[i]).p[3]=0) and
      (Tobrs(obrs[i]).p[6]=0) and (Tobrs(obrs[i]).p[7]=0) and
      (Tobrs(obrs[i]).p[8]=900) and
      ((Tobrs(obrs[i]).side=2) or (Tobrs(obrs[i]).side=4)) then begin
        //�������� �����������
        recalc:=true;
        //����������� ������� ������� �� hdx
        //���� ���� �08 �� ���������
        if Tobrs(obrs[i]).p[21]<>8 then 
        Tobrs(obrs[i]).p[14]:=Tobrs(obrs[i]).p[14]+hdx;
    end;   
    //�������� ���, Front Slot ��� ���� 90�, ������� 1 ��� 3
    if (Tobrs(obrs[i]).opkey=17) and ((Tobrs(obrs[i]).opgr=3) or
      (Tobrs(obrs[i]).opgr=4)) and
      (Tobrs(obrs[i]).p[6]=900) and (Tobrs(obrs[i]).p[7]=900) and
      (Tobrs(obrs[i]).p[8]=900) and
      ((Tobrs(obrs[i]).side=1) or (Tobrs(obrs[i]).side=3)) then begin
        //�������� �����������
        recalc:=true;
        //����������� ������� ������� �� hdx
        Tobrs(obrs[i]).p[12]:=Tobrs(obrs[i]).p[12]+hdx;
        //������� ������� ����� �� hdx/2
        Tobrs(obrs[i]).p[3]:=Tobrs(obrs[i]).p[3]+(hdx div 2);
    end;
    //���/�����, Notch/Rabbet, ����� �� �����, ������� 4 ��� 2
    if (Tobrs(obrs[i]).opkey=32) and                            //��������
      ((Tobrs(obrs[i]).opgr=3) or (Tobrs(obrs[i]).opgr=4)) and  //������ ��������
      (Tobrs(obrs[i]).side=2) then begin  //�������
        //�������� �����������
        recalc:=true;
        //������� ������� ����� �� +hdx
        Tobrs(obrs[i]).p[2]:=Tobrs(obrs[i]).p[2]+hdx;
    end;
    //��������� "���������"
    //��������� "���������" ����� ������
    if (TObrs(obrs[i]).opkey=10) and
         ((TObrs(obrs[i]).opgr=1) or (TObrs(obrs[i]).opgr=2)) and
         (TObrs(obrs[i]).side=1) and (TObrs(obrs[i]).p[7]<>900) and
         (abs( TObrs(obrs[i]).p[1] -
         Round(long-(old_h*tan(((Tobrs(obrs[i]).p[7]-900)/10)*(PI/180))))
         )<=9)
         then begin
           recalc:=true;
           TObrs(obrs[i]).side:=2;
           TObrs(obrs[i]).p[1]:=long;
           TObrs(obrs[i]).p[6]:=1800-TObrs(obrs[i]).p[7];
           TObrs(obrs[i]).p[7]:=900;
           TObrs(obrs[i]).newopparam;
    end;
    //��������� "���������"
    //��������� "���������" ������ ������
    if (TObrs(obrs[i]).opkey=10) and
         ((TObrs(obrs[i]).opgr=1) or (TObrs(obrs[i]).opgr=2)) and
         (TObrs(obrs[i]).side=1) and (TObrs(obrs[i]).p[7]<>900) and
         (abs( TObrs(obrs[i]).p[1] -
         Round(old_h*tan(((Tobrs(obrs[i]).p[7]-900)/10)*(PI/180)))
         )<=9)
         then begin
           recalc:=true;
           TObrs(obrs[i]).side:=2;
           TObrs(obrs[i]).p[1]:=0;
           TObrs(obrs[i]).p[6]:=1800-TObrs(obrs[i]).p[7];
           TObrs(obrs[i]).p[7]:=900;
           TObrs(obrs[i]).newopparam;
    end;
    ///////////����� ������� ���������/////////////////////////////////
    //���� �������� ���� ����������� ��������� �����-��� ��������
    if recalc then begin recalcall:=true; Tobrs(obrs[i]).newparam; end;
  end;
  if recalcall then reprog;
end;

//��������������� ������� ������ TProgs ��������� changesidecut
function sortList8(p1,p2:pointer):integer; //��������� ������� optimize
begin
  //���������� �� �����������
  Result:=sign(TObrs(p1).p[1]-TObrs(p2).p[1]);
end;

//������ ������� ����������� � 1 �� 3
procedure TProgs.changesidecut;
var recalcop,recalcall,recalc:boolean;
    i:integer;
begin
  //��������� ���� �� ������ �������� � ���� �� ��������
  if assigned(obrs) then if obrs.Count>0 then begin
    //��������� ��� ��������
    for i:=0 to obrs.Count-1 do begin
      //�������� �� ���������������
      recalcop:=false;
      recalc:=false;
      //�������� ��� ������ ������� 1 �� ������� 3
      if (TObrs(obrs[i]).opkey=17) and
         ((TObrs(obrs[i]).opgr=3) or (TObrs(obrs[i]).opgr=4)) and
         (TObrs(obrs[i]).side=1) then begin
           //�������� �����������
           recalcop:=true;
           TObrs(obrs[i]).side:=3;
      end;
      //������ � ���������, Lap Joint ����������� �� ���������� �������� ���������
      //������ 4, � ������� �����, ������� 2 � 4
      if (TObrs(obrs[i]).opkey=30) and (TObrs(obrs[i]).opgr=4) and
         ((TObrs(obrs[i]).side=2) or (TObrs(obrs[i]).side=4)) and
         (TObrs(obrs[i]).p[6]=900) and (TObrs(obrs[i]).p[7]=900) and
         (TObrs(obrs[i]).p[14]=h) and
         (TObrs(obrs[i]).p[1]+TObrs(obrs[i]).p[12]=long) then begin
           recalc:=true;
           TObrs(obrs[i]).p[12]:=TObrs(obrs[i]).p[12]-1;
      end;
      //������ � ���������, Lap Joint ����������� �� ���������� �������� ���������
      //������ 4, � ��������� �����, ������� 2 � 4
      if (TObrs(obrs[i]).opkey=30) and (TObrs(obrs[i]).opgr=4) and
         ((TObrs(obrs[i]).side=2) or (TObrs(obrs[i]).side=4)) and
         (TObrs(obrs[i]).p[6]=900) and (TObrs(obrs[i]).p[7]=900) and
         (TObrs(obrs[i]).p[14]=h) and
         (TObrs(obrs[i]).p[1]=0) then begin
           recalc:=true;
           TObrs(obrs[i]).p[1]:=TObrs(obrs[i]).p[1]+1;
      end;
      //������ � ���������, Lap Joint ����������� �� ���������� �������� ���������
      //������ 4, � ������� �����, ������� 1 � 3
      if (TObrs(obrs[i]).opkey=30) and (TObrs(obrs[i]).opgr=4) and
         ((TObrs(obrs[i]).side=1) or (TObrs(obrs[i]).side=3)) and
         (TObrs(obrs[i]).p[6]=900) and (TObrs(obrs[i]).p[7]=900) and
         (TObrs(obrs[i]).p[14]=sh) and
         (TObrs(obrs[i]).p[1]+TObrs(obrs[i]).p[12]=long) then begin
           recalc:=true;
           TObrs(obrs[i]).p[12]:=TObrs(obrs[i]).p[12]-1;
      end;
      //������ � ���������, Lap Joint ����������� �� ���������� �������� ���������
      //������ 4, � ��������� �����, ������� 1 � 3
      if (TObrs(obrs[i]).opkey=30) and (TObrs(obrs[i]).opgr=4) and
         ((TObrs(obrs[i]).side=1) or (TObrs(obrs[i]).side=3)) and
         (TObrs(obrs[i]).p[6]=900) and (TObrs(obrs[i]).p[7]=900) and
         (TObrs(obrs[i]).p[14]=sh) and
         (TObrs(obrs[i]).p[1]=0) then begin
           recalc:=true;
           TObrs(obrs[i]).p[1]:=TObrs(obrs[i]).p[1]+1;
      end;
      //������ � ���������, Lap Joint ����������� �� ���������� �������� ���������
      //*������ 3, � ������� �����, ������� 2 � 4
      if (TObrs(obrs[i]).opkey=30) and (TObrs(obrs[i]).opgr=3) and
         ((TObrs(obrs[i]).side=2) or (TObrs(obrs[i]).side=4)) and
         (TObrs(obrs[i]).p[6]=900) and (TObrs(obrs[i]).p[7]=900) and
         (TObrs(obrs[i]).p[14]=h) and
         (TObrs(obrs[i]).p[1]=TObrs(obrs[i]).p[12]) then begin
           recalc:=true;
           TObrs(obrs[i]).p[12]:=TObrs(obrs[i]).p[12]-1;
      end;
      //������ � ���������, Lap Joint ����������� �� ���������� �������� ���������
      //*������ 3, � ��������� �����, ������� 2 � 4
      if (TObrs(obrs[i]).opkey=30) and (TObrs(obrs[i]).opgr=3) and
         ((TObrs(obrs[i]).side=2) or (TObrs(obrs[i]).side=4)) and
         (TObrs(obrs[i]).p[6]=900) and (TObrs(obrs[i]).p[7]=900) and
         (TObrs(obrs[i]).p[14]=h) and
         (TObrs(obrs[i]).p[1]=long) then begin
           recalc:=true;
           TObrs(obrs[i]).p[1]:=TObrs(obrs[i]).p[1]-1;
           TObrs(obrs[i]).p[12]:=TObrs(obrs[i]).p[12]-1;
      end;
      //������ � ���������, Lap Joint ����������� �� ���������� �������� ���������
      //*������ 3, � ������� �����, ������� 1 � 3
      if (TObrs(obrs[i]).opkey=30) and (TObrs(obrs[i]).opgr=3) and
         ((TObrs(obrs[i]).side=1) or (TObrs(obrs[i]).side=3)) and
         (TObrs(obrs[i]).p[6]=900) and (TObrs(obrs[i]).p[7]=900) and
         (TObrs(obrs[i]).p[14]=sh) and
         (TObrs(obrs[i]).p[1]=TObrs(obrs[i]).p[12]) then begin
           recalc:=true;
           TObrs(obrs[i]).p[12]:=TObrs(obrs[i]).p[12]-1;
      end;
      //������ � ���������, Lap Joint ����������� �� ���������� �������� ���������
      //*������ 3, � ��������� �����, ������� 1 � 3
      if (TObrs(obrs[i]).opkey=30) and (TObrs(obrs[i]).opgr=3) and
         ((TObrs(obrs[i]).side=1) or (TObrs(obrs[i]).side=3)) and
         (TObrs(obrs[i]).p[6]=900) and (TObrs(obrs[i]).p[7]=900) and
         (TObrs(obrs[i]).p[14]=sh) and
         (TObrs(obrs[i]).p[1]=long) then begin
           recalc:=true;
           TObrs(obrs[i]).p[1]:=TObrs(obrs[i]).p[1]-1;
           TObrs(obrs[i]).p[12]:=TObrs(obrs[i]).p[12]-1;
      end;
      //������ � ��������� ��� �����, Lap Joint � ��������� �����, ������� 2 � 4
      //������ 3, ����������� �� ���������� �������� ���������
      if (TObrs(obrs[i]).opkey=30) and (TObrs(obrs[i]).opgr=3) and
         ((TObrs(obrs[i]).side=2) or (TObrs(obrs[i]).side=4)) and
         (TObrs(obrs[i]).p[6]<>900) and (TObrs(obrs[i]).p[7]=900) and
         (TObrs(obrs[i]).p[14]=h) and
         ((TObrs(obrs[i]).p[1]/10)<=
         SimpleRoundTo(
         ((TObrs(obrs[i]).p[12]/10))/
         (sin((180-(TObrs(obrs[i]).p[6]/10))*(PI/180))),-1))
          then begin
           recalc:=true;
           TObrs(obrs[i]).p[12]:=Round((TObrs(obrs[i]).p[1]-1)*
           sin((180-(TObrs(obrs[i]).p[6]/10))*(PI/180)));
      end;
      //�������� ���������������
      if recalcop then  TObrs(obrs[i]).newopparam;
      if recalc then TObrs(obrs[i]).newparam;
    end;
    //���� �� ���� �������� ���������������
    obrs.Sort(sortlist8);
    //������������� ������� ����������������� ��������
    sorted:=true;
    reprog;
  end;
end;


//���������� ������ �������� ��������� ��� ��������� ������ ��������
procedure TProgs.reprog;
var i,j:integer;
    temps:TStringList;
begin
  temps:=TStringList.Create;
  for i:=0 to data.Count-1 do
    if pos('KS',data.Strings[i])<>1 then begin
      if pos('BT',data.Strings[i])=1 then temps.Add('BT '+inttostr(idf)) else
        if pos('BN',data.Strings[i])=1 then temps.Add('BN '+comment) else
          temps.Add(data.Strings[i])
    end else break;
  for i:=0 to obrs.Count-1 do
    for j:=0 to Tobrs(obrs[i]).data.Count-1 do
      temps.Add(Tobrs(obrs[i]).data.Strings[j]);
  data.Clear;
  for i:=0 to temps.Count-1 do data.Add(temps.Strings[i]);
  temps.Free;    
end;

procedure Tprogs.perestanovka;
var i:integer;
begin
  //���� �������� ����������
  if assigned(obrs) then begin
    for i:=0 to obrs.Count-1 do begin
      //���� ����� �������� 30, ������ 3 ��� 4, � ������� �������� 1 ��� 3
      if (TObrs(obrs[i]).opkey=30) and
      ((TObrs(obrs[i]).opgr=3) or (TObrs(obrs[i]).opgr=4)) and
      ((TObrs(obrs[i]).side=3) or (TObrs(obrs[i]).side=1)) then
        //��������� ��������� �������� ���� ��� ����
        if (i+1)<(obrs.Count-1) then
          if (TObrs(obrs[i+1]).opkey=30) and
          ((TObrs(obrs[i+1]).opgr=3) or (TObrs(obrs[i+1]).opgr=4)) and
          ((TObrs(obrs[i+1]).side=3) or (TObrs(obrs[i+1]).side=1)) then
            //��������� ������, ������ ������� ������
            if (i+2)<(obrs.Count-1) then
              if (TObrs(obrs[i+2]).opkey=30) and
              ((TObrs(obrs[i+2]).opgr=3) or (TObrs(obrs[i+2]).opgr=4)) and
              ((TObrs(obrs[i+2]).side=2) or (TObrs(obrs[i+2]).side=4)) then
                if (i+3)<(obrs.Count-1) then
                  if (TObrs(obrs[i+3]).opkey=30) and
                  ((TObrs(obrs[i+3]).opgr=3) or (TObrs(obrs[i+3]).opgr=4)) and
                  ((TObrs(obrs[i+3]).side=2) or (TObrs(obrs[i+3]).side=4)) then
                    //��������� ������� �������� �����
                    begin
                      obrs.Exchange(i,i+2);
                      obrs.Exchange(i+1,i+3);
                      reprog;
                      //break;
                    end;

    end;
  end;
end;

function TProgs.perestanovkaCadWork(aaax:byte;bbbx:boolean):integer;
var i,j,k,excl:integer;
    findch,half:boolean;
begin
  if assigned(obrs) then begin //�������� ������������� �������� � ���������
    Result:=0;
    i:=-1;
//    for i:=0 to obrs.Count-1 do begin //���������� ��������
    while i<(obrs.Count-1) do begin
      i:=i+1;
      findch:=false;
      //���� ����� �������� 30, ������ 3 ��� 4
      if (TObrs(obrs[i]).opkey=30) and
      ((TObrs(obrs[i]).opgr=3) or (TObrs(obrs[i]).opgr=4)) then
        //��������� ��������� �������� ���� ��� ����
        if (i+1)<(obrs.Count-1) then
          if (TObrs(obrs[i+1]).opkey=30) and
          ((TObrs(obrs[i+1]).opgr=3) or (TObrs(obrs[i+1]).opgr=4)) then
            //��������� ������
            if (i+2)<(obrs.Count-1) then
              if (TObrs(obrs[i+2]).opkey=30) and
              ((TObrs(obrs[i+2]).opgr=3) or (TObrs(obrs[i+2]).opgr=4)) then
                if not bbbx then begin
                  if ((i+3)<(obrs.Count-1)) then
                    if (TObrs(obrs[i+3]).opkey=30) and
                      ((TObrs(obrs[i+3]).opgr=3) or (TObrs(obrs[i+3]).opgr=4)) then
                       //����� �������
                       findch:=true;
                  end else findch:=true;
      if findch then
            //�������������� ������� ���� ����� ���� ������
            if ((TObrs(obrs[i+1]).p[1]=TObrs(obrs[i+2]).p[1]) and
            (TObrs(obrs[i+2]).p[1]=TObrs(obrs[i+3]).p[1])) or (bbbx and
            (TObrs(obrs[i+1]).p[1]=TObrs(obrs[i+2]).p[1]))
             then
    begin
      //�������� �� ���������
      k:=0;
      excl:=0;
      for j:=0 to 3 do if Tobrs(obrs[i+j]).opkey=30 then k:=k+1 else excl:=Tobrs(obrs[i+j]).side;
      //������� � ����� 1 ������� � ������ � �� ������ �����.
      if aaax=1 then begin
        for j:=0 to 3 do
           if (Tobrs(obrs[i+j]).side=3) and (Tobrs(obrs[i+j]).opkey=30) and (Tobrs(obrs[i]).opkey=30)   and (excl<>3) then  //3
             obrs.Exchange(i,i+j);
        for j:=0 to 3 do
           if (Tobrs(obrs[i+j]).side=1) and (Tobrs(obrs[i+j]).opkey=30) and (Tobrs(obrs[i+1]).opkey=30) and (excl<>1) then  //1
             obrs.Exchange(i+1,i+j);
        for j:=0 to 3 do
           if (Tobrs(obrs[i+j]).side=2) and (Tobrs(obrs[i+j]).opkey=30) and (Tobrs(obrs[i+2]).opkey=30) and (excl<>2) then  //2
             obrs.Exchange(i+2,i+j);
        for j:=0 to 3 do
           if (Tobrs(obrs[i+j]).side=4) and (Tobrs(obrs[i+j]).opkey=30) and (Tobrs(obrs[i+3]).opkey=30) and (excl<>4) then  //4
             obrs.Exchange(i+3,i+j);
        reprog;
        inc(Result);
        i:=i+1;
      end;
      if aaax=2 then begin
        for j:=0 to 3 do
           if (Tobrs(obrs[i+j]).side=2) and (Tobrs(obrs[i+j]).opkey=30) and (Tobrs(obrs[i]).opkey=30)   and (excl<>2) then  //3
             obrs.Exchange(i,i+j);
        for j:=0 to 3 do
           if (Tobrs(obrs[i+j]).side=4) and (Tobrs(obrs[i+j]).opkey=30) and (Tobrs(obrs[i+1]).opkey=30) and (excl<>4) then  //1
             obrs.Exchange(i+1,i+j);
        for j:=0 to 3 do
           if (Tobrs(obrs[i+j]).side=3) and (Tobrs(obrs[i+j]).opkey=30) and (Tobrs(obrs[i+2]).opkey=30) and (excl<>3) then  //2
             obrs.Exchange(i+2,i+j);
        for j:=0 to 3 do
           if (Tobrs(obrs[i+j]).side=1) and (Tobrs(obrs[i+j]).opkey=30) and (Tobrs(obrs[i+3]).opkey=30) and (excl<>1) then  //4
             obrs.Exchange(i+3,i+j);
        reprog;
        inc(Result);
        i:=i+1;
      end;
    end;

    end;
  end;
end;

/////////////TObrs//////////////////////////////////////////////
procedure TObrs.newparam;
var i,j:integer;
    s,s1,s2:string;
begin
  s:='KP ';
  for i:=1 to 20 do
    if p[i]>=0 then begin
      s1:=inttostr(i);
      if length(s1)<2 then s1:='0'+s1;
      s1:='P'+s1+':';
      s2:=inttostr(p[i]);
      if p[21]=i then s2:='0000-'+s2;
      for j:=length(s2) to 7 do s2:='0'+s2;
      s:=s+s1+s2+' ';
    end;
  s:=trimright(s);
  if pos('KP',data.Strings[1])=1 then data.Strings[1]:=s;
end;

//��������� ����, ������ ��� ������� ��������
procedure TObrs.newopparam;
var s,s1,s2:string;
    i:integer;
begin
  s:=data.Strings[0];
  delete(s,1,11);
  s1:='KS ';
  s2:=inttostr(opgr);
  if length(s2)=1 then s1:=s1+s2+'-';
  s2:=inttostr(opkey);
  if length(s2)<3 then for i:=length(s2)+1 to 3 do s2:='0'+s2;
  if length(s2)=3 then s1:=s1+s2+'-';
  s2:=inttostr(side);
  if length(s2)=1 then s1:=s1+s2+' '+s;
  if pos('KS ',data.Strings[0])=1 then data.Strings[0]:=s1;
end;

/////////////TBtl///////////////////////////////////////////////
constructor TBtl.Create(filename:TFileName);
var f:textfile;
    s,s1,s2,s3:string;
    prog:TProgs;
    oprt,i:integer;
    obr:Tobrs;
    eop:boolean;
begin
  inherited Create;
  if filename<>'' then begin
    assignfile(f,filename);
    reset(f);
    readln(f,s);
    if ((pos('VN',s)=1) and (pos('BTL V5.0',s)<>0))// or (pos('BTL V1.0',s)<>0)
     then begin
      header:=TStringList.Create;
      //��������� ��������� �� ��� ���, ���� �� ������� ������ ���������
      repeat
        header.Add(s);
        readln(f,s);
      until (pos('BT',s)=1) or eof(f);
      eop:=false;
      //���� ������ ��������� ������� ������ ������ ��������
      //������������ ������ �������� ������� �� ������
      if pos('BT',s)=1 then progs:=TObjectList.Create(true);
      while not eof(f) do begin  //������ ���� ���������
        //������ ���� �� ����� ����� ��������� ��� ���� �� ��������
        repeat
          if pos('BT',s)=1 then begin  //�� ����� ����� ���������
            prog:=TProgs.Create;       //������ ������ ���������
            prog.sorted:=false;        //�������� ��������� �� �������������
            prog.data:=TStringList.Create; //������ ������ ������ ���������
            s1:=s;      //������ �������� � s1
            oprt:=0;    //������ �������� = 0
            delete(s1,1,3);
            prog.idf:=strtoint(s1);    //����� ���������� � ������ ���������
            eop:=false;
          end;
          if pos('BN',s)=1 then begin //�� ����� ������� ����������� ���������
            s1:=s;
            delete(s1,1,3);
            if assigned(prog) then    //���� ��������� �������
               prog.comment:=s1;      //������ � �����������
          end;
          if pos('BP',s)=1 then begin //���� ������ � ������� ���������
            s1:=s;
            if pos('A:',s1)<>0 then begin  //���� � ������ ���������� ��������
              delete(s1,1,pos('A:',s1)+1);
              delete(s1,pos(' ',s1),length(s1)-pos(' ',s1)+1); //�������� �����
              if assigned(prog) then
                  prog.col:=strtoint(s1);  //����� ��������
            end;
            s1:=s;                         //��������������� ������
            if pos('P01',s1)<>0 then begin //���� ������
              delete(s1,1,pos('P01',s1)+3);
              delete(s1,pos(' ',s1),length(s1)-pos(' ',s1)+1);
              if assigned(prog) then
                  prog.long:=strtoint(s1);
            end;
            s1:=s;
            if pos('P02',s1)<>0 then begin  //���� ������ �����
              delete(s1,1,pos('P02',s1)+3);
              delete(s1,pos(' ',s1),length(s1)-pos(' ',s1)+1);
              if assigned(prog) then
                  prog.h:=strtoint(s1);
            end;
            s1:=s;
            if pos('P03',s1)<>0 then begin  //���� ������ �����
              delete(s1,1,pos('P03',s1)+3);
              delete(s1,pos(' ',s1),length(s1)-pos(' ',s1)+1);
              if assigned(prog) then
                  prog.sh:=strtoint(s1);
            end;
            s1:=s;
            if pos('P09',s1)<>0 then begin  //���� ����� ������������
              delete(s1,1,pos('P09',s1)+3);
              delete(s1,pos(' ',s1),length(s1)-pos(' ',s1)+1);
              if assigned(prog) then
                  prog.idprv:=strtoint(s1);
            end;
          end;   //������ � ������� ����������
          //������� ��������
          if pos('KS',s)=1 then begin
            //���� ��� ������ �������� � ��������� ������ ������ ��������
            if oprt=0 then prog.obrs:=TObjectList.Create;
            oprt:=oprt+1;
            eop:=true; //������� ��������
            //������ ������� ��������
            obr:=TObrs.Create;
            obr.data:=TStringList.Create;
            s1:=s;
            delete(s1,1,3);
            s1:=copy(s1,1,pos('-',s1)-1);
            obr.opgr:=strtoint(s1);
            s1:=s;
            delete(s1,1,pos('-',s1));
            s1:=copy(s1,1,pos('-',s1)-1);
            obr.opkey:=strtoint(s1);
            s1:=s;
            delete(s1,1,5);
            s1:=copy(s1,pos('-',s1)+1,1);
            obr.side:=strtoint(s1);
            obr.data.Add(s);
            //������������� ������� ���������� � ������� �����.����� - ������ ��������
            for i:=1 to 21 do obr.p[i]:=-1;
          end;
          if pos('KP',s)=1 then begin
            if oprt<>0 then begin
              s1:=s;
              delete(s1,1,3);
              repeat
                s2:=copy(s1,2,2); //������ ������� - �� �� ����� ���������
                delete(s1,1,4);
                //�������� ���������
                if length(s1)>8 then s3:=copy(s1,1,pos(' ',s1)-1)
                  else s3:=s1;
                if length(s1)>8 then delete(s1,1,pos(' ',s1)) else s1:='';
                //��������� �������� � ������
                if pos('-',s3)<>0 then begin
                  delete(s3,pos('-',s3),1);
                  obr.p[21]:=strtoint(s2);
                end;
                obr.p[strtoint(s2)]:=strtoint(s3);
              until s1='';
              obr.data.Add(s);
            end;
          end;
          if pos('KF',s)=1 then begin
            if oprt<>0 then begin
              obr.data.Add(s);
            end;
          end;
          //���������� �������� �  ���������
          if (pos('KF FR',s)=1) and (oprt<>0) and assigned(prog.obrs) then begin
            prog.obrs.Add(obr);
            eop:=false; //�������� ���������
          end;
          //��������� ������� ����������� ������ � ���� ������
          if assigned(prog) then
                prog.data.Add(s);
          readln(f,s); //������ ����� ������
          //��������� ������ ������
          if eof(f) then begin
            //������� � � ������ ���������
            if assigned(prog) then prog.data.Add(s);
            //���� � ���� ������ ����� �������� ��������� � ��������
            if (pos('KF',s)=1) and (oprt<>0) and assigned(prog.obrs) then
              prog.obrs.Add(obr);
          end;
          //���� �� ����� ����� ��������� ��� ����� ��������, � ������ �� ��������
          if ((pos('BT',s)=1) or (pos('KS',s)=1)) and eop and assigned(prog.obrs) then begin
            prog.obrs.Add(obr);
            eop:=false;
          end;
        //���� � ����������� ������ ����� ��������� ��� ����� ����� � ������� ����
        until (pos('BT',s)=1) or eof(f);
        //���� ���� ������ ������ ���� ���������
        if assigned(progs) then
             progs.Add(prog);
      end;
    end else showmessage('��� �� BTL-���� ������ 5.0');
    closefile(f); //���� ��������, ��������� ���
  end;
end;

function TBtl.attachCADWorkSpec(filename:TFileName):boolean;
var f:textfile;
    s:string;
    numpr,i,j:integer;
begin
  j:=0;
  if (filename<>'') or (assigned(progs)) then begin
    assignfile(f,filename);
    reset(f);
    readln(f,s);
    if pos('.lstm',s)<>0 then begin //�������� ��������� ����� � �����
      //������ ���� �� �����
      while not eof(f) do begin
        readln(f,s);  //������ �� ������ ������
        s:=trimLeft(s); //������� ����� �������
        //�������� ������ ����� �� ������� � ��������� �������������
        //�� ��� � ����� �����, ���� ��, �� ��������� ��� ��� �� 0
        //���� �� ������, ������ �������� ����� ������������
        if TryStrToint(copy(s,1,pos(' ',s)-1),numpr) then
          if numpr<>0 then begin
            if assigned(progs) then begin //�� ������ ������
              //���� � ���������� ����� ������������ ������ �����������
              //�� ������������
              for i:=0 to progs.Count-1 do
                if (progs[i] as Tprogs).idprv=numpr then begin
                  //����� ������
                  delete(s,1,pos(' ',s)-1);//������� ����� ������������ �� ������
                  s:=trimLeft(s);          //�� ������ ������
                  //���������� ���������� ����� ������ � ������� ������ ���� ����
                  (progs[i] as Tprogs).idcnststr:=copy(s,1,pos(' ',s)-1);
                  j:=j+1;  //������� ����� ����������� �������
                  //��������� ����� ������, ������� ��� ����� ������������ ����
                  break;
                end;
            end;
          end;
      end;
    end
    else ShowMessage('��� �� ���� ������������ CADWork');
    closefile(f);
  end;
  //��������� ������ ����� ������� � ��������� � ���������� � Result
  if j>0 then begin
    ShowMessage('���������� ������� ������ ������ �������. ���������: '+inttostr(j)+' �����: '+inttostr(progs.Count));
    Result:=true
  end else Result:=False;
end;

procedure Tbtl.prepare;
var i,j,oldcol,newind,oldind,k,z:integer;
    prog,oldprg:Tprogs;   //����������� ���������, ������ ���������
    exclData:TStringList; //����������� ����� ���������
    s,s1,sx,sc:string;
    ok:boolean;
    obrz:TObrs;
begin
  //������� ���� ����������� �� ��� ���, ���� ����� �������� �� ������ = �������
  repeat
    ok:=true; //������� ��� ��������=�������
    //��������� ��� ���������
    for i:=0 to progs.Count-1 do begin
      //��������� ��� ����� ������� � ��������� ������ 1
      if (progs[i] as Tprogs).col>1 then begin
        //��� ���, ����� ��������� ������� ��������� ����� �� �������� �����
        ok:=false;
        //���������� ������ ���������� ��� ����������� ������������ ������
        oldcol:=(progs[i] as Tprogs).col;
        //���������� ������ �����
        oldind:=(progs[i] as Tprogs).idf;
        //��������� �������� ������ ��������� � ��������� ����������
        oldprg:=Tprogs.Create;
        oldprg.idf:=(progs[i] as Tprogs).idf;
        oldprg.col:=(progs[i] as Tprogs).col;
        oldprg.idprv:=(progs[i] as Tprogs).idprv;
        oldprg.optilong:=(progs[i] as Tprogs).optilong;
        oldprg.h:=(progs[i] as Tprogs).h;
        oldprg.sh:=(progs[i] as Tprogs).sh;
        oldprg.zg:=(progs[i] as Tprogs).zg;
        oldprg.long:=(progs[i] as Tprogs).long;
        oldprg.comment:=(progs[i] as Tprogs).comment;
        oldprg.idcnststr:=(progs[i] as Tprogs).idcnststr;
        oldprg.data:=TstringList.Create;
        oldprg.data.Assign((progs[i] as Tprogs).data);
        //���� �� ���������, ������ �����������
        oldprg.obrs:=TObjectList.Create;
        for k:=0 to (progs[i] as Tprogs).obrs.Count-1 do begin
          obrz:=TObrs.Create;
          obrz.p:=TObrs(TProgs(progs[i]).obrs[k]).p;
          obrz.opkey:=TObrs(TProgs(progs[i]).obrs[k]).opkey;
          obrz.opgr:=TObrs(TProgs(progs[i]).obrs[k]).opgr;
          obrz.side:=TObrs(TProgs(progs[i]).obrs[k]).side;
          obrz.data:=TStringList.Create;
          for z:=0 to TObrs(TProgs(progs[i]).obrs[k]).data.Count-1 do
            obrz.data.Add(TObrs(TProgs(progs[i]).obrs[k]).data.Strings[z]);
          oldprg.obrs.Add(obrz);
        end;
        //
        //������� ������� ��������� �� ������
        progs.Delete(i);
        //���� ���������� ��������, ��������� ��������� � ����� ������
        repeat
          //������ ������ ����� ��� ����� ���������
          exclData:=TStringList.Create;
          //�� ������ ������ ��� �������
          exclData.Clear;
          //��������� � ���� ����� �������� ���������
          exclData.Assign((oldprg as Tprogs).data);
          //�������� ����������� ������ ���������
          sc:=''; //����� ����������� �� �������
          sx:=''; //����� ������ �� �������
          for j:=0 to exclData.Count-1 do begin
            s:=exclData[j]; //�������� j-� ������ ��� ���������� �������� ��� ���
            if pos('BT',s)<>0 then begin //���� � ������� ������ ����� ���������
              //���� ������ ������, �� ���� �� �������� ����������
              //�� ����� ������=������� �������, ����� ����� ������ �����
              //�������� + 1
              if oldprg.col=oldcol then newind:=oldind
              else newind:=progs.Count+1;
              exclData.Delete(j); //������� ������ ������
              //� ��������� ����� � ����� ��������
              exclData.Insert(j,'BT  '+inttostr(newind));
            end;
            //���� ��� ������ ����������� � ����� ������ ����������
            //��������� ����� �����������
            if (pos('BN',s)<>0) and (oldprg.idcnststr<>'') then begin
              //�������� � ������ sx ����� ������
              //���� �� �� ����, �� ������ ����� �����������
              if pos('/',oldprg.idcnststr)<>0 then
                //� �� �������� ����� �� ������� �����������
                sx:=copy(oldprg.idcnststr,1,pos('/',oldprg.idcnststr)-1)
              //���� �� ��������� �� �������� �� ��� ��������  
              else sx:=oldprg.idcnststr;
              //� ������� ��� �� ������ � �������� ������ ��� ������� ���������
              delete(oldprg.idcnststr,1,pos('/',oldprg.idcnststr));
              //��������� ����� ����������� � ������ sc
              sc:=s+' / '+sx;
              exclData.Delete(j); //������� ������ ������
              //� ��������� ����� � ������� ������+������ �����������
              exclData.Insert(j,sc);
            end;
            //������ ������ � �������
            if pos('BP',s)<>0 then begin
              //������� � ������ ���������� ��������
              if pos('A:',s)<>0 then begin
                //�������� ������� ������ ����� ����� �������� � s1
                s1:=copy(s,pos('A:',s)+5,length(s)-pos(' ',s)+1);
                //����� ��������� ����� ����, ��������� ������� ����������
                s1:='BP A:001'+s1;
                exclData.Delete(j); //������� ������ ������
                //� ��������� ����� � ������ ������� � ��������� =1
                exclData.Insert(j,s1);
                //��� ��� ��������� �������� ���������������, � ������� ���������
                //�� ����� ��������� ������ ��������� �������
                break;
              end;
            end;
          end; //����� ����������� ������ ���������, ����� ��������� � exclData
          //��������� ��������� ��� ������ � ������ ��������
          prog:=Tprogs.Create; //������ ����� ���������
          prog.idf:=newind; //����� �� ����� ���������� ����� ������
          prog.col:=1; //���� ������� � ���������
          prog.idprv:=oldprg.idprv; //����� ������������ ������
          prog.long:=oldprg.long;   //������ ������
          prog.zg:=oldprg.zg; //����� ��������� ������
          prog.optilong:=prog.optilong; //������ ��������� ������
          prog.h:=oldprg.h; //������ ��������� ������
          prog.sh:=oldprg.sh; //������ ��������� ������
          //���� ������ ����� ������ �����������
          prog.obrs:=TObjectList.Create;
          for k:=0 to oldprg.obrs.Count-1 do begin
            obrz:=TObrs.Create;
            obrz.p:=TObrs(oldprg.obrs[k]).p;
            obrz.opkey:=TObrs(oldprg.obrs[k]).opkey;
            obrz.opgr:=TObrs(oldprg.obrs[k]).opgr;
            obrz.side:=TObrs(oldprg.obrs[k]).side;
            obrz.data:=TStringList.Create;
            for z:=0 to TObrs(oldprg.obrs[k]).data.Count-1 do
              obrz.data.Add(TObrs(oldprg.obrs[k]).data.Strings[z]);
            prog.obrs.Add(obrz);
          end;
          //
          //���� ����� ����������� �������, �� ��������� ���; ���� ��� - ������
          if sc<>'' then begin
            //������� ��������� �������
            delete(sc,1,3);
            prog.comment:=sc;
          end else prog.comment:=oldprg.comment;
          prog.idcnststr:=sx; //���������� ��� �� ���������� ����� ������
          prog.data:=TStringList.Create;
          prog.data.Assign(exclData); //������������ ����� ���������� ���������
          progs.Add(prog); //��������� � ������ ����� ���������
          //��������� �� 1 ����� ������� ������ ���������
          oldprg.col:=oldprg.col-1;
        until oldprg.col=0; //���������� ������� ����� 0, ��� ���������
        //��� ��� � ������ ��������� �� �������� �������, ��� ��� �� �����
        for k:=0 to oldprg.obrs.Count-1 do TObrs(oldprg.obrs[k]).data.Free;
        oldprg.obrs.Free;
        oldprg.data.Free;
        oldprg.Free;
        //��������� ����� �������� ����� ������ ��� �������
        break;
      end; //����� ������� ���������, �������
    end; //����� �������� ������ ��������� � ������ ������� ������ 1
  until ok; //���������� �������� = ����� �������
  //������ � ������ �������� ����� �������� ������������� ������ ������,
  //���� ��� ����. ��������� ��� ���������.
  for i:=0 to progs.Count-1 do begin
    //���� ����� ������ ����������
    if (progs[i] as TProgs).idcnststr<>'' then
      //������ ���������
      for j:=0 to (progs[i] as TProgs).data.Count-1 do begin
        s:=(progs[i] as TProgs).data[j];
        //������� ������ � ������������
        if (pos('BN',s)<>0) then
          //���� ����� ������ �� ������ � ������ �����������
          if pos((progs[i] as TProgs).idcnststr,s)=0 then begin
            //��������� ��� � �����������
            s:=s+' / '+(progs[i] as TProgs).idcnststr;
            (progs[i] as TProgs).data.Delete(j); //������� ������ ������
            //� ��������� ����� � ������� ������+������ �����������
            (progs[i] as TProgs).data.Insert(j,s);
            //��� ��� �� ������ ���������� ����������� ������ ����� �� ������
            //������� ��������� �������
            delete(s,1,3);
            //��������� ��� �����������
            (progs[i] as TProgs).comment:=s;
            break;
          end;
      end;
  end;
  ShowMessage('����� ����� �������� '+inttostr(progs.Count));
end; //����� ���������

procedure TBtl.writeprog(filename:TFileName);
var f:textfile;
    i,j:integer;
begin
  if filename<>'' then begin
    assignfile(f,filename);
    rewrite(f);
    //������� ���������� ���������
    if assigned(header) then for i:=0 to header.Count-1 do writeln(f,header[i]);
    //������ ���������� ���������
    for i:=0 to progs.Count-1 do
      for j:=0 to (progs[i] as Tprogs).data.Count-1 do
        writeln(f,(progs[i] as Tprogs).data[j]);
    closefile(f);
    ////////////////���������///////////////////////////
    if Form1.Memo1.Lines.Count>0 then
      Form1.Memo1.Lines.SaveToFile(ExtractFilePath(filename)+'Opti_'+
      ExtractFileName(ChangeFileExt(filename,'.txt')));
    ////////////////////////////////////////////////////
    ShowMessage('��������� ��������');
  end;
end;

function sortList(p1,p2:pointer):integer; //��������� ������� optimize
begin
  //���������� �� �����������
  Result:=sign(Topt(p1).long-Topt(p2).long);
end;

function sortList2(p1,p2:pointer):integer; //��������� ������� optimize
begin
  //���������� �� �����������
  Result:=sign(Tprogs(p1).zg-Tprogs(p2).zg);
end;

function sortList6(p1,p2:pointer):integer; //��������� ������� optimize
var a,b:real;
begin
  //���������� �� �����������
  a:=strtofloat(floattostr(Tprogs(p1).optilong)+','+floattostr(Tprogs(p1).zg)+'5');
  b:=strtofloat(floattostr(Tprogs(p2).optilong)+','+floattostr(Tprogs(p2).zg)+'5');
  Result:=sign(b-a);
end;

function sortList3(p1,p2:pointer):integer; //��������� ������� optimize
begin
  //���������� �� �����������
  Result:=sign(Topt(p1).ostatok-Topt(p2).ostatok);
end;


function sortList4(p1,p2:pointer):integer; //��������� ������� optimize
begin
  //���������� �� �����������
  Result:=sign(Tolong(p1).l-TOlong(p2).l);
end;

function sortList5(p1,p2:pointer):integer; //��������� ������� optimize
begin
  //���������� �� �����������
  Result:=sign(Tkart(p1).ostatok-Tkart(p2).ostatok);
end;

function sortList7(p1,p2:pointer):integer; //��������� ������� optimize
begin
  //���������� �� ��������
  Result:=sign(Topt(p2).optilong-Topt(p1).optilong);
end;


procedure Tbtl.nprz(venci:integer);   //��������� ��������� ������� BTl �����
var i,j,k:integer;
    s,s1,s2,s3:string;
begin
  for i:=0 to progs.Count-1 do begin
    for j:=0 to (progs[i] as TProgs).data.Count-1 do begin
      s:=(progs[i] as TProgs).data[j];
      if pos('BT',s)<>0 then begin
        (progs[i] as TProgs).idf:=i+1;
        s3:='BT '+inttostr(i+1);
        (progs[i] as TProgs).data.Delete(j);
        (progs[i] as TProgs).data.Insert(j,s3);
      end;
      if pos('BN',s)<>0 then begin
        if venci=1 then begin
          s2:=s;
          if pos('_',s2)<>0 then begin
            delete(s2,1,pos('_',s2));
            if pos('/OP@',s2)<>0 then
              delete(s2,pos('/OP@',s2),length(s2)-pos('/OP@',s2)+1);
            s2:=inttostr((progs[i] as TProgs).zg)+'_'+s2;
            (progs[i] as TProgs).comment:=s2;
            s2:='BN '+s2;
            (progs[i] as TProgs).data.Delete(j);
            (progs[i] as TProgs).data.Insert(j,s2);
          end;
        end else if venci=2 then begin
          s2:=inttostr(TProgs(progs[i]).zg)+'_'+inttostr(TProgs(progs[i]).idprv);
          (progs[i] as TProgs).comment:=s2;
          s2:='BN '+s2;
          (progs[i] as TProgs).data.Delete(j);
          (progs[i] as TProgs).data.Insert(j,s2);
        end else begin
          s2:=inttostr((progs[i] as TProgs).zg)+'_'+(progs[i] as TProgs).idcnststr;
          if (progs[i] as TProgs).idcnststr='' then
            s2:=s2+inttostr((progs[i] as TProgs).idprv);
          (progs[i] as TProgs).comment:=s2;
          s2:='BN '+s2;
          (progs[i] as TProgs).data.Delete(j);
          (progs[i] as TProgs).data.Insert(j,s2);
        end;
      end;
      if pos('BP',s)<>0 then
        if pos('P09',s)<>0 then begin
          delete(s,pos('P09',s),length(s)-pos('P09',s)+1);
          s1:=inttostr(i+1);
          for k:=length(s1) to 7 do s1:='0'+s1;
          s:=s+'P09:'+s1;
          (progs[i] as TProgs).data.Delete(j);
          (progs[i] as TProgs).data.Insert(j,s);
          break;
        end;
    end;
    (progs[i] as TProgs).idprv:=i+1;
  end;
end;       //��������� ��������� ������� BTl �����

//�����������
procedure Tbtl.optimize(a:TObjectList;rez:integer);
var i,z,k,along,j,aai,aaj:integer;
    inlist,outlist,intmplist,outtmplist,karts,tmplist:TObjectList;
    opt:Topt;
    xopt,nnt,nopt:boolean;
    kart:Tkart;
    s:string;
    sum,proc,ostatok,ostatokperc,alllong:real;
    nn:array of integer;

//������� ������� ����������� ������� TObjectList > new TObjectList
//� ��������� ��������
function listCopy(b:TObjectList):TObjectList;
var copt:TOpt;
    ai:integer;
begin
  if assigned(b) then begin
    Result:=TObjectList.Create;
    for ai:=0 to b.Count-1 do begin
      copt:=TOpt.Create;
      copt.id:=TOpt(b[ai]).id;
      copt.long:=TOpt(b[ai]).long;
      copt.idbrev:=TOpt(b[ai]).idbrev;
      copt.ostatok:=TOpt(b[ai]).ostatok;
      copt.optilong:=TOpt(b[ai]).optilong;
      Result.Add(copt);
    end;
  end else Result:=nil;
end;

//������� ���������� ��������� ������� TObjectList add new TObjectList
//� ��������� ��������
procedure listadd(b:TObjectList;c:TObjectList);
var ai:integer;
    copt:TOpt;
begin
  if assigned(b) then begin
    if not assigned(c) then c:=TObjectList.Create;
    for ai:=0 to b.Count-1 do begin
      copt:=TOpt.Create;
      copt.id:=TOpt(b[ai]).id;
      copt.long:=TOpt(b[ai]).long;
      copt.idbrev:=TOpt(b[ai]).idbrev;
      copt.ostatok:=TOpt(b[ai]).ostatok;
      copt.optilong:=TOpt(b[ai]).optilong;
      c.Add(copt);
    end;
  end;
end;

//���� �������� ��������� �����������
begin
  //���� ���� ���� ���� ������������� ��������� � ���� �� ���� ������
  //��������� �������� ��� ���������
  if (a.Count>0) and (progs.Count>0) then begin
    //������ ������� ������
    inlist:=TObjectList.Create;
    //���������� � ���� ��� ������ ������
    for i:=0 to progs.Count-1 do begin
      opt:=Topt.Create;
      opt.id:=TProgs(progs[i]).idf;
      opt.long:=TProgs(progs[i]).long;
      inlist.Add(opt);
    end;
    //��������� ������� ������ �� �����������
    inlist.Sort(sortList);
    //��������� ������ ��������� �� �����������
    a.Sort(sortList4);
    //������ �������� ������
    outlist:=TObjectList.Create;
    //������� �������� �����������, max ������ ��������� + ������ ����
    //>= ������������ ������ �������
    if (TOpt(inlist[inlist.Count-1]).long+rez)<=Tolong(a[a.Count-1]).l then
    begin
      //������� ����� �������
      k:=0;
      //�������� �����������, ���� ������� �� ������� ����� �� ��������
      repeat
        //����� ������������� ��������� +1
        k:=k+1;
        //������� ��� �� ����� ��������� �� �����������
        nopt:=true;
        //������ ������ ����
        karts:=TObjectlist.Create;
        //����� � ����� ������� ��������� �� ������
        for i:=a.Count-1 downto 0 do begin
          //���� ������������ ������� �������� ������+��� ������
          //�������������� �������
          //��������� ��� ����� ��������� <>0
          if (Tolong(a[i]).l>=(Topt(inlist[inlist.Count-1]).long+rez))
          and (Tolong(a[i]).opticol<>0) then begin
            //��������� �������������
            nopt:=false;
            //����������� ������ ��������� = ������� �� ������ ���������
            along:=Tolong(a[i]).l;
            //������ ��������� ������� ������ ��� ������
            intmplist:=TObjectList.Create;
            //�������� ������� ������ �� ��������� �������
            intmplist:=listcopy(inlist);
            //������ ��������� �������� ������
            outtmplist:=TObjectList.Create;
            repeat
              //������� ��� ������ ������ ������� �� ���������
              xopt:=true;
              //��������� ��������� ������� ������ � ����� �� ������
              for j:=intmplist.Count-1 downto 0 do begin
                //���� �� ������� ������ ������� ���������� j-�� ���������
                if (along-Topt(intmplist[j]).long-rez)>=0 then begin
                  //�������� ���� ���������� �������� ������ ����
                  along:=along-Topt(intmplist[j]).long-rez;
                  //������� ������ ������, ��������� ����� �� �����
                  xopt:=false;
                  //������ ���������� �������
                  opt:=Topt.Create;
                  opt.id:=Topt(intmplist[j]).id;
                  opt.long:=Topt(intmplist[j]).long;
                  opt.idbrev:=k;    //����� ������ ����������� k
                  opt.ostatok:=along; //������� �������
                  opt.optilong:=Tolong(a[i]).l; //��������� i
                  //���������� ������� �� ��������� �������� ������
                  outtmplist.Add(opt);
                  //� ������� ��� �� ���������� �������� ������
                  intmplist.Delete(j);
                end;
              end;
            //������� �� ��������� ��� �� ����������
            until xopt;
            //������ ������� �����
            kart:=Tkart.Create;
            //������� ����� ����� � �����
            kart.ostatok:=along;
            kart.optilong:=Tolong(a[i]).l; //��������� i
            //������� ��������� ������ � ������� �����
            kart.inl:=TObjectList.Create;
            kart.inl.Assign(intmplist);
            //�������� ��������� ������ � ������� �����
            kart.oul:=TObjectList.Create;
            kart.oul.Assign(outtmplist);
            //������� ����� � ������ ����
            karts.Add(kart);
          //������������� ���� ���� �� ����������
          end; // else break;
        //��������� ��������
        end;
        //���� ����� ���������������
        if karts.Count>0 then begin
          //����� �������� ��������� �� �� ����������� �������
          karts.Sort(sortList5);
          //������� ����� �������� ����������� �������
          for z:=0 to a.Count-1 do
            if Tolong(a[z]).l=Tkart(karts[0]).optilong then begin
              Tolong(a[z]).col:=Tolong(a[z]).col+1;
              //-1 ������� ������������ ����� ���������, ���� ��� �������
              //�������� �� ������ ����� ���� ���������
              if Tolong(a[z]).opticol<>-1 then
                Tolong(a[z]).opticol:=Tolong(a[z]).opticol-1;
            end;
          //������� ���� 0-�� ����� ���������� ������� ������, � �������� ��������
          inlist.Free;
          inlist:=TObjectList.Create;
          inlist:=listcopy(Tkart(karts[0]).inl);
          listadd(Tkart(karts[0]).oul,outlist);
          //������� ������ ���� � ������ ������ ����
          for z:=karts.Count-1 to 0 do begin
            Tkart(karts[z]).inl.Free;
            Tkart(karts[z]).oul.Free;
          end;
          karts.Free;
        end;
      //����������� ���������, ������� �� ������� ������ �� ��������
      //��� ��������� ������ �� �������������
      until (inlist.Count=0) or nopt;
    end else ShowMessage('������ max ������� ������ ��� max ���������');
    if nopt then ShowMessage('��������! � ������� ������ �� ��� �������!'+
    ' �������� ����� �������� ���������');
    ////////////////////////////////////////////////////////////
    Form1.Memo1.Clear;
    //��������� �������� ������ �� ������
    outlist.Sort(sortlist7);
    //�������������� ������ ������� ���������=0
    setlength(nn,1);
    nn[0]:=0;
    //��������� ����� ������ ���������, ��������� ������ ������������ �� �������
    for aai:=0 to outlist.Count-1 do begin
      //����� ��������� �� ������ � ������� ����� �������
      nnt:=true;
      //��������� ���� ������
      for aaj:=0 to length(nn)-1 do if Topt(outlist[aai]).idbrev=nn[aaj] then nnt:=false;
      //���� ����� ��������� �� ������, ��������� ��� ����� ���������
      if nnt then begin
        setlength(nn,length(nn)+1);
        nn[length(nn)-1]:=Topt(outlist[aai]).idbrev;
      end;
    end;
    //������ ������ ��������� �� �����
    for aai:=0 to outlist.Count-1 do
      for aaj:=1 to length(nn)-1 do
        //���� ������ ������� ���� ����� ��������� � ������� ������� ���������
        if Topt(outlist[aai]).idbrev=nn[aaj] then begin
          //��� ������ �� ������ ����������� ��� ������, ��� � ����� ����� �����
          Topt(outlist[aai]).idbrev:=aaj;
          //������ ���������, ����� ������ ������
          break;
    end;
    {for aai:=1 to length(nn)-1 do Form1.Memo1.Lines.Add(inttostr(aai)+'='+inttostr(nn[aai]));
      for i:=0 to outlist.Count-1 do begin
      s:='';
      s:=s+inttostr(Topt(outlist[i]).id)+' / ';
      s:=s+inttostr(Topt(outlist[i]).idbrev)+' / ';
      s:=s+inttostr(Topt(outlist[i]).long)+' / ';
      s:=s+inttostr(Topt(outlist[i]).optilong)+' / ';
      s:=s+inttostr(Topt(outlist[i]).ostatok)+' / ';
      Form1.Memo1.Lines.Add(s);
    end;}
    ////////////////////////////////////////////////////////////
    //������ ����� ������������ �������� ������ � �����������
    //���������� �������� ������ ������� �� �����
    for i:=0 to outlist.Count-1 do begin
      //���� ���������� id ������, �� ������� ��������
      for k:=0 to progs.Count-1 do begin
        if Topt(outlist[i]).id=(progs[k] as Tprogs).idf then begin
          //���� ��� �������������� ������� ������ �����������
          if pos('/OP@',(progs[k] as Tprogs).comment) <>0 then
            delete((progs[k] as Tprogs).comment,
            pos('/OP@',(progs[k] as Tprogs).comment),
            length((progs[k] as Tprogs).comment)-
            pos('/OP@',(progs[k] as Tprogs).comment)+1);
          //���������� ����� ��������� � � ������
          (progs[k] as Tprogs).zg:=TOpt(outlist[i]).idbrev;
          (progs[k] as Tprogs).optilong:=TOpt(outlist[i]).optilong;
          //���������� ����� �����������
          (progs[k] as Tprogs).comment:=(progs[k] as Tprogs).comment+
          '/OP@ ���������: '+inttostr(Topt(outlist[i]).idbrev)+
          ' /������: '+floattostr(Topt(outlist[i]).optilong/10)+
          ' /�������: '+floattostr(Topt(outlist[i]).ostatok/10);
          //���� ����������� � ������ ���������
          for j:=0 to (progs[k] as Tprogs).data.Count-1 do begin
            //������� ������ � ������������
            if pos('BN',(progs[k] as Tprogs).data[j])<>0 then begin
              s:=(progs[k] as Tprogs).data[j];
              delete(s,1,3); //������� ��������� �������
              trimLeft(s);   //�� ������ ������� �������
              //���� ����������� � ������ <> ����������� � ������� ���������
              if s<>(progs[k] as Tprogs).comment then begin
                //���� ��� �� ��������� � ��������� ��������� �������
                s:='BN '+(progs[k] as Tprogs).comment;
                //������� j-� ������ �� ������ ������������
                (progs[k] as Tprogs).data.Delete(j);
                //��������� j-� ������ � ����� ������������
                (progs[k] as Tprogs).data.Insert(j,s);
              end;
            end;
          end;
        end;
      end;
    end;
    /////////////����� ���������////////////////////////////////////
  //  Form1.Memo1.Clear;
  //  j:=Topt(outlist[outlist.Count-1]).idbrev;
    j:=length(nn)-1;
    k:=0;
    ostatok:=0;
    alllong:=0;
    ostatokperc:=0;
    repeat
      k:=k+1;
      tmplist:=TObjectList.Create;
      for i:=0 to outlist.Count-1 do begin
        if Topt(outlist[i]).idbrev=k then begin
          opt:=Topt.Create;
          opt.id:=Topt(outlist[i]).id;
          opt.long:=Topt(outlist[i]).long;
          opt.idbrev:=Topt(outlist[i]).idbrev;  //����� ���������
          opt.ostatok:=Topt(outlist[i]).ostatok;
          opt.optilong:=Topt(outlist[i]).optilong;
          tmplist.Add(opt);
        end;
      end;
      tmplist.Sort(sortList3);
      s:=''; sum:=0;
      for i:=0 to tmplist.Count-1 do begin
        sum:=sum+Topt(tmplist[i]).long/10;
        if rez>0 then sum:=sum+(rez/10);
        s:=s+' | '+inttostr(Topt(tmplist[i]).id)+', L='+floattostr(Topt(tmplist[i]).long/10);
      //    Form1.Memo1.Lines.Add(floattostr(Topt(tmplist[i]).ostatok/10));
      end;
      ostatok:=ostatok+Topt(tmplist[0]).ostatok;
      alllong:=alllong+Topt(tmplist[0]).optilong;
      ostatokperc:=(ostatok/alllong)*100;
      proc:=(Topt(tmplist[0]).ostatok/Topt(tmplist[0]).optilong)*100;
      s:='� '+inttostr(k)+s+' /���������: '+floattostr(Topt(tmplist[0]).optilong/10)+
      ' /������: '+floattostr(sum)+
      '  /�������: '+floattostr(Topt(tmplist[0]).ostatok/10)
      +' /�����: '+floattostrF(proc,ffFixed,8,3)+' %';
      Form1.Memo1.Lines.Add(s);
      tmplist.Free;
    until k=j;
    //����� ������ ���������� ���������
    s:='';
    for z:=0 to a.Count-1 do
      if Tolong(a[z]).col>0 then s:=s+' ��������� '+floattostr(Tolong(a[z]).l/10)+
      ' ��: '+inttostr(Tolong(a[z]).col)+';';
    Form1.Memo1.Lines.Add('');
    s:=s+' �������: '+floattostr(ostatok/10)+';'+' ����� ������: '+
    floattostr(alllong/10)+'; �������: '+floattostrF(ostatokperc,ffFixed,8,3)+'%';
    Form1.Memo1.Lines.Add(s);
    //��������� ������ �� �����������, ������������ ������ ��������� � � ������
    progs.Sort(sortList2);
 //   progs.Sort(sortList6);
    //������� ��������� �������
    outlist.Free;
    inlist.Free;
  end; //������ ����������� ��� ��� ������� �� �������
end;


procedure TBtl.writeXprog(ax:integer;filename:TFileName);
var f:textfile;
    i:integer;
begin
  if filename<>'' then begin
    assignfile(f,filename);
    rewrite(f);
    //������� ���������� ���������
    if assigned(header) then for i:=0 to header.Count-1 do writeln(f,header[i]);
    //������ ���������� ���������� � ��������� ���������
    for i:=0 to (progs[ax-1] as Tprogs).data.Count-1 do
        writeln(f,(progs[ax-1] as Tprogs).data[i]);
    closefile(f);
    ////////////////////////////////////////////////////
    ShowMessage('��������� ��������');
  end;
end;


procedure TBtl.load(filename:TFileName);
var f:textfile;
    s,s1,s2,s3,s4,s5:string;
    prog:TProgs;
    oprt,i,oldzg,newzg:integer;
    obr:Tobrs;
    eop:boolean;
begin
  if filename<>''  then begin
    assignfile(f,filename);
    oldzg:=0; newzg:=0;
    reset(f);
    readln(f,s);
    if ((pos('VN',s)=1) and (pos('BTL V5.0',s)<>0))// or (pos('BTL V1.0',s)<>0)
     then begin
      //header:=TStringList.Create;
      //��������� ��������� �� ��� ���, ���� �� ������� ������ ���������
      repeat
        //header.Add(s);
        readln(f,s);
      until (pos('BT',s)=1) or eof(f);
      eop:=false;
      //���� ������ ��������� ������� ������ ������ ��������
      //������������ ������ �������� ������� �� ������
      //if pos('BT',s)=1 then progs:=TObjectList.Create(true);
      while not eof(f) do begin  //������ ���� ���������
        //������ ���� �� ����� ����� ��������� ��� ���� �� ��������
        repeat
          if pos('BT',s)=1 then begin  //�� ����� ����� ���������
            prog:=TProgs.Create;       //������ ������ ���������
            prog.sorted:=false;        //�������� ��������� �� �������������
            prog.data:=TStringList.Create; //������ ������ ������ ���������
            s1:=s;      //������ �������� � s1
            oprt:=0;    //������ �������� = 0
            delete(s1,1,3);
            if assigned(progs) then
              prog.idf:=progs.Count+1
            else prog.idf:=strtoint(s1);    //����� ���������� � ������ ���������
            eop:=false;
          end;
          if pos('BN',s)=1 then begin //�� ����� ������� ����������� ���������
            s1:=s;
            delete(s1,1,3);
            if assigned(prog) then    //���� ��������� �������
               prog.comment:=s1;      //������ � �����������
          end;
          if pos('BP',s)=1 then begin //���� ������ � ������� ���������
            s1:=s;
            if pos('A:',s1)<>0 then begin  //���� � ������ ���������� ��������
              delete(s1,1,pos('A:',s1)+1);
              delete(s1,pos(' ',s1),length(s1)-pos(' ',s1)+1); //�������� �����
              if assigned(prog) then
                  prog.col:=strtoint(s1);  //����� ��������
            end;
            s1:=s;                         //��������������� ������
            if pos('P01',s1)<>0 then begin //���� ������
              delete(s1,1,pos('P01',s1)+3);
              delete(s1,pos(' ',s1),length(s1)-pos(' ',s1)+1);
              if assigned(prog) then
                  prog.long:=strtoint(s1);
            end;
            s1:=s;
            if pos('P02',s1)<>0 then begin  //���� ������ �����
              delete(s1,1,pos('P02',s1)+3);
              delete(s1,pos(' ',s1),length(s1)-pos(' ',s1)+1);
              if assigned(prog) then
                  prog.h:=strtoint(s1);
            end;
            s1:=s;
            if pos('P03',s1)<>0 then begin  //���� ������ �����
              delete(s1,1,pos('P03',s1)+3);
              delete(s1,pos(' ',s1),length(s1)-pos(' ',s1)+1);
              if assigned(prog) then
                  prog.sh:=strtoint(s1);
            end;
            s1:=s;
            if pos('P09',s1)<>0 then begin  //���� ����� ������������
              delete(s1,1,pos('P09',s1)+3);
              delete(s1,pos(' ',s1),length(s1)-pos(' ',s1)+1);
              if assigned(prog) then
                  prog.idprv:=strtoint(s1);
            end;
          end;   //������ � ������� ����������
          //������� ��������
          if pos('KS',s)=1 then begin
            //���� ��� ������ �������� � ��������� ������ ������ ��������
            if oprt=0 then prog.obrs:=TObjectList.Create;
            oprt:=oprt+1;
            eop:=true; //������� ��������
            //������ ������� ��������
            obr:=TObrs.Create;
            obr.data:=TStringList.Create;
            s1:=s;
            delete(s1,1,3);
            s1:=copy(s1,1,pos('-',s1)-1);
            obr.opgr:=strtoint(s1);
            s1:=s;
            delete(s1,1,pos('-',s1));
            s1:=copy(s1,1,pos('-',s1)-1);
            obr.opkey:=strtoint(s1);
            s1:=s;
            delete(s1,1,5);
            s1:=copy(s1,pos('-',s1)+1,1);
            obr.side:=strtoint(s1);
            obr.data.Add(s);
            //������������� ������� ���������� � ������� �����.����� - ������ ��������
            for i:=1 to 21 do obr.p[i]:=-1;
          end;
          if pos('KP',s)=1 then begin
            if oprt<>0 then begin
              s1:=s;
              delete(s1,1,3);
              repeat
                s2:=copy(s1,2,2); //������ ������� - �� �� ����� ���������
                delete(s1,1,4);
                //�������� ���������
                if length(s1)>8 then s3:=copy(s1,1,pos(' ',s1)-1)
                  else s3:=s1;
                if length(s1)>8 then delete(s1,1,pos(' ',s1)) else s1:='';
                //��������� �������� � ������
                if pos('-',s3)<>0 then begin
                  delete(s3,pos('-',s3),1);
                  obr.p[21]:=strtoint(s2);
                end;
                obr.p[strtoint(s2)]:=strtoint(s3);
              until s1='';
              obr.data.Add(s);
            end;
          end;
          if pos('KF',s)=1 then begin
            if oprt<>0 then begin
              obr.data.Add(s);
            end;
          end;
          //���������� �������� �  ���������
          if (pos('KF FR',s)=1) and (oprt<>0) and assigned(prog.obrs) then begin
            prog.obrs.Add(obr);
            eop:=false; //�������� ���������
          end;
          //��������� ������� ����������� ������ � ���� ������
          if assigned(prog) then
                prog.data.Add(s);
          readln(f,s); //������ ����� ������
          //��������� ������ ������
          if eof(f) then begin
            //������� � � ������ ���������
            if assigned(prog) then prog.data.Add(s);
            //���� � ���� ������ ����� �������� ��������� � ��������
            if (pos('KF',s)=1) and (oprt<>0) and assigned(prog.obrs) then
              prog.obrs.Add(obr);
          end;
          //���� �� ����� ����� ��������� ��� ����� ��������, � ������ �� ��������
          if ((pos('BT',s)=1) or (pos('KS',s)=1)) and eop and assigned(prog.obrs) then begin
            prog.obrs.Add(obr);
            eop:=false;
          end;
        //���� � ����������� ������ ����� ��������� ��� ����� ����� � ������� ����
        until (pos('BT',s)=1) or eof(f);
        //���� ���� ������ ������ ���� ���������
        if assigned(progs) then begin
             if oldzg=0 then begin
               s5:=TProgs(progs[progs.Count-1]).comment;
               s4:=copy(s5,1,pos('_',s5)-1);
               if not trystrtoint(s4,oldzg) then oldzg:=-1;
             end;
             if oldzg>0 then begin
               s4:=copy(prog.comment,1,pos('_',prog.comment)-1);
               if not trystrtoint(s4,newzg) then newzg:=-1;
               if newzg>0 then begin
                 delete(prog.comment,1,pos('_',prog.comment)-1);
                 prog.comment:=inttostr(oldzg+newzg)+prog.comment;
                 prog.reprog;
               end;
             end;
             progs.Add(prog);
        end;
      end;
    end else showmessage('��� �� BTL-���� ������ 5.0');
    closefile(f); //���� ��������, ��������� ���
  end;
end;

/////////////////����������� �����///////////////////////////
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////


procedure TForm1.listprog;
var li:TListItem;
    i:integer;
begin
  ListView1.Clear;
  if assigned(Btl) and assigned(btl.progs) then
    for i:=0 to btl.progs.Count-1 do begin
      li:=listView1.Items.Add;
      li.Caption:=inttostr((btl.progs[i] as Tprogs).idf);
      li.SubItems.Add(inttostr((btl.progs[i] as Tprogs).col));
      li.SubItems.Add(inttostr((btl.progs[i] as Tprogs).idprv));
      li.SubItems.Add(floattostr((btl.progs[i] as Tprogs).long/10));
      li.SubItems.Add((btl.progs[i] as Tprogs).comment);
      li.SubItems.Add((btl.progs[i] as Tprogs).idcnststr);
      if (btl.progs[i] as Tprogs).zg<>0 then
      li.SubItems.Add(inttostr((btl.progs[i] as Tprogs).zg));
    end;
end;

procedure TForm1.N3Click(Sender: TObject);
var i:integer;
begin
    if assigned(btl) then  begin
    if assigned(Btl.progs) then begin
      if Btl.progs.Count>0 then
      for i:=0 to Btl.progs.Count-1 do
        if assigned(TProgs(Btl.progs[i]).data) then begin
          TProgs(Btl.progs[i]).data.Free;
          if assigned(TProgs(btl.progs[i]).obrs)
            then TProgs(btl.progs[i]).obrs.Free;
        end;
      Btl.header.Free;
      Btl.progs.Free;
    end;
    Btl.Free;
  end;
  Application.Terminate;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  N3Click(self);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then   //���� ���� ������ ������ ������
        Btl:=TBtl.Create(OpenDialog1.FileName);
  //���� ��������� ����������� ������ �� ����������
  if assigned(Btl) then
  if assigned(Btl.progs) then begin
     Label2.Caption:=inttostr(Btl.progs.Count);
     listprog;
     if Btl.progs.Count>0 then begin
       N4.Enabled:=True;
       N24.Enabled:=true;
       N20.Enabled:=true;
       N11.Enabled:=true;
       Cadwork1.Enabled:=true;
       N7.Enabled:=true;
       N22.Enabled:=true;
       // N8.Enabled:=false;
       CadWork1.Enabled:=true;
       //Button3.Enabled:=false;
       Form1.Caption:=Form1.Caption+' / '+OpenDialog1.FileName;
     end;
   end else begin
     Label2.Caption:='0';
     N4.Enabled:=False;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  N2Click(self);
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.BTL1Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm1.CadWork1Click(Sender: TObject);
begin
  if (OpenDialog2.Execute) and (assigned(Btl)) and (assigned(Btl.progs)) then
  begin
    if not Btl.attachCADWorkSpec(OpenDialog2.FileName) then
        ShowMessage('������������ CADWork ����������� ��������')
    else listprog;    
  end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Btl.prepare;
  N8.Enabled:=true;
  CadWork1.Enabled:=false;
  Button3.Enabled:=true;
  listprog;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  if SaveDialog1.Execute then Btl.writeprog(SaveDialog1.FileName);
end;

procedure TForm1.N8Click(Sender: TObject);
var xrez,i,x:integer;
    olong:TObjectList;
    xlong:TOlong;
begin
   if assigned(Btl) and (ListView2.Items.Count>0) then begin
    if Edit3.Text<>'' then if not TryStrToInt(edit3.Text,xrez) then xrez:=0;
    xrez:=xrez*10;
    olong:=TObjectList.Create;
    for i:=0 to ListView2.Items.Count-1 do
      if ListView2.Items[i].Checked then begin
        x:=StrToInt(ListView2.Items[i].Caption)*10;
        xlong:=TOlong.Create;
        xlong.l:=x;
        xlong.col:=0;
        if ListView2.Items[i].SubItems[0]<>'' then begin
          if not TryStrToInt(ListView2.Items[i].SubItems[0],xlong.opticol) then
            ShowMessage('����������� ������� ���������� ���������')
        end else xlong.opticol:=-1;
        olong.Add(xlong);
      end;
    if olong.Count>0 then begin Btl.prepare; Btl.optimize(olong,xrez); listprog; end;
    olong.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  N8Click(self);
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  Btl.nprz(0);
  listprog;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.readlong;
end;

procedure TForm1.readlong;
var f:textfile;
    s:string;
    li:TlistItem;
    i:integer;
    dob:boolean;
begin
  assignfile(f,'optilong.txt');
  if FileExists('optilong.txt') then begin
    reset(f);
    while not eof(f) do begin
      readln(f,s);
      dob:=true;
      for i:=0 to ListView2.Items.Count-1 do
        if pos(s,ListView2.Items[i].Caption)<>0 then dob:=false;
      if dob then begin
        li:=ListView2.Items.Add;
        li.Caption:=s;
        li.SubItems.Add('');
      end;
    end;
    closefile(f);
  end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var s:string;
    f:TStringList;
    i:integer;
begin
  if assigned(ListView2.Selected) then begin
    s:=ListView2.Selected.Caption;
    f:=TStringList.Create;
    if FileExists('optilong.txt') then f.LoadFromFile('optilong.txt');
    if f.Count>0 then for i:=0 to f.Count-1 do
      if pos(s,f[i])<>0 then begin f.Delete(i); break; end;
    f.SaveToFile('optilong.txt');
    f.Free;
    ListView2.Selected.Free;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Form4.ShowModal;
end;



procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i:integer;
begin
  if assigned(btl) then  begin
    if assigned(Btl.progs) then begin
      if Btl.progs.Count>0 then
      for i:=0 to Btl.progs.Count-1 do
        if assigned(TProgs(Btl.progs[i]).data) then begin
          TProgs(Btl.progs[i]).data.Free;
          if assigned(TProgs(btl.progs[i]).obrs)
            then TProgs(btl.progs[i]).obrs.Free;
        end;
      Btl.header.Free;
      Btl.progs.Free;
    end;
    Btl.Free;
  end;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  Btl.nprz(1);
  listprog;
end;

procedure TForm1.ListView2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  R:TRect;
  ht:TLVHitTestInfo;
begin
  //���������� �������������� ���� � ListView2
  Item := ListView2.GetItemAt(2, Y);
  if Item=nil then Exit;
  FillChar(ht,SizeOf(ht),0);
  ht.pt.x:=X;
  ht.pt.y:=Y;
  SendMessage(ListView2.Handle, LVM_SUBITEMHITTEST, 0, Integer(@ht));
  Sub:=ht.iSubItem;
  //Caption:=inttostr(sub);
  if Sub > 0 then begin
    ListView_GetSubItemRect(ListView2.Handle, Item.Index, Sub,LVIR_BOUNDS, @R);
    Offsetrect(R,ListView1.Left,ListView2.Top);
    Edit1.SetBounds(R.Left,R.Top,R.Right-R.Left,R.Bottom-R.Top);
    Dec(Sub);
    Edit1.Text:=Item.SubItems[Sub];
    Edit1.Visible:=True;
  end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    Item.SubItems[Sub]:=Edit1.Text;
    Edit1.Visible:=False;
  end;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  Form5.ShowModal;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
  ShowMessage('��������� ��� ������ � BTL-������� (����������� �������) ������'
  +' 5.0 <������ CadWork> '+#10#13+
  '��������� �������, ��� "������ ����� ��������" 2019 ���.'+#10#13
  +'+79231621108'+#10#13+'kadrinstk@yandex.ru'+#10#13+'bubaeshka@yandex.ru');
end;

procedure TForm1.N15Click(Sender: TObject);
var i,h:integer;
    fs:boolean;
begin
  if assigned(Btl) then if assigned(btl.progs) then if btl.progs.Count>0 then
  begin
    h:=TProgs(Btl.progs[0]).h;
    fs:=true;
    for i:=0 to btl.progs.Count-1 do if TProgs(Btl.progs[i]).h<>h then begin
      ShowMessage('������! ���� �������� ������ ������ �������!');
      fs:=false;
      Break;
    end;
    if fs then Form6.Show;
  end;
end;

procedure TForm1.N16Click(Sender: TObject);
var i:integer;
begin
  if assigned(Btl) then if assigned(btl.progs) then if btl.progs.Count>0 then
  begin
    for i:=0 to btl.progs.Count-1 do
      TProgs(btl.progs[i]).perestanovka;
    ShowMessage('������������ ��������� �������!');
  end;
end;

procedure TForm1.N17Click(Sender: TObject);
begin
  Btl.nprz(2);
  listprog;
end;

procedure TForm1.N18Click(Sender: TObject);
var i:integer;
begin
  if assigned(Btl) then if assigned(Btl.progs) then if Btl.progs.Count>0 then
  for i:=0 to btl.progs.Count-1 do TProgs(Btl.progs[i]).changesidecut;
  ShowMessage('�������� ��������');
end;

procedure TForm1.N19Click(Sender: TObject);
begin
  perestavka(1,false);
end;

procedure TForm1.N21Click(Sender: TObject);
begin
  Form7.Show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  N7Click(self);  
end;

procedure TForm1.N22Click(Sender: TObject);
begin
  Form8.Show;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
  Form9.Show;
end;

procedure TForm1.N25Click(Sender: TObject);
begin
  perestavka(2,false);
end;

procedure TForm1.N26Click(Sender: TObject);
var i,pr_count:integer;
begin
  if assigned(Btl) then if assigned(Btl.progs) then
    if Btl.progs.Count>0 then begin
      pr_count:=0;
      for i:=0 to Btl.progs.Count-1 do begin
        pr_count:=pr_count+TProgs(Btl.progs[i]).removebadcut;
      end;
      ShowMessage('������� '+inttostr(pr_count)+' �������� � '+inttostr(Btl.progs.Count)+' ����������');
  end;
end;

procedure TForm1.perestavka(cases:byte;polubrus:boolean);
var i,zy:integer;
    uopok,uopcancel:boolean; //������������� �� ��������?
begin
  if assigned(Btl) then if assigned(btl.progs) then if btl.progs.Count>0 then
  begin
    zy:=0;
    uopok:=false;
    uopcancel:=false;
    for i:=0 to btl.progs.Count-1 do begin
      //������� ��������� �������������?
      if not TProgs(btl.progs[i]).sorted then
        //���� �� �������������, ������������ ������ �����������?
        //���� ������, �� ���������
        if uopok then TProgs(btl.progs[i]).changesidecut else
          //���� �� ������ ����������� ����� ������ �� ����������, ���� ������ �� �������
          if not uopcancel then
            case messagebox(self.Handle,PChar('����� �������� ���, �������� �� �����������, �����������?'),
                 PChar('�� �������?'),MB_OKCANCEL) of
              IDOK: begin TProgs(btl.progs[i]).changesidecut; uopok:=true; end;
              IDCANCEL: uopcancel:=true;
            end;
      //������ ������� �����, ������������ ���������� ���������.
      zy:=zy+TProgs(btl.progs[i]).perestanovkaCadWork(cases,polubrus);
    end;
    ShowMessage('������������ ��������� �������! ����������� ����� '+inttostr(zy));
  end;

end;

procedure TForm1.N27Click(Sender: TObject);
begin
  perestavka(1,true);
end;

procedure TForm1.N28Click(Sender: TObject);
begin
  perestavka(2,true);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
var i:integer;
begin
  if CheckBox1.Checked then begin
      for i:=0 to ListView2.Items.Count-1 do
         ListView2.Items[i].Checked:=true;
    end else begin
      for i:=0 to ListView2.Items.Count-1 do
        ListView2.Items[i].Checked:=false;
  end;
end;

procedure TForm1.N29Click(Sender: TObject);
begin
  if OpenDialog1.Execute then if assigned(Btl) then begin
    Btl.load(OpenDialog1.FileName);
    if assigned(Btl.progs) then begin
      Label2.Caption:=inttostr(Btl.progs.Count);
      listprog;
    end;  
  end;    
end;

procedure TForm1.N30Click(Sender: TObject);
var fff:textfile;
    i:integer;
begin
  if SaveDialog2.Execute then begin
    if (SaveDialog2.FileName<>'') and assigned(Btl) and assigned(Btl.progs) and (Btl.progs.Count>0) then begin
      assignfile(fff,SaveDialog2.FileName);
      rewrite(fff);
      for i:=0 to Btl.progs.Count-1 do writeln(fff,TProgs(Btl.progs[i]).comment);
      closefile(fff);
    end;
  end;
end;

end.
