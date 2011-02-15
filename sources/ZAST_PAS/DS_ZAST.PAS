program ds_zast;


uses DemoVga,Crt,Strings,graph;
var vihh:boolean;




{-----Процедура временной задержки, не зависящей от тактовой частоты--------}
   Procedure NewDelay(Time:Longint);
   var Timer  : Longint absolute $0040:$006C;
       BegTime: Longint;
   begin
        BegTime:=Timer;
        While BegTime=Timer do;
        While Timer-BegTime<Time do;
   end;

{---Процедура плавного гашения монитора-------------------------------------}
   PROCEDURE Temnenie_Monitora(Zaderjka:byte);
   VAR Pal1,Pal2: POINTER;
       i: INTEGER;

      PROCEDURE Palette256Set(VAR Palette256);ASSEMBLER;
      ASM
	PUSH DS

	MOV DX,3C8H
	MOV AL,0
	OUT DX,AL

	MOV CX,384

	LDS SI,Palette256

	MOV DX,3C9H

	CLI

        @NextValue:
	LODSW
	OUT DX,AL
	XCHG AH,AL
	OUT DX,AL
	LOOP @NextValue

	STI

	POP DS
      END;

      PROCEDURE Palette256Get(VAR Palette256);ASSEMBLER;
      ASM
	PUSH DS

	MOV DX,3C7H
	MOV AL,0
	OUT DX,AL

	MOV CX,384

	LDS SI,Palette256

	CLI
	MOV DX,3C9H

        @NextValue:
	IN AL,DX
	MOV AH,AL
	IN AL,DX
	XCHG AH,AL
	STOSW
	LOOP @NextValue
	STI

	POP DS
      END;

      PROCEDURE Palette256Darken(VAR Palette256; StartElement, EndElement, Decrement, MinValue: BYTE);ASSEMBLER;
      ASM
	PUSH DS

	LDS SI,Palette256
	LES DI,Palette256

	MOV AX,StartElement.WORD
	MOV BL,3
	MUL BL

	MOV DX,AX
	ADD SI,AX
	ADD DI,AX

	MOV AX,EndElement.WORD
	MUL BL

	MOV CX,AX
	SUB CX,DX
	ADD CX,3

	XOR AX,AX

	MOV DX,Decrement.WORD
	MOV BX,MinValue.WORD

        @Loop1:
	LODSB
	CMP AX,BX
	JBE @Next
	CMP AX,DX
	JB @SetMin
	SUB AX,DX
	JMP @Next

        @SetMin:
	MOV AX,BX

        @Next:
	STOSB
	LOOP @Loop1

	POP DS
      END;

      PROCEDURE RetraceWait;ASSEMBLER;
      ASM
	MOV DX,3DAH

        @WaitForRetrace:
	IN AL,DX
	TEST AL,8
	JZ @WaitForRetrace
      END;

      PROCEDURE DataMove(VAR Source,Destination; Count: WORD; SourceOffset,DestinationOffset: WORD);ASSEMBLER;
      ASM
	MOV DX,DS

	LDS SI,Source
	ADD SI,SourceOffset
	LES DI,Destination
	ADD DI,DestinationOffset

	MOV CX,Count
	SHR CX,1
	JNC @MoveWords
	MOVSB

        @MoveWords:
	REP MOVSW

	MOV DS,DX
      END;

   BEGIN
	GETMEM(Pal1,768);
	GETMEM(Pal2,768);
	Palette256Get(Pal1^);
	FOR i:=0 TO 32 DO
            BEGIN
		 DataMove(Pal1^,Pal2^,768,0,0);
  		 Palette256Darken(Pal2^,0,255,i*2,0);
                 if zaderjka=1
                    then
                        newdelay(1)
                    else
                        RetraceWait;
		 Palette256Set(Pal2^);
	    END;
	FREEMEM(Pal1,768);
	FREEMEM(Pal2,768);
   END;



















Type PMem1 = ^TMem1;
     TMem1 = Array[0..65534] Of Byte;
const Info1 : string = 'Demo Sort';
      Info2 : string = ' Present';
