unit DS_Mouse;
interface
  procedure Init_Mouse;{Инициализация мышки}
  procedure Show_Mouse;{Показать указатель мышки}
  procedure Hide_Mouse;{Скрыть указатель мышки}
  function  Mouse_Left_Buttion:boolean;{Проверка на нажатие левой кнопки мышки}
  function  Mouse_Right_Buttion:boolean;{Проверка на нажатие правой кнопки мышки}
  procedure Controlxy(var x,y:word);{Определение текущего положения указателя мышки}
  procedure Mouse_Set_Position(x,y:word);{Поместить указатель мышки в позицию x,y}

var
   d,b:word;

implementation
{-----Инициализация мышки---------------------------------------------------}
   procedure init_mouse; assembler;
   asm
      mov ax,0
      int 33h
   end;
{-----Показать указатель мышки----------------------------------------------}
   procedure show_mouse; assembler;
   asm
      mov ax,1
      int 33h
   end;
{-----Скрыть указатель мышки------------------------------------------------}
   procedure hide_mouse; assembler;
   asm
      mov ax,2
      int 33h
   end;
{-----Проверка на нажатие левой кнопки мышки--------------------------------}
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
{-----Проверка на нажатие правой кнопки мышки-------------------------------}
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
{-----Определение текущего положения указателя мышки------------------------}
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
{-----Поместить указатель мышки в позицию x,y--------------------------------}
   procedure mouse_set_position(x,y:word);assembler;
   asm
      mov AX,4
      mov CX,x
      mov DX,y
      int 33h
   end;

end.