unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnLightsWarningOn: TBitBtn;
    btnLightsWarningOff: TBitBtn;
    btnLightsAutomaticOn: TBitBtn;
    btnLightsAutomaticOff: TBitBtn;
    btnLightsRed: TButton;
    btnLightsRedYellow: TButton;
    btnLightsYellow: TButton;
    btnLightsGreen: TButton;
    Label1: TLabel;
    Label2: TLabel;
    labelTitle: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    shapeLightsBackground: TShape;
    shapeLightsRed: TShape;
    shapeLightsYellow: TShape;
    shapeLightsGreen: TShape;
    timerAutomaitc1: TTimer;
    timerAutomaitc2: TTimer;
    timerAutomaitc3: TTimer;
    timerAutomaitc4: TTimer;
    timerWarnLights: TTimer;
    procedure btnLightsAutomaticOffClick(Sender: TObject);
    procedure btnLightsAutomaticOnClick(Sender: TObject);
    procedure btnLightsGreenClick(Sender: TObject);
    procedure btnLightsRedClick(Sender: TObject);
    procedure btnLightsRedYellowClick(Sender: TObject);
    procedure btnLightsWarningOffClick(Sender: TObject);
    procedure btnLightsWarningOnClick(Sender: TObject);
    procedure btnLightsYellowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure timerAutomaitc1Timer(Sender: TObject);
    procedure timerAutomaitc2Timer(Sender: TObject);
    procedure timerAutomaitc3Timer(Sender: TObject);
    procedure timerAutomaitc4Timer(Sender: TObject);
    procedure timerWarnLightsTimer(Sender: TObject);
  private

  public
    var durationRed, durationRedYellow, durationGreen, durationYellow: Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnLightsRedClick(Sender: TObject);
begin
  //Lightsphase: Red
  shapeLightsRed.Brush.Color := clRed;
  shapeLightsYellow.Brush.Color := clBlack;
  shapeLightsGreen.Brush.Color := clBlack;
end;

procedure TForm1.btnLightsGreenClick(Sender: TObject);
begin
  //Lightsphase: Green
  shapeLightsRed.Brush.Color := clBlack;
  shapeLightsYellow.Brush.Color := clBlack;
  shapeLightsGreen.Brush.Color := clGreen;
end;

procedure TForm1.btnLightsAutomaticOnClick(Sender: TObject);
begin
  // disable all buttons !AutomaticOff
  btnLightsAutomaticOn.Enabled := false;
  btnLightsAutomaticOff.Enabled := true;
  btnLightsRed.Enabled := false;
  btnLightsRedYellow.Enabled := false;
  btnLightsYellow.Enabled := false;
  btnLightsGreen.Enabled := false;
  btnLightsWarningOn.Enabled := false;
  btnLightsWarningOff.Enabled := false;

  //reset Lights
  shapeLightsRed.Brush.Color := clBlack;
  shapeLightsYellow.Brush.Color := clBlack;
  shapeLightsGreen.Brush.Color := clBlack;

  //startAutomaticTimer
  timerAutomaitc1.Enabled  := true;
end;

procedure TForm1.btnLightsAutomaticOffClick(Sender: TObject);
begin
  // enable all buttons !( WarningOff, AutomaticOff )
  btnLightsAutomaticOn.Enabled := true;
  btnLightsAutomaticOff.Enabled := false;
  btnLightsRed.Enabled := true;
  btnLightsRedYellow.Enabled := true;
  btnLightsYellow.Enabled := true;
  btnLightsGreen.Enabled := true;
  btnLightsWarningOn.Enabled := true;
  btnLightsWarningOff.Enabled := false;

  //reset Lights
  shapeLightsRed.Brush.Color := clBlack;
  shapeLightsYellow.Brush.Color := clBlack;
  shapeLightsGreen.Brush.Color := clBlack;

  //disable all AutomaticTimers
  timerAutomaitc1.Enabled := false;
  timerAutomaitc2.Enabled := false;
  timerAutomaitc3.Enabled := false;
  timerAutomaitc4.Enabled := false;
end;

procedure TForm1.btnLightsRedYellowClick(Sender: TObject);
begin
  //Lightsphase: Red-Yellow
  shapeLightsRed.Brush.Color := clRed;
  shapeLightsYellow.Brush.Color := clYellow;
  shapeLightsGreen.Brush.Color := clBlack;
end;

