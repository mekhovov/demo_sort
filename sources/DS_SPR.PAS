unit DS_Spr;
interface
         procedure Spravka_Big;
implementation
uses Dos,Graph,CRT,
     DS,
     DS_Mouse,
     DS_Tools,
     DS_Efect,
     DS_Buton,
     DS_Photo,
     DS_Ramks;














   procedure Spravka_Big;
    procedure Sprav;
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
        OutTextXY(10,10,'                                   Справка');
        teory_window(7,35-5,635-3,438-10,'                         Справка о методах сортировки');
        clrwin;
        proc;
        show_mouse;
        {$I-}
        assign(t,'.\DS_data\dst\ds_sprav.dst');
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
                    outtextxy(190+30,185+120+50-150,'Ошибка: Файл  ''.\DS_data\dst\ds_sprav.dst''');
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

        Sprav;

   end;


end.