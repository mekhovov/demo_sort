unit DS_Ramks;
interface

  procedure Ramka_Fon;{��ᮢ���� ࠬ��, �� 䮭� ���ன �㤥� �ந�������� ���஢��}
  procedure Ramka_Fon_2;{��ᮢ���� ࠬ��, �� 䮭� ���ன �㤥� �ᯮ�������� ����-�奬�}

  procedure Ramka_1(x1,y1,x2,y2 :integer);{��ᮢ���� ࠬ��}
  procedure Ramka_2(x1,y1,x2,y2:integer);{��ᮢ���� ��㪫�� ࠬ��}
  procedure Ramka_2_2(x1,y1,x2,y2:integer);{��ᮢ���� ��㪫�� ࠬ�� v2}
  procedure Ramka_3(x1,y1,x2,y2:integer);{��ᮢ���� ��㪫�� ࠬ��}
  procedure Ramka_4(x1,y1,x2,y2:integer;stroka:string);{��ᮢ���� ��㪫�� ࠬ�� � ���� 䮭��}

implementation
uses crt,graph,DS_Buton;
{-----��ᮢ���� ࠬ��-------------------------------------------------------}
   procedure Ramka_1(x1,y1,x2,y2:integer);
   begin
        Ramka_2(x1,y1,x2,y2);
        setcolor(12);
        moveto(x1+3,y2-3);
        lineto(x1+3,y1+3);
        lineto(x2-3,y1+3);
        setcolor(15);
        lineto(x2-3,y2-3);
        lineto(x1+3,y2-3);
   end;
{-----��ᮢ���� ��㪫�� ࠬ��----------------------------------------------}
   procedure Ramka_2(x1,y1,x2,y2:integer);
   begin
        setcolor(15);
        setlinestyle(0,0,0);
        moveto(x1,y2);
        lineto(x1,y1);
        lineto(x2,y1);
        setcolor(12);
        lineto(x2,y2);
        lineto(x1,y2);
        setfillstyle(1,14);
        bar(x1+1,y1+1,x2-1,y2-1);
   end;
{-----��ᮢ���� ��㪫�� ࠬ�� v2-------------------------------------------}
   procedure Ramka_2_2(x1,y1,x2,y2:integer);
   begin
        setcolor(15);
        setlinestyle(0,0,0);
        moveto(x1,y2);
        lineto(x1,y1);
        lineto(x2,y1);
        setcolor(12);
        lineto(x2,y2);
        lineto(x1,y2);
   end;
{-----��ᮢ���� ��㪫�� ࠬ��-----------------------------------------------}
   procedure Ramka_3(x1,y1,x2,y2:integer);
   begin
        setcolor(12);
        setlinestyle(0,0,0);
        moveto(x1,y2);
        lineto(x1,y1);
        lineto(x2,y1);
        setcolor(15);
        lineto(x2,y2);
        lineto(x1,y2);
        setfillstyle(1,14);
        bar(x1+1,y1+1,x2-1,y2-1);
   end;
{-----��ᮢ���� ��㪫�� ࠬ�� � ���� 䮭��---------------------------------}
   procedure Ramka_4(x1,y1,x2,y2:integer;stroka:string);
   begin
        setfillstyle(1,9);
        bar(x1,y1-20,x2,y2);
        setcolor(0);
        rectangle(x1,y1-20,x2,y2);
        setcolor(12);
        rectangle(x1+1,y1-20+1,x2-1,y2-1);
        setcolor(13);
        line(x2,y1-20,x2,y2);
        setcolor(0);
        setlinestyle(0,0,0);
        moveto(x1,y2);
        lineto(x1,y1);
        lineto(x2,y1);
        setcolor(13);
        lineto(x2,y2);
        lineto(x1,y2);
        setfillstyle(1,15);
        bar(x1+1,y1+1,x2-1,y2-1);
        setcolor(14);
        rectangle(x1+2,y1+2,x2-2,y2-2);
        setcolor(12);
        rectangle(x1+1,y1+1,x2-1,y2-1);
        setcolor(15);
        outtextxy(x1+5,y1-13,stroka);
   end;
{-----��ᮢ���� ࠬ��, �� 䮭� ���ன �㤥� �ந�������� ���஢��---------}
   procedure ramka_fon;
   begin
        clrscr;
        Ramka_2(0,0,getmaxx,getmaxy);
        Setcolor(13);
        Rectangle(4,4,635,475);
        Setcolor(15);
        Rectangle(1,1,638,478);
        Setcolor(13);
        line(4,430,635,430);
        line(4,434,635,434);
        Setcolor(15);
        line(3,432,636,432);

        SetFillStyle(1,9);
        Bar(5,5,634,25);
        Setcolor(0);
        line(5,25,634,25);
        line(5,26,634,26);

        Setcolor(13);
        line(560,435,560,475);
        line(556,435,556,475);
        Setcolor(15);
        line(558,433,558,477);

        risovanie_key(570,445,625,465,10,'����');
   end;
{---��ᮢ���� ࠬ��, �� 䮭� ���ன �㤥� �ᯮ�������� ����-�奬�---------}
   procedure Ramka_Fon_2;
   begin
        clrscr;
        Ramka_2(0,0,getmaxx,getmaxy);
        Setcolor(13);
        Rectangle(4,4,635,475);
        Setcolor(15);
        Rectangle(1,1,638,478);
        Setcolor(13);
        line(4,430,635,430);
        line(4,434,635,434);
        Setcolor(15);
        line(3,432,636,432);

        SetFillStyle(1,9);
        Bar(5,5,634,25);
        Setcolor(0);
        line(5,25,634,25);
        line(5,26,634,26);

        Setcolor(13);
        line(560,435,560,475);
        line(556,435,556,475);
        Setcolor(15);
        line(558,433,558,477);

        risovanie_key(570,445,625,465,10,'�����');
   end;

end.