procedure TForm1.btnLightsWarningOffClick(Sender: TObject);
begin  
  // enable all buttons !( WarningOff, AutomaticOff )
  btnLightsAutomaticOn.Enabled := true;
  btnLightsAutomaticOff.Enabled := false;
  btnLightsRed.Enabled := true;
  btnLightsRedYellow.Enabled := true;
  btnLightsYellow.Enabled := true;
  btnLightsGreen.Enabled := true;
  btnLightsWarningOn.Enabled := true;
  btnLightsWarningOff.Enabled := false;

  //reset Lights
  shapeLightsRed.Brush.Color := clBlack;
  shapeLightsYellow.Brush.Color := clBlack;
  shapeLightsGreen.Brush.Color := clBlack;

  //stop WarnTimer
  timerWarnLights.Enabled := false;
end;

procedure TForm1.btnLightsWarningOnClick(Sender: TObject);
begin
  // disable all buttons !WarningOff
  btnLightsAutomaticOn.Enabled := false;
  btnLightsAutomaticOff.Enabled := false;
  btnLightsRed.Enabled := false;
  btnLightsRedYellow.Enabled := false;
  btnLightsYellow.Enabled := false;
  btnLightsGreen.Enabled := false;
  btnLightsWarningOn.Enabled := false;
  btnLightsWarningOff.Enabled := true;

  //reset Lights
  shapeLightsRed.Brush.Color := clBlack;
  shapeLightsYellow.Brush.Color := clBlack;
  shapeLightsGreen.Brush.Color := clBlack;

  //start WarnTimer
  timerWarnLights.Enabled := true;
end;

procedure TForm1.btnLightsYellowClick(Sender: TObject);
begin
  //Lightsphase: Yellow
  shapeLightsRed.Brush.Color := clBlack;
  shapeLightsYellow.Brush.Color := clYellow;
  shapeLightsGreen.Brush.Color := clBlack;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //init all vars

  //init duration Vars (in deconds)
  durationGreen     := 15;
  durationRed       := 15;
  durationRedYellow := 5;
  durationYellow    := 5;

  //disable all timer
  timerWarnLights.Enabled := false;
  timerAutomaitc1.Enabled := false; 
  timerAutomaitc2.Enabled := false;
  timerAutomaitc3.Enabled := false;
  timerAutomaitc4.Enabled := false;

  //reset all lights
  shapeLightsRed.Brush.Color := clBlack;
  shapeLightsYellow.Brush.Color := clBlack;
  shapeLightsGreen.Brush.Color := clBlack;

  //reset all Buttons
  btnLightsAutomaticOn.Enabled := true;
  btnLightsAutomaticOff.Enabled := false;
  btnLightsRed.Enabled := true;
  btnLightsRedYellow.Enabled := true;
  btnLightsYellow.Enabled := true;
  btnLightsGreen.Enabled := true;
  btnLightsWarningOn.Enabled := true;
  btnLightsWarningOff.Enabled := false;

  //init TimerDuration  
  timerAutomaitc1.Interval := (durationRed*1000);  
  timerAutomaitc2.Interval := (durationRedYellow*1000);   
  timerAutomaitc3.Interval := (durationGreen*1000);   
  timerAutomaitc4.Interval := (durationYellow*1000);

end;


//Timerphasen: 1(Rot) -> 2(Rot-Gelb) -> 3(Grün) -> 4(Gelb) -> 1...
procedure TForm1.timerAutomaitc1Timer(Sender: TObject);
begin
  timerAutomaitc1.Enabled  := false;
  timerAutomaitc2.Enabled  := true;
end;

procedure TForm1.timerAutomaitc2Timer(Sender: TObject);
begin
  timerAutomaitc2.Enabled  := false;
  timerAutomaitc3.Enabled  := true;
end;

procedure TForm1.timerAutomaitc3Timer(Sender: TObject);
begin
  timerAutomaitc3.Enabled  := false;
  timerAutomaitc4.Enabled  := true;
end;

procedure TForm1.timerAutomaitc4Timer(Sender: TObject);
begin
  timerAutomaitc4.Enabled  := false;
  timerAutomaitc1.Enabled  := true;
end;

procedure TForm1.timerWarnLightsTimer(Sender: TObject);
begin
  //WarnTimer
  if shapeLightsYellow.Brush.Color = clYellow then
    begin
      shapeLightsYellow.Brush.Color := clBlack;
    end
  else
    begin
      shapeLightsYellow.Brush.Color := clYellow;
    end;
end;

end.

