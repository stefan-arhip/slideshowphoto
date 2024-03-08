unit _MouseImage_;

interface

uses
Windows, Messages, SysUtils, Classes, Controls, ExtCtrls;

type
TMouseImage = class(TImage)
private
{ D�clarations priv�es }
FOnMouseEnter: TNotifyEvent;
FOnMouseLeave: TNotifyEvent;
protected
{ D�clarations prot�g�es }
procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
public
{ D�clarations publiques }
constructor Create(AOwner: TComponent); override;
published
{ D�clarations publi�es }
property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
end;

procedure Register;

implementation

constructor TMouseImage.Create(AOwner: TComponent);
begin
inherited Create(AOwner);
FOnMouseEnter := nil;
FOnMouseLeave := nil;
end;

procedure TMouseImage.CMMouseEnter(var Msg: TMessage);
begin
If Assigned(FOnMouseEnter) then FOnMouseEnter(Self);
end;

procedure TMouseImage.CMMouseLeave(var Msg: TMessage);
begin
If Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
end;

procedure Register;
begin
RegisterComponents('Exemples', [TMouseImage]);
end;

End.






