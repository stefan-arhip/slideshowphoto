unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Menus, Buttons, ExtCtrls;

type
  TForm3 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.DFM}

procedure TForm3.FormCreate(Sender: TObject);
begin
    StringGrid1.Cells[0,0]:='Tasta';
    StringGrid1.Cells[1,0]:='Actiune';
    StringGrid1.Cells[0,1]:='[A] sau [F]';
    StringGrid1.Cells[1,1]:='afisarea acestui mesaj';
    StringGrid1.Cells[0,2]:='[P]';
    StringGrid1.Cells[1,2]:='vizualizare poze/afisarea altei poze';
    StringGrid1.Cells[0,3]:='[F]';
    StringGrid1.Cells[1,3]:='vizualizare filme/afisarea altui film';
    StringGrid1.Cells[0,4]:='[Space]';
    StringGrid1.Cells[1,4]:='schimba poza sau filmul afisat curent';
    StringGrid1.Cells[0,5]:='[PageUp]';
    StringGrid1.Cells[1,5]:='mareste pozele filmul';
    StringGrid1.Cells[0,6]:='[PageDown]';
    StringGrid1.Cells[1,6]:='micsoreaza pozele/filmul';
    StringGrid1.Cells[0,7]:='[Enter] sau [click]';
    StringGrid1.Cells[1,7]:='vizualizare pe tot ecranul (poze)/iesire din vizualizare pe tot ecranul';
    StringGrid1.Cells[0,8]:='[I] sau [Esc]';
    StringGrid1.Cells[1,8]:='iesire din program';
end;

procedure TForm3.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
