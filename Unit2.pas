unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Iesire1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.DFM}

procedure TForm2.FormCreate(Sender: TObject);
begin
  left:=0;
  top:=0;
  width:=screen.Width;
  height:=screen.height;
  color:=clblack;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  form1.timer1.enabled:=false;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  form1.timer1.enabled:=true;
end;        

procedure TForm2.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