var Picture1 : PMem1;
    LightMap : Pointer;
    vih:boolean;

   Function Min(A,B : Integer) : Integer;
   InLine($58/
          $5A/
          $3B/$C2/
          $7C/$01/
          $92
         );

   Function Max(A,B : Integer) : Integer;
   InLine($58/
          $5A/
          $3B/$C2/
          $7D/$01/
          $92
         );

   Procedure InitPicture(info:string);
   Type PFont = ^TFont;
        TFont = Array[0..255, 0..15] Of Byte;
   Var Font : PFont;
       C,O,I,J,K,L : Word;

   Begin
        GetMem( Picture1, 65535);
        FillChar( Picture1^, 65535, 0);
        Font := GetFontPtr( Font16);
        K := 0;
        For I := 1 To 25000 Do
            Begin
                 K := K + Random( 256) * 256 + Random( 256);
                 Picture1^[ K] := Random( 25);
            End;
        For I := 1 To Length( Info) Do
            For J := 0 To 15 Do
                Begin
                     C := Font^[ Byte( Info[ I])][ J];
                     For L := 0 To 7 Do
                         Begin
                              If C Mod 2 <> 0 Then
                                 Begin
                                      O :=  320 * 40 + (I-1) * 8 * 4 + 320 * J * 3 + 8 * 4;
                                      K := L * 4;
                                      Picture1^[ O - K] := 50;           Picture1^[ O - K + 1] := 50;
                                      Picture1^[ O - K + 2] := 50;   Picture1^[ O - K + 3] := 50;
                                      Picture1^[ O - K + 320] := 50; Picture1^[ O - K + 321] := 50;
                                      Picture1^[ O - K + 322] := 50; Picture1^[ O - K + 323] := 50;
                                 End;
                              C := C Div 2;
                         End;
                End;
        For J := 0 To 3 Do
            For I := 0 To 64000 Do
                Picture1^[ I] := (Picture1^[ I-1] + Picture1^[ I+1] + Picture1^[ I-320] + Picture1^[ I+320]) Div 4;
   End;

   Procedure DrawBumpMap1( Lx,Ly : Integer);
   Type PVideoMem = ^TVideoMem;
        TVideoMem = Array[1..200,1..320] Of Byte;
   Var P : PVideoMem;
       D,D2 : Pointer;
       X,Y : Integer;
       dX,dY : LongInt;
   Begin
        P := PVideoMem( Picture1);
        D := DBuffer;
        For Y := 1 To 200 Do
            For X := 1 To 320 Do
                Begin
                     dX := P^[Y][X+1]-P^[Y][X-1] - (X - Lx);
                     dY := P^[Y+1][X]-P^[Y-1][X] - (Y - Ly);
                     dX := Max( 0, Min( 255, dX));
                     dY := Max( 0, Min( 255, dY));
                     D2 := Pointer( LongInt( LightMap) + dX + dY*256);
                     Byte( D^) := Byte( D2^);
                     Inc( LongInt( D));
                End;
   End;


   Procedure RunBumpMap;
   Var J,I,Lx,Ly,Lxt,lyt : Integer;
       dLx,dLy : Integer;
       SinTab : Array[0..255] Of Real;
   Begin
        vih:=false;
        InitDemoPart;
        GetMem( LightMap, 65535);
        For I := 0 To 255 Do
            SinTab[ I] := Sqr( Sqr( Sin( I*Pi/256)));
        For I := 0 To 255 Do
            For J := 0 To 255 Do
                Mem[ Seg( LightMap^) : I * 256 + J] := Round( SinTab[ J] * SinTab[ I] * 62);
        InitPicture(Info1);
        For I := 1 To 64 Do
            SetRGBColor( I, I, I, I);
        Lx := 0; Ly := 0;
        dLx := 2; dLy := 1;
        Repeat
              ClearDBuffer;
              DrawBumpMap1( 128+Lx, 128+Ly);
              Inc( Lx, dLx);
              Inc( Ly, dLy);
              DBuff2Video;
              if keypressed
                 then
                     begin
                          readkey;
                          vihh:=true;
                          vih:=true;
                     end;
        Until vih or ( Lx < 0) Or ( Lx > 330) or ( Ly < 0) Or ( Ly > 210);
        FreeMem( Picture1, 65500);
        FreeMem( LightMap, 65535);


        if not vih
           then
               begin
                    lxt:=lx;
                    lyt:=ly;
                    vih:=false;
                    GetMem( LightMap, 65535);
                    For I := 0 To 255 Do
                        SinTab[ I] := Sqr( Sqr( Sin( I*Pi/256)));
                    For I := 0 To 255 Do
                        For J := 0 To 255 Do
                            Mem[ Seg( LightMap^) : I * 256 + J] := Round( SinTab[ J] * SinTab[ I] * 62);
                    InitPicture(Info2);
                    For I := 1 To 64 Do
                        SetRGBColor( I, I, I, I);
                    Lx := 0+lxt;
                    Ly := 0+lyt;
                    dLx := 2;
                    dLy := 1;
                    Repeat
                          ClearDBuffer;
                          DrawBumpMap1(Lx+128, Ly+128);
                          dec( Lx, dLx);
                          dec( Ly, dLy);
                          DBuff2Video;
                          if keypressed
                             then
                                 begin
                                      readkey;
                                      vihh:=true;
                                      vih:=true;
                                 end;
                    Until vih or ( Lx < 0) Or ( Lx > 330) or ( Ly < 0) Or ( Ly > 210);

                    FreeMem( Picture1, 65500);
                    FreeMem( LightMap, 65535);

               end;

        Temnenie_Monitora(1);

        {RestoreDemo;}
        ClearDBuffer;
   End;













