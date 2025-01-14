unit print;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, QuickRpt, ComCtrls, Printers, Buttons, Contnrs;

type
  TPrintPanel = class(TPanel)
  public
    property Canvas;
  end;

/////////////////////////////////////////////////////////////////////
  TEdit = class(StdCtrls.TEdit)
  private
    FAlignment: TAlignment;
    procedure SetAlignment(Value: TAlignment);
  protected
    procedure KeyPress(var Key: Char); override;
    procedure CreateParams(var Params: TCreateParams); override;
  published
    property Alignment: TAlignment read FAlignment write SetAlignment;
  end;
////////////////////////////////////////////////////////////////////////

  TForm8 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Button3: TButton;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PrintDialog1: TPrintDialog;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure showd;
    procedure Button3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    listPan: TObjectList;
    printPan: TPrintPanel;
    ap:integer;
  public
    { Public declarations }
  end;

const
  PRWIDTH=480;
  PRHEIGHT=620;

var
  Form8: TForm8;

implementation

uses main, temp;

{$R *.dfm}

///////////////////////////////////////////////////////////////
procedure TEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  case Alignment of
    taLeftJustify:
      Params.Style:= Params.Style or ES_LEFT and not ES_MULTILINE;
    taRightJustify:
      Params.Style:= Params.Style or ES_RIGHT and not ES_MULTILINE;
    taCenter:
      Params.Style:= Params.Style or ES_CENTER and not ES_MULTILINE;
  end;
end;

procedure TEdit.KeyPress(var Key: Char);
begin
  inherited;
end;

procedure TEdit.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment:= Value;
    RecreateWnd;
  end;
end;
//////////////////////////////////////////////////////////////////////////

procedure TForm8.Button1Click(Sender: TObject);
begin
  Form8.Close;
end;

procedure TForm8.showd;
var i,wd,tp,wdd,hdd,np, h_div, h_half, max_wdd,wid_ost, wid_wdd:integer;
    ratio:real;
    ed0,ed,ed1,ed2,ed3:Tedit;
