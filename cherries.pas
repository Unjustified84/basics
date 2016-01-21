//Created by Unjustified - June 2006

unit cherries;

interface

uses windows,
     ShellAPI,
     SysUtils,
     DateUtils;

Procedure Welcome(Title: String);
Procedure ClrScr;
Procedure Center(S: String);
Procedure Email;
Procedure Show_Date;
Procedure Show_Time;

implementation

Procedure Welcome(Title: String);
Begin
  Writeln; Writeln; Writeln; Writeln;
  Center('Welcome');
  Writeln; Writeln;
  Center (Title);
  Writeln; Writeln; Writeln; Writeln;
  Center ('Press <ENTER> to continue...');
  Readln;
  ClrScr;
End;


procedure ClrScr;
var
  hStdOut: HWND;
  ScreenBufInfo: TConsoleScreenBufferInfo;
  Coord1: TCoord;
  z: Integer;
begin
  hStdOut := GetStdHandle(STD_OUTPUT_HANDLE);
  GetConsoleScreenBufferInfo(hStdOut, ScreenBufInfo);
  for z := 1 to ScreenBufInfo.dwSize.Y do
    WriteLn('');
  Coord1.X := 0;
  Coord1.Y := 0;
  SetConsoleCursorPosition(hStdOut, Coord1);
end;

Procedure Center(S: String);
Var
  i : integer;
  x: integer;
Begin
  x := (((80 + Length(S)) div 2)- Length(S));
  for i:= 1 to x do
  begin
    write(' ');
  end;
    writeln (S);
End;

Procedure Email;
Var
  Subject : String;
  Body    : String;
  email   : String;
  Link    : String;
Begin
  Write  ('Subject: ');
  Readln (Subject);
  Writeln;
  Write  ('Message: ');
  Readln (Body);
  Writeln;
  Write  ('Your Email: ');
  Readln (Email);
  Link := 'mailto:james@unjustified.co.uk?cc=' + email + '&subject=' + subject + '&body=' + Body + '%0A%0A' + email;
  ShellExecute(0, 'open', pChar(Link), nil, nil, 1);
end;

Procedure Show_Date;
Begin
  Case DayOfTheMonth(Now) of
    1, 21, 31     : Begin ShortDateFormat := 'dddd d"st" mmmm yyyy'; End;
    2, 22         : Begin ShortDateFormat := 'dddd d"nd" mmmm yyyy'; End;
    3, 23         : Begin ShortDateFormat := 'dddd d"rd" mmmm yyyy'; End;
    4..20, 24..30 : Begin ShortDateFormat := 'dddd d"th" mmmm yyyy'; End;
  end;
  Writeln (DateToStr(Now));
end;

Procedure Show_Time;
Begin
  LongTimeFormat := 'hh:nn AM/PM';
  Writeln (TimeToStr(Now));
End;


{

##### Open CMD #####

ShellExecute(0, 'open', 'cmd.exe', '/s mailto:james@unjustified.co.uk&subject:testy', 'C:\', 1);

http://msdn.microsoft.com/en-us/library/bb762153%28v=VS.85%29.aspx

ShellExecute(0, 'open', 'cmd.exe', '/c mkdir c:\test', 'C:', 1);
                                      ¦                  ¦   ¦
                                      ¦                  ¦   ¦
                                      ¦                  ¦   ¦
                                  /c Params             Dir  ¦
                                                             ¦
                                                             ¦
                                                             ¦
                                                          window
## WINDOW ##

0  = hide (Hides the window and activates another window.)
1  = ShowNormal (Activates and displays a window. If the window is minimized or maximized, Windows restores it to its original size and position. An application should specify this flag when displaying the window for the first time.)
3  = Maximise (Maximizes the specified window.)
4  = ShowNoActivate (Displays a window in its most recent size and position. The active window remains active.)
6  = Minimize (Minimizes the specified window and activates the next top-level window in the z-order.)
7  = ShowInNoActive (Displays the window as a minimized window. The active window remains active.)
8  = Showna (Displays the window in its current state. The active window remains active.)
9  = Restore (Activates and displays the window. If the window is minimized or maximized, Windows restores it to its original size and position. An application should specify this flag when restoring a minimized window.)
10 = ShowDefault (Sets the show state based on the SW_ flag specified in the STARTUPINFO structure passed to the CreateProcess function by the program that started the application. An application should call ShowWindow with this flag to set the initial show state of its main window.)

}

End.



