unit DS_Buton;
interface

  function  Keypress(mx1,m1:word):boolean;{���ᮢ�� ���.��. mx1,�᫨ ����� �����(m1=1),�ࠢ��(m1=2) ��� ��� (m1=3)��. ��誨}
  function  keypress_for_palitra(mx1,m1:word):boolean;
  procedure Risovanie_Key(x,y,x1,y1,nom:word;str:string);{��ᮢ���� ������ � ����஬ nom � �������� str (� ࠬ���)}
  procedure Risovanie_Key_1(x,y,x1,y1,nom:word;str:string);{��ᮢ���� ������ � ����஬ nom � �������� str (��� ࠬ��)}
  procedure risovanie_key_for_palitra(x,y,x1,y1,nom:word;str:string);{��ᮢ���� ������ � ����஬ nom � �������� str(� ࠬ���)}
  procedure Pres(m:word);{���ᮢ�� ������ ������ m}
  procedure Pres_2(m:word);{���ᮢ�� ������ ������ m}
  procedure Pres_for_palitra(m:word);{���ᮢ�� ������ ������ m}
  function  Vedenie_Kursora(mx1:word):boolean;{�� ��������� ����� �� ������ ������� ���ᢥ稢�����}
  function  Vedenie_kursora_for_palitra(mx1:word):boolean;