begin
  ap:=0;
  if (assigned(Btl)) then begin
    if (Btl.progs.Count>0) then begin
      if trystrtoint(Edit1.Text,wdd) then begin
        ratio:=wdd/55;
        hdd:=round((25*ratio-1)*0.8);
      end else begin wdd:=55; hdd:=25; end;
      listPan:=TObjectList.Create;
      listPan.OwnsObjects:=true;
      printPan:=TPrintPanel.Create(Form8);
      np:=0;
      with printPan do begin
        Parent:=Form8;
        Width:=PRWIDTH;
        Height:=PRHEIGHT;
        top:=30;
        left:=5;
        name:='panel0';
        visible:=true;
        color:=clWhite;
        caption:='';
        Canvas.Font.Height:=hdd-4;
        Canvas.Font.Style:=[fsBold];
        Canvas.Font.Name:='Arial';
        max_wdd:=0;
        for i:=0 to Btl.progs.Count-1 do
          if Canvas.TextWidth(TProgs(Btl.progs[i]).comment)>max_wdd then
            max_wdd:=Canvas.TextWidth(TProgs(Btl.progs[i]).comment);
        wdd:=max_wdd+5;
      end;
      listPan.Add(printPan);
      h_half:=hdd div 2;
      h_div:=hdd mod 2;
      wd:=-1*wdd+20;
      tp:=25;
      for i:=0 to Btl.progs.Count-1 do begin
        if (wd+2*wdd+5)<PRWIDTH then wd:=wd+wdd+5
          else begin
            wd:=25;
            tp:=tp+2*hdd+5;
          end;
        if (tp+2*hdd+35)>PRHEIGHT then begin
          np:=np+1;
          printPan:=TPrintPanel.Create(Form8);
          with printPan do begin
            Parent:=Form8;
            Width:=PRWIDTH;
            Height:=PRHEIGHT;
            top:=30;
            left:=5;
            name:='panel'+inttostr(np);
            tp:=25;
            wd:=25;
            visible:=false;
            color:=clWhite;
            caption:='';
          end;
          listPan.Add(printPan);
        end;
        ed0:=TEdit.Create(Form8);
        with ed0 do begin
          Parent:=TPrintPanel(listPan.Items[np]);
          AutoSize:=false;
          Alignment:=taCenter;
          Left:=wd;
          Top:=tp;
          Height:=h_half+1;
          Width:=wdd;
          font.Height:=round((hdd-4)/2)-4;
          font.Style:=[fsBold];
          font.Name:='Arial';
          ctl3D:=false;
          Text:=Edit3.Text;
        end;
        ed:=TEdit.Create(Form8);
        with ed do begin
          Parent:=TPrintPanel(listPan.Items[np]);
          AutoSize:=false;
          Alignment:=taCenter;
          Left:=wd;
          Top:=tp+h_half;
          Height:=hdd+h_div;
          Width:=wdd;
          font.Height:=hdd-4;
          font.Style:=[fsBold];
          font.Name:='Arial';
          ctl3D:=false;
          Text:=copy(TProgs(Btl.progs[i]).comment,
             pos('_',TProgs(Btl.progs[i]).comment)+1,length(TProgs(Btl.progs[i]).comment));
        end;
        /////////////////////////////////////
        ed1:=TEdit.Create(Form8);
        with ed1 do begin
          Parent:=TPrintPanel(listPan.Items[np]);
          AutoSize:=false;
          Alignment:=taCenter;
          Left:=wd;
          Top:=tp+hdd+h_half+h_div-1;
          Height:=h_half+1;
          wid_wdd:=wdd div 3;
          Width:=wid_wdd;
          wid_ost:=wdd mod 3;
          font.Height:=round((hdd-4)/2)-2;
          font.Style:=[fsBold];
          font.Name:='Arial';
          Text:='N '+
            copy(TProgs(Btl.progs[i]).comment,0,pos('_',TProgs(Btl.progs[i]).comment)-1);
          ctl3D:=false;
        end;
        ed2:=TEdit.Create(Form8);
        with ed2 do begin
          Parent:=TPrintPanel(listPan.Items[np]);
          AutoSize:=false;
          Alignment:=taCenter;
          Left:=wd+wid_wdd-5;
          Top:=tp+hdd+h_half+h_div-1;
          Height:=h_half+1;
          Width:=wid_wdd;
          font.Height:=round((hdd-4)/2)-2;
          font.Name:='Arial';
          Text:='���� '+Edit2.Text;
            copy(TProgs(Btl.progs[i]).comment,0,pos('_',TProgs(Btl.progs[i]).comment)-1);
          ctl3D:=false;
        end;
        ed3:=TEdit.Create(Form8);
        with ed3 do begin
          Parent:=TPrintPanel(listPan.Items[np]);
          AutoSize:=false;
          Alignment:=taCenter;
          Left:=wd+2*wid_wdd-6;
          Top:=tp+hdd+h_half+h_div-1;
          Height:=h_half+1;
          Width:=wid_wdd+wid_ost+6;
          font.Height:=round((hdd-4)/2)-2;
          font.Name:='Arial';
          Text:='L '+floattostrf(TProgs(Btl.progs[i]).long/10,ffFixed,5,1);
            copy(TProgs(Btl.progs[i]).comment,0,pos('_',TProgs(Btl.progs[i]).comment)-1);
          ctl3D:=false;
        end;
        /////////////////////////////////////
      end;
    end;
    if listPan.Count>1 then BitBtn2.Enabled:=true;
    label1.Caption:='�������� 1 �� '+inttostr(listPan.Count);
    button2.Enabled:=true;
    button3.Enabled:=true;
  end else begin
    label1.Caption:='������ ��������';
    button2.Enabled:=false;
    button3.Enabled:=false;
  end;
  BitBtn1.Enabled:=false;
end;

procedure TForm8.Button2Click(Sender: TObject);
var Bitmap:TBitmap;
    ratio:real;
    newwidth,newheight,i,j,from_page,to_page:integer;
////////////////////////////////////////////////////
    infoSize,imageSize:DWord;
    info:PBitmapInfo;
    image:Pointer;
