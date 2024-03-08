unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, MPlayer, Menus, Jpeg, _MouseImage_, PicShow, StdCtrls, Spin, FileCtrl,
  ComCtrls, Gauges;

type
  TForm1 = class(TForm)
    MouseImage1: TMouseImage;
    Image1: TImage;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    MouseImage2: TMouseImage;
    Image2: TImage;
    Image3: TImage;
    MouseImage3: TMouseImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    SpinEdit3: TSpinEdit;
    Notebook1: TNotebook;
    MediaPlayer1: TMediaPlayer;
    PicShow1: TPicShow;
    Timer1: TTimer;
    Muzica: TMediaPlayer;
    Timer2: TTimer;
    Animate1: TAnimate;
    Film: TMediaPlayer;
    FileListBox1: TFileListBox;
    Timer3: TTimer;
    N1: TMenuItem;
    Poze1: TMenuItem;
    Filme1: TMenuItem;
    Iesire1: TMenuItem;
    N2: TMenuItem;
    Fullscreen1: TMenuItem;
    Image4: TImage;
    MouseImage4: TMouseImage;
    N3: TMenuItem;
    Ajutor1: TMenuItem;
    Ajutor2: TMenuItem;
    Gauge1: TGauge;
    Schimbapozasaufilmul1: TMenuItem;
    N4: TMenuItem;
    Marestezonavizualizata1: TMenuItem;
    Micsoreazazonavizualizata1: TMenuItem;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure MouseImage1MouseEnter(Sender: TObject);
    procedure MouseImage1MouseLeave(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure MouseImage2MouseEnter(Sender: TObject);
    procedure MouseImage2MouseLeave(Sender: TObject);
    procedure MouseImage1Click(Sender: TObject);
    procedure MouseImage3MouseEnter(Sender: TObject);
    procedure MouseImage3MouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure PicShow1Complete(Sender: TObject);
    procedure MouseImage2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PicShow1MouseEnter(Sender: TObject);
    procedure PicShow1MouseLeave(Sender: TObject);
    procedure PicShow1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Fullscreen1Click(Sender: TObject);
    procedure MouseImage4Click(Sender: TObject);
    procedure MouseImage4MouseEnter(Sender: TObject);
    procedure MouseImage4MouseLeave(Sender: TObject);
    procedure Schimbapozasaufilmul1Click(Sender: TObject);
    procedure Marestezonavizualizata1Click(Sender: TObject);
    procedure Micsoreazazonavizualizata1Click(Sender: TObject);
  private
    { Private declarations }
    PicPath: String;
    Pictures: TStringList;
    procedure ShowNextImage;
    procedure LoadNextImage;
    procedure CreateImageList(Path: String);
  public
    { Public declarations }
    NameOfLoadedFile:String;
  end;

var
  Form1: TForm1;
  indexfilm:integer;

implementation

uses Unit2, Unit3;

{$R *.DFM}

Function Extragere(t:AnsiString;i:Integer;b:Boolean):AnsiString;
Var s:AnsiString;
Begin
  s:=t;
  If b Then
    Delete(s,Length(s)-i+1,Length(s))
  Else
    Delete(s,1,Length(s)-i);
  Extragere:=s;
End;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FileListBox1.Mask:='*.avi';
  FileListBox1.Directory:=ExtractFilePath(Application.ExeName)+'dvd\';
  Randomize;
  indexfilm:=Random(FileListBox1.Items.Capacity-1);
  film.filename:=FileListbox1.Directory+'\'+FileListbox1.Items[indexfilm];
  muzica.filename:=ExtractFilePath(Application.ExeName)+'\butoane\M.wav';
  muzica.open;
  muzica.play;
  Color:=clBlack;
  Left:=0;
  Top:=0;
  width:=screen.width;
  height:=screen.height;
  mouseimage1.picture:=nil;
  mouseimage1.left:=10;//(width-mouseimage1.width) div 3;
  mouseimage1.top:=10;//height-mouseimage1.height-20;
  image1.picture.loadfromfile(ExtractFilePath(Application.ExeName)+'butoane\P_2.bmp');
  image1.left:=mouseimage1.left;
  image1.top:=mouseimage1.top;
  mouseimage2.picture:=nil;
  mouseimage2.left:=10+mouseimage1.width+10;//((width-mouseimage2.width) div 3)*2;
  mouseimage2.top:=10;//height-mouseimage2.height-20;
  image2.picture.loadfromfile(ExtractFilePath(Application.ExeName)+'butoane\F_2.bmp');
  image2.left:=mouseimage2.left;
  image2.top:=mouseimage2.top;
  mouseimage3.picture:=nil;
  mouseimage3.left:=width-mouseimage3.width-10;
  mouseimage3.top:=10;
  image3.picture.loadfromfile(ExtractFilePath(Application.ExeName)+'butoane\X_2.bmp');
  image3.left:=width-image3.width-10;
  image3.top:=10;
  mouseimage4.picture:=nil;
  mouseimage4.left:=width-mouseimage4.width-mouseimage3.width-10-10;
  mouseimage4.top:=10;
  image4.picture.loadfromfile(ExtractFilePath(Application.ExeName)+'butoane\A_2.bmp');
  image4.left:=mouseimage4.left;
  image4.top:=mouseimage4.top;
  MediaPlayer1.FileName:=ExtractFilePath(Application.ExeName)+'butoane\B.wav';
  notebook1.height:=450;//height-2*(mouseimage1.height+20);      //450
  notebook1.width:=600;//Round(width*450/600);       //600
  notebook1.left:=(width-notebook1.width) div 2;
  notebook1.top:=(height-notebook1.height) div 2;
  picshow1.width:=notebook1.width;
  picshow1.height:=notebook1.height;
  picshow1.left:=0;
  picshow1.top:=0;
  SpinEdit1.MaxValue := High(TShowStyle);
  SpinEdit1.Value := 0;//126;118
  CheckBox1.Checked := PicShow1.Threaded;
  SpinEdit2.Value := PicShow1.Step;
  Gauge1.Left:=Notebook1.Left;
  Gauge1.Top:=Notebook1.Top+Notebook1.Height+10;
  Gauge1.Width:=Notebook1.Width;
  Gauge1.Height:=15;
  Bevel1.Left:=Gauge1.Left;
  Bevel1.Top:=Gauge1.Top;
  Bevel1.Width:=Gauge1.Width;
  Bevel1.Height:=Gauge1.Height;
//  With Image5 Do
//    Begin
//      Left:=Notebook1.left;
//      Top:=NoteBook1.Top;
//      Width:=NoteBook1.Width;
//      Height:=NoteBook1.Height;
//    End;
  Pictures := TStringList.Create;
  CreateImageList(ExtractFilePath(Application.ExeName)+'poze mici\');
  LoadNextImage;
  CheckBox3Click(Sender);
  MouseImage1Click(Sender);
end;

procedure TForm1.MouseImage1MouseEnter(Sender: TObject);
begin
  MouseImage1.picture.loadfromfile(ExtractFilePath(Application.ExeName)+'butoane\P_1.bmp');
  MediaPlayer1.open;
  MediaPlayer1.play;
end;

procedure TForm1.MouseImage1MouseLeave(Sender: TObject);
begin
  mouseimage1.picture:=nil;
  MediaPlayer1.stop;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MouseImage2MouseEnter(Sender: TObject);
begin
  MouseImage2.picture.loadfromfile(ExtractFilePath(Application.ExeName)+'butoane\F_1.bmp');
  MediaPlayer1.open;
  MediaPlayer1.play;
end;

procedure TForm1.MouseImage2MouseLeave(Sender: TObject);
begin
  mouseimage2.picture:=nil;
  MediaPlayer1.stop;
end;

procedure TForm1.MouseImage1Click(Sender: TObject);
begin
  Gauge1.Visible:=False;
  Bevel1.Visible:=Gauge1.Visible;
  Timer1.Enabled:=true; //pornesc derularea pozelor
  timer2.Enabled:=true; //pornesc re-pornirea muzicii de fundal
  timer3.Enabled:=false;  //opresc derularea filmelor
  try
    film.PauseOnly;    //daca era "film.pause" o data face PAUSE o data PLAY
  except
  end;
  NoteBook1.ActivePage:='P';
  ShowNextImage;
end;

procedure TForm1.MouseImage3MouseEnter(Sender: TObject);
begin
  MouseImage3.picture.loadfromfile(ExtractFilePath(Application.ExeName)+'butoane\X_1.bmp');
  MediaPlayer1.open;
  MediaPlayer1.play;
end;

procedure TForm1.MouseImage3MouseLeave(Sender: TObject);
begin
  mouseimage3.picture:=nil;
  MediaPlayer1.stop;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Pictures.Free;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  PicShow1.Style := SpinEdit1.Value;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
  PicShow1.Step := SpinEdit2.Value;
end;

procedure TForm1.PicShow1Complete(Sender: TObject);
begin
  LoadNextImage;
end;

procedure TForm1.ShowNextImage;
begin
  if Pictures.Count = 0
    then
      Exit;
  if PicShow1.Busy
    then
      begin
        PicShow1.Stop;
        PicShow1Complete(Self);
      end;
  PicShow1.Execute;
end;

procedure TForm1.LoadNextImage;
const CurrentImage: String = '';
var   Index: Integer;
begin
  if Pictures.Count > 0 then
  begin
    NameOfLoadedFile:=PicPath + CurrentImage;
    repeat
      Index := Random(Pictures.Count);
    until (Pictures.Count <= 1) or (CurrentImage <> Pictures[Index]);
    CurrentImage := Pictures[Index];
    PicShow1.Picture.LoadFromFile(PicPath + CurrentImage);
  end;
end;

procedure TForm1.CreateImageList(Path: String);
var
  FileList: TFileListBox;
begin
  FileList := TFileListBox.Create(Self);
  try
    FileList.Parent := Self;
    FileList.Visible := False;
    FileList.Mask := GraphicFileMask(TGraphic);
    FileList.Directory := Path;
    if FileList.Items.Count > 0 then
    begin
      Pictures.Assign(FileList.Items);
      if (Length(Path) > 0) and (Path[Length(Path)] <> '\') then
        PicPath := Path + '\'
      else
        PicPath := Path;
    end;
  finally
    FileList.Free;
  end;
end;

procedure TForm1.MouseImage2Click(Sender: TObject);
var where:trect;
begin
  Gauge1.Visible:=True;
  Bevel1.Visible:=Gauge1.Visible;
  NoteBook1.ActivePage:='F';
  Timer1.Enabled:=False; //opresc derularea pozelor
  Timer2.Enabled:=False; //opresc re-pornirea muzicii de fundal
  Timer3.Enabled:=true;  //pornesc derularea filmelor
  muzica.PauseOnly;
  try
    with film do
      begin
        Inc(indexfilm);
        if indexfilm>=filelistbox1.items.capacity then
          indexfilm:=0;
        film.filename:=FileListbox1.Directory+'\'+FileListbox1.Items[indexfilm];
        open;
        play;
      end;
    Animate1.Visible:=true;
    with where do
      begin
        left:=0;
        top:=0;
        right:=NoteBook1.Width;
        bottom:=Notebook1.height;
      end;
    film.DisplayRect:=where;
  except
(*    if MessageDlg('Vizionarea secventelor de film necesita instalarea codec-ului DivX!'#13+
                  'Pentru a instala codec-ul apasati <OK> si urmati instructiunile de instalare.'#13#13+
                  'Dupa ce codec-ul a fost instalat, rulati filmul.',
                  mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
      begin
        try;
          ExecuteFile(codec_adresa,'','',1);
          //Startclick(Sender);
        except

        end;
      end;*)
  end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox3.Checked;
  Label3.Enabled:=CheckBox3.Checked;
  SpinEdit3.Enabled:=CheckBox3.Checked;
end;

procedure TForm1.SpinEdit3Change(Sender: TObject);
begin
  Timer1.Interval:=SpinEdit3.Value*1000;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  If PicShow1.Busy Then
  Else
    ShowNextImage;
  If CheckBox2.Checked Then
    SpinEdit1.Value:=Random(SpinEdit1.MaxValue);
end;

procedure TForm1.PicShow1MouseEnter(Sender: TObject);
begin
//  timer1.Enabled:=false;
end;

procedure TForm1.PicShow1MouseLeave(Sender: TObject);
begin
//  Button1Click(sender);
//  timer1.Enabled:=true;
end;

procedure TForm1.PicShow1Click(Sender: TObject);
var xy:extended;
begin
  form2.image2.Picture.LoadFromFile(Extragere(NameOfLoadedFile,25,true)+'dvd\'+Extragere(NameOfLoadedFile,15,false));
  form2.image1.picture:=form2.image2.picture;
  xy:=form2.image2.width/form2.image2.height;
  if form2.image2.width<form2.image2.height then
    begin
      form2.image1.height:=form2.height;
      form2.image1.width:=round(form2.image1.height*xy);
    end
  else
    begin
      form2.image1.width:=form2.width;
      form2.image1.height:=round(form2.image1.width/xy);
    end;
  form2.image1.left:=(form2.width-form2.image1.width) div 2;;
  form2.image1.top:=(form2.height-form2.image1.height) div 2;
  form2.showmodal;
  //showmessage(Extragere(NameOfLoadedFile,20,true)+'mari\'+Extragere(NameOfLoadedFile,15,false));
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  with muzica do
    if position>EndPos-10 then play;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
Var Where:TRect;
begin
  //Label6.Caption:=IntToStr(film.position)+'/'+IntToStr(film.length);
  Gauge1.MinValue:=0;
  Gauge1.MaxValue:=Film.Length;
  Gauge1.Progress:=Film.Position;
  with film do
    if position>=film.length then
      begin
        Inc(indexfilm);
        if indexfilm>=filelistbox1.items.capacity then
          indexfilm:=0;
        film.filename:=FileListbox1.Directory+'\'+FileListbox1.Items[indexfilm];
        open;
        play;
        where.left:=0;
        where.top:=0;
        where.right:=NoteBook1.Width;
        where.bottom:=Notebook1.height;
        DisplayRect:=where;
      end;
end;

procedure TForm1.Fullscreen1Click(Sender: TObject);
begin
  If NoteBook1.ActivePage='P' Then
    PicShow1Click(Sender)
  Else
    //
end;

procedure TForm1.MouseImage4Click(Sender: TObject);
begin
(*  ShowMessage('Ajutor:'#13+
              '[A,F1]        - afisarea acestui mesaj'+#13+
              '[P]           - vizualizare poze/afisarea altei poze'+#13+
              '[F]           - vizualizare filme/afisarea altui film'+#13+
              '[Space]       - schimba poza sau filmul afisat curent'+#13+
              '[PageUp]      - mareste pozele filmul'+#13+
              '[PageDown]    - micsoreaza pozele/filmul'+#13+
              '[Enter/click] - vizualizare pe tot ecranul (poze)/iesire din vizualizare pe tot ecranul'+#13+
              '[I,Esc]       - iesire din program');*)
  Form3.ShowModal;            
end;

procedure TForm1.MouseImage4MouseEnter(Sender: TObject);
begin
  MouseImage4.picture.loadfromfile(ExtractFilePath(Application.ExeName)+'butoane\A_1.bmp');
  MediaPlayer1.open;
  MediaPlayer1.play;
end;

procedure TForm1.MouseImage4MouseLeave(Sender: TObject);
begin
  mouseimage4.picture:=nil;
  MediaPlayer1.stop;
end;

procedure TForm1.Schimbapozasaufilmul1Click(Sender: TObject);
begin
  If NoteBook1.ActivePage='P' Then
    MouseImage1Click(Sender)
  Else
    MouseImage2Click(Sender);
end;

procedure TForm1.Marestezonavizualizata1Click(Sender: TObject);
Var xy:Extended;
    Where:TRect;
begin
  xy:=NoteBook1.Width/NoteBook1.Height;
  NoteBook1.Width:=NoteBook1.Width+50;
  Repeat
    NoteBook1.Width:=NoteBook1.Width-5;
    NoteBook1.Height:=Round(NoteBook1.Width/xy);
  Until (NoteBook1.Width<=Width) And (NoteBook1.Height<=Height-2*(MouseImage1.Height+20));
  NoteBook1.Left:=(Width-NoteBook1.Width) Div 2;
  NoteBook1.Top:=(Height-NoteBook1.Height) Div 2;
  with where do
    begin
      left:=0;
      top:=0;
      right:=NoteBook1.Width;
      bottom:=Notebook1.height;
    end;
  film.DisplayRect:=where;
  Gauge1.Left:=Notebook1.Left;
  Gauge1.Top:=Notebook1.Top+Notebook1.Height+10;
  Gauge1.Width:=Notebook1.Width;
  Gauge1.Height:=15;
  Bevel1.Left:=Gauge1.Left;
  Bevel1.Top:=Gauge1.Top;
  Bevel1.Width:=Gauge1.Width;
  Bevel1.Height:=Gauge1.Height;
end;

procedure TForm1.Micsoreazazonavizualizata1Click(Sender: TObject);
Var xy:Extended;
    Where:TRect;
begin
  xy:=NoteBook1.Width/NoteBook1.Height;
  NoteBook1.Width:=NoteBook1.Width-50;
  If NoteBook1.Width<320 Then NoteBook1.Width:=320;
  NoteBook1.Height:=Round(NoteBook1.Width/xy);
  NoteBook1.Left:=(Width-NoteBook1.Width) Div 2;
  NoteBook1.Top:=(Height-NoteBook1.Height) Div 2;
  with where do
    begin
      left:=0;
      top:=0;
      right:=NoteBook1.Width;
      bottom:=Notebook1.height;
    end;
  film.DisplayRect:=where;
  Gauge1.Left:=Notebook1.Left;
  Gauge1.Top:=Notebook1.Top+Notebook1.Height+10;
  Gauge1.Width:=Notebook1.Width;
  Gauge1.Height:=15;
  Bevel1.Left:=Gauge1.Left;
  Bevel1.Top:=Gauge1.Top;
  Bevel1.Width:=Gauge1.Width;
  Bevel1.Height:=Gauge1.Height;  
end;

end.
