unit DS_GInit;
interface

  procedure Grafika_VGA_on;{Процедура вкл. режима графики(VGA) и вывода,если необходимо,информации об ошибке}
  procedure Init_VGA_256;{Инициализация режима VGA 256 color}

implementation
uses graph;

{-----Процедура вкл. режима графики(VGA) и вывода,если необходимо,информации об ошибке}
   procedure Grafika_VGA_on;
   var GraphDriver,GraphMode,ErrorCode:Integer;
   begin
        GraphDriver:=VGA;
        GraphMode:=VGAHi;
        InitGraph(GraphDriver,GraphMode,'');
        ErrorCode:=GraphResult;
        if ErrorCode<>grok
           then
               begin
                    Writeln(GraphErrorMsg(ErrorCode));
                    Writeln('Программа остановлена.');
                    Halt
               end;
   end;
{---Процедура инициализации режима VGA 256 color----------------------------}
   procedure  Init_VGA_256;
   var Driver, Mode,
       TestDriver,
       ErrCode: Integer;
        {$F+}
        function TestDetect: Integer;
         begin
              TestDetect := 1;
         end;
        {$F-}

   begin
        TestDriver := InstallUserDriver('svga256', @TestDetect);

        Driver := Detect;
        InitGraph(Driver, Mode, '');
        ErrCode := GraphResult;
        if ErrCode <> grOk
           then
               begin
                    Writeln(GraphErrorMsg(ErrCode));
                    Writeln('Программа остановлена.');
                    Halt;
               end
   end;

end.