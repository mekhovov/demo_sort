unit DS_Ramks;
interface

  procedure Ramka_Fon;{Рисование рамки, на фоне которой будет производться сортировка}
  procedure Ramka_Fon_2;{Рисование рамки, на фоне которой будет распологаться блок-схема}

  procedure Ramka_1(x1,y1,x2,y2 :integer);{Рисование рамки}
  procedure Ramka_2(x1,y1,x2,y2:integer);{Рисование выпуклой рамки}
  procedure Ramka_2_2(x1,y1,x2,y2:integer);{Рисование выпуклой рамки v2}
  procedure Ramka_3(x1,y1,x2,y2:integer);{Рисование впуклой рамки}
  procedure Ramka_4(x1,y1,x2,y2:integer;stroka:string);{Рисование впуклой рамки с белым фоном}

implementation
uses crt,graph,DS_Buton;
{-----Рисование рамки-------------------------------------------------------}
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
{-----Рисование выпуклой рамки----------------------------------------------}
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
{-----Рисование выпуклой рамки v2-------------------------------------------}
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
{-----Рисование впуклой рамки-----------------------------------------------}
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
{-----Рисование впуклой рамки с белым фоном---------------------------------}
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
{-----Рисование рамки, на фоне которой будет производться сортировка---------}
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

        risovanie_key(570,445,625,465,10,'Меню');
   end;
{---Рисование рамки, на фоне которой будет распологаться блок-схема---------}
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

        risovanie_key(570,445,625,465,10,'Далее');
   end;

end.