unit DS;
interface
  procedure Start_Demo_Sorting;
  procedure Information_1(zad:byte);{Вывод окна запроса о дополнительной информации}
  procedure Information_2(zad:byte);{Вывод окна запроса о дополнительной информации}
  procedure Vibor_first;{Процедура выбора в основном меню}
  procedure End_Demo_Sorting;
implementation
uses DS_BC,
     DS_Mouse,
     DS_Photo,
     DS_GInit,
     DS_Tools,
     DS_Efect,
     DS_Buton,
     DS_Ramks,
     DS_BlShem,
     DS_Zast,
     DS_Gif,
     DS_T_G,
     DS_Spr,
     Dos,
     CRT,
     Graph;
{--------------------------------------------------------------------------------}
  procedure Start_Demo_Sorting;
  begin
       Control_Files;
       Temnenie_Monitora(1);

       {Zastavka;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&}

       Randomize;
       Grafika_VGA_On;
       Izmenenie_Palitri(1);
       Vibor_first;
  end;
{#############################################################################}
{#############################################################################}
{---Процедура вывода окна запроса о дополнительной информации---------------}
   procedure Information_1(zad:byte);
   var Vihod_BS,Del_BS,BS:boolean;
       i:byte;
   begin
            i:=40;
            while i>0 do
                  begin
                       setcolor(13);
                       rectangle(150+i,170+i,490-i,250-i);
                       newdelay(1);
                       setcolor(14);
                       rectangle(150+i,170+i,490-i,250-i);

                       dec(i,10)
                  end;

            Ramka_2(150,170,490,250);

            pcx_photo('.\DS_data\img\ds_vopr.pcx',160,175);

            settextstyle(0,0,0);
            setcolor(0);

            OutTextXY(195,180,'Хотите ли вы получить дополнительную');
            OutTextXY(195,190,'    информацию об этом методе?');

            Risovanie_Key_1(170,220,300,240,30,'Да');
            Risovanie_Key_1(330,220,470,240,31,'Нет');

            Show_Mouse;


            Vihod_BS:=false;
            BS:=false;
            repeat
                  vedenie_kursora(10);

                  if not Bs
                     then
                         begin
                              vedenie_kursora(30);
                              vedenie_kursora(31);

                              if keypress(30,3)
                                 then
                                     begin
                                          BS:=true;
                                          Vihod_BS:=true;
                                          Hide_Mouse;
                                          Ramka_Fon_2;
                                          setfillstyle(1,14);
                                          bar(10,435,550,472);
                                          Setcolor(0);
                                          OutTextXY(10,450,'Чтобы начать сортировку нажмите клавишу ''Далее ''');
                                          Block_Shema(zad);
                                     end;

                              if keypress(31,3)
                                 then
                                     begin
                                          Hide_mouse;
                                          setfillstyle(1,14);
                                          bar(150,170,490,250);
                                          Show_mouse;
                                          BS:=true;
                                          Vihod_BS:=true;
                                     end
                         end;
            until keypress(10,3) or Vihod_BS;
            NewDelay(4);
   end;
{#############################################################################}
{#############################################################################}
{---Процедура вывода окна запроса о дополнительной информации---------------}
   procedure Information_2(zad:byte);
   var Vihod_BS,Del_BS,BS:boolean;
       i:byte;
   begin
        Hide_Mouse;

        i:=40;
        while i>0 do
              begin
                   setcolor(13);
                   rectangle(150+i,290+i,490-i,370-i);
                   newdelay(1);
                   setcolor(14);
                   rectangle(150+i,290+i,490-i,370-i);

                   dec(i,10)
              end;

        Ramka_2(150,290,490,370);

        pcx_photo('.\DS_data\img\ds_vopr.pcx',160,295);

        settextstyle(0,0,0);
        setcolor(0);

        OutTextXY(210,300,'Хотите ли вы получить (повторно)');
        OutTextXY(210,310,'  дополнительную информацию об ');
        OutTextXY(210,320,'         этом методе?');

        Risovanie_Key_1(170,340,300,360,30,'Да');
        Risovanie_Key_1(330,340,470,360,31,'Нет');
        Show_Mouse;


        Vihod_BS:=false;
        BS:=false;
        repeat
              vedenie_kursora(10);

              if not Bs
                 then
                     begin
                          vedenie_kursora(30);
                          vedenie_kursora(31);

                          if keypress(30,3)
                             then
                                 begin
                                      BS:=true;
                                      Vihod_BS:=true;
                                      Hide_Mouse;
                                      Ramka_Fon;
                                      setfillstyle(1,14);
                                      bar(10,435,550,472);
                                      Setcolor(0);
                                      OutTextXY(10,450,'Для перехода в меню нажмите клавишу ''Меню ''');
                                      Block_Shema(zad);
                                 end;

                          if keypress(31,3)
                             then
                                 begin
                                      Hide_mouse;
                                      setfillstyle(1,14);
                                      bar(150,290,490,370);
                                      Show_mouse;
                                      BS:=true;
                                 end
                     end;
        until keypress(10,3) or Vihod_BS;
   end;
{#############################################################################}
{#############################################################################}
{#############################################################################}
{---Процедура рисования меню для выбора сортировки--------------------------}
    procedure interfaise_menu;
              begin
                   Hide_Mouse;

                   cleardevice;
                   Izmenenie_Palitri(1);
                   Init_mouse;

                   Ramka_2(0,0,getmaxx,getmaxy);
                   Setcolor(13);
                   Rectangle(4,4,635,475);
                   Setcolor(15);
                   Rectangle(1,1,638,478);

                   Ramka_1(25,45,610,410);
                   SetFillStyle(1,13);
                   Bar(29,49,606,406);

                   SetFillStyle(1,9);
                   Bar(5,5,634,25);

                   Setcolor(13);
                   line(4,430,635,430);
                   line(4,434,635,434);
                   Setcolor(15);
                   line(3,432,636,432);

                   Setcolor(15);
                   OutTextXY(10,10,'                              Методы сортировок');
                   Setcolor(0);
                   line(5,25,634,25);
                   line(5,26,634,26);

                   Setcolor(0);
                   OutTextXY(140,450,'Выберите интересующий Вас метод сортировки.');

                   risovanie_key(120-30,63,500-30,93,1,'Обменная сортировка с выбором (метод пузырька)');
                   risovanie_key(120-30,113+10,500-30,143+10,2,'Сортировка посредством простого выбора');
                   risovanie_key(120-30,163+20,500-30,193+20,3,'Сортировка простыми вставками');
                   risovanie_key(120-30,213+30,500-30,243+30,4,'Сортировка с убывающим шагом (метод Шелла)');
                   risovanie_key(120-30,263+40,500-30,293+40,5,'Обменная сортировка с разделением (метод Хоара)');
                   risovanie_key(120-30,363,500-30,393,7,'Переход в основное меню');

                   {risovanie_key(120,313,500,343,6,'**Сортировка слиянием**');}

                   show_mouse;
              end;
{#############################################################################}
{#############################################################################}
{#############################################################################}
{-----Процедура рисования основного меню------------------------------------}
    procedure first_interfaise_menu;
              begin
                   Hide_mouse;
                   ClrScr;

                   Ramka_2(0,0,getmaxx,getmaxy);

                   pcx_photo('.\DS_data\img\ds_fon.pcx',0,0);

                   Setcolor(13);
                   Rectangle(4,4,635,475);
                   Setcolor(15);
                   Rectangle(1,1,638,478);

                   Ramka_1(25,45,610,410);
                   SetFillStyle(1,13);
                   Bar(29,49,606,406);

                   SetFillStyle(1,9);
                   Bar(5,5,634,25);

                   Setcolor(13);
                   line(4,430,635,430);
                   line(4,434,635,434);
                   Setcolor(15);
                   line(3,432,636,432);

                   Setcolor(15);
                   OutTextXY(10,10,'    Демонстрационно - обучающая программа.  Методы сортировок в массивах');
                   Setcolor(0);
                   line(5,25,634,25);
                   line(5,26,634,26);



                   {pcx_photo('.\DS_data\img\ds_gerb.pcx',490,50);}


                   risovanie_key(130,60,485,90,91,'О программе');
                   risovanie_key(130,110,485,140,92,'Как пользоваться программой и теория');
                   risovanie_key(130,160,485,190,93,'Переход в меню для выбора сортировки');
                   risovanie_key(130,210,485,240,94,'Время выполнения сортировок');
                   risovanie_key(130,260,485,290,95,'Цитаты на тему...');
                   risovanie_key(130,310,485,340,96,'Создание файла с текстами алгоритмов');
                   risovanie_key(130,360,485,390,97,'Выход');
                   show_mouse;
              end;
{#############################################################################}
{#############################################################################}
{#############################################################################}
{#############################################################################}
const n=10;
type stroka_massiva=record
         chislo:byte;
         color:byte;
         ox:integer;
         oy:integer;
     end;
var namber_zadachi:byte;
    to_dig_or_to_small:boolean;
    massiv:array[0..n] of stroka_massiva;
    massiv_time:array[0..n] of stroka_massiva;
    Count_Sravnenie,Count_Dvijenie:integer;
    koof_zaderjki:byte;
{#############################################################################}
{#############################################################################}
{#############################################################################}
{-----------Процедура заполнения массива-------------------------------------}
    procedure Zapolnenie_massiva(var massiv:array of stroka_massiva);
    var i,j,time_chislo,time_color:byte;
        q:string;

     {---Вложенная процедура сопоставляет цвета карточек по спектру---}
        procedure Colors_and_spektr(massiv_time:array of stroka_massiva);
        var i,j:byte;
            x:integer;
         {---Вложенная процедура сортирует временный массив------------------}
            procedure Sort_Hoarra(l,r:word);
            var b,tmp:integer;
                i,j:word;
                begin
                     i:=l;
                     j:=r;
                     b:=massiv_time[(l+r) div 2].chislo;
                     while i<=j do
                           begin
                                while massiv_time[i].chislo<b do
                                      inc(i);
                                while massiv_time[j].chislo>b do
                                      dec(j);
                                if i<=j
                                   then
                                        begin
                                             tmp:=massiv_time[i].chislo;
                                             massiv_time[i].chislo:=massiv_time[j].chislo;
                                             massiv_time[j].chislo:=tmp;

                                             inc(i);
                                             dec(j);
                                        end;
                                if l<j
                                   then
                                       Sort_Hoarra(l,j);
                                if i<r
                                   then
                                       Sort_Hoarra(i,r);
                           end;
                end;
         {---Конец процедуры сортировки временного массива-------------------}
            begin
                 for i:=1 to n do
                     massiv_time[i].chislo:=massiv[i].chislo;

                 Sort_Hoarra(1,n);

                 if to_dig_or_to_small=true
                    then
                        begin
                             massiv_time[1].color:=1;
                             massiv_time[2].color:=2;
                             massiv_time[3].color:=3;
                             massiv_time[4].color:=3;
                             massiv_time[5].color:=4;
                             massiv_time[6].color:=5;
                             massiv_time[7].color:=6;
                             massiv_time[8].color:=7;
                             massiv_time[9].color:=8;
                             massiv_time[10].color:=9;

                             for i:=1 to n do
                                 for j:=1 to n do
                                     if massiv_time[i].chislo = massiv[j].chislo
                                        then
                                            massiv[j].color:=massiv_time[i].color;

                            for i:=1 to n do
                                if massiv_time[4].chislo = massiv[i].chislo
                                   then
                                       massiv[i].chislo:=massiv_time[3].chislo

                        end
                    else
                        begin
                             massiv_time[1].color:=9;
                             massiv_time[2].color:=8;
                             massiv_time[3].color:=7;
                             massiv_time[4].color:=6;
                             massiv_time[5].color:=5;
                             massiv_time[6].color:=4;
                             massiv_time[7].color:=3;
                             massiv_time[8].color:=3;
                             massiv_time[9].color:=2;
                             massiv_time[10].color:=1;

                             for i:=1 to n do
                                 for j:=1 to n do
                                     if massiv_time[i].chislo = massiv[j].chislo
                                        then
                                            massiv[j].color:=massiv_time[i].color;
                            for i:=1 to n do
                                if massiv_time[7].chislo = massiv[i].chislo
                                   then
                                       massiv[i].chislo:=massiv_time[8].chislo;
                        end;
         end;
     {---Конец процедуры сопоставления цвета карточек по спектру-------------}
        begin
             for i:=1 to n do
                 with massiv[i] do
                      begin
                           time_chislo:=random(90)+10;
                                    if (time_chislo=massiv[1].chislo) or
                                       (time_chislo=massiv[2].chislo) or
                                       (time_chislo=massiv[3].chislo) or
                                       (time_chislo=massiv[4].chislo) or
                                       (time_chislo=massiv[5].chislo) or
                                       (time_chislo=massiv[6].chislo) or
                                       (time_chislo=massiv[7].chislo) or
                                       (time_chislo=massiv[8].chislo) or
                                       (time_chislo=massiv[9].chislo) or
                                       (time_chislo=massiv[10].chislo)
                                      then
                                          dec(i)
                                      else
                                          massiv[i].chislo:=time_chislo;
                      end;

             Colors_and_spektr(massiv_time);

             massiv[1].ox:=9;
             massiv[2].ox:=72;
             massiv[3].ox:=137;
             massiv[4].ox:=202;
             massiv[5].ox:=267;
             massiv[6].ox:=332;
             massiv[7].ox:=397;
             massiv[8].ox:=462;
             massiv[9].ox:=527;
             massiv[10].ox:=590;

             for i:=1 to n do
                 massiv[i].oy:=214;
        end;
{#############################################################################}
{#############################################################################}
{#############################################################################}
{-----------Процедура рисования карточек-------------------------------------}
    procedure Risovanie_kartochek(massiv:array of stroka_massiva);
    var p:pointer;
        size:word;
        q:string;
        i:byte;
       begin
            Ramka_1(0,0,60,80);
            setcolor(12);
            rectangle(7,7,48,68);
            setcolor(12);
            rectangle(10,10,45,65);
            setcolor(15);
            rectangle(9,9,46,66);

            size:=imagesize(7,7,48,68);
            getmem(p,size);
            getimage(7,7,48,68,p^);
            Ramka_fon;
            settextstyle(1,0,3);
            for i:=1 to n do
                begin
                     putimage(massiv[i].ox,214,p^,copyput);
                     setfillstyle(1,massiv[i].color);
                     floodfill(massiv[i].ox+10,218,12);
                     setcolor(0);
                     str(massiv[i].chislo,q);
                     outtextxy(massiv[i].ox+8,229,q);
                end;
            settextstyle(0,0,0);
            freemem(p,size);
       end;
{#############################################################################}
{#############################################################################}
{#############################################################################}
{--------------Прoцедура выбора нужной сортировки или выхода-----------------}
   procedure vibor;
   var times:boolean;
       qqqqq,man:byte;

  {---Вложенная процедура проверки на нажатие какой либо клавиши и выхода в меню-}
    procedure Any_key;
    var kl:char;
        s:string[2];
              begin
                   if Keypressed
                      then
                          begin
                               kl:=readkey;

                               if kl=#82
                                  then
                                      times:=true;

                               if kl=#83
                                  then
                                      begin
                                           times:=false;
                                           setfillstyle(1,14);
                                           bar(412,389,633,427);
                                      end;

                               if kl=#27
                                  then
                                      begin
                                           Pres(10);
                                           Temnenie_Monitora(1);
                                           vibor;
                                      end
                                  else
                                      if times
                                         then
                                             begin
                                                  setcolor(0);
                                                  outtextxy(455,405,'Временная задержка');

                                                  Risovanie_Key_1(413,416,523,427,52,'Отсутствует');
                                                  Risovanie_Key_1(527,416,632,427,53,'Присутствует');
                                                  if (kl=#75) and (koof_zaderjki=1)
                                                     then
                                                         begin
                                                              koof_zaderjki:=0;
                                                              Pres_2(52);
                                                         end;

                                                  if (kl=#77)  and (koof_zaderjki=0)
                                                     then
                                                         begin
                                                              koof_zaderjki:=1;
                                                              Pres_2(53);
                                                         end;

                                                  setcolor(9);
                                                  if koof_zaderjki=1
                                                     then
                                                         outtextxy(531,418,'Присутствует')
                                                     else
                                                         outtextxy(424,418,'Отсутствует')
                                             end;
                          end;
              end;
  {---Вложенная процедура выбора метода сортировки (по убыванию / по возрастанию)-}
      procedure To_max_or_to_min;
      var i:byte;
          begin
               i:=50;
               while i>0 do
                     begin
                          setcolor(13);
                          rectangle(170+i,170+i,459-i,279-i);
                          newdelay(1);
                          setcolor(14);
                          rectangle(170+i,170+i,459-i,279-i);

                          dec(i,10)
                     end;

               ramka_2(170,170,459,279);
               setcolor(0);
               outtextxy(234,209,'Отсортировать числа ...');

               pcx_photo('.\DS_data\img\ds_vopr.pcx',190,180);

               setcolor(0);
               outtextxy(10,450,'Выберите, каким образом числа будут распологаться после сортировки.');

               risovanie_key_1(180,249,310,269,20,'По возрастанию');
               risovanie_key_1(320,249,450,269,21,'По убыванию');
               show_mouse;
               i:=0;       repeat
                    vedenie_kursora(10);
                    vedenie_kursora(20);
                    vedenie_kursora(21);
                    if keypress(10,3)
                       then
                            vibor;

                     if keypress(20,3)
                        then
                            begin
                                 to_dig_or_to_small:=true;
                                 i:=1;
                            end;
                     if keypress(21,3)
                        then
                            begin
                                 to_dig_or_to_small:=false;
                                 i:=1;
                            end;

               until (i=1);

               setfillstyle(1,14);
               bar(10,440,550,462);
          end;
  {---Вложенная процедура вывода кол-ва сравнений и перестановок на экран----}
    procedure Counts;
    var stroka_1,stroka_2:string;
        okonchanie_Count_Sravnenie,okonchanie_Count_Dvijenie:string;
        q,qq:integer;
        i:byte;
              begin
                   i:=30;
                   while i>0 do
                         begin
                              setcolor(13);
                              rectangle(160+i,90+i,484-i,159-i);
                              newdelay(1);
                              setcolor(14);
                              rectangle(160+i,90+i,484-i,159-i);

                              dec(i,10)
                         end;

                   Ramka_2(160,90,484,159);
                   setcolor(0);

                   pcx_photo('.\DS_data\img\ds_voskl.pcx',170,95);

                   settextstyle(0,0,0);
                   okonchanie_Count_Sravnenie:='';
                   okonchanie_Count_Dvijenie:='';
                   if Count_Sravnenie<20
                      then
                          begin
                               q:=Count_Sravnenie;
                               case q of
                                    1:okonchanie_Count_Sravnenie:='ие';
                                    2..4:okonchanie_Count_Sravnenie:='ия';
                                    5..20:okonchanie_Count_Sravnenie:='ий';
                               end;
                          end
                      else
                          begin
                               q:=Count_Sravnenie;
                               case q of
                                    20..99:begin
                                                qq:=q mod 10;
                                                case qq of
                                                         1:okonchanie_Count_Sravnenie:='ие';
                                                         2..4:okonchanie_Count_Sravnenie:='ия';
                                                         5..9,0:okonchanie_Count_Sravnenie:='ий';
                                                end;

                                           end;
                                    100..999:begin
                                                qq:=q mod 100;
                                                case qq of
                                                         1:okonchanie_Count_Sravnenie:='ие';
                                                         2..4:okonchanie_Count_Sravnenie:='ия';
                                                         5..9,0:okonchanie_Count_Sravnenie:='ий';
                                                end;
                                           end;
                               end;
                          end;

                   if Count_Dvijenie<20
                      then
                          begin
                               q:=Count_Dvijenie;
                               case q of
                                    1:okonchanie_Count_Dvijenie:='ка';
                                    2..4:okonchanie_Count_Dvijenie:='ки';
                                    5..20:okonchanie_Count_Dvijenie:='ок';
                               end;
                          end
                      else
                          begin
                               q:=Count_Dvijenie;
                               case q of
                                    20..99:begin
                                                qq:=q mod 10;
                                                case qq of
                                                         1:okonchanie_Count_Dvijenie:='ка';
                                                         2..4:okonchanie_Count_Dvijenie:='ки';
                                                         5..9,0:okonchanie_Count_Dvijenie:='ок';
                                                end;

                                           end;
                                    100..999:begin
                                                qq:=q mod 100;
                                                case qq of
                                                         1:okonchanie_Count_Dvijenie:='ка';
                                                         2..4:okonchanie_Count_Dvijenie:='ки';
                                                         5..9,0:okonchanie_Count_Dvijenie:='ок';
                                                end;
                                           end;
                               end;
                          end;


                   str(Count_Sravnenie,stroka_1);
                   str(Count_Dvijenie,stroka_2);
                   setcolor(0);
                   outtextxy(200,105,'В ходе сортировки было произведено:');
                   outtextxy(220,125,'      '+stroka_1+'  сравнен'+okonchanie_Count_Sravnenie);
                   outtextxy(220,135,'      '+stroka_2+'  перестанов'+okonchanie_Count_Dvijenie+'.');
              end;
  {---Вложенная процедура движения-----------------------------------------------}
    procedure Dvijenie(ch_1,ch_2:byte);
    var y,i,w:integer;
        chislo_1,chislo_2:pointer;
        size_1,size_2:word;
       begin
            inc(Count_Dvijenie);

            y:=213;
            size_2:=imagesize(massiv[ch_1].ox-1,y,massiv[ch_1].ox+43,y+63);
            getmem(chislo_2,size_2);
            getimage(massiv[ch_1].ox-1,y,massiv[ch_1].ox+43,y+63,chislo_2^);

            size_1:=imagesize(massiv[ch_2].ox-1,y,massiv[ch_2].ox+43,y+63);
            getmem(chislo_1,size_1);
            getimage(massiv[ch_2].ox-1,y,massiv[ch_2].ox+43,y+63,chislo_1^);

            w:=y;
            for i:=y downto y-67 do
                begin
                     Any_key;

                     putimage(massiv[ch_1].ox-1,i,chislo_2^,CopyPut);
                     putimage(massiv[ch_2].ox-1,w,chislo_1^,CopyPut);
                     inc(w);
                end;

            w:=massiv[ch_2].ox-1;
            for i:=massiv[ch_1].ox-1 downto massiv[ch_2].ox-1 do
                begin
                     Any_key;

                     putimage(i,y-67,chislo_2^,CopyPut);
                     putimage(w,y+67,chislo_1^,CopyPut);
                     inc(w);
                end;
            w:=y+67;
            for i:=y-67 to y do
                begin
                     Any_key;

                     putimage(massiv[ch_2].ox-1,i,chislo_2^,CopyPut);
                     putimage(massiv[ch_1].ox-1,w,chislo_1^,CopyPut);
                     dec(w);
                end;
            freemem(chislo_1,size_1);
            freemem(chislo_2,size_2);
       end;
  {---Вложенная процедура рисования "сравнения" чисел------------------------}
    procedure Sravnenie(ch_1,ch_2:byte);
    var i:byte;
        y:integer;
        begin
             inc(Count_Sravnenie);
             for i:=1 to 20 do
                 begin
                     Any_key;
                     setcolor(15);
                     rectangle(massiv[ch_1].ox-2,massiv[ch_1].oy-2,massiv[ch_1].ox+43,massiv[ch_1].oy+63);
                     setcolor(15);
                     rectangle(massiv[ch_2].ox-2,massiv[ch_2].oy-2,massiv[ch_2].ox+43,massiv[ch_2].oy+63);
                     setcolor(14);
                     rectangle(massiv[ch_1].ox-3,massiv[ch_1].oy-3,massiv[ch_1].ox+44,massiv[ch_1].oy+64);
                     setcolor(14);
                     rectangle(massiv[ch_2].ox-3,massiv[ch_2].oy-3,massiv[ch_2].ox+44,massiv[ch_2].oy+64);
                     NewDelay(2 * koof_zaderjki);
                     setcolor(14);
                     rectangle(massiv[ch_1].ox-2,massiv[ch_1].oy-2,massiv[ch_1].ox+43,massiv[ch_1].oy+63);
                     setcolor(14);
                     rectangle(massiv[ch_2].ox-2,massiv[ch_2].oy-2,massiv[ch_2].ox+43,massiv[ch_2].oy+63);
                     setcolor(15);
                     rectangle(massiv[ch_1].ox-3,massiv[ch_1].oy-3,massiv[ch_1].ox+44,massiv[ch_1].oy+64);
                     setcolor(15);
                     rectangle(massiv[ch_2].ox-3,massiv[ch_2].oy-3,massiv[ch_2].ox+44,massiv[ch_2].oy+64);
                     NewDelay(2 * koof_zaderjki);
                 end;
                 setcolor(14);
                 rectangle(massiv[ch_1].ox-3,massiv[ch_1].oy-3,massiv[ch_1].ox+44,massiv[ch_1].oy+64);
                 setcolor(14);
                 rectangle(massiv[ch_2].ox-3,massiv[ch_2].oy-3,massiv[ch_2].ox+44,massiv[ch_2].oy+64);

                 NewDelay(10 * koof_zaderjki);
        end;
  {---Вложенная процедура рисования "опускания" карточек---------------------}
    procedure Opuskanie_Kartochki(ch:byte);
    var y,i:integer;
        chislo_1:pointer;
        size_1:word;
        ch2,stroka_1:string;
       begin
            if to_dig_or_to_small=true
               then
                   begin
                        setcolor(0);
                        str(massiv[ch].chislo,ch2);
                        stroka_1:='Число '+ch2+' считается минимальным.';
                        OutTextXY(10,445,stroka_1);
                   end
               else
                   begin
                        setcolor(0);
                        str(massiv[ch].chislo,ch2);
                        stroka_1:='Число '+ch2+' считается максимальным.';
                        OutTextXY(10,445,stroka_1);
                   end;
            size_1:=imagesize(massiv[ch].ox-1,massiv[ch].oy-1,massiv[ch].ox+43,massiv[ch].oy+62);
            getmem(chislo_1,size_1);
            getimage(massiv[ch].ox-1,massiv[ch].oy-1,massiv[ch].ox+43,massiv[ch].oy+62,chislo_1^);
            for i:=massiv[ch].oy-1 to massiv[ch].oy+9 do
                begin
                     Any_key;

                     putimage(massiv[ch].ox-1,i,chislo_1^,CopyPut);
                     NewDelay(5 * koof_zaderjki);
                end;
            freemem(chislo_1,size_1);
            inc(massiv[ch].oy,10);
            setfillstyle(1,14);
            bar(10,445,550,462);
       end;
  {---Вложенная процедура рисования "поднятия" карточек----------------------}
   procedure Podnyatie_Kartochki(ch:byte);
   var y,i:integer;
       chislo_1:pointer;
       size_1:word;
       begin
            size_1:=imagesize(massiv[ch].ox-1,massiv[ch].oy-1,massiv[ch].ox+43,massiv[ch].oy+62);
            getmem(chislo_1,size_1);
            getimage(massiv[ch].ox-1,massiv[ch].oy-1,massiv[ch].ox+43,massiv[ch].oy+62,chislo_1^);
            for i:=massiv[ch].oy-1 downto massiv[ch].oy-11 do
                begin
                     Any_key;

                     putimage(massiv[ch].ox-1,i,chislo_1^,CopyPut);
                     NewDelay(2 * koof_zaderjki);
                end;
            freemem(chislo_1,size_1);
            dec(massiv[ch].oy,10);
       end;
  {---Вложенная процедура рисования выежающей надписи в конце сортировки-----}
   procedure End_Sorting(zad:byte);
   var xx,count:integer;
       size,x,y:word;
       p:pointer;
        {---Вложенная процедура рисования закрашивания карточек в конце сортировки-------}
          procedure Zakrashivanie_Kartochek_Posle_Sort;
          var i:byte;
              y:integer;
              q:string;
              begin
                   y:=214;
                   settextstyle(1,0,3);
                   for i:=1 to n div 2 do
                       begin
                            setfillstyle(1,massiv[i].color);
                            floodfill(massiv[i].ox+10,y+10,12);
                            setcolor(0);
                            str(massiv[i].chislo,q);
                            outtextxy(massiv[i].ox+8,y+15,q);
                            NewDelay(1);

                            setfillstyle(1,massiv[n+1-i].color);
                            floodfill(massiv[n+1-i].ox+10,y+10,12);
                            setcolor(0);
                            str(massiv[n+1-i].chislo,q);
                            outtextxy(massiv[n+1-i].ox+8,y+15,q);
                            NewDelay(1);
                       end;
                   settextstyle(0,0,0);
              end;
        {---Конец вложенной процедуры рисования закрашивания карточек в конце сортировки-------}
       begin
            Hide_Mouse;
            NewDelay(5);
            Zakrashivanie_Kartochek_Posle_Sort;
            Show_Mouse;
            NewDelay(5);
            Hide_Mouse;
            setfillstyle(1,14);
            bar(10,435,550,472);
            Setcolor(0);
            OutTextXY(10,445,'Массив отсортирован.');
            Show_Mouse;
            NewDelay(5);
            Hide_Mouse;
            setcolor(0);
            OutTextXY(10,455,'Для перехода в меню нажмите эту клавишу ');
            setcolor(7);
            line(332,453,333,453);
            line(333,454,335,454);
            line(334,455,337,455);
            line(335,456,339,456);
            line(325,457,341,457);
            line(325,458,343,458);
            setcolor(8);
            line(325,459,345,459);
            line(325,460,343,460);
            line(325,461,341,461);
            line(335,462,339,462);
            line(334,463,337,463);
            line(333,464,335,464);
            line(332,465,333,465);
            Show_Mouse;

            size:=imagesize(9,448,346,460);
            getmem(p,size);
            Hide_Mouse;
            getimage(9,453,346,465,p^);
            Show_Mouse;
            xx:=(9);
            count:=9;
            repeat
                  vedenie_kursora(10);
                  Hide_Mouse;
                  putimage(xx,453,p^,copyput);
                  Show_Mouse;
                  case count of
                       10..217:begin
                                    inc(xx);
                                    Delay(70);
                                end;
                       218..265:begin
                                     dec(xx);
                                     if odd(xx)
                                        then
                                            Delay(100);
                                end;
                       266..315:begin
                                     inc(xx);
                                     Delay(100+xx);
                                end;
                  end;
                  inc(count);
            until keypress(10,3) or (count=316);

            if count=316
               then
                   Information_2(zad);

            freemem(p,size);
            Temnenie_Monitora(0);
            interfaise_menu;
       end;

  {---Вложенная процедура демонстрации обменной сортировки с выбором (метод пузырька)-}
    procedure Zadacha_1;
    var chislo:byte;
        z,i,j:byte;
        x,y:integer;
        q:string;
        x1,y1:word;
        ch1,ch2,stroka_1,stroka_2,stroka_3:string;
       begin
            Ochistka_Bufera_Klaviaturi;
            Keypressed;

            Count_Sravnenie:=0;
            Count_Dvijenie:=0;

            ClrScr;
            hide_mouse;
            Zapolnenie_massiva(massiv);
            Risovanie_kartochek(massiv);
            Setcolor(15);
            OutTextXY(120,10,'Обменная сортировка с выбором (метод пузырька)');
            y:=214;

            Setcolor(13);
            OutTextXY(10,436,'Для перехода в меню нажмите клавишу Esc');

            Setcolor(13);
            OutTextXY(10,464,'Отсортированную часть массива сост. числа:');
            stroka_3:=' ';
            z:=0;

            for i:=2 to n do
                begin
                     for j:=n downto i do
                         begin
                              Setcolor(0);
                              str(massiv[j].chislo,ch1);
                              str(massiv[j-1].chislo,ch2);
                              if to_dig_or_to_small=true
                                 then
                                     begin
                                          stroka_1:='Сравниваются числа '+ch2+' и '+ch1+' ...';
                                          stroka_2:='Если число '+ch1+' меньше, чем число '+ch2+', то они меняются местами.';
                                          OutTextXY(10,445,stroka_1);
                                          OutTextXY(10,455,stroka_2);
                                     end
                                 else
                                     begin
                                          stroka_1:='Сравниваются числа '+ch2+' и '+ch1+' ...';
                                          stroka_2:='Если число '+ch1+' больше, чем число '+ch2+', то они меняются местами.';
                                          OutTextXY(10,445,stroka_1);
                                          OutTextXY(10,455,stroka_2);
                                     end;
                              Sravnenie(j,j-1);
                              setfillstyle(1,14);
                              bar(10,445,550,462);

                              if to_dig_or_to_small=true
                                 then
                                     begin
                                          if massiv[j].chislo < massiv[j-1].chislo
                                             then
                                                 begin
                                                      Setcolor(0);
                                                      str(massiv[j].chislo,ch1);
                                                      str(massiv[j-1].chislo,ch2);
                                                      stroka_1:='Число '+ch1+' меньше, чем число '+ch2;
                                                      OutTextXY(10,445,stroka_1);
                                                      NewDelay(50 * koof_zaderjki);
                                                      setfillstyle(1,14);
                                                      bar(10,445,550,462);

                                                      setcolor(0);
                                                      str(massiv[j].chislo,ch1);
                                                      str(massiv[j-1].chislo,ch2);
                                                      stroka_1:='Числа '+ch1+' и '+ch2+' меняются местами ...' ;
                                                      OutTextXY(10,445,stroka_1);

                                                      Dvijenie(j,j-1);

                                                      setfillstyle(1,14);
                                                      bar(10,445,550,462);

                                                      x:=massiv[j-1].chislo;
                                                      massiv[j-1].chislo:=massiv[j].chislo;
                                                      massiv[j].chislo:=x;

                                                      x:=massiv[j-1].color;
                                                      massiv[j-1].color:=massiv[j].color;
                                                      massiv[j].color:=x;
                                                 end
                                             else
                                                 begin
                                                      if massiv[j].chislo > massiv[j-1].chislo
                                                         then
                                                             begin
                                                                  Setcolor(0);
                                                                  str(massiv[j].chislo,ch1);
                                                                  str(massiv[j-1].chislo,ch2);
                                                                  stroka_1:='Число '+ch1+' больше, чем число '+ch2;
                                                                  OutTextXY(10,445,stroka_1);
                                                                  NewDelay(50 * koof_zaderjki);
                                                                  setfillstyle(1,14);
                                                                  bar(10,445,550,462);
                                                             end;
                                                      if massiv[j].chislo = massiv[j-1].chislo
                                                         then
                                                             begin
                                                                  Setcolor(0);
                                                                  str(massiv[j].chislo,ch1);
                                                                  str(massiv[j-1].chislo,ch2);
                                                                  stroka_1:='Число '+ch1+' равно числу '+ch2;
                                                                  OutTextXY(10,445,stroka_1);
                                                                  NewDelay(50 * koof_zaderjki);
                                                                  setfillstyle(1,14);
                                                                  bar(10,445,550,462);
                                                             end;
                                                 end;
                                     end
                                 else
                                     begin
                                          if massiv[j].chislo > massiv[j-1].chislo
                                             then
                                                 begin
                                                      Setcolor(0);
                                                      str(massiv[j].chislo,ch1);
                                                      str(massiv[j-1].chislo,ch2);
                                                      stroka_1:='Число '+ch1+' больше, чем число '+ch2;
                                                      OutTextXY(10,445,stroka_1);
                                                      NewDelay(50 * koof_zaderjki);
                                                      setfillstyle(1,14);
                                                      bar(10,445,550,462);

                                                      setcolor(0);
                                                      str(massiv[j].chislo,ch1);
                                                      str(massiv[j-1].chislo,ch2);
                                                      stroka_1:='Числа '+ch1+' и '+ch2+' меняются местами ...' ;
                                                      OutTextXY(10,445,stroka_1);

                                                      Dvijenie(j,j-1);

                                                      setfillstyle(1,14);
                                                      bar(10,445,550,462);

                                                      x:=massiv[j-1].chislo;
                                                      massiv[j-1].chislo:=massiv[j].chislo;
                                                      massiv[j].chislo:=x;

                                                      x:=massiv[j-1].color;
                                                      massiv[j-1].color:=massiv[j].color;
                                                      massiv[j].color:=x;
                                                 end
                                             else
                                                 begin
                                                      if massiv[j].chislo < massiv[j-1].chislo
                                                         then
                                                             begin
                                                                  Setcolor(0);
                                                                  str(massiv[j].chislo,ch1);
                                                                  str(massiv[j-1].chislo,ch2);
                                                                  stroka_1:='Число '+ch1+' меньше, чем число '+ch2;
                                                                  OutTextXY(10,445,stroka_1);
                                                                  NewDelay(50 * koof_zaderjki);
                                                                  setfillstyle(1,14);
                                                                  bar(10,445,550,462);
                                                             end;
                                                      if massiv[j].chislo = massiv[j-1].chislo
                                                         then
                                                             begin
                                                                  Setcolor(0);
                                                                  str(massiv[j].chislo,ch1);
                                                                  str(massiv[j-1].chislo,ch2);
                                                                  stroka_1:='Число '+ch1+' равно числу '+ch2;
                                                                  OutTextXY(10,445,stroka_1);
                                                                  NewDelay(50 * koof_zaderjki);
                                                                  setfillstyle(1,14);
                                                                  bar(10,445,550,462);
                                                             end;
                                                 end;
                                     end;

                         end;
                     setfillstyle(6,massiv[i-1].color);
                     floodfill(massiv[i-1].ox+10,y+10,12);
                     settextstyle(1,0,3);
                     setcolor(15);
                     str(massiv[i-1].chislo,q);
                     outtextxy(massiv[i-1].ox+8,y+15,q);
                     settextstyle(0,0,0);

                     Setcolor(massiv[i-1].color);
                     str(massiv[i-1].chislo,ch1);
                     stroka_3:=ch1;
                     OutTextXY(350+z,464,stroka_3);
                     inc(z,20);
                     NewDelay(10 * koof_zaderjki);
                end;
            NewDelay(20 * koof_zaderjki);
            setfillstyle(6,massiv[i].color);
            floodfill(massiv[i].ox+10,y+10,12);
            settextstyle(1,0,3);
            setcolor(15);
            str(massiv[i].chislo,q);
            outtextxy(massiv[i].ox+8,y+15,q);
            settextstyle(0,0,0);
            Setcolor(massiv[i].color);
            str(massiv[i].chislo,ch1);
            stroka_3:=ch1;
            OutTextXY(350+z,464,stroka_3);
            setfillstyle(1,15);

            Counts;

            Mouse_Set_Position(getmaxx div 2,getmaxy div 2);
            Show_Mouse;
            End_Sorting(1);
       end;
  {---Вложенная процедура демонстрации сортировки посредством простого выбора-}
    procedure Zadacha_2;
    var y:integer;
        i,j,namber_min,min:byte;
        ch1,ch2,ch3,stroka_1,stroka_2,stroka_3:string;
        z:byte;
        q:string;
       begin
            Ochistka_Bufera_Klaviaturi;
            Keypressed;

            Count_Sravnenie:=0;
            Count_Dvijenie:=0;

            ClrScr;
            hide_mouse;
            Zapolnenie_massiva(massiv);
            Risovanie_kartochek(massiv);
            Setcolor(15);
            OutTextXY(150,10,'Сортировка посредством простого выбора');
            y:=214;

            Setcolor(13);
            OutTextXY(10,436,'Для перехода в меню нажмите клавишу Esc');

            Setcolor(13);
            OutTextXY(10,464,'Отсортированную часть массива сост. числа:');
            stroka_3:=' ';
            z:=0;

            for i:=1 to n-1 do
            begin
                 namber_min:=i;
                 min:=massiv[i].chislo;
                 Opuskanie_Kartochki(namber_min);
                 if to_dig_or_to_small=true
                    then
                        for j:=i+1 to n do
                            begin
                                 Setcolor(0);
                                 str(massiv[j].chislo,ch1);
                                 str(massiv[namber_min].chislo,ch2);
                                 stroka_1:='Сравниваются числа '+ch2+' и '+ch1+' ...';
                                 stroka_2:='Если число '+ch1+' меньше, чем число '+ch2+', то оно считается минимальным.';
                                 OutTextXY(10,445,stroka_1);
                                 OutTextXY(10,455,stroka_2);
                                 Sravnenie(j,namber_min);
                                 setfillstyle(1,14);
                                 bar(10,445,550,462);

                                 if massiv[j].chislo<min
                                    then
                                        begin
                                             Setcolor(0);
                                             str(massiv[j].chislo,ch1);
                                             str(massiv[j-1].chislo,ch2);
                                             stroka_1:='Число '+ch1+' меньше, чем число '+ch2;
                                             OutTextXY(10,445,stroka_1);
                                             NewDelay(50 * koof_zaderjki);
                                             setfillstyle(1,14);
                                             bar(10,445,550,462);

                                             if (massiv[namber_min].oy) <> ((getmaxy div 2)-30+5)
                                                then
                                                    Podnyatie_Kartochki(namber_min);

                                             min:=massiv[j].chislo;
                                             namber_min:=j;
                                             Opuskanie_Kartochki(namber_min);
                                        end
                                    else
                                        begin
                                             if massiv[j].chislo>min
                                                then
                                                    begin
                                                         Setcolor(0);
                                                         str(massiv[j].chislo,ch1);
                                                         str(massiv[j-1].chislo,ch2);
                                                         stroka_1:='Число '+ch1+' больше, чем число '+ch2;
                                                         OutTextXY(10,445,stroka_1);
                                                         NewDelay(50 * koof_zaderjki);
                                                         setfillstyle(1,14);
                                                         bar(10,445,550,462);
                                                     end;
                                             if massiv[j].chislo=min
                                                then
                                                    begin
                                                         Setcolor(0);
                                                         str(massiv[j].chislo,ch1);
                                                         str(massiv[j-1].chislo,ch2);
                                                         stroka_1:='Число '+ch1+' равно числу '+ch2;
                                                         OutTextXY(10,445,stroka_1);
                                                         NewDelay(50 * koof_zaderjki);
                                                         setfillstyle(1,14);
                                                         bar(10,445,550,462);
                                                    end;
                                        end;
                            end
                    else
                        for j:=i+1 to n do
                            begin
                                 Setcolor(0);
                                 str(massiv[j].chislo,ch1);
                                 str(massiv[namber_min].chislo,ch2);
                                 stroka_1:='Сравниваются числа '+ch2+' и '+ch1+' ...';
                                 stroka_2:='Если число '+ch1+' больше, чем число '+ch2+', то оно считается максимальным.';
                                 OutTextXY(10,445,stroka_1);
                                 OutTextXY(10,455,stroka_2);
                                 Sravnenie(j,namber_min);
                                 setfillstyle(1,14);
                                 bar(10,445,550,462);

                                 if massiv[j].chislo>min
                                    then
                                        begin
                                             Setcolor(0);
                                             str(massiv[j].chislo,ch1);
                                             str(massiv[j-1].chislo,ch2);
                                             stroka_1:='Число '+ch1+' больше, чем число '+ch2;
                                             OutTextXY(10,445,stroka_1);
                                             NewDelay(50 * koof_zaderjki);
                                             setfillstyle(1,14);
                                             bar(10,445,550,462);

                                             if (massiv[namber_min].oy) <> ((getmaxy div 2)-30+5)
                                                then
                                                    Podnyatie_Kartochki(namber_min);

                                             min:=massiv[j].chislo;
                                             namber_min:=j;
                                             Opuskanie_Kartochki(namber_min);
                                        end
                                    else
                                        begin
                                             if massiv[j].chislo<min
                                                then
                                                    begin
                                                         Setcolor(0);
                                                         str(massiv[j].chislo,ch1);
                                                         str(massiv[j-1].chislo,ch2);
                                                         stroka_1:='Число '+ch1+' меньше, чем число '+ch2;
                                                         OutTextXY(10,445,stroka_1);
                                                         NewDelay(50 * koof_zaderjki);
                                                         setfillstyle(1,14);
                                                         bar(10,445,550,462);
                                                     end;
                                             if massiv[j].chislo=min
                                                then
                                                    begin
                                                         Setcolor(0);
                                                         str(massiv[j].chislo,ch1);
                                                         str(massiv[j-1].chislo,ch2);
                                                         stroka_1:='Число '+ch1+' равно числу '+ch2;
                                                         OutTextXY(10,445,stroka_1);
                                                         NewDelay(50 * koof_zaderjki);
                                                         setfillstyle(1,14);
                                                         bar(10,445,550,462);
                                                    end;
                                        end;
                            end;
                 if (massiv[namber_min].oy) <> (214)
                    then
                        Podnyatie_Kartochki(namber_min);

                 if (to_dig_or_to_small) and (namber_min<>i)
                    then
                        begin
                             setcolor(0);
                             str(massiv[i].chislo,ch1);
                             str(massiv[namber_min].chislo,ch2);
                             str(i,ch3);
                             stroka_1:=ch3+'-е число('+ch1+') меняется местом с минимальным числом('+ch2+')...';
                             OutTextXY(10,445,stroka_1);
                             Dvijenie(namber_min,i);
                             setfillstyle(1,14);
                             bar(10,445,550,462);
                        end
                    else
                        if (not to_dig_or_to_small) and (namber_min<>i)
                           then
                               begin
                                    setcolor(0);
                                    str(massiv[i].chislo,ch1);
                                    str(massiv[namber_min].chislo,ch2);
                                    str(i,ch3);
                                    stroka_1:=ch3+'-е число('+ch1+') меняется местом с максимальным числом('+ch2+')...';
                                    OutTextXY(10,445,stroka_1);
                                    Dvijenie(namber_min,i);
                                    setfillstyle(1,14);
                                    bar(10,445,550,462);
                               end;
                 massiv[namber_min].chislo:=massiv[i].chislo;
                 massiv[i].chislo:=min;

                 min:=massiv[namber_min].color;
                 massiv[namber_min].color:=massiv[i].color;
                 massiv[i].color:=min;

                 setfillstyle(6,massiv[i].color);
                 floodfill(massiv[i].ox+10,y+10,12);
                 settextstyle(1,0,3);
                 setcolor(15);
                 str(massiv[i].chislo,q);
                 outtextxy(massiv[i].ox+8,y+15,q);
                 settextstyle(0,0,0);

                 Setcolor(massiv[i].color);
                 str(massiv[i].chislo,ch1);
                 stroka_3:=ch1;
                 OutTextXY(350+z,464,stroka_3);
                 inc(z,20);
                 NewDelay(10 * koof_zaderjki);
            end;

            i:=n;
            NewDelay(20 * koof_zaderjki);
            setfillstyle(6,massiv[i].color);
            floodfill(massiv[i].ox+10,y+10,12);
            settextstyle(1,0,3);
            setcolor(15);
            str(massiv[i].chislo,q);
            outtextxy(massiv[i].ox+8,y+15,q);
            settextstyle(0,0,0);
            Setcolor(massiv[i].color);
            str(massiv[i].chislo,ch1);
            stroka_3:=ch1;
            OutTextXY(350+z,464,stroka_3);
            setfillstyle(1,15);

            Counts;

            Mouse_Set_Position(getmaxx div 2,getmaxy div 2);
            Show_Mouse;
            End_Sorting(2);
       end;
  {---Вложенная процедура демонстрации coртировки простыми вставками---------}
    procedure Zadacha_3;

       procedure Obmen_Kartochek(namber_kartochki,namber_first:byte);
       var k_tmp,k_all:pointer;
           size_k_tmp,size_k_all:word;
           y,i:word;
           count_k:byte;
           stroka_1,ch1,ch2:string;
       begin
            setcolor(0);
            str(massiv[namber_first].chislo,ch1);
            str(massiv[namber_kartochki].chislo,ch2);
            stroka_1:='Число '+ch2+' ставим вместо числа '+ch1+'...' ;
            OutTextXY(10,445,stroka_1);

            inc(Count_Dvijenie);
            y:=213;
            size_k_tmp:=imagesize(massiv[namber_kartochki].ox-1,y,massiv[namber_kartochki].ox+43,y+63);
            getmem(k_tmp,size_k_tmp);
            getimage(massiv[namber_kartochki].ox-1,y,massiv[namber_kartochki].ox+43,y+63,k_tmp^);
            for i:=y to y+67 do
                begin
                     Any_key;
                     putimage(massiv[namber_kartochki].ox-1,i,k_tmp^,CopyPut);
                     {newdelay(1);}
                end;
            for i:=massiv[namber_kartochki].ox downto massiv[namber_first].ox do
                begin
                     Any_key;
                     putimage(i-1,y+67,k_tmp^,CopyPut);
                end;

            for count_k:=namber_kartochki-1 downto namber_first do
                begin
                     Any_key;
                     size_k_all:=imagesize(massiv[count_k].ox-1,y,massiv[count_k].ox+43,y+63);
                     getmem(k_all,size_k_all);
                     getimage(massiv[count_k].ox-1,y,massiv[count_k].ox+43,y+63,k_all^);
                     for i:=massiv[count_k].ox to massiv[count_k+1].ox do
                         begin
                              Any_key;
                              putimage(i-1,y,k_all^,CopyPut);
                         end;
                     freemem(k_all,size_k_all);
                end;

            for i:=y+67 downto y do
                begin
                     Any_key;
                     putimage(massiv[namber_first].ox-1,i,k_tmp^,CopyPut);
                end;
            freemem(k_tmp,size_k_tmp);

            setfillstyle(1,14);
            bar(10,445,550,472);
       end;

    var y:integer;
        i,j,k,tmp_chislo,tmp_color:byte;
        q:string[4];
        ch1,ch2,stroka_1,stroka_2,stroka_3:string;
       begin
            Ochistka_Bufera_Klaviaturi;
            Keypressed;

            Count_Sravnenie:=0;
            Count_Dvijenie:=0;

            ClrScr;
            hide_mouse;
            Zapolnenie_massiva(massiv);
            Risovanie_kartochek(massiv);
            Setcolor(15);
            OutTextXY(180,10,'Сортировка простыми вставками');
            y:=214;

            Setcolor(13);
            OutTextXY(10,436,'Для перехода в меню нажмите клавишу Esc');

            setcolor(0);

            for i:=2 to N do
                begin
                     tmp_chislo:=massiv[i].chislo;
                     tmp_color:=massiv[i].color;
                     j:=1;
                     if to_dig_or_to_small=true
                        then
                            begin
                                 while tmp_chislo > massiv[j].chislo do
                                       begin
                                            setcolor(0);
                                            str(massiv[i].chislo,ch2);
                                            str(massiv[j].chislo,ch1);
                                            stroka_1:='Сравниваются числа '+ch1+' и '+ch2+' ...';
                                    stroka_2:='Если число '+ch1+' больше, чем число '+ch2+',то число '+ch1+' не соответствует';
                                            stroka_3:='   упорядоченности массива и будет заменено числом '+ch2+'.';
                                            OutTextXY(10,445,stroka_1);
                                            OutTextXY(10,455,stroka_2);
                                            OutTextXY(10,464,stroka_3);

                                            sravnenie(i,j);

                                            setfillstyle(1,14);
                                            bar(10,445,550,472);

                                            setcolor(0);
                                            str(massiv[i].chislo,ch2);
                                            str(massiv[j].chislo,ch1);
                                            stroka_1:='Число '+ch1+' меньше, чем число '+ch2;
                                            OutTextXY(10,445,stroka_1);
                                            NewDelay(50 * koof_zaderjki);
                                            setfillstyle(1,14);
                                            bar(10,445,550,472);

                                            inc(j);
                                       end;
                                 if i <> j
                                    then
                                        begin
                                             setcolor(0);
                                             str(massiv[i].chislo,ch2);
                                             str(massiv[j].chislo,ch1);
                                             stroka_1:='Сравниваются числа '+ch1+' и '+ch2+' ...';
                                    stroka_2:='Если число '+ch1+' больше, чем число '+ch2+',то число '+ch1+' не соответствует';
                                             stroka_3:='   упорядоченности массива и будет заменено числом '+ch2+'.';

                                             OutTextXY(10,445,stroka_1);
                                             OutTextXY(10,455,stroka_2);
                                             OutTextXY(10,464,stroka_3);

                                             sravnenie(i,j);

                                             setfillstyle(1,14);
                                             bar(10,445,550,472);

                                             if tmp_chislo = massiv[j].chislo
                                                then
                                                    begin
                                                         setcolor(0);
                                                         str(massiv[i].chislo,ch2);
                                                         str(massiv[j].chislo,ch1);
                                                         stroka_1:='Число '+ch1+' равно числу '+ch2;
                                                         OutTextXY(10,445,stroka_1);
                                                         NewDelay(50 * koof_zaderjki);
                                                         setfillstyle(1,14);
                                                         bar(10,445,550,472);
                                                    end
                                                else
                                                    if tmp_chislo < massiv[j].chislo
                                                       then
                                                           begin
                                                                setcolor(0);
                                                                str(massiv[i].chislo,ch2);
                                                                str(massiv[j].chislo,ch1);
                                                                stroka_1:='Число '+ch1+' больше, чем число '+ch2;
                                                                OutTextXY(10,445,stroka_1);
                                                                NewDelay(50 * koof_zaderjki);
                                                                setfillstyle(1,14);
                                                                bar(10,445,550,472);
                                                           end;

                                             Obmen_Kartochek(i,j);
                                             for k:=i-1 downto j do
                                                 begin
                                                      massiv[k+1].chislo:=massiv[k].chislo;
                                                      massiv[k+1].color:=massiv[k].color;
                                                 end;
                                             massiv[j].chislo:=tmp_chislo;
                                             massiv[j].color:=tmp_color;
                                        end;
                            end
                        else
                            begin
                                 while tmp_chislo < massiv[j].chislo do
                                       begin
                                            setcolor(0);
                                            str(massiv[i].chislo,ch2);
                                            str(massiv[j].chislo,ch1);
                                            stroka_1:='Сравниваются числа '+ch1+' и '+ch2+' ...';
                                    stroka_2:='Если число '+ch1+' меньше, чем число '+ch2+',то число '+ch1+' не соответствует';
                                            stroka_3:='   упорядоченности массива и будет заменено числом '+ch2+'.';
                                            OutTextXY(10,445,stroka_1);
                                            OutTextXY(10,455,stroka_2);
                                            OutTextXY(10,464,stroka_3);

                                            sravnenie(i,j);

                                            setfillstyle(1,14);
                                            bar(10,445,550,472);

                                            setcolor(0);
                                            str(massiv[i].chislo,ch2);
                                            str(massiv[j].chislo,ch1);
                                            stroka_1:='Число '+ch1+' больше, чем число '+ch2;
                                            OutTextXY(10,445,stroka_1);
                                            NewDelay(50 * koof_zaderjki);
                                            setfillstyle(1,14);
                                            bar(10,445,550,472);

                                            inc(j);
                                       end;
                                 if i <> j
                                    then
                                        begin
                                             setcolor(0);
                                             str(massiv[i].chislo,ch2);
                                             str(massiv[j].chislo,ch1);
                                             stroka_1:='Сравниваются числа '+ch1+' и '+ch2+' ...';
                                    stroka_2:='Если число '+ch1+' меньше, чем число '+ch2+',то число '+ch1+' не соответствует';
                                             stroka_3:='   упорядоченности массива и будет заменено числом '+ch2+'.';

                                             OutTextXY(10,445,stroka_1);
                                             OutTextXY(10,455,stroka_2);
                                             OutTextXY(10,464,stroka_3);

                                             sravnenie(i,j);

                                             setfillstyle(1,14);
                                             bar(10,445,550,472);

                                             if tmp_chislo = massiv[j].chislo
                                                then
                                                    begin
                                                         setcolor(0);
                                                         str(massiv[i].chislo,ch2);
                                                         str(massiv[j].chislo,ch1);
                                                         stroka_1:='Число '+ch1+' равно числу '+ch2;
                                                         OutTextXY(10,445,stroka_1);
                                                         NewDelay(50 * koof_zaderjki);
                                                         setfillstyle(1,14);
                                                         bar(10,445,550,472);
                                                    end
                                                else
                                                    if tmp_chislo > massiv[j].chislo
                                                       then
                                                           begin
                                                                setcolor(0);
                                                                str(massiv[i].chislo,ch2);
                                                                str(massiv[j].chislo,ch1);
                                                                stroka_1:='Число '+ch1+' меньше, чем число '+ch2;
                                                                OutTextXY(10,445,stroka_1);
                                                                NewDelay(50 * koof_zaderjki);
                                                                setfillstyle(1,14);
                                                                bar(10,445,550,472);
                                                           end;

                                             Obmen_Kartochek(i,j);
                                             for k:=i-1 downto j do
                                                 begin
                                                      massiv[k+1].chislo:=massiv[k].chislo;
                                                      massiv[k+1].color:=massiv[k].color;
                                                 end;
                                             massiv[j].chislo:=tmp_chislo;
                                             massiv[j].color:=tmp_color;
                                        end;
                            end;

                end;

            Counts;

            Mouse_Set_Position(getmaxx div 2,getmaxy div 2);
            Show_Mouse;
            End_Sorting(3);
       end;
  {---Вложенная процедура демонстрации сортировки с убывающим шагом (метод Шелла)-}
    procedure Zadacha_4;
    var y:integer;
        jump:byte;
        i,j:byte;
        tmp,tmp_color:byte;
        sort_end:boolean;
        ch1,ch2,stroka_1,stroka_2,stroka_3:string;
       begin
            ClrScr;
            hide_mouse;
            Zapolnenie_massiva(massiv);
            Risovanie_kartochek(massiv);
            Setcolor(15);
            OutTextXY(130,10,'Сортировка с убывающим шагом (метод Шелла)');
            y:=214;

            Count_Sravnenie:=0;
            Count_Dvijenie:=0;

            Jump:=N;
            while Jump>1 do
                  begin
                       Jump:=Jump div 2;
                       repeat
                             sort_end:=true;
                             for i:=1 to (N-Jump) do
                                 begin
                                      j:=i+Jump;



                                      Setcolor(0);
                                      str(massiv[i].chislo,ch1);
                                      str(massiv[j].chislo,ch2);




                                      if to_dig_or_to_small=true
                                         then
                                             begin
                                             stroka_1:='Сравниваются числа '+ch1+' и '+ch2+' ...';
                                           stroka_2:='Если число '+ch1+' больше, чем число '+ch2+', то они меняются местами.';
                                             OutTextXY(10,445,stroka_1);
                                             OutTextXY(10,455,stroka_2);
                                             end
                                         else
                                             begin
                                             stroka_1:='Сравниваются числа '+ch1+' и '+ch2+' ...';
                                           stroka_2:='Если число '+ch1+' меньше, чем число '+ch2+', то они меняются местами.';
                                             OutTextXY(10,445,stroka_1);
                                             OutTextXY(10,455,stroka_2);
                                             end;




                                      Sravnenie(i,j);
                                      setfillstyle(1,14);
                                      bar(10,445,550,462);



                                      if to_dig_or_to_small=true
                                         then
                                             begin
                                             if massiv[i].chislo > massiv[j].chislo
                                                then
                                                    begin
                                                         Setcolor(0);
                                                         str(massiv[i].chislo,ch1);
                                                         str(massiv[j].chislo,ch2);
                                                         stroka_1:='Число '+ch1+' больше, чем число '+ch2;
                                                         OutTextXY(10,445,stroka_1);
                                                         NewDelay(50 * koof_zaderjki);
                                                         setfillstyle(1,14);
                                                         bar(10,445,550,462);

                                                         setcolor(0);
                                                         str(massiv[i].chislo,ch1);
                                                         str(massiv[j].chislo,ch2);
                                                         stroka_1:='Числа '+ch1+' и '+ch2+' меняются местами ...' ;
                                                         OutTextXY(10,445,stroka_1);

                                                         Dvijenie(j,i);

                                                         setfillstyle(1,14);
                                                         bar(10,445,550,462);


                                                         tmp:=massiv[i].chislo;
                                                         massiv[i].chislo:=massiv[j].chislo;
                                                         massiv[j].chislo:=tmp;

                                                         tmp_color:=massiv[i].color;
                                                         massiv[i].color:=massiv[j].color;
                                                         massiv[j].color:=tmp_color;

                                                         sort_end:=false;
                                                    end
                                                else
                                                    if massiv[i].chislo < massiv[j].chislo
                                                       then
                                                           begin
                                                                Setcolor(0);
                                                                str(massiv[i].chislo,ch1);
                                                                str(massiv[j].chislo,ch2);
                                                                stroka_1:='Число '+ch1+' меньше, чем число '+ch2;
                                                                OutTextXY(10,445,stroka_1);
                                                                NewDelay(50 * koof_zaderjki);
                                                                setfillstyle(1,14);
                                                                bar(10,445,550,462);
                                                           end
                                                       else
                                                           if massiv[i].chislo = massiv[j].chislo
                                                              then
                                                                  begin
                                                                       Setcolor(0);
                                                                       str(massiv[i].chislo,ch1);
                                                                       str(massiv[j].chislo,ch2);
                                                                       stroka_1:='Число '+ch1+' равно, числу '+ch2;
                                                                       OutTextXY(10,445,stroka_1);
                                                                       NewDelay(50 * koof_zaderjki);
                                                                       setfillstyle(1,14);
                                                                       bar(10,445,550,462);
                                                                  end;
                                             end
                                         else
                                             begin
                                             if massiv[i].chislo < massiv[j].chislo
                                                then
                                                    begin
                                                         Setcolor(0);
                                                         str(massiv[i].chislo,ch1);
                                                         str(massiv[j].chislo,ch2);
                                                         stroka_1:='Число '+ch1+' меньше, чем число '+ch2;
                                                         OutTextXY(10,445,stroka_1);
                                                         NewDelay(50 * koof_zaderjki);
                                                         setfillstyle(1,14);
                                                         bar(10,445,550,462);

                                                         setcolor(0);
                                                         str(massiv[i].chislo,ch1);
                                                         str(massiv[j].chislo,ch2);
                                                         stroka_1:='Числа '+ch1+' и '+ch2+' меняются местами ...' ;
                                                         OutTextXY(10,445,stroka_1);

                                                         Dvijenie(j,i);

                                                         setfillstyle(1,14);
                                                         bar(10,445,550,462);


                                                         tmp:=massiv[i].chislo;
                                                         massiv[i].chislo:=massiv[j].chislo;
                                                         massiv[j].chislo:=tmp;

                                                         tmp_color:=massiv[i].color;
                                                         massiv[i].color:=massiv[j].color;
                                                         massiv[j].color:=tmp_color;

                                                         sort_end:=false;
                                                    end
                                                else
                                                    if massiv[i].chislo > massiv[j].chislo
                                                       then
                                                           begin
                                                                Setcolor(0);
                                                                str(massiv[i].chislo,ch1);
                                                                str(massiv[j].chislo,ch2);
                                                                stroka_1:='Число '+ch1+' больше, чем число '+ch2;
                                                                OutTextXY(10,445,stroka_1);
                                                                NewDelay(50 * koof_zaderjki);
                                                                setfillstyle(1,14);
                                                                bar(10,445,550,462);
                                                           end
                                                       else
                                                           if massiv[i].chislo = massiv[j].chislo
                                                              then
                                                                  begin
                                                                       Setcolor(0);
                                                                       str(massiv[i].chislo,ch1);
                                                                       str(massiv[j].chislo,ch2);
                                                                       stroka_1:='Число '+ch1+' равно, числу '+ch2;
                                                                       OutTextXY(10,445,stroka_1);
                                                                       NewDelay(50 * koof_zaderjki);
                                                                       setfillstyle(1,14);
                                                                       bar(10,445,550,462);
                                                                  end;
                                                end;
                                 end;
                       until sort_end;
                  end;

            Counts;

            Mouse_Set_Position(getmaxx div 2,getmaxy div 2);
            Show_Mouse;
            End_Sorting(4);
       end;

  {--Вложенная процедура демонстрации обменной сортировки с разделением (метод Хоара)-}
    procedure Zadacha_5;

       procedure videlenie_opornogo_el_ta(b_namber:byte);
       begin
            setcolor(15);
            line(massiv[b_namber].ox-3-13+8,213-45,massiv[b_namber].ox-3-13+8,213-50);
            line(massiv[b_namber].ox-3-13+8,213-45,massiv[b_namber].ox+43+8,213-45);
            line(massiv[b_namber].ox+43+8,213-45,massiv[b_namber].ox+43+8,213-50);
            outtextxy(massiv[b_namber].ox-13+8,213-70+5,'опорный');
            outtextxy(massiv[b_namber].ox-13+8,213-60+5,'элемент');
            line(massiv[b_namber].ox+13+8,213-45,massiv[b_namber].ox+13+8,203);
            line(massiv[b_namber].ox+13+8-5,193,massiv[b_namber].ox+13+8,203);
            line(massiv[b_namber].ox+13+8+5,193,massiv[b_namber].ox+13+8,203);
            setcolor(12);
            line(massiv[b_namber].ox-3-13+8-1,213-45-1,massiv[b_namber].ox-3-13+8-1,213-50-1);
            line(massiv[b_namber].ox-3-13+8-1,213-45-1,massiv[b_namber].ox+43+8-1,213-45-1);
            line(massiv[b_namber].ox+43+8-1,213-45-1,massiv[b_namber].ox+43+8-1,213-50-1);
            outtextxy(massiv[b_namber].ox-13+8-1,213-70+5-1,'опорный');
            outtextxy(massiv[b_namber].ox-13+8-1,213-60+5-1,'элемент');
            line(massiv[b_namber].ox+13+8-1,213-45-1,massiv[b_namber].ox+13+8-1,203-1);
            line(massiv[b_namber].ox+13+8-5-1,193-1,massiv[b_namber].ox+13+8-1,203-1);
            line(massiv[b_namber].ox+13+8+5-1,193-1,massiv[b_namber].ox+13+8-1,203-1);

       end;

       procedure clear_opornogiy_el_t(b_namber:byte);
       begin
            setcolor(14);
            line(massiv[b_namber].ox-3-13+8,213-45,massiv[b_namber].ox-3-13+8,213-50);
            line(massiv[b_namber].ox-3-13+8,213-45,massiv[b_namber].ox+43+8,213-45);
            line(massiv[b_namber].ox+43+8,213-45,massiv[b_namber].ox+43+8,213-50);
            outtextxy(massiv[b_namber].ox-13+8,213-70+5,'опорный');
            outtextxy(massiv[b_namber].ox-13+8,213-60+5,'элемент');
            line(massiv[b_namber].ox+13+8,213-45,massiv[b_namber].ox+13+8,203);
            line(massiv[b_namber].ox+13+8-5,193,massiv[b_namber].ox+13+8,203);
            line(massiv[b_namber].ox+13+8+5,193,massiv[b_namber].ox+13+8,203);
            line(massiv[b_namber].ox-3-13+8-1,213-45-1,massiv[b_namber].ox-3-13+8-1,213-50-1);
            line(massiv[b_namber].ox-3-13+8-1,213-45-1,massiv[b_namber].ox+43+8-1,213-45-1);
            line(massiv[b_namber].ox+43+8-1,213-45-1,massiv[b_namber].ox+43+8-1,213-50-1);
            outtextxy(massiv[b_namber].ox-13+8-1,213-70+5-1,'опорный');
            outtextxy(massiv[b_namber].ox-13+8-1,213-60+5-1,'элемент');
            line(massiv[b_namber].ox+13+8-1,213-45-1,massiv[b_namber].ox+13+8-1,203-1);
            line(massiv[b_namber].ox+13+8-5-1,193-1,massiv[b_namber].ox+13+8-1,203-1);
            line(massiv[b_namber].ox+13+8+5-1,193-1,massiv[b_namber].ox+13+8-1,203-1);

       end;

       procedure risovanie_granici(l,r:byte);
       begin
            setcolor(13);
            line(massiv[l].ox-3+1,  213-68+1,  massiv[l].ox-3+1,   213-73+1);
            line(massiv[l].ox-3+1,  213-73+1,  massiv[r].ox+43,    213-73+1);
            line(massiv[r].ox+43,   213-68+1,  massiv[r].ox+43,    213-73+1);
            setcolor(10);
            line(massiv[l].ox-3,    213-68,  massiv[l].ox-3,     213-73);
            line(massiv[l].ox-3,    213-73,  massiv[r].ox+43-1,  213-73);
            line(massiv[r].ox+43-1, 213-68,  massiv[r].ox+43-1,  213-73);

            setcolor(13);
            line(massiv[l].ox-3+1,  213+68+1+63,  massiv[l].ox-3+1,   213+73+1+63);
            line(massiv[l].ox-3+1,  213+73+1+63,  massiv[r].ox+43,    213+73+1+63);
            line(massiv[r].ox+43,   213+68+1+63,  massiv[r].ox+43,    213+73+1+63);
            setcolor(10);
            line(massiv[l].ox-3,    213+68+63,  massiv[l].ox-3,     213+73+63);
            line(massiv[l].ox-3,    213+73+63,  massiv[r].ox+43-1,  213+73+63);
            line(massiv[r].ox+43-1, 213+68+63,  massiv[r].ox+43-1,  213+73+63);
       end;

       procedure clear_granica(l,r:byte);
       begin
            setcolor(14);
            line(massiv[l].ox-3+1,  213-68+1,  massiv[l].ox-3+1,   213-73+1);
            line(massiv[l].ox-3+1,  213-73+1,  massiv[r].ox+43,    213-73+1);
            line(massiv[r].ox+43,   213-68+1,  massiv[r].ox+43,    213-73+1);
            line(massiv[l].ox-3,    213-68,  massiv[l].ox-3,     213-73);
            line(massiv[l].ox-3,    213-73,  massiv[r].ox+43-1,  213-73);
            line(massiv[r].ox+43-1, 213-68,  massiv[r].ox+43-1,  213-73);
            line(massiv[l].ox-3+1,  213+68+1+63,  massiv[l].ox-3+1,   213+73+1+63);
            line(massiv[l].ox-3+1,  213+73+1+63,  massiv[r].ox+43,    213+73+1+63);
            line(massiv[r].ox+43,   213+68+1+63,  massiv[r].ox+43,    213+73+1+63);
            line(massiv[l].ox-3,    213+68+63,  massiv[l].ox-3,     213+73+63);
            line(massiv[l].ox-3,    213+73+63,  massiv[r].ox+43-1,  213+73+63);
            line(massiv[r].ox+43-1, 213+68+63,  massiv[r].ox+43-1,  213+73+63);
       end;

       procedure risovanie_max_el_ta(ch:byte);
       var y,i:integer;
           chislo_1:pointer;
           size_1:word;
           ch2,stroka_1:string;
       begin
            size_1:=imagesize(massiv[ch].ox-1,massiv[ch].oy-1,massiv[ch].ox+43,massiv[ch].oy+63);
            getmem(chislo_1,size_1);
            getimage(massiv[ch].ox-1,massiv[ch].oy-1,massiv[ch].ox+43,massiv[ch].oy+63,chislo_1^);
            for i:=213 to 222 do
                begin
                     Any_key;

                     putimage(massiv[ch].ox-1,i,chislo_1^,CopyPut);
                     NewDelay(5 * koof_zaderjki);
                end;
            freemem(chislo_1,size_1);
            massiv[ch].oy:=223;
       end;

       procedure clear_max_el_t(ch:byte);
       var y,i:integer;
           chislo_1:pointer;
           size_1:word;
       begin
            size_1:=imagesize(massiv[ch].ox-1,massiv[ch].oy,massiv[ch].ox+43,massiv[ch].oy+63);
            getmem(chislo_1,size_1);
            getimage(massiv[ch].ox-1,massiv[ch].oy,massiv[ch].ox+43,massiv[ch].oy+63,chislo_1^);
            for i:=223 downto 214 do
                begin
                     Any_key;

                     putimage(massiv[ch].ox-1,i,chislo_1^,CopyPut);
                     NewDelay(2 * koof_zaderjki);
                end;
            freemem(chislo_1,size_1);
            massiv[ch].oy:=214;
       end;

       procedure risovanie_min_el_ta(ch:byte);
       var y,i:integer;
           chislo_1:pointer;
           size_1:word;
           ch2,stroka_1:string;
       begin
            size_1:=imagesize(massiv[ch].ox-1,massiv[ch].oy,massiv[ch].ox+43,massiv[ch].oy+63);
            getmem(chislo_1,size_1);
            getimage(massiv[ch].ox-1,massiv[ch].oy,massiv[ch].ox+43,massiv[ch].oy+63,chislo_1^);
            for i:=213 downto 203 do
                begin
                     Any_key;

                     putimage(massiv[ch].ox-1,i,chislo_1^,CopyPut);
                     NewDelay(5 * koof_zaderjki);
                end;
            freemem(chislo_1,size_1);
            massiv[ch].oy:=203;
       end;

       procedure clear_min_el_t(ch:byte);
       var y,i:integer;
           chislo_1:pointer;
           size_1:word;
       begin
            size_1:=imagesize(massiv[ch].ox-1,massiv[ch].oy-1,massiv[ch].ox+43,massiv[ch].oy+63);
            getmem(chislo_1,size_1);
            getimage(massiv[ch].ox-1,massiv[ch].oy-1,massiv[ch].ox+43,massiv[ch].oy+63,chislo_1^);
            for i:=203 to 213 do
                begin
                     Any_key;

                     putimage(massiv[ch].ox-1,i,chislo_1^,CopyPut);
                     NewDelay(2 * koof_zaderjki);
                end;
            freemem(chislo_1,size_1);
            massiv[ch].oy:=214;
       end;

       procedure Hoare_Sort(L,R:byte);
       var b,b_namber,tmp,tmp_color:byte;
           i,j:byte;
           ch1,ch2,ch3,stroka_1,stroka_2,stroka_3:string;
           x1,y1,x2,y2:word;
       begin
            risovanie_granici(l,r);

            b_namber:=(L+R) div 2;
            if b_namber=1
               then
                   b_namber:=2;
            b:=massiv[b_namber].chislo;

            setcolor(0);
            str(l,ch1);
            str(r,ch2);
            stroka_1:='Выбираем опорный элемент, относительно которого будет проверяться';
            stroka_2:='упорядоченность элементов массива на промежутке ['+ch1+'...'+ch2+'].';
            OutTextXY(10,445,stroka_1);
            OutTextXY(10,455,stroka_2);

            NewDelay(50 * koof_zaderjki);
            setfillstyle(1,14);
            bar(10,445,550,472);


            videlenie_opornogo_el_ta(b_namber);


            setcolor(0);
            str(l,ch1);
            str(r,ch2);
            str(b,ch3);
            stroka_1:='Из элементов массива на промежутке ['+ch1+'...'+ch2+'].';
            stroka_2:='Выбран опорный элемент равный '+ch3+'.';
            OutTextXY(10,445,stroka_1);
            OutTextXY(10,455,stroka_2);
            NewDelay(50 * koof_zaderjki);
            setfillstyle(1,14);
            bar(10,445,550,472);

            i:=L;
            j:=R;
            while i<J do
            begin
                 if to_dig_or_to_small=true
                    then
                        begin
                             while massiv[i].chislo < b do
                             begin
                                  setcolor(0);
                                  str(b,ch1);
                                  str(massiv[i].chislo,ch2);
                                  stroka_1:='Сравнивается опорный элемент ('+ch1+') с элементом, стоящим левее ('+ch2+')';
                                  stroka_2:='Если число, стоящее левее больше, чем опорный элемент, то это число';
                             stroka_3:='будет заменено меньшим числом из правой части массива.';
                                  OutTextXY(10,445,stroka_1);
                                  OutTextXY(10,455,stroka_2);
                                  OutTextXY(10,464,stroka_3);

                                  sravnenie(i,b_namber);

                                  setfillstyle(1,14);
                                  bar(10,445,555,472);

                                  setcolor(0);
                                  str(b,ch1);
                                  str(massiv[i].chislo,ch2);
                                  stroka_1:='Число '+ch2+' меньше, чем число '+ch1+'.';
                                  OutTextXY(10,445,stroka_1);
                                  NewDelay(50 * koof_zaderjki);
                                  setfillstyle(1,14);
                                  bar(10,445,555,472);

                                  inc(i);
                             end;
                             if i < b_namber
                                then
                                    begin
                                         setcolor(0);
                                         str(b,ch1);
                                         str(massiv[i].chislo,ch2);
                                       stroka_1:='Сравнивается опорный элемент ('+ch1+') с элементом, стоящим левее ('+ch2+')';
                                         stroka_2:='Если число, стоящее левее больше, чем опорный элемент, то это число';
                             stroka_3:='будет заменено меньшим числом из правой части массива.';
                                         OutTextXY(10,445,stroka_1);
                                         OutTextXY(10,455,stroka_2);
                                         OutTextXY(10,464,stroka_3);

                                         sravnenie(i,b_namber);

                                         setfillstyle(1,14);
                                         bar(10,445,555,472);

                                         setcolor(0);
                                         str(b,ch1);
                                         str(massiv[i].chislo,ch2);
                                         stroka_1:='Число '+ch2+' больше, чем число '+ch1+'.';
                                         OutTextXY(10,445,stroka_1);
                                         risovanie_max_el_ta(i);
                                         NewDelay(50 * koof_zaderjki);
                                         setfillstyle(1,14);
                                         bar(10,445,555,472);

                                     end
                                 else
                                     if (b=massiv[i].chislo) and (i <> b_namber)
                                        then
                                            begin
                                                 setcolor(0);
                                                 str(b,ch1);
                                                 str(massiv[i].chislo,ch2);
                                                 stroka_1:='Число '+ch2+' равно числу '+ch1+'.';
                                                 OutTextXY(10,445,stroka_1);
                                                 NewDelay(50 * koof_zaderjki);
                                                 setfillstyle(1,14);
                                                 bar(10,445,555,472);
                                            end;

                             while massiv[j].chislo > b do
                             begin
                                  setcolor(0);
                                  str(b,ch1);
                                  str(massiv[j].chislo,ch2);
                                  stroka_1:='Сравнивается опорный элемент ('+ch1+') с элементом, стоящим правее ('+ch2+')';
                                  stroka_2:='Если число, стоящее правее меньше, чем опорный элемент, то это число';
                             stroka_3:='будет заменено большим числом из левой части массива.';
                                  OutTextXY(10,445,stroka_1);
                                  OutTextXY(10,455,stroka_2);
                                  OutTextXY(10,464,stroka_3);

                                  sravnenie(j,b_namber);

                                  setfillstyle(1,14);
                                  bar(10,445,555,472);

                                  setcolor(0);
                                  str(b,ch1);
                                  str(massiv[j].chislo,ch2);
                                  stroka_1:='Число '+ch2+' больше, чем число '+ch1+'.';
                                  OutTextXY(10,445,stroka_1);
                                  NewDelay(50 * koof_zaderjki);
                                  setfillstyle(1,14);
                                  bar(10,445,555,472);

                                  dec(j);
                             end;
                             if j > b_namber
                                then
                                    begin
                                         setcolor(0);
                                         str(b,ch1);
                                         str(massiv[j].chislo,ch2);
                                      stroka_1:='Сравнивается опорный элемент ('+ch1+') с элементом, стоящим правее ('+ch2+')';
                                         stroka_2:='Если число, стоящее правее меньше, чем опорный элемент, то это число';
                              stroka_3:='будет заменено большим числом из левой части массива.';
                                         OutTextXY(10,445,stroka_1);
                                         OutTextXY(10,455,stroka_2);
                                         OutTextXY(10,464,stroka_3);

                                         sravnenie(j,b_namber);

                                         setfillstyle(1,14);
                                         bar(10,445,555,472);

                                         setcolor(0);
                                         str(b,ch1);
                                         str(massiv[j].chislo,ch2);
                                         stroka_1:='Число '+ch2+' меньше, чем число '+ch1+'.';
                                         OutTextXY(10,445,stroka_1);
                                         risovanie_min_el_ta(j);
                                         NewDelay(50 * koof_zaderjki);
                                         setfillstyle(1,14);
                                         bar(10,445,555,472);

                                     end
                                else
                                    if (b=massiv[j].chislo) and (j <> b_namber)
                                       then
                                           begin
                                                setcolor(0);
                                                str(b,ch1);
                                                str(massiv[j].chislo,ch2);
                                                stroka_1:='Число '+ch2+' равно числу '+ch1+'.';
                                                OutTextXY(10,445,stroka_1);
                                                NewDelay(50 * koof_zaderjki);
                                                setfillstyle(1,14);
                                                bar(10,445,555,472);
                                           end;
                        end
                    else
                        begin
                             while massiv[i].chislo > b do
                             begin
                                  setcolor(0);
                                  str(b,ch1);
                                  str(massiv[i].chislo,ch2);
                                  stroka_1:='Сравнивается опорный элемент ('+ch1+') с элементом, стоящим левее ('+ch2+')';
                                  stroka_2:='Если число, стоящее левее меньше, чем опорный элемент, то это число';
                             stroka_3:='будет заменено большим числом из правой части массива.';
                                  OutTextXY(10,445,stroka_1);
                                  OutTextXY(10,455,stroka_2);
                                  OutTextXY(10,464,stroka_3);

                                  sravnenie(i,b_namber);

                                  setfillstyle(1,14);
                                  bar(10,445,555,472);

                                  setcolor(0);
                                  str(b,ch1);
                                  str(massiv[i].chislo,ch2);
                                  stroka_1:='Число '+ch2+' больше, чем число '+ch1+'.';
                                  OutTextXY(10,445,stroka_1);
                                  NewDelay(50 * koof_zaderjki);
                                  setfillstyle(1,14);
                                  bar(10,445,555,472);

                                  inc(i);
                             end;
                             if i < b_namber
                                then
                                    begin
                                         setcolor(0);
                                         str(b,ch1);
                                         str(massiv[i].chislo,ch2);
                                       stroka_1:='Сравнивается опорный элемент ('+ch1+') с элементом, стоящим левее ('+ch2+')';
                                         stroka_2:='Если число, стоящее левее меньше, чем опорный элемент, то это число';
                             stroka_3:='будет заменено большим числом из правой части массива.';
                                         OutTextXY(10,445,stroka_1);
                                         OutTextXY(10,455,stroka_2);
                                         OutTextXY(10,464,stroka_3);

                                         sravnenie(i,b_namber);

                                         setfillstyle(1,14);
                                         bar(10,445,555,472);

                                         setcolor(0);
                                         str(b,ch1);
                                         str(massiv[i].chislo,ch2);
                                         stroka_1:='Число '+ch2+' меньше, чем число '+ch1+'.';
                                         OutTextXY(10,445,stroka_1);
                                         risovanie_max_el_ta(i);
                                         NewDelay(50 * koof_zaderjki);
                                         setfillstyle(1,14);
                                         bar(10,445,555,472);

                                     end
                                 else
                                     if (b=massiv[i].chislo) and (i <> b_namber)
                                        then
                                            begin
                                                 setcolor(0);
                                                 str(b,ch1);
                                                 str(massiv[i].chislo,ch2);
                                                 stroka_1:='Число '+ch2+' равно числу '+ch1+'.';
                                                 OutTextXY(10,445,stroka_1);
                                                 NewDelay(50 * koof_zaderjki);
                                                 setfillstyle(1,14);
                                                 bar(10,445,555,472);
                                            end;

                             while massiv[j].chislo < b do
                             begin
                                  setcolor(0);
                                  str(b,ch1);
                                  str(massiv[j].chislo,ch2);
                                  stroka_1:='Сравнивается опорный элемент ('+ch1+') с элементом, стоящим правее ('+ch2+')';
                                  stroka_2:='Если число, стоящее правее больше, чем опорный элемент, то это число';
                             stroka_3:='будет заменено меньшим числом из левой части массива.';
                                  OutTextXY(10,445,stroka_1);
                                  OutTextXY(10,455,stroka_2);
                                  OutTextXY(10,464,stroka_3);

                                  sravnenie(j,b_namber);

                                  setfillstyle(1,14);
                                  bar(10,445,555,472);

                                  setcolor(0);
                                  str(b,ch1);
                                  str(massiv[j].chislo,ch2);
                                  stroka_1:='Число '+ch2+' меньше, чем число '+ch1+'.';
                                  OutTextXY(10,445,stroka_1);
                                  NewDelay(50 * koof_zaderjki);
                                  setfillstyle(1,14);
                                  bar(10,445,555,472);

                                  dec(j);
                             end;
                             if j > b_namber
                                then
                                    begin
                                         setcolor(0);
                                         str(b,ch1);
                                         str(massiv[j].chislo,ch2);
                                      stroka_1:='Сравнивается опорный элемент ('+ch1+') с элементом, стоящим правее ('+ch2+')';
                                         stroka_2:='Если число, стоящее правее больше, чем опорный элемент, то это число';
                              stroka_3:='будет заменено меньшим числом из левой части массива.';
                                         OutTextXY(10,445,stroka_1);
                                         OutTextXY(10,455,stroka_2);
                                         OutTextXY(10,464,stroka_3);

                                         sravnenie(j,b_namber);

                                         setfillstyle(1,14);
                                         bar(10,445,555,472);

                                         setcolor(0);
                                         str(b,ch1);
                                         str(massiv[j].chislo,ch2);
                                         stroka_1:='Число '+ch2+' больше, чем число '+ch1+'.';
                                         OutTextXY(10,445,stroka_1);
                                         risovanie_min_el_ta(j);
                                         NewDelay(50 * koof_zaderjki);
                                         setfillstyle(1,14);
                                         bar(10,445,555,472);

                                     end
                                else
                                    if (b=massiv[j].chislo) and (j <> b_namber)
                                       then
                                           begin
                                                setcolor(0);
                                                str(b,ch1);
                                                str(massiv[j].chislo,ch2);
                                                stroka_1:='Число '+ch2+' равно числу '+ch1+'.';
                                                OutTextXY(10,445,stroka_1);
                                                NewDelay(50 * koof_zaderjki);
                                                setfillstyle(1,14);
                                                bar(10,445,555,472);
                                           end;
                        end;
                          if massiv[i].oy <> 214
                             then
                                 clear_max_el_t(i);

                          if massiv[j].oy <> 214
                             then
                                 clear_min_el_t(j);

                          if i <= j
                             then
                                 begin

                                      if (i <> j) and (massiv[i].chislo <> massiv[j].chislo)
                                         then
                                             begin
                                                  setcolor(0);
                                                  str(massiv[i].chislo,ch1);
                                                  str(massiv[j].chislo,ch2);
                                                  stroka_1:='Число '+ch1+' меняется местом с числом '+ch2+'...';
                                                  stroka_2:='Т.К.они не соответствуют относительной упорядоченности массива.';
                                                  OutTextXY(10,445,stroka_1);
                                                  OutTextXY(10,455,stroka_2);

                                                  clear_opornogiy_el_t(b_namber);

                                                  dvijenie(j,i);

                                                  videlenie_opornogo_el_ta(b_namber);

                                                  setfillstyle(1,14);
                                                  bar(10,445,555,472);
                                             end;

                                      tmp:=massiv[i].chislo;
                                      massiv[i].chislo:=massiv[j].chislo;
                                      massiv[j].chislo:=tmp;

                                      tmp_color:=massiv[i].color;
                                      massiv[i].color:=massiv[j].color;
                                      massiv[j].color:=tmp_color;

                                      inc(i);
                                      dec(j);

                                 end;
                  end;

                  clear_granica(l,r);

                  clear_opornogiy_el_t(b_namber);

                  if L < j
                     then
                         Hoare_Sort(L,J);

                  if i < R
                     then
                         Hoare_Sort(i,R);
       end;

    var y:integer;
       begin
            Ochistka_Bufera_Klaviaturi;
            Keypressed;

            Count_Sravnenie:=0;
            Count_Dvijenie:=0;

            ClrScr;
            hide_mouse;
            Zapolnenie_massiva(massiv);
            Risovanie_kartochek(massiv);
            Setcolor(15);
            OutTextXY(120,10,'Обменная сортировка с разделением (метод Хоара)');
            y:=214;

            Setcolor(13);
            OutTextXY(10,436,'Для перехода в меню нажмите клавишу Esc');

            setcolor(0);



            Hoare_Sort(1,N);


            Counts;


            Mouse_Set_Position(getmaxx div 2,getmaxy div 2);
            Show_Mouse;
            End_Sorting(5);
       end;
  {---Вложенная процедура демонстрации сортировки слиянием-------------------}
    procedure Zadacha_6;
    var y:integer;
       begin
            ClrScr;
            hide_mouse;
            Zapolnenie_massiva(massiv);
            Risovanie_kartochek(massiv);
            Setcolor(15);
            OutTextXY(230,10,'Сортировка слиянием');
            y:=214;

            Mouse_Set_Position(getmaxx div 2,getmaxy div 2);
            Show_Mouse;
            End_Sorting(6);
       end;
  {---Вложенная процедура выхода---------------------------------------------}
    procedure Vihod;
    begin
         Temnenie_Monitora(0);
         cleardevice;
         Izmenenie_Palitri(1);
         Vibor_first;
    end;
  {--------------------------------------------------------------------------}
  begin
       times:=false;
       show_mouse;
       Temnenie_Monitora(0);
       interfaise_menu;

       pcx_photo('.\DS_data\img\ds_comp1.pcx',479,290);
       pcx_photo('.\DS_data\img\ds_gerb3.pcx',480,50);

       qqqqq:=0;
       repeat
             vedenie_kursora(1);
             vedenie_kursora(2);
             vedenie_kursora(3);
             vedenie_kursora(4);
             vedenie_kursora(5);
             vedenie_kursora(6);
             vedenie_kursora(7);


             if qqqqq = 20
                then
                    pcx_photo('.\DS_data\img\ds_comp2.pcx',479,290);
             if qqqqq = 40
                then
                    pcx_photo('.\DS_data\img\ds_comp3.pcx',479,290);
             if qqqqq = 60
                then
                    pcx_photo('.\DS_data\img\ds_comp4.pcx',479,290);
             if qqqqq = 80
                then
                    begin
                         pcx_photo('.\DS_data\img\ds_comp1.pcx',479,290);
                         qqqqq:=0;
                    end;

             inc(qqqqq);



             if keypress(1,3)
                then
                    begin
                         Hide_Mouse;
                         Ramka_fon_2;
                         setfillstyle(1,14);
                         bar(10,435,550,472);
                         Setcolor(0);
                         OutTextXY(10,450,'Для продолжения нажмите клавишу ''Далее ''');
                         SetColor(15);
                         OutTextXY(120,10,'Обменная сортировка с выбором (метод пузырька)');
                         Information_1(1);

                         Hide_Mouse;
                         Ramka_fon;
                         SetColor(15);
                         OutTextXY(120,10,'Обменная сортировка с выбором (метод пузырька)');
                         To_max_or_to_min;
                         Zadacha_1;

                    end;
             if keypress(2,3)
                then
                    begin
                         Hide_Mouse;
                         Ramka_fon_2;
                         setfillstyle(1,14);
                         bar(10,435,550,472);
                         Setcolor(0);
                         OutTextXY(10,450,'Для продолжения нажмите клавишу ''Далее ''');
                         SetColor(15);
                         OutTextXY(150,10,'Сортировка посредством простого выбора');
                         Information_1(2);

                         Hide_Mouse;
                         Ramka_fon;
                         SetColor(15);
                         OutTextXY(150,10,'Сортировка посредством простого выбора');
                         To_max_or_to_min;
                         Zadacha_2;
                    end;
             if keypress(3,3)
                then
                    begin
                         Hide_Mouse;
                         Ramka_fon_2;
                         setfillstyle(1,14);
                         bar(10,435,550,472);
                         Setcolor(0);
                         OutTextXY(10,450,'Для продолжения нажмите клавишу ''Далее ''');
                         SetColor(15);
                         OutTextXY(180,10,'Сортировка простыми вставками');
                         Information_1(3);

                         Hide_Mouse;
                         Ramka_fon;
                         SetColor(15);
                         OutTextXY(180,10,'Сортировка простыми вставками');
                         To_max_or_to_min;
                         Zadacha_3;
                    end;
             if keypress(4,3)
                then
                    begin
                         Hide_Mouse;
                         Ramka_fon_2;
                         setfillstyle(1,14);
                         bar(10,435,550,472);
                         Setcolor(0);
                         OutTextXY(10,450,'Для продолжения нажмите клавишу ''Далее ''');
                         SetColor(15);
                         OutTextXY(130,10,'Сортировка с убывающим шагом (метод Шелла)');
                         Information_1(4);

                         Hide_Mouse;
                         Ramka_fon;
                         SetColor(15);
                         OutTextXY(130,10,'Сортировка с убывающим шагом (метод Шелла)');
                         To_max_or_to_min;
                         Zadacha_4;
                    end;
             if keypress(5,3)
                then
                    begin
                         Hide_Mouse;
                         Ramka_fon_2;
                         setfillstyle(1,14);
                         bar(10,435,550,472);
                         Setcolor(0);
                         OutTextXY(10,450,'Для продолжения нажмите клавишу ''Далее ''');
                         SetColor(15);
                         OutTextXY(120,10,'Обменная сортировка с разделением (метод Хоара)');
                         Information_1(5);

                         Hide_Mouse;
                         Ramka_fon;
                         SetColor(15);
                         OutTextXY(120,10,'Обменная сортировка с разделением (метод Хоара)');
                         To_max_or_to_min;
                         Zadacha_5;
                    end;
             if keypress(6,3)
                then
                    begin
                         Hide_Mouse;
                         Ramka_fon_2;
                         setfillstyle(1,14);
                         bar(10,435,550,472);
                         Setcolor(0);
                         OutTextXY(10,450,'Для продолжения нажмите клавишу ''Далее ''');
                         SetColor(15);
                         OutTextXY(230,10,'Сортировка слиянием');
                         Information_1(6);

                         Hide_Mouse;
                         Ramka_fon;
                         SetColor(15);
                         OutTextXY(230,10,'Сортировка слиянием');
                         To_max_or_to_min;
                         Zadacha_6;
                    end;

       until keypress(7,3);

       vihod;
  end;



{#############################################################################}
{----Процедура выбора в основном меню----------------------------------------}
   procedure Vibor_first;
   var qqqq:byte;

  {---Вложенная процедура рисования действия при нажатии на клавишу 1--------}
   procedure Z_1;
   begin
        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(2);
        Init_mouse;

        Pcx_Photo('.\DS_data\img\ds_1.pcx',0,0);


        show_mouse;
        risovanie_key_for_palitra(570,445,625,465,10,'Меню');

        repeat
              vedenie_kursora_for_palitra(10);
        until keypress_for_palitra(10,3);

        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);
        Vibor_first;
   end;
  {---Вложенная процедура рисования действия при нажатии на клавишу 2--------}
   procedure Z_2;
    procedure teory;
    var t:text;
       s:string;
       j,i,kx,ky,l,fs:integer;
       next,pred:boolean;

      procedure clrwin;
      begin
           setcolor(15);
           setfillstyle(1,15);
           hide_mouse;
           bar(8,53-5,616,438-10);
           show_mouse;
      end;

      procedure teory_window(x1,y1,x2,y2:integer;s:string);
      begin
           risovanie_key(x1,y1,x2,y2,67,'');
           setfillstyle(1,9);
           hide_mouse;
           bar(x1+1,y1+1,x2-1,y1+16);
           setcolor(0);
           line(x1+1,y1+16,x2-1,y1+16);
           line(x1+1,y1+17,x2-1,y1+17);
           show_mouse;
           setcolor(15);
           hide_mouse;
           outtextxy(x1+12,y1+5,s);
           show_mouse;
      end;

      procedure proc;
      begin
           hide_mouse;
           setfillstyle(9,14);
           bar(618,53-5,635-3,438-10);
           risovanie_key(619,53-5,634-3,66-5,60,#24);
           risovanie_key(619,421-10,634-3,437-10,61,#25);
           show_mouse;
      end;

      function fsize:integer;
      var c:integer;
      begin
           c:=0;
           reset(t);
           repeat
                 readln(t);
                 inc(c);
           until eof(t);
           fsize:=c;
      end;

      procedure polosa(i:integer);
      begin
           hide_mouse;
           setfillstyle(9,14);
           bar(618,68-5,635-3,420-11);
           risovanie_key(619,68+j-5,634-3,l+j-10,62,'');
           show_mouse;
      end;

      procedure screen(i:integer);
      var k,a:integer;
          s:string;
      begin
           setcolor(0);
           reset(t);
           if i<>1
              then
                  for k:=1 to i-1 do
                      readln(t,s);
           ky:=0;
           k:=i;
           hide_mouse;
           repeat
                 inc(k);
                 readln(t,s);
                 outtextxy(12,57+ky,s);
                 ky:=ky+10;
           until eof(t) or (k>i+35);
           show_mouse;
      end;

    begin
        hide_mouse;
        ramka_fon;
        show_mouse;
        Setcolor(15);
        OutTextXY(10,10,'                    Как пользоваться программой + теория');
        teory_window(7,35-5,635-3,438-10,'Как пользоваться программой, несколько слов о сортировке');
        clrwin;
        proc;
        show_mouse;
        {$I-}
        assign(t,'.\DS_data\dst\ds_absor.dst');
        reset(t);
        {I+}
        if ioresult<>0
           then
               begin
                    Hide_Mouse;
                    setfillstyle(1,14);
                    bar(150+30,170+120+50-150,490-30,220+120-150);
                    i:=40;
                    while i>0 do
                          begin
                               setcolor(13);
                               rectangle(150+i+30,170+i+120+50-150,490-i-30,220-i+120+50-150);
                               newdelay(1);
                               setcolor(15);
                               rectangle(150+i+30,170+i+120+50-150,490-i-30,220-i+120+50-150);

                               dec(i,10)
                          end;

                    Ramka_2(150+30,170+120+50-150,490-30,220+120+50-150);
                    pcx_photo('.\DS_data\img\ds_voskl.pcx',160+30,175+120+50-150);

                    setcolor(0);
                    outtextxy(190+30,185+120+50-150,'Ошибка: Файл  ''.\DS_data\dst\ds_absor.dst''');
                    outtextxy(190+30,195+120+55-150,'         не найден.');
                    OutTextXY(10,450,'Для перехода в меню нажмите клавишу ''Меню ''');
                    show_mouse;
                    repeat
                          vedenie_kursora(10);
                    until keypress(10,3);
               end
           else
               begin
                    l:=0;
                    j:=1;
                    risovanie_key(110-10,450-5,290-10,470-5,65,'Предыдущая страница');
                    risovanie_key(340-10,450-5,520-10,470-5,64,'Следующая страница');
                    next:=true;
                    pred:=false;
                    fs:=fsize;
                    if fs>35
                       then
                           l:=fs-35;
                           l:=420-l;
                           risovanie_key(619,68-5,634-3,l-8,66,'');
                           screen(1);
                           repeat
                                 if (j>1) and pred
                                    then
                                        vedenie_kursora(60);

                                 if (fs>j+36) and next
                                    then
                                        vedenie_kursora(61);

                                 if next
                                    then
                                        vedenie_kursora(64);
                                 if pred
                                    then
                                        vedenie_kursora(65);

                                 vedenie_kursora(10);



                                 if (j>1) and pred and keypress(60,3)
                                    then
                                        begin
                                             clrwin;
                                             dec(j);
                                             polosa(j);
                                             screen(j);
                                            next:=true;
                                        end;

                                 if (fs>j+36) and next and keypress(61,3)
                                    then
                                        begin
                                             clrwin;
                                             inc(j);
                                             polosa(j);
                                             screen(j);
                                             pred:=true;
                                        end;

                                 if next and keypress(64,3)
                                    then
                                        if (j<fs-72)
                                           then
                                               begin
                                                    clrwin;
                                                    inc(j,36);
                                                    polosa(j);
                                                    screen(j);
                                                    pred:=true;
                                               end
                                           else
                                               begin
                                                    if next
                                                       then
                                                           begin
                                                                clrwin;
                                                                j:=fs-36;
                                                                polosa(j);
                                                                screen(j);
                                                                next:=false;
                                                           end;
                                               end;

                                 if pred and keypress(65,3)
                                    then
                                        if (j>36)
                                           then
                                               begin
                                                    clrwin;
                                                    dec(j,36);
                                                    polosa(j);
                                                    screen(j);
                                                    next:=true;
                                               end
                                          else
                                              begin
                                                   if pred
                                                      then
                                                          begin
                                                               clrwin;
                                                               j:=1;
                                                               polosa(j);
                                                               screen(j);
                                                               pred:=false;
                                                          end;
                                              end;
                           until keypress(10,3)
               end;
    end;

   begin
        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);
        Init_mouse;
        Show_Mouse;

        Teory;

        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);
        Vibor_first;
   end;
  {---Вложенная процедура рисования действия при нажатии на клавишу 4--------}
   procedure Z_4;


   begin
        Hide_Mouse;

        cleardevice;
        Izmenenie_Palitri(1);
        Init_mouse;

        Ramka_2(0,0,getmaxx,getmaxy);
        Setcolor(13);
        Rectangle(4,4,635,475);
        Setcolor(15);
        Rectangle(1,1,638,478);

        Ramka_1(25,45,610,410);
        SetFillStyle(1,13);
        Bar(29,49,606,406);

        SetFillStyle(1,9);
        Bar(5,5,634,25);

        Setcolor(13);
        line(4,430,635,430);
        line(4,434,635,434);
        Setcolor(15);
        line(3,432,636,432);

        Setcolor(15);
        OutTextXY(10,10,'                        Время выполнения сортировок');
        Setcolor(0);
        line(5,25,634,25);
        line(5,26,634,26);

        Setcolor(0);
        OutTextXY(140,450,'Выберите интересующий Вас раздел меню.');

        risovanie_key(120+20,63,500-30,93,70,'Справка');
        risovanie_key(120+20,63+60,500-30,93+60,71,'Массив упорядочен по возрастанию');
        risovanie_key(120+20,113+70,500-30,143+70,72,'Массив упорядочен по убыванию');
        risovanie_key(120+20,163+80,500-30,193+80,73,'Массив заполнен случайным образом');
        risovanie_key(120+20,213+90,500-30,243+90,74,'Графическое представление времени');
        risovanie_key(120+20,363,500-30,393,77,'Переход в основное меню');



        qqqq:=0;
        pcx_photo('.\DS_data\img\ds_comp1.pcx',479,50);
        pcx_photo('.\DS_data\img\ds_gerb3.pcx',480,280);


        show_mouse;

        repeat
             vedenie_kursora(70);
             vedenie_kursora(71);
             vedenie_kursora(72);
             vedenie_kursora(73);
             vedenie_kursora(74);
             vedenie_kursora(77);

             if qqqq = 20
                then
                    pcx_photo('.\DS_data\img\ds_comp2.pcx',479,50);
             if qqqq = 40
                then
                    pcx_photo('.\DS_data\img\ds_comp3.pcx',479,50);
             if qqqq = 60
                then
                    pcx_photo('.\DS_data\img\ds_comp4.pcx',479,50);
             if qqqq = 80
                then
                    begin
                         pcx_photo('.\DS_data\img\ds_comp1.pcx',479,50);
                         qqqq:=0;
                    end;

             inc(qqqq);

             if keypress(70,3)
                then
                    begin
                         Spravka_Big;

                         Hide_Mouse;
                         Temnenie_Monitora(0);
                         cleardevice;
                         Izmenenie_Palitri(1);

                         Z_4;
                    end;

             if keypress(73,3)
                then
                    begin
                         M_Random;

                         Hide_Mouse;
                         Temnenie_Monitora(0);
                         cleardevice;
                         Izmenenie_Palitri(1);

                         Z_4;
                    end;
             if keypress(71,3)
                then
                    begin
                         M_Sort;

                         Hide_Mouse;
                         Temnenie_Monitora(0);
                         cleardevice;
                         Izmenenie_Palitri(1);

                         Z_4;
                    end;
             if keypress(72,3)
                then
                    begin
                         M_Un_Sort;

                         Hide_Mouse;
                         Temnenie_Monitora(0);
                         cleardevice;
                         Izmenenie_Palitri(1);

                         Z_4;
                    end;
             if keypress(74,3)
                then
                    begin
                         M_All_Graph;

                         Hide_Mouse;
                         Temnenie_Monitora(0);
                         cleardevice;
                         Izmenenie_Palitri(1);

                         Z_4;
                    end;

       until keypress(77,3);

       Temnenie_Monitora(0);
       cleardevice;
       Izmenenie_Palitri(1);
       Vibor_first;
   end;
  {---Вложенная процедура рисования действия при нажатии на клавишу 5--------}
   procedure Z_5;
   begin
        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(2);
        Init_mouse;

        Pcx_Photo('.\DS_data\img\ds_5.pcx',0,0);

        show_mouse;
        risovanie_key_for_palitra(570,445,625,465,10,'Меню');

        repeat
              vedenie_kursora_for_palitra(10);
        until keypress_for_palitra(10,3);

        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);
        Vibor_first;
   end;
  {---Вложенная процедура рисования действия при нажатии на клавишу 6--------}
   procedure Z_6;
   var f,f2:text;
       i:byte;
       stroka:string;
   begin
        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);
        Init_mouse;

        ClrScr;

        Ramka_fon_2;

        Setcolor(15);
        OutTextXY(10,10,'                   Создание файла с тексом методов сортировки');
        Setcolor(0);
        line(5,25,634,25);
        line(5,26,634,26);

        Setcolor(0);
        OutTextXY(20,450,'Для перехода в меню нажмите клавишу ''Меню''');


        OutTextXY(20,40, '   По Вашему желанию будет создан файл,  в котором будут содержаться тексты');
        OutTextXY(20,50, 'процедур всех рассмотренных в программе методов сортировки. Процедуры будут');
        OutTextXY(20,60, 'написаны на языке программирования высокого уровня - Turbo Pascal 7.0.');
        OutTextXY(20,70, '    В качестве передаваемых процедурам параметров будет массив, обьявленный');
        OutTextXY(20,80, 'как Array[0..N] of Integer,  в качестве получаемых параметров будет тот же,');
        OutTextXY(20,90, 'но уже отсортированный массив. N - кол-во чисел в массиве.');
        OutTextXY(20,100,'   Откомпилировав  и  запустив  полученный  файл Вы увидите исходный состав');
        OutTextXY(20,110,'массива  и  состав  того-же  массива  после сортировки различными методами,');
        OutTextXY(20,120,'дабы удостовериться, что программа действительно работает.');
        OutTextXY(20,130,'   Т.к. все алгоритмы сортировки описаны, как процедуры,  следовательно  Вы');
        OutTextXY(20,140,'безболезненно можете вставить их коды в свои собственные программы, изменив');
        OutTextXY(20,150,'лишь,  по  необходимости,  обьявление  массива.  И  все!  Вам  не  придется');
        OutTextXY(20,160,'выискивать в программе где же здесь запрограммирован этот метод,  Вы просто');
        OutTextXY(20,170,'копируета код необходимой Вам процедуры и вставляете в свою программу!');
        OutTextXY(20,180,'   Созданный файл будет находиться в подкаталоге Sort_Pas каталога DemoSort');
        OutTextXY(20,190,'называться файл будет так-же, как и подкаталог то есть - Sort_Pas.pas');


        i:=40;
        while i>0 do
        begin
             setcolor(13);
             rectangle(150+i-30,170+i+10+40,490-i+40,220-i+50+40);
             newdelay(1);
             setcolor(14);
             rectangle(150+i-30,170+i+10+40,490-i+40,220-i+50+40);

             dec(i,10)
        end;

        Ramka_2(150-30,170+10+40,490+40,220+50+40);
        pcx_photo('.\DS_data\img\ds_vopr.pcx',160-30,175+10+40);

        setcolor(0);
        outtextxy(200-30,180+10+40,'         Хотите ли Вы создать файл?');
        outtextxy(200-30,195+10+40,'Если ''  '' то нажмите клавишу ''Создать файл'',');
        outtextxy(200-30,210+10+40,'  В противном случае нажмите клавишу ''Меню''');
        setcolor(8);
        outtextxy(200-30+46,195+10+40,'Да');
        setcolor(0);

        risovanie_key(570,445,625,465,10,'Меню');

        risovanie_key_1(250,240+40,390,260+40,40,'Создать файл');

        show_mouse;

        repeat
              vedenie_kursora(10);
              vedenie_kursora(40);
              if keypress(40,3)
                 then
                     begin
                          assign(f,'Sort_Pas\sort_pas.pas');
                          assign(f2,'.\DS_data\dst\ds_sort.dst');
                          {$I-}
                          rewrite(f);
                          if IOResult<>0
                             then
                                 begin
                                      Hide_Mouse;
                                      setfillstyle(1,14);
                                      bar(150+60,170+120+50,490-60,220+120+50);
                                      i:=40;
                                      while i>0 do
                                      begin
                                           setcolor(13);
                                           rectangle(150+i+60,170+i+120+50,490-i-60,220-i+120+50);
                                           newdelay(1);
                                           setcolor(14);
                                           rectangle(150+i+60,170+i+120+50,490-i-60,220-i+120+50);

                                           dec(i,10)
                                      end;

                                      Ramka_2(150+60,170+120+50,490-60,220+120+50);
                                      pcx_photo('.\DS_data\img\ds_voskl.pcx',160+60,175+120+50);

                                      setcolor(0);
                                      outtextxy(175+60,185+120+50,'   Ошибка при создании');
                                      outtextxy(175+60,195+120+50,'         файла');
                                      show_mouse;

                                 end
                             else
                                 begin
                                      reset(f2);
                                      if IOResult<>0
                                         then
                                             begin
                                                  Hide_Mouse;
                                                  setfillstyle(1,14);
                                                  bar(150+60,170+120+50,490-60,220+120+50);
                                                  i:=40;
                                                  while i>0 do
                                                        begin
                                                             setcolor(13);
                                                             rectangle(150+i+60,170+i+120+50,490-i-60,220-i+120+50);
                                                             newdelay(1);
                                                             setcolor(14);
                                                             rectangle(150+i+60,170+i+120+50,490-i-60,220-i+120+50);

                                                             dec(i,10)
                                                        end;

                                                        Ramka_2(150+60,170+120+50,490-60,220+120+50);
                                                        pcx_photo('.\DS_data\img\ds_voskl.pcx',160+60,175+120+50);

                                                        setcolor(0);
                                                        outtextxy(175+60,185+120+50,'   Ошибка при создании');
                                                        outtextxy(175+60,195+120+50,'         файла');
                                                        show_mouse;

                                                  end
                                         else
                                             begin
                                                  while not EOF(f2) do
                                                        begin
                                                             readln(f2,stroka);
                                                             writeln(f,stroka);
                                                        end;

                                                        Hide_Mouse;
                                                        setfillstyle(1,14);
                                                        bar(150+60,170+120+50,490-60,220+120+50);
                                                        i:=40;
                                                        while i>0 do
                                                              begin
                                                                   setcolor(13);
                                                                   rectangle(150+i+60,170+i+120+50,490-i-60,220-i+120+50);
                                                                   newdelay(1);
                                                                   setcolor(14);
                                                                   rectangle(150+i+60,170+i+120+50,490-i-60,220-i+120+50);

                                                                   dec(i,10)
                                                              end;

                                                        Ramka_2(150+60,170+120+50,490-60,220+120+50);
                                                        pcx_photo('.\DS_data\img\ds_voskl.pcx',160+60,175+120+50);

                                                        setcolor(0);
                                                        outtextxy(200+60,190+120+50,'Файл удачно создан');
                                                        show_mouse;
                                                        {$I+}
                                                        close(f2);
                                                        close(f);
                                             end;
                                 end;
                     end;
        until keypress(10,3);

        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);
        Vibor_first;
   end;

 {---Начало процедуры выбора в основном меню---------------------------------}
   begin
        Init_mouse;
        show_mouse;
        first_interfaise_menu;
        qqqq:=0;
        pcx_photo('.\DS_data\img\ds_gerb6.pcx',490,50);
        repeat
             vedenie_kursora(91);
             vedenie_kursora(92);
             vedenie_kursora(93);
             vedenie_kursora(94);
             vedenie_kursora(95);
             vedenie_kursora(96);
             vedenie_kursora(97);
             if qqqq = 10
                then
                    pcx_photo('.\DS_data\img\ds_gerb6.pcx',490,50);
             if qqqq = 20
                then
                    pcx_photo('.\DS_data\img\ds_gerb1.pcx',490,50);
             if qqqq = 30
                then
                    pcx_photo('.\DS_data\img\ds_gerb2.pcx',490,50);
             if qqqq = 40
                then
                    pcx_photo('.\DS_data\img\ds_gerb3.pcx',490,50);
             if qqqq = 50
                then
                    pcx_photo('.\DS_data\img\ds_gerb4.pcx',490,50);
             if qqqq = 60
                then
                    begin
                         pcx_photo('.\DS_data\img\ds_gerb5.pcx',490,50);
                         qqqq:=0;
                    end;

             inc(qqqq);


             if keypress(93,3)
                then
                    begin
                         Hide_Mouse;
                         Temnenie_Monitora(0);
                         cleardevice;
                         Izmenenie_Palitri(1);
                         Init_mouse;
                         vibor;
                    end;

             if keypress(91,3)
                then
                    Z_1;

             if keypress(92,3)
                then
                    Z_2;

             if keypress(94,3)
                then
                    begin
                         hide_mouse;
                         Temnenie_Monitora(0);
                         Show_mouse;
                         Z_4;
                    end;

             if keypress(95,3)
                then
                    Z_5;

             if keypress(96,3)
                then
                    Z_6;

       until keypress(97,3);
       End_Demo_Sorting;
   end;
{#############################################################################}

{---Процедура выхода из программы---------------------------------------------}
    procedure End_Demo_Sorting;

        procedure Pic_end;
        var TheGif: PGif;

        begin
             TheGif := New(PGif, Init('.\DS_data\img\ds_end.gif'));

             TheGif^.Decode(True);

             Ochistka_bufera_klaviaturi;

             repeat until keypressed;

             Temnenie_Monitora(1);

             Dispose(TheGif, Done);
        end;

       begin

            Temnenie_Monitora(1);
            closegraph;

            {Pic_end; {&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&}

            closegraph;

            clrscr;
            textcolor(15);
            Writeln;
            Writeln('                   ╔════════════════════════════════════════╗');
            Writeln('                   ║        D e m o     s o r t i n g       ║');
            Writeln('                   ║                                        ║');
            Writeln('                   ║         Квалификационная работа        ║');
            Writeln('                   ║                                        ║');
            Writeln('                   ║           ученика 11-Г класса          ║');
            Writeln('                   ║                                        ║');
            Writeln('                   ║      Лицея Информационных Технологий   ║');
            Writeln('                   ║                                        ║');
            Writeln('                   ║ М е х о в о в а    А л е к с а н д р а ║');
            Writeln('                   ╚════════════════════════════════════════╝');
            Writeln;
            Writeln;
            Writeln;
            Writeln;
            Writeln;
            Writeln;
            Writeln;
            Writeln;
            Writeln('                               Благодарю Вас за использование данной программы.');
            Writeln('                                                С уважением, Меховов Александр!');

            Ochistka_bufera_klaviaturi;

            Halt(99);
       end;

{---------------------------------------------------------------------------}
begin
     koof_zaderjki:=0;
end.