implementation
uses graph,DS_Mouse,DS_Tools;
var a:array[1..6,1..100] of word;
    st:array[1..100] of string;
{-----���ᮢ�� ������ ������ mx1 , �᫨ ����� �����(m1=1) , �ࠢ��(m1=2) ��� ��� (m1=3) ������ ��誨}
   function keypress(mx1,m1:word):boolean;
   var x,y:word;
   begin
        controlxy(x,y);
        case m1 of
             1:if mouse_left_buttion and (x>a[1,mx1]) and (y>a[2,mx1]) and (x<a[3,mx1]) and (y<a[4,mx1])
                  then
                      begin
                           keypress:=true;
                           pres(mx1);
                      end
                  else keypress:=false;
             2:if mouse_right_buttion and (x>a[1,mx1]) and (y>a[2,mx1]) and (x<a[3,mx1]) and (y<a[4,mx1])
                  then
                      begin
                           keypress:=true;
                           pres(mx1);
                      end
                  else keypress:=false;
             3:if (mouse_right_buttion or mouse_left_buttion)and (x>a[1,mx1]) and (y>a[2,mx1])and(x<a[3,mx1])and(y<a[4,mx1])
                  then
                      begin
                           keypress:=true;
                           pres(mx1);
                      end
                  else keypress:=false;
        end;
   end;
{-----���ᮢ�� ������ ������ mx1 , �᫨ ����� �����(m1=1) , �ࠢ��(m1=2) ��� ��� (m1=3) ������ ��誨}
   function keypress_for_palitra(mx1,m1:word):boolean;
   var x,y:word;
   begin
        controlxy(x,y);
        case m1 of
             1:if mouse_left_buttion and (x>a[1,mx1]) and (y>a[2,mx1]) and (x<a[3,mx1]) and (y<a[4,mx1])
                  then
                      begin
                           keypress_for_palitra:=true;
                           pres_for_palitra(mx1);
                      end
                  else keypress_for_palitra:=false;
             2:if mouse_right_buttion and (x>a[1,mx1]) and (y>a[2,mx1]) and (x<a[3,mx1]) and (y<a[4,mx1])
                  then
                      begin
                           keypress_for_palitra:=true;
                           pres_for_palitra(mx1);
                      end
                  else keypress_for_palitra:=false;
             3:if (mouse_right_buttion or mouse_left_buttion)and (x>a[1,mx1]) and (y>a[2,mx1])and(x<a[3,mx1])and(y<a[4,mx1])
                  then
                      begin
                           keypress_for_palitra:=true;
                           pres_for_palitra(mx1);
                      end
                  else keypress_for_palitra:=false;
        end;
   end;
{-----��ᮢ���� ������ � ����஬ nom � �������� str (� ࠬ���)-------------}
   procedure risovanie_key(x,y,x1,y1,nom:word;str:string);
   var z:integer;
   begin
        a[1,nom]:=x;
        a[2,nom]:=y;
        a[3,nom]:=x1;
        a[4,nom]:=y1;
        st[nom]:=str;
        setcolor(0);
        rectangle(x-1,y-1,x1+1,y1+1);
        setcolor(12);
        line(x,y1,x1,y1);
        line(x1,y,x1,y1);
        setcolor(15);
        line(x,y1,x,y);
        line(x1,y,x,y);
        setfillstyle(1,14);
        bar(x+1,y+1,x1-1,y1-1);
        z:=length(str)*8;
        x1:=x+((abs(x1-x)-z) div 2);
        y1:=y+(abs(y1-y) div 2)-3;
        setcolor(0);
        outtextxy(x1,y1,str);
        a[5,nom]:=x1;
        a[6,nom]:=y1;
   end;
{-----��ᮢ���� ������ � ����஬ nom � �������� str (��� ࠬ��)--------------}
   procedure Risovanie_Key_1(x,y,x1,y1,nom:word;str:string);
   var z:integer;
   begin
        a[1,nom]:=x;
        a[2,nom]:=y;
        a[3,nom]:=x1;
        a[4,nom]:=y1;
        st[nom]:=str;
        setcolor(12);
        line(x,y1,x1,y1);
        line(x1,y,x1,y1);
        setcolor(15);
        line(x,y1,x,y);
        line(x1,y,x,y);
        setfillstyle(1,14);
        bar(x+1,y+1,x1-1,y1-1);
        z:=length(str)*8;
        x1:=x+((abs(x1-x)-z) div 2);
        y1:=y+(abs(y1-y) div 2)-3;
        setcolor(0);
        outtextxy(x1,y1,str);
        a[5,nom]:=x1;
        a[6,nom]:=y1;
   end;
{-----��ᮢ���� ������ � ����஬ nom � �������� str (� ࠬ���) ��� ������������ �������-}
   procedure risovanie_key_for_palitra(x,y,x1,y1,nom:word;str:string);
   var z:integer;
   begin
        a[1,nom]:=x;
        a[2,nom]:=y;
        a[3,nom]:=x1;
        a[4,nom]:=y1;
        st[nom]:=str;
        setcolor(0);
        rectangle(x-1,y-1,x1+1,y1+1);
        setcolor(8);
        line(x,y1,x1,y1);
        line(x1,y,x1,y1);
        setcolor(15);
        line(x,y1,x,y);
        line(x1,y,x,y);
        setfillstyle(1,7);
        bar(x+1,y+1,x1-1,y1-1);
        z:=length(str)*8;
        x1:=x+((abs(x1-x)-z) div 2);
        y1:=y+(abs(y1-y) div 2)-3;
        setcolor(0);
        outtextxy(x1,y1,str);
        a[5,nom]:=x1;
        a[6,nom]:=y1;
   end;
{-----���ᮢ�� ������ ������ m-------------------------------------------}
   procedure pres(m:word);
   begin
        hide_mouse;
        setcolor(15);
        line(a[1,m],a[4,m],a[3,m],a[4,m]);
        line(a[3,m],a[2,m],a[3,m],a[4,m]);
        setcolor(12);
        line(a[1,m],a[4,m],a[1,m],a[2,m]);
        line(a[3,m],a[2,m],a[1,m],a[2,m]);
        setfillstyle(1,14);
        bar(a[1,m]+1,a[2,m]+1,a[3,m]-1,a[4,m]-1);
        setcolor(9);{��������� 梥� ������ �� ������ �� ����⨨}
        outtextxy(a[5,m],a[6,m],st[m]);
        Setcolor(0);
        SetLineStyle(1,1,1);
        Rectangle(a[1,m]+5,a[2,m]+5,a[3,m]-5,a[4,m]-5);
        SetLineStyle(0,1,1);
        {��������������������������������}NewDelay(2);
        setcolor(12);
        line(a[1,m],a[4,m],a[3,m],a[4,m]);
        line(a[3,m],a[2,m],a[3,m],a[4,m]);
        setcolor(15);
        line(a[1,m],a[4,m],a[1,m],a[2,m]);
        line(a[3,m],a[2,m],a[1,m],a[2,m]);
        setfillstyle(1,14);
        bar(a[1,m]+1,a[2,m]+1,a[3,m]-1,a[4,m]-1);
        setcolor(0);{��������� 梥� ������ �� ������ �� ����⨨}
        outtextxy(a[5,m],a[6,m],st[m]);
        show_mouse;
   end;
{-----���ᮢ�� ������ ������ m-------------------------------------------}
   procedure pres_2(m:word);
   begin
        hide_mouse;
        setcolor(15);
        line(a[1,m],a[4,m],a[3,m],a[4,m]);
        line(a[3,m],a[2,m],a[3,m],a[4,m]);
        setcolor(12);
        line(a[1,m],a[4,m],a[1,m],a[2,m]);
        line(a[3,m],a[2,m],a[1,m],a[2,m]);
        setfillstyle(1,14);
        bar(a[1,m]+1,a[2,m]+1,a[3,m]-1,a[4,m]-1);
        setcolor(9);{��������� 梥� ������ �� ������ �� ����⨨}
        outtextxy(a[5,m],a[6,m],st[m]);
        {��������������������������������}NewDelay(2);
        setcolor(12);
        line(a[1,m],a[4,m],a[3,m],a[4,m]);
        line(a[3,m],a[2,m],a[3,m],a[4,m]);
        setcolor(15);
        line(a[1,m],a[4,m],a[1,m],a[2,m]);
        line(a[3,m],a[2,m],a[1,m],a[2,m]);
        setfillstyle(1,14);
        bar(a[1,m]+1,a[2,m]+1,a[3,m]-1,a[4,m]-1);
        setcolor(0);{��������� 梥� ������ �� ������ �� ����⨨}
        outtextxy(a[5,m],a[6,m],st[m]);
        show_mouse;
   end;
{-----���ᮢ�� ������ ������ m-------------------------------------------}
   procedure pres_for_palitra(m:word);
   begin
        hide_mouse;
        setcolor(15);
        line(a[1,m],a[4,m],a[3,m],a[4,m]);
        line(a[3,m],a[2,m],a[3,m],a[4,m]);
        setcolor(8);
        line(a[1,m],a[4,m],a[1,m],a[2,m]);
        line(a[3,m],a[2,m],a[1,m],a[2,m]);
        setfillstyle(1,7);
        bar(a[1,m]+1,a[2,m]+1,a[3,m]-1,a[4,m]-1);
        setcolor(1);{��������� 梥� ������ �� ������ �� ����⨨}
        outtextxy(a[5,m],a[6,m],st[m]);
        Setcolor(0);
        SetLineStyle(1,1,1);
        Rectangle(a[1,m]+5,a[2,m]+5,a[3,m]-5,a[4,m]-5);
        SetLineStyle(0,1,1);
        {��������������������������������}NewDelay(2);
        setcolor(8);
        line(a[1,m],a[4,m],a[3,m],a[4,m]);
        line(a[3,m],a[2,m],a[3,m],a[4,m]);
        setcolor(15);
        line(a[1,m],a[4,m],a[1,m],a[2,m]);
        line(a[3,m],a[2,m],a[1,m],a[2,m]);
        setfillstyle(1,7);
        bar(a[1,m]+1,a[2,m]+1,a[3,m]-1,a[4,m]-1);
        setcolor(1);{��������� 梥� ������ �� ������ �� ����⨨}
        outtextxy(a[5,m],a[6,m],st[m]);
        show_mouse;
   end;
{-----�� ��������� ����� �� ������ ������� ���ᢥ稢�����-----------------}
   function vedenie_kursora(mx1:word):boolean;
   var x,y:word;
   begin
        controlxy(x,y);
        if (x>a[1,mx1]) and (y>a[2,mx1]) and (x<a[3,mx1]) and (y<a[4,mx1])
           then
               begin
                    vedenie_kursora:=true;
                    setcolor(8);{��������� 梥� ������ �� ������ �� �������� �����}
                    outtextxy(a[5,mx1],a[6,mx1],st[mx1]);
               end
           else
               begin
                    vedenie_kursora:=false;
                    setcolor(0);
                    outtextxy(a[5,mx1],a[6,mx1],st[mx1]);
               end;
   end;
{-----�� ��������� ����� �� ������ ������� ���ᢥ稢�����-----------------}
   function vedenie_kursora_for_palitra(mx1:word):boolean;
   var x,y:word;
   begin
        controlxy(x,y);
        if (x>a[1,mx1]) and (y>a[2,mx1]) and (x<a[3,mx1]) and (y<a[4,mx1])
           then
               begin
                    vedenie_kursora_for_palitra:=true;
                    setcolor(9);{��������� 梥� ������ �� ������ �� �������� �����}
                    outtextxy(a[5,mx1],a[6,mx1],st[mx1]);
               end
           else
               begin
                    vedenie_kursora_for_palitra:=false;
                    setcolor(0);
                    outtextxy(a[5,mx1],a[6,mx1],st[mx1]);
               end;
   end;

end.