{   Type PMem2 = ^TMem2;
        TMem2 = Array[1..25,1..2620] Of Byte;

        PBmpLetter = ^TBmpLetter;
        TBmpLetter = Array[0..32*32] Of Byte;

   Var Picture2 : PMem2;
       BmpFont : Array[#0..#255] Of PBmpLetter;
       v2:boolean;
   Const StartChar  = #128;
         EndChar    = ' ';



      Procedure MyWireTable;Assembler;
      Asm
         @C_0000: Db         0110b
         Db         1001b
         Db         0110b
         @C_0001: Db         1001b
         Db         1001b
         Db         0110b
         @C_0010: Db         0111b
         Db         1000b
         Db         0111b
         @C_0011: Db         1100b
         Db         0010b
         Db         0001b
         @C_0100: Db         0110b
         Db         1001b
         Db         1001b
         @C_0101: Db         1001b
         Db         1001b
         Db         1001b
         @C_0110: Db         0001b
         Db         0110b
         Db         1000b
         @C_0111: Db         1000b
         Db         1000b
         Db         1000b
         @C_1000: Db         1110b
         Db         0001b
         Db         1110b
         @C_1001: Db         0001b
         Db         0010b
         Db         1100b
         @C_1010: Db         1111b
         Db         0000b
         Db         1111b
         @C_1011: Db         0000b
         Db         0000b
         Db         1111b
         @C_1100: Db         1100b
         Db         0010b
         Db         0001b
         @C_1101: Db         0001b
         Db         0001b
         Db         0001b
         @C_1110: Db         1111b
         Db         0000b
         Db         0000b
         @C_1111: Db         0000b
         Db         0000b
         Db         0000b
      End;

      Procedure DrawWireString( S : PChar);
      Type PWireTable = ^TWireTable;
           TWireTable = Array[0..15,0..2] Of Byte;

           PFont = ^TFont;
           TFont = Array[0..255,1..8] Of Byte;

      Var WTab : PWireTable;
          Font : PFont;
          I,J,K,O,N,M : Word;
          Prev,C,C0,C1,CC : Byte;
      Begin
           WTab := @MyWireTable;
           Font := GetFontPtr( Font8);
           For I := 0 To StrLen( S)-1 Do
               Begin
                    For J := 1 To 8 Do
                        Begin
                             C :=  Font^[ Byte( S[ I])][ J];
                             If J <> 1
                                Then
                                    C0 :=  Font^[ Byte( S[ I])][ J-1]
                                Else
                                    C0 := 0;
                             If J <> 8
                                Then
                                    C1 :=  Font^[ Byte( S[ I])][ J+1]
                                Else
                                    C1 := 0;
                             Prev := 0;
                             For K := 0 To 7 Do
                                 Begin
                                      If C Mod 2 <> 0
                                         Then
                                             Begin
                                                  O := 0;
                                                  If C0 Mod 2 <> 0
                                                     Then
                                                         O := O Or 1;
                                                  If Prev <> 0
                                                     Then
                                                         O := O Or 2;
                                                  If C1 Mod 2 <> 0
                                                     Then
                                                         O := O Or 4;
                                                  If ((C And 3) Shr 1) <> 0
                                                     Then
                                                         O := O Or 8;
                                                  For N := 0 To 2 Do
                                                      Begin
                                                           CC := WTab^[ O][ N];
                                                           For M := 0 To 3 Do
                                                               Begin
                                                                    If CC Mod 2 <> 0
                                                                    Then
                                                  Picture2^[ 1 + (J - 1) * 3 + N][ I * 8 * 4 + 4 * 8 - (M + K * 4)] := 65;
                                                                    CC := CC Div 2;
                                                               End;
                                                      End;
                                             End;
                                      Prev := C Mod 2;
                                      C := C Div 2;
                                      C0 := C0 Div 2;
                                      C1 := C1 Div 2;
                                 End;
                        End;
               End;
      End;

      Procedure MakeBmpFont;
      Type PFont = ^TFont;
           TFont = Array[0..255,1..16] Of Byte;

      Var Font : PFont;
          C : Char;
          I,J : Word;
          B : Byte;
      Begin
           Font := GetFontPtr( Font16);
           For C := StartChar To EndChar Do
               Begin
                    FillChar( BmpFont[ C]^, SizeOf( TBmpLetter), 0);
                    For I := 0 To 15 Do
                        Begin
                             B := Font^[ Byte( C)][ I];
                             For J := 7 DownTo 0 Do
                                 Begin
                                      If B Mod 2 <> 0
                                         Then
                                             Begin
                                                  BmpFont[ C]^[8 + 2 * I * 32 + J * 2]      := 60;
                                                  BmpFont[ C]^[8 + 2 * I * 32 + J * 2 + 1]  := 60;
                                                  BmpFont[ C]^[8 + 32 + 2 * I * 32 + J * 2]           := 60;
                                                  BmpFont[ C]^[8 + 32 + 2 * I * 32 + J * 2 + 1] := 60;
                                             End;
                                      B := B Div 2;
                                 End;
                        End;
                    For I := 0 To 1 Do
                        For J := 64 To SizeOf( TBmpLetter) - 64 Do
               BmpFont[ C]^[ J] := (BmpFont[ C]^[ J-1] + BmpFont[ C]^[ J+1] + BmpFont[ C]^[ J+32] + BmpFont[ C]^[ J-32]) Div 4;
               End;
      End;

      Procedure DrawBmpLetter( X,Y : Integer; C : Char; Fase : Integer);
      Var I,J,K,L : Integer;
          A : Byte;
      Begin
           L := 30-Fase;
           For I := 15 To Fase Do
               Begin
                    K := 30-Fase;
                    For J := 15 To Fase Do
                        Begin
                             A := BmpFont[ C]^[ (16+L) * 32 + 16 + K];
                             If A > 10
                                Then
                                    Mem[ Seg( DBuffer^) : X + (Y + I - 1) * 320 + J] := A;
                             A := BmpFont[ C]^[ (16+L) * 32 + 16 - K];
                             If A > 10
                                Then
                                    Mem[ Seg( DBuffer^) : X + (Y + I - 1) * 320 + 32- J] := A;
                             A := BmpFont[ C]^[ (16-L) * 32 + 16 - K];
                             If A > 10
                                Then
                                    Mem[ Seg( DBuffer^) : X + (Y + 32 - I - 1) * 320 + 32 - J] := A;
                             A := BmpFont[ C]^[ (16-L) * 32 + 16 + K];
                             If A > 10
                                Then
                                    Mem[ Seg( DBuffer^) : X + (Y + 32 - I - 1) * 320 + J] := A;
                             Inc( K);
                        End;
                    Inc( L);
               End;
      End;

      Procedure RunFontDemo;
      var O,I,J : Integer;
          C : Char;
          S : String;
          X,Y,Fase,Ch : Integer;
      Begin
           v2:=false;
           InitDemoPart;
           For I := 0 To 64 Do
               SetRGBColor( I, I, 0, 0);
           SetRGBColor( 65, 20, 10, 30);
           For C := StartChar To EndChar Do
               New( BmpFont[ C]);
           MakeBmpFont;
           New( Picture2);
           FillChar( Picture2^, SizeOf( TMem2), 0);
           O := -1000;
           Ch := 1;
           Fase := 16*2;
           S := 'Лицей'+#245+'Информационных'+#245+'Технологий ';

           Repeat
                 ClearDBuffer;
                 For J := 1 To 25 Do
                     For I := 1 To 319 Do
                         If (O + I >= 0) And (O + I < 2600)
                            Then
                                Mem[ Seg( DBuffer^) : (J + 100) * 320 + I] := Picture2^[ J ][ O + I ];

                 Y := 1;
                 X := 1;
                 For I := 1 To Ch-1 Do
                     Begin
                          If S[I] = #245
                             Then
                                 Begin
                                      X := -17;
                                      Y := Y + 55;
                                 End
                             Else
                                 DrawBmpLetter( X, Y + 20, S[ I], 28 - Random( 2) + 3);
                             if Ch < Length( S)
                                then
                                    delay(1);{######################################################################}

{                          Inc( X, 18);
                     End;
                 If S[ Ch] <> #245
                    Then
                        DrawBmpLetter( X, Y + 20, S[ Ch], Fase Div 2);
                 Inc( Fase);
                 If Fase > 31*2
                    Then
                        Begin
                             Fase := 16*2;
                             Inc( Ch);
                             If Ch > Length( S)
                                Then
                                    begin
                                         dec(ch);
                                         v2:=true;
                                    end;
                        End;
                 DBuff2Video;
                 if v2
                    then
                        begin
                             if o=-1000
                                then
                                    o:=-320;

                             DrawWireString('при  Д Г У');
                             Inc( O);
                        end;
                 if keypressed
                 then
                     begin
                          readkey;
                          vihh:=true;
                          o:=1800;
                     end;
           Until O >400 ;
           Temnenie_Monitora(1);
           For C := EndChar DownTo StartChar
               Do
                 Dispose( BmpFont[ C]);
           Dispose( Picture2);
           ClearDBuffer;
      End;}






Const
 Lines = 100;

 Persp : Array[0..Lines] Of Word =
       (2,1,1,2,1,1,1,2,1,1,1,2,1,1,1,1,1,1,0,1,1,1,1,0,1,1,1,0,
        1,1,1,0,1,1,0,1,1,0,1,0,1,0,1,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0,0,
        1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        1,0,0,0,0,0,0,0,0,0,0,0,0);

 TotalText = 38;
 Text : Array[1..TotalText] Of PChar =
  ( '     Курсовая работа',
    '-------------------------',
    '   Методы сортировок в ',
    '        массивах',
    '-------------------------',
    '                    автор',
    '        Меховов Александр',
    '                  Юрьевич',
    '',
    '     ученик II-курса',
    '',
    '  Лицея',
    '  Информационных',
    '  Технологий',
    '',
    '           при',
    '',
    '          Д Г У',
    '',
    '    Предложенная Вашему',
    '         вниманию',
    '         программа',
    '         является ',
    'демонстрационно-обучающей',
    '            и',
    '    предназначена для',
    'наглядного представления',
    '    процесса различных',
    '    методов сортировки',
    '',
    '',
    '     Днепропетровск ',
    '          1999',
    '','','','','');


Type

 PScanLine = ^TScanLine;
 TScanLine = Record
  X1,Total : Integer;
  Offset : Array[1..320] Of Word;
 End;

 PMem = ^TMem;
 TMem = Array[0..65500] Of Byte;

Var
 ScanLine : Array[1..Lines] Of PScanLine;
 Picture5 : PMem;

Procedure DrawText;
Var
  O,O2,I,J : Integer;
  C : Byte;
Begin
 For I := 1 To Lines Do Begin
  O := 100 * 320 + I * 320 + ScanLine[ I]^.X1 + Persp[ I];
  O2 := (I - 1) * 320;
  For J := 1 To ScanLine[ I]^.Total Do Begin
   C := Byte( Ptr( Seg( Picture5^), O2 + ScanLine[ I]^.Offset[ J])^);
   If C <> 0 Then Byte( Ptr( Seg( DBuffer^), O + J)^) := I;
  End;
 End;
End;

Procedure DrawString( S : PChar);
Type
  PFont = ^TFont;
  TFont = Array[0..255, 0..15] Of Byte;
Var
 Font : PFont;
 C,O,I,J,K,L : Integer;
Begin
 Font := GetFontPtr( Font16);
 For I := 0 To StrLen( S)-1 Do
  For J := 0 To 15 Do Begin
   C := Font^[ Byte( S[ I])][ J];
   For L := 0 To 7 Do Begin
    If C Mod 2 <> 0 Then Picture5^[ 320 * 130 + I * 8 + 320 * J + 8 - L] := 50;
    C := C Div 2;
   End;
  End;
End;

Procedure RunStarText;
Var
  I,J,T : Integer;
  X1,X2 : Integer;
  dX,X : Real;
  CurPos,CurSt : Integer;
  R : Real;
Begin
 InitDemoPart;
 R := 0;
 For I := 1 To 100 Do Begin
  SetRGBColor( I, Round( R), 0, 0);
  R := R + 0.6;
 End;
 GetMem( Picture5, 65500);
 FillChar( Picture5^, 65500, 0);
 For I := 1 To Lines Do New( ScanLine[ I]);
 X1 := 105;
 X2 := 210;
 For I := 1 To Lines Do Begin
  dX := 220 / (X2 - X1);
  X := 0;
  T := 0;
  ScanLine[ I]^.X1 := X1;
  For J := X1 To X2 Do Begin
   Inc( T);
   ScanLine[ I]^.Offset[ T] := Round( X);
   X := X + dX;
  End;
  ScanLine[ I]^.Total := T;
  Dec( X1);
  Inc( X2);
 End;
 CurPos := 0;
 CurSt := 1;
 Repeat
  ClearDBuffer;
  DrawText;
  DBuff2Video;
  Move( Ptr( Seg( Picture5^), Ofs( Picture5^) + 320)^, Picture5^, 65000);
  Inc( CurPos);
  If CurPos = 16 Then Begin
   DrawString( Text[ CurSt]);
   Inc( CurSt);
   {If CurSt > TotalText Then CurSt := 1;}
   CurPos := 0;
  End;
  Delay( 200);
  if keypressed
     then
         begin
              readkey;
              curst:=1000;
         end;
 Until CurSt > TotalText;

 Temnenie_Monitora(1);

 For I := Lines DownTo 1 Do Dispose( ScanLine[ I]);
 FreeMem( Picture5, 65500);
 RestoreDemo;
End;





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

{---------------------------------------------------------------------------}
  procedure ReadRgb(ColorNum: byte; var ReadedR, ReadedG, ReadedB: byte);
  begin
       { asm sti end;}
       port[$03C7]:=ColorNum;
       ReadedR:=port[$03C9];
       ReadedG:=port[$03C9];
       ReadedB:=port[$03C9];
       { asm cli end}
  end;
{---------------------------------------------------------------------------}
  procedure NewRGB(ColorNum, NewR, NewG, NewB: byte);
  begin
       { asm sti end;}
       port[$03C8]:=ColorNum;
       port[$03C9]:=NewR;
       port[$03C9]:=NewG;
       port[$03C9]:=NewB;
       { asm cli end;}
  end;
    procedure WaitSync; assembler;
  asm
     mov dx, 03DAh
     @@1:
     in  al, dx
     test al, 8
     jz @@1

     @@2:
     in  al, dx
     test al, 8
     jz @@2
  end;





{---------------------------------------------------------------------------}
  procedure Shade(ColorNum, EndR, EndG, EndB : byte; pause: word);
  var DeltaR, DeltaG, DeltaB : real;
      RNow, GNow, BNow : real;
      OldR, OldG, OldB : byte;
      Cicles           : byte;
  begin
       ReadRGB(ColorNum, OldR, OldG, OldB);
       DeltaR:=(EndR-OldR)/64;
       DeltaG:=(EndG-OldG)/64;
       DeltaB:=(EndB-OldB)/64;
       RNow:=OldR;
       GNow:=OldG;
       BNow:=OldB;
       for cicles:=0 to 63 do
           begin
                RNow:=RNow+DeltaR;
                GNow:=GNow+DeltaG;
                BNow:=BNow+DeltaB;
                NewRGB(ColorNum, round(RNow), round(GNow), round(BNow));
                WaitSync;
                NewDelay(Pause);
           end;
    end;

{---------------------------------------------------------------------------}
  procedure FillShade(ColorStart,ColorNum: byte;StartR,StartG,StartB, EndR,EndG,EndB: byte);
  var DeltaR, DeltaG, DeltaB : real;
      RNow, GNow, BNow : real;
      OldR, OldG, OldB : byte;
      Cicles           : byte;
  begin
       DeltaR:=(EndR-StartR)/ColorNum;
       DeltaG:=(EndG-StartG)/ColorNum;
       DeltaB:=(EndB-StartB)/ColorNum;
       RNow:=StartR;
       GNow:=StartG;
       BNow:=StartB;
       for cicles:=0 to ColorNum do   { <--- otimaze !!!}
           begin
                RNow:=RNow+DeltaR;
                GNow:=GNow+DeltaG;
                BNow:=BNow+DeltaB;
                NewRGB(ColorStart+cicles, round(RNow), round(GNow), round(BNow));
                { WaitSync; }
           end;
  end;

{---Процедура чтения .BMP рисунка-------------------------------------------}
    procedure LoadBmp(fn : string);
    type pbyte=^byte;
    var
       ppp:pointer;
       f:file;
       f2:file of byte;
       ch,null:byte;
       offbits:longint;
       width,height:longint;
       i,k,l:word;
       bmp:array[0..1024] of byte;

       procedure readparam(offs:longint;ofb:boolean;var arg:longint);
       begin
            arg:=0;
            ch:=0;
            seek(f2,offs-0);
            if ofb
               then
                   begin
                        seek(f2,offs);
                        read(f2,ch);
                        arg:=ch;
                        read(f2,ch);
                        arg:=arg+ch*256;
                   end
               else
                   begin
                        read(f2,ch);
                        arg:=ch;
                        read(f2,ch);
                        arg:=arg+ch*256;
                   end;
       end;

       procedure readpal(offs:word);
       var r,g,b,nul:byte;
           t:byte;
       begin
            seek(f2,offs-1);
            for t:=0 to 255 do
                begin
                     read(f2,ch);
                     nul:=ch;
                     read(f2,ch);
                     b:=ch;
                     read(f2,ch);
                     g:=ch;
                     read(f2,ch);
                     r:=ch;
                     newrgb(t,r div 4,g div 4,b div 4);
                end;
       end;

   begin
        assign(f,fn);
        reset(f,1);
        assign(f2,fn);
        reset(f2);
        readparam(18,false,width);
        readparam(10,true,offbits);
        readparam(22,false,height);
        fillshade(0,255,0,0,0,0,0,0);
        seek(f,offbits);
        for i:=1 to height do
            begin
                 blockread(f,bmp,width);
                 for k:=0 to width do
                     putpixel((getmaxx div 2)-(width div 2)+k,(getmaxy div 2)+(height div 2)-i,bmp[k]);
            end;
        readpal(54);
        close(f);
        close(f2);
   end;


  procedure al;
  begin
       Init_VGA_256;
       SetGraphMode(2);
       LoadBmp('DS_Zast.bmp');
       readkey;
       Temnenie_Monitora(1);
       closegraph;
  end;








begin
     vihh:=false;

     RunBumpMap;

     {if not vihh
        then
            RunFontDemo;}

     if not vihh
        then
            RunStarText;
     al;
end.