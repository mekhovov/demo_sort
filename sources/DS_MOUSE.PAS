unit DS_Mouse;
interface
  procedure Init_Mouse;{���樠������ ��誨}
  procedure Show_Mouse;{�������� 㪠��⥫� ��誨}
  procedure Hide_Mouse;{������ 㪠��⥫� ��誨}
  function  Mouse_Left_Buttion:boolean;{�஢�ઠ �� ����⨥ ����� ������ ��誨}
  function  Mouse_Right_Buttion:boolean;{�஢�ઠ �� ����⨥ �ࠢ�� ������ ��誨}
  procedure Controlxy(var x,y:word);{��।������ ⥪�饣� ��������� 㪠��⥫� ��誨}
  procedure Mouse_Set_Position(x,y:word);{�������� 㪠��⥫� ��誨 � ������ x,y}

var
   d,b:word;

implementation
{-----���樠������ ��誨---------------------------------------------------}
   procedure init_mouse; assembler;
   asm
      mov ax,0
      int 33h
   end;
{-----�������� 㪠��⥫� ��誨----------------------------------------------}
   procedure show_mouse; assembler;
   asm
      mov ax,1
      int 33h
   end;
{-----������ 㪠��⥫� ��誨------------------------------------------------}
   procedure hide_mouse; assembler;
   asm
      mov ax,2
      int 33h
   end;
{-----�஢�ઠ �� ����⨥ ����� ������ ��誨--------------------------------}
   function mouse_left_buttion:boolean;
            procedure leftm(var g:word); assembler;
            asm
               mov ax,3
               int 33h
               les di,g
               mov word ptr es:[di],bx
            end;
   begin
        leftm(b);
        if b=1 then mouse_left_buttion:=true
        else mouse_left_buttion:=false;
   end;
{-----�஢�ઠ �� ����⨥ �ࠢ�� ������ ��誨-------------------------------}
   function mouse_right_buttion:boolean;
            procedure rightm(var f:word); assembler;
            asm
               mov ax,3
               int 33h
               push di
               les di,f
               mov word ptr es:[di],bx
               pop di
            end;
   begin
        rightm(d);
        if d=2 then mouse_right_buttion:=true
        else mouse_right_buttion:=false;
   end;
{-----��।������ ⥪�饣� ��������� 㪠��⥫� ��誨------------------------}
   procedure controlxy(var x,y:word); assembler;
   asm
      mov ax,3
      int 33h
      push di
      les di,x
      mov word ptr es:[di],cx
      les di,y
      mov word ptr es:[di],dx
      pop di
   end;
{-----�������� 㪠��⥫� ��誨 � ������ x,y--------------------------------}
   procedure mouse_set_position(x,y:word);assembler;
   asm
      mov AX,4
      mov CX,x
      mov DX,y
      int 33h
   end;

end.