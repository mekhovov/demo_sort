unit DS_Efect;
interface

  procedure Temnenie_Stroki(th,x,y:word;s:string;Tipe:byte);{Плавное появление и затухание строки}
  procedure Stroka_Lava;
  procedure Temnenie_Monitora(Zaderjka:byte);{Плавно гасит монитор}
  procedure Shade(ColorNum, EndR, EndG, EndB : byte; pause: word);{Для гашения}

implementation
uses graph,DS_Tools,DS_Mouse;
{---------------------------------------------------------------------------}
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

{---Процедура плавного появления и затухания строки-------------------------}
   procedure Temnenie_Stroki(th,x,y:word;s:string;Tipe:byte);
   begin
        settextstyle(Tipe,0,th);
        setrgbpalette(1,0,0,0);
        outtextxy(x,y,s);
        setrgbpalette(1,0,0,0);
        Shade(1,63,0,0,1);
        {▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀}{NewDelay(10);}
        Shade(1,0,0,0,1);
        setrgbpalette(16,60,60,60);
        cleardevice;
   end;
{--------------------------------------------------------------------------}
   procedure Stroka_Lava;

  CONST MinX = 40;
        MaxX = 360;
        MinY = 117;
        MaxY = 317;

        MinX_1 = 180;
        MaxX_1 = 500;
        MinY_1 = 117;
        MaxY_1 = 317;

        MinX_2 = 323;
        MaxX_2 = 643;
        MinY_2 = 117;
        MaxY_2 = 317;

  TYPE TColors = Array [MinX..MaxX, MinY..MaxY] of Byte;
       PColors = ^TColors;

       TColors_1 = Array [MinX_1..MaxX_1, MinY_1..MaxY_1] of Byte;
       PColors_1 = ^TColors_1;

       TColors_2 = Array [MinX_2..MaxX_2, MinY_2..MaxY_2] of Byte;
       PColors_2 = ^TColors_2;

  VAR i, j: word;
      Colors : PColors;
      Colors_1 : PColors_1;
      Colors_2 : PColors_2;
      k:byte;
  procedure Clear(H, Q : Integer);
  VAR i,j: LongInt;
  begin
    for j := MaxY-H downto MinY+H do
      begin
        for i := MaxX-H downto MinX+H do
          begin
            Colors^[i, j] := Q+((Colors^[i+1, j]+Colors^[i-1, j]+
                                 Colors^[i, j+1]+Colors^[i, j-1]+
                                 Colors^[i+1, j+1]+Colors^[i+1, j-1]+
                                 Colors^[i-1, j+1]+Colors^[i-1, j-1]) div 8);
            if (Colors^[i, j] <> 0) then Dec(Colors^[i, j]);
            PutPixel(i, j, Colors^[i, j]);
          end;
      end;
  end;

  procedure Clear1(H, Q : Integer);
  VAR i,j: LongInt;
  begin
    for j := MaxY_1-H downto MinY_1+H do
      begin
        for i := MaxX_1-H downto MinX_1+H do
          begin
            Colors_1^[i, j] := Q+((Colors_1^[i+1, j]+Colors_1^[i-1, j]+
                                 Colors_1^[i, j+1]+Colors_1^[i, j-1]+
                                 Colors_1^[i+1, j+1]+Colors_1^[i+1, j-1]+
                                 Colors_1^[i-1, j+1]+Colors_1^[i-1, j-1]) div 8);
            if (Colors_1^[i, j] <> 0) then Dec(Colors_1^[i, j]);
            PutPixel(i, j, Colors_1^[i, j]);
          end;
      end;
  end;

  procedure Clear2(H, Q : Integer);
  VAR i,j: LongInt;
  begin
    for j := MaxY_2-H downto MinY_2+H do
      begin
        for i := MaxX_2-H downto MinX_2+H do
          begin
            Colors_2^[i, j] := Q+((Colors_2^[i+1, j]+Colors_2^[i-1, j]+
                                 Colors_2^[i, j+1]+Colors_2^[i, j-1]+
                                 Colors_2^[i+1, j+1]+Colors_2^[i+1, j-1]+
                                 Colors_2^[i-1, j+1]+Colors_2^[i-1, j-1]) div 8);
            if (Colors_2^[i, j] <> 0) then Dec(Colors_2^[i, j]);
            PutPixel(i, j, Colors_2^[i, j]);
          end;
      end;
  end;

  begin
       New(Colors);
       New(Colors_1);
       New(Colors_2);
       for i := 0 to 255 do
           SetRGBPalette(i, i, 0, 0);
       SetColor(255);

       setfillstyle(0,100);
       bar(269,117,271,224);
       bar(408,117,413,215);

       for i := MinX to MaxX do
           for j := MinY to MaxY do
               Colors^[i, j] := GetPixel(i, j);


       for i := MinX_1 to MaxX_1 do
           for j := MinY_1 to MaxY_1 do
               Colors_1^[i, j] := GetPixel(i, j);


       for i := MinX_2 to MaxX_2 do
           for j := MinY_2 to MaxY_2 do
               Colors_2^[i, j] := GetPixel(i, j);

       k := 0;
       repeat
             Clear(90,0);
             Clear1(90,0);
             Clear2(90,0);
             if odd(k)
                then
                    NewDelay(1);
             inc(k);
       until (k > 35);

       Dispose(Colors);
       Dispose(Colors_1);
       Dispose(Colors_2);

       Temnenie_Monitora(0);
  END;
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
        Hide_Mouse;
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

end.