////////////////////////////////////////////////////
begin
  if assigned(listPan) then begin
    printDialog1.MinPage:=1;
    printDialog1.MaxPage:=listPan.Count;
    printDialog1.ToPage:=listPan.Count; 
    printDialog1.Options := [poPageNums];
    if printDialog1.Execute then begin
      from_page:=printDialog1.FromPage;
      to_page:=printDialog1.ToPage;
      Printer.BeginDoc;
      for i:=from_page-1 to to_page-1 do begin
        for j:=0 to listpan.Count-1 do
          if j<>i then TPrintPanel(listpan.Items[j]).Visible:=false else
            TPrintPanel(listpan.Items[j]).Visible:=true;
        self.Repaint;
        Bitmap:=TBitmap.Create;
        Bitmap.PixelFormat:=pf24bit;
        Bitmap.Height:=PRHEIGHT;
        Bitmap.Width:=PRWIDTH;
        Bitmap.Canvas.CopyRect(Rect(0,0,PRWIDTH,PRHEIGHT),TPrintPanel(listpan.Items[i]).Canvas,Rect(0,0,PRWIDTH,PRHEIGHT));
        ratio:=Printer.PageWidth/PRWIDTH;
        newwidth:=round(PRWIDTH*ratio-1);
        newheight:=round(PRHEIGHT*ratio-1);
        label1.Caption:='������ �������� '+inttostr(i+1)+' �� '+inttostr(listpan.Count) ;
        Printer.Canvas.Refresh;
///////////////////////////////////////////////////////////////////
        GetDIBSizes(Bitmap.Handle,infoSize,imageSize);
        info:=AllocMem(infoSize);
        try
          image:=AllocMem(imageSize);
          try
            GetDIB(Bitmap.Handle,0,info^,image^);
            StretchDIBits(Printer.Canvas.Handle,0,0,newwidth,newheight,
              0,0,PRWIDTH,PRHEIGHT,image,info^,DIB_RGB_COLORS,SRCCOPY);
          finally
            FreeMem(image,imagesize);
          end;
        finally
          FreeMem(info,infosize);
        end;
///////////////////////////////////////////////////////////////////
//        Printer.Canvas.StretchDraw(Rect(0,0,newwidth,newheight),Bitmap);
////////////////////////////////////////////////////////////////////
        if i<(to_page-1) then Printer.NewPage;
        Bitmap.Free;
      end;
      Printer.EndDoc;
      label1.Caption:='�������� '+inttostr(listPan.Count)+' �� '+inttostr(listPan.Count);
      BitBtn1.Enabled:=true;
      BitBtn2.Enabled:=false;
      ap:=listPan.Count-1;
    end;
  end;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if assigned(listPan) then begin
    listPan.Clear;
    listPan.Free;
  end;
  button2.Enabled:=true;
  button3.Enabled:=true;
  label1.Caption:='��������������� ��������:';
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
  if assigned(listPan)then 
    if listPan.Count>0 then begin listPan.Clear;
    listPan.Free;
  end;
  showd;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
var i:integer;
begin
  if assigned(listPan) then begin
    if (listPan.Count-1)>ap then begin
      ap:=ap+1;
      for i:=0 to listpan.Count-1 do
        if ap<>i then begin
          TPrintPanel(listPan.Items[i]).Visible:=false;
          TPrintPanel(listPan.Items[i]).SendToBack;
        end else begin
          TPrintPanel(listPan.Items[i]).Visible:=true;
          TPrintPanel(listPan.Items[i]).BringToFront;
        end;
      self.Repaint;
    end;
    label1.Caption:='�������� '+inttostr(ap+1)+' �� '+inttostr(listPan.Count);
    if (listPan.Count-1)<=ap then BitBtn2.Enabled:=false;
    if ap>0 then BitBtn1.Enabled:=true;
  end;
end;

procedure TForm8.BitBtn1Click(Sender: TObject);
var i:integer;
begin
  if assigned(listPan) then begin
    if ap>0 then begin
      if ap=1 then BitBtn1.Enabled:=false;
      if ap<=(listPan.Count-1) then BitBtn2.Enabled:=true;
      ap:=ap-1;
    end else BitBtn1.Enabled:=false;
    for i:=0 to listpan.Count-1 do
      if ap<>i then begin
        TPrintPanel(listPan.Items[i]).Visible:=false;
        TPrintPanel(listPan.Items[i]).SendToBack;
      end else begin
        TPrintPanel(listPan.Items[i]).Visible:=true;
        TPrintPanel(listPan.Items[i]).BringToFront;
      end;
    self.Repaint;
    label1.Caption:='�������� '+inttostr(ap+1)+' �� '+inttostr(listPan.Count);
  end;
end;

end.
