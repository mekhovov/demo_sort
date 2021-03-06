unit DS_GInit;
interface

  procedure Grafika_VGA_on;{��楤�� ���. ०��� ��䨪�(VGA) � �뢮��,�᫨ ����室���,���ଠ樨 �� �訡��}
  procedure Init_VGA_256;{���樠������ ०��� VGA 256 color}

implementation
uses graph;

{-----��楤�� ���. ०��� ��䨪�(VGA) � �뢮��,�᫨ ����室���,���ଠ樨 �� �訡��}
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
                    Writeln('�ணࠬ�� ��⠭������.');
                    Halt
               end;
   end;
{---��楤�� ���樠����樨 ०��� VGA 256 color----------------------------}
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
                    Writeln('�ணࠬ�� ��⠭������.');
                    Halt;
               end
   end;

end.