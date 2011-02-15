unit DS_T_G;
interface
          procedure M_Sort;
          procedure M_Un_sort;
          procedure M_Random;
          procedure M_All_Graph;

implementation
uses Dos,Graph,CRT,
     DS,
     DS_Mouse,
     DS_Tools,
     DS_Efect,
     DS_Buton,
     DS_Photo,
     DS_Ramks;

  var S_Time_S1_M1_Sort,
      S_Time_S1_M2_Sort,
      S_Time_S2_M1_Sort,
      S_Time_S2_M2_Sort,
      S_Time_S3_M1_Sort,
      S_Time_S3_M2_Sort,
      S_Time_S4_M1_Sort,
      S_Time_S4_M2_Sort,
      S_Time_S5_M1_Sort,
      S_Time_S5_M2_Sort:word;
      S_Time_S1_M1_UnSort,
      S_Time_S1_M2_UnSort,
      S_Time_S2_M1_UnSort,
      S_Time_S2_M2_UnSort,
      S_Time_S3_M1_UnSort,
      S_Time_S3_M2_UnSort,
      S_Time_S4_M1_UnSort,
      S_Time_S4_M2_UnSort,
      S_Time_S5_M1_UnSort,
      S_Time_S5_M2_UnSort:word;
      S_Time_S1_M1_Rnd,
      S_Time_S1_M2_Rnd,
      S_Time_S2_M1_Rnd,
      S_Time_S2_M2_Rnd,
      S_Time_S3_M1_Rnd,
      S_Time_S3_M2_Rnd,
      S_Time_S4_M1_Rnd,
      S_Time_S4_M2_Rnd,
      S_Time_S5_M1_Rnd,
      S_Time_S5_M2_Rnd:word;


procedure Sorting(Massiv:array of word;var Sort_Massiv:array of word;N:word);
   var i,j,k:word;
       x:word;
       begin
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            for i:=1 to N-1 do
            begin
                 k:=i;
                 x:=Sort_Massiv[i];
                 for j:=i+1 to n do
                     if Sort_Massiv[j]<x
                        then
                            begin
                                 x:=Sort_Massiv[j];
                                 k:=j;
                            end;
                 Sort_Massiv[k]:=Sort_Massiv[i];
                 Sort_Massiv[i]:=x;

            end;
       end;


procedure UnSorting(Massiv:array of word;var Sort_Massiv:array of word;N:word);
   var i,j,k:word;
       x:word;
       begin
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];

            for i:=1 to N-1 do
            begin
                 k:=i;
                 x:=Sort_Massiv[i];
                 for j:=i+1 to n do
                     if Sort_Massiv[j]>x
                        then
                            begin
                                 x:=Sort_Massiv[j];
                                 k:=j;
                            end;
                 Sort_Massiv[k]:=Sort_Massiv[i];
                 Sort_Massiv[i]:=x;

            end;
       end;








   procedure M_T;
   begin
        risovanie_key(110-90,450-5,290-110-80,470-5,47,'Справка');
        risovanie_key(110+90-90,450-5,290+70-85,470-5,48,'Начать сортировку');
        risovanie_key(110+100+180-105,450-5,290+70+180-90,470-5,49,'Обновить экран');
        risovanie_key(110-90+440,450-5,290-110-80+440,470-5,46,'Графики');


        Ramka_1(10,32,200+10,220);
        Ramka_1(10+210,32,200+210+10,220);
        Ramka_1(10+220+210-10,32,200+220+210,220);
        Ramka_1(10,32+200,200+10+105,220+200);
        Ramka_1(10+315,32+200,200+10+100+320,220+200);

        Ramka_2(10+5,32+5,200+10-5,55);
        Ramka_2(10+5+210,32+5,200+10-5+210,55);
        Ramka_2(10+5+210+210,32+5,200+10-5+210+210,55);
        Ramka_2(10+5,32+5+200,200+10-5+105,55+200);
        Ramka_2(10+5+315,32+5+200,200+10-5+105+315,55+200);

        Setcolor(9);
        OutTextXY(50,32+10,'Метод пузырька');
        OutTextXY(50+220,32+10,'Простой выбор');
        OutTextXY(50+220+200,32+10,'Простые вставки');
        OutTextXY(50+60,32+10+200,'Метод Шелла');
        OutTextXY(50+60+320,32+10+200,'Метод Хоара');

        setcolor(0);
        line(10+5,32+100,205,32+100);
        line(10+5+210,32+100,205+210,32+100);
        line(10+5+210+210,32+100,205+210+210,32+100);
        line(10+5,32+100+200,205+105,32+100+200);
        line(10+5+315,32+100+200,205+105+315,32+100+200);
        setcolor(15);
        line(10+5,32+100+1,205,32+100+1);
        line(10+5+210,32+100+1,205+210,32+100+1);
        line(10+5+210+210,32+100+1,205+210+210,32+100+1);
        line(10+5,32+100+200+1,205+105,32+100+200+1);
        line(10+5+315,32+100+200+1,205+105+315,32+100+200+1);



        setcolor(13);
        OutTextXY(20,32+30,'Массив - 10 чисел');
        OutTextXY(20+210,32+30,'Массив - 10 чисел');
        OutTextXY(20+210+210,32+30,'Массив - 10 чисел');
        OutTextXY(20,32+30+200,'Массив - 10 чисел');
        OutTextXY(20+315,32+30+200,'Массив - 10 чисел');
        OutTextXY(20,32+30+80,'Массив - 1 000 чисел');
        OutTextXY(20+210,32+30+80,'Массив - 1 000 чисел');
        OutTextXY(20+210+210,32+30+80,'Массив - 1 000 чисел');
        OutTextXY(20,32+30+80+200,'Массив - 1 000 чисел');
        OutTextXY(20+315,32+30+80+200,'Массив - 1 000 чисел');
        setcolor(10);
        OutTextXY(20+1,32+1+30,'Массив - 10 чисел');
        OutTextXY(20+1+210,32+1+30,'Массив - 10 чисел');
        OutTextXY(20+1+210+210,32+1+30,'Массив - 10 чисел');
        OutTextXY(20+1,32+1+30+200,'Массив - 10 чисел');
        OutTextXY(20+1+315,32+1+30+200,'Массив - 10 чисел');
        OutTextXY(20+1,32+1+30+80,'Массив - 1 000 чисел');
        OutTextXY(20+1+210,32+1+30+80,'Массив - 1 000 чисел');
        OutTextXY(20+1+210+210,32+1+30+80,'Массив - 1 000 чисел');
        OutTextXY(20+1,32+1+30+80+200,'Массив - 1 000 чисел');
        OutTextXY(20+1+315,32+1+30+80+200,'Массив - 1 000 чисел');

        setcolor(13);
        OutTextXY(20,32+30+20,'1 цикл :');
        OutTextXY(20+210,32+30+20,'1 цикл :');
        OutTextXY(20+210+210,32+30+20,'1 цикл :');
        OutTextXY(20,32+30+200+20,'1 цикл :');
        OutTextXY(20+315,32+30+200+20,'1 цикл :');
        setcolor(12);
        OutTextXY(20,32+30+30,'2 цикл :');
        OutTextXY(20+210,32+30+30,'2 цикл :');
        OutTextXY(20+210+210,32+30+30,'2 цикл :');
        OutTextXY(20,32+30+200+30,'2 цикл :');
        OutTextXY(20+315,32+30+200+30,'2 цикл :');
        setcolor(10);
        OutTextXY(20,32+30+40,'3 цикл :');
        OutTextXY(20+210,32+30+40,'3 цикл :');
        OutTextXY(20+210+210,32+30+40,'3 цикл :');
        OutTextXY(20,32+30+200+40,'3 цикл :');
        OutTextXY(20+315,32+30+200+40,'3 цикл :');

        setcolor(13);
        OutTextXY(20,32+30+20+80,'1 цикл :');
        OutTextXY(20+210,32+30+20+80,'1 цикл :');
        OutTextXY(20+210+210,32+30+20+80,'1 цикл :');
        OutTextXY(20,32+30+200+20+80,'1 цикл :');
        OutTextXY(20+315,32+30+200+20+80,'1 цикл :');
        setcolor(12);
        OutTextXY(20,32+30+30+80,'2 цикл :');
        OutTextXY(20+210,32+30+30+80,'2 цикл :');
        OutTextXY(20+210+210,32+30+30+80,'2 цикл :');
        OutTextXY(20,32+30+200+30+80,'2 цикл :');
        OutTextXY(20+315,32+30+200+30+80,'2 цикл :');
        setcolor(10);
        OutTextXY(20,32+30+40+80,'3 цикл :');
        OutTextXY(20+210,32+30+40+80,'3 цикл :');
        OutTextXY(20+210+210,32+30+40+80,'3 цикл :');
        OutTextXY(20,32+30+200+40+80,'3 цикл :');
        OutTextXY(20+315,32+30+200+40+80,'3 цикл :');

        show_mouse;

   end;


























  procedure M_Sort;
  label Run_Rocedure;

  var S_Time_S1_M1,
    S_Time_S1_M2,
    S_Time_S2_M1,
    S_Time_S2_M2,
    S_Time_S3_M1,
    S_Time_S3_M2,
    S_Time_S4_M1,
    S_Time_S4_M2,
    S_Time_S5_M1,
    S_Time_S5_M2:word;

    Mod_Time,Div_Time:byte;
    strk1,strk2,strk3,strk4,strk5,strk6,strk7,strk8,strk9,strk10:string[6];
    strk1_1,strk1_2:string[3];
    tmp_strk:string[3];

    Clear_Sort:boolean;
    Graf_On:boolean;




procedure Times_Sort;

   procedure Buble_Sorting(Massiv:array of word;NN:word);
   var i,j:word;
       x:word;
       begin
            for i:=2 to NN do
                for j:=NN downto i do
                    if Massiv[j-1] > Massiv[j]
                       then
                           begin
                                x:=Massiv[j-1];
                                Massiv[j-1]:=Massiv[j];
                                Massiv[j]:=x;
                           end;
       end;

   procedure Selection_Sorting(Massiv:array of word;NN:word);
   var i,j,k:word;
       x:word;
       begin
            for i:=1 to NN-1 do
            begin
                 k:=i;
                 x:=Massiv[i];
                 for j:=i+1 to NN do
                     if Massiv[j]<x
                        then
                            begin
                                 x:=Massiv[j];
                                 k:=j;
                            end;
                 Massiv[k]:=Massiv[i];
                 Massiv[i]:=x;

            end;
       end;

   procedure Insertion_Sorting(Massiv:array of word;NN:word);
   var i,j,k:word;
       b:word;
       begin
            for i:=2 to NN do
                begin
                     b:=Massiv[i];
                     j:=1;
                     while (b>Massiv[j]) do
                           j:=j+1;
                     for k:=i-1 downto j do
                         Massiv[k+1]:=Massiv[k];
                         Massiv[j]:=b;
                end;
       end;

   procedure Shell_Sorting(Massiv:array of word;NN:word);
   var Jump:word;
       i,j:word;
       Temp:word;
       End_Sort:boolean;
       begin
            Jump:=NN;
            while Jump>1 do
                  begin
                       Jump:=Jump div 2;
                       repeat
                             End_Sort:=true;
                             for i:=1 to (NN-Jump) do
                                 begin
                                      j:=i+Jump;
                                      if Massiv[i]>Massiv[j]
                                         then
                                             begin
                                                  Temp:=Massiv[i];
                                                  Massiv[i]:=Massiv[j];
                                                  Massiv[j]:=Temp;
                                                  End_Sort:=False;
                                             end;
                                 end;
                       until End_Sort;
                  end;
       end;



   Procedure Hoare_Sorting(Massiv:array of word;NN:word);
   var i,j,L,R:word;
       x,w:word;
       s:word;
       stack:array [1..1000] of record L,R:word end;
   begin
        s:=1;
        stack[1].L:=1;
        stack[s].R:=NN;

        repeat (* выбор из стека последнего запроса *)
               L:=stack[s].L;
               R:=stack[s].R;
               s:=s-1;
               repeat (* разделение Sort_Massiv[L] ...Sort_Massiv[R] *)
                      i:=L;
                      J:=R;
                      X:=Massiv[(L+R) div 2];
                      repeat
                            while Massiv[i] < x DO
                                  begin
                                       i:=i+1
                                  end;
                            while x < Massiv[j] DO
                                  begin
                                       j:=j-1
                                  end;
                            If i<=j
                               then
                                   begin
                                        w:=Massiv[i];
                                        Massiv[i]:=Massiv[j];
                                        Massiv[j]:=w;
                                        i:=i+1;
                                        j:=j-1
                                   end
                      until i>j;
                      If i < R
                         then (* запись в стек запроса из правой части *)
                              begin
                                   s:=s+1;
                                   stack[s].L:=i;
                                   stack[s].R:=R
                              end;
                      R:=j; (* теперь L и R ограничивают левую часть *)
               until L>=R
        until s=0
   end;


{   procedure Hoare_Sorting(l,r:word;Massiv:array of word);
   var b,tmp:word;
       i,j:word;
       begin
            i:=l;
            j:=r;
            b:=Massiv[(l+r) div 2];
            while i<=j do
                  begin
                       while Massiv[i]<b do
                             inc(i);
                       while Massiv[j]>b do
                             dec(j);
                       if i<=j
                          then
                              begin
                                   tmp:=Massiv[i];
                                   Massiv[i]:=Massiv[j];
                                   Massiv[j]:=tmp;

                                   inc(i);
                                   dec(j);
                              end;
                       if l<j
                          then
                              Hoare_Sorting(l,j,Massiv);
                       if i<r
                          then
                              Hoare_Sorting(i,r,Massiv);
                  end;
       end;
}

   const Z1=10;
         Z2=1000;
         Circle_1_1=10;
         Circle_1_2=10000;
         Circle_2=100;
   var M1:array[0..Z1] of word;
       M2:array[0..Z2] of word;
       i,q:word;
       h,min,s,ms:word;

       Time_S1_M1,
       Time_S1_M2,
       Time_S2_M1,
       Time_S2_M2,
       Time_S3_M1,
       Time_S3_M2,
       Time_S4_M1,
       Time_S4_M2,
       Time_S5_M1,
       Time_S5_M2:word;


   begin

        s:=0;
        ms:=0;
        h:=0;
        min:=0;
        s:=0;
        ms:=0;

        Time_S1_M1:=0;
        Time_S1_M2:=0;
        Time_S2_M1:=0;
        Time_S2_M2:=0;
        Time_S3_M1:=0;
        Time_S3_M2:=0;
        Time_S4_M1:=0;
        Time_S4_M2:=0;
        Time_S5_M1:=0;
        Time_S5_M2:=0;


        S_Time_S1_M1:=0;
        S_Time_S1_M2:=0;
        S_Time_S2_M1:=0;
        S_Time_S2_M2:=0;
        S_Time_S3_M1:=0;
        S_Time_S3_M2:=0;
        S_Time_S4_M1:=0;
        S_Time_S4_M2:=0;
        S_Time_S5_M1:=0;
        S_Time_S5_M2:=0;

        Mod_Time:=0;
        Div_Time:=0;

        for i:=1 to Z1 do
            begin
                 M1[i]:=Random(65355);
            end;
        for i:=1 to Z1 do
            begin
                 M2[i]:=M1[i];
            end;
        for i:=Z1+1 to Z2 do
            begin
                 M2[i]:=Random(65355);
            end;


        Sorting(M1,M1,10);
        Sorting(M2,M2,1000);


{Sort-1, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Buble_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S1_M1:=s*100+ms;


        if Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S1_M1 div 100;
        Mod_Time:=Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100,32+30+20,strk1_1+','+strk1_2+' мсек.');


{Sort-1, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Buble_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S1_M2:=s*100+ms;
        str(Time_S1_M2,strk1);

        setcolor(13);
        outtextxy(100,32+30+20+80,strk1+' мсек.');


{Sort-2, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Selection_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S2_M1:=s*100+ms;

        if Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S2_M1 div 100;
        Mod_Time:=Time_S2_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100+210,32+30+20,strk1_1+','+strk1_2+' мсек.');


{Sort-2, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Selection_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S2_M2:=s*100+ms;
        str(Time_S2_M2,strk1);

        setcolor(13);
        outtextxy(100+210,32+30+20+80,strk1+' мсек.');


{Sort-3, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Insertion_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S3_M1:=s*100+ms;


        if Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S3_M1 div 100;
        Mod_Time:=Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100+210+210,32+30+20,strk1_1+','+strk1_2+' мсек.');


{Sort-3, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Insertion_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S3_M2:=s*100+ms;
        str(Time_S3_M2,strk1);

        setcolor(13);
        outtextxy(100+210+210,32+30+20+80,strk1+' мсек.');


{Sort-4, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Shell_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S4_M1:=s*100+ms;


        if Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S4_M1 div 100;
        Mod_Time:=Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100,32+30+20+200,strk1_1+','+strk1_2+' мсек.');


{Sort-4, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Shell_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S4_M2:=s*100+ms;
        str(Time_S4_M2,strk1);

        setcolor(13);
        outtextxy(100,32+30+20+80+200,strk1+' мсек.');

{Sort-5, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Hoare_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S5_M1:=s*100+ms;

        if Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S5_M1 div 100;
        Mod_Time:=Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        str(s,strk1);
        str(ms,strk2);
        setcolor(13);
        outtextxy(100+315,32+30+20+200,strk1_1+','+strk1_2+' мсек.');


{Sort-5, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Hoare_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S5_M2:=s*100+ms;
        str(Time_S5_M2,strk1);

        setcolor(13);
        outtextxy(100+315,32+30+20+80+200,strk1+' мсек.');



        inc(S_Time_S1_M1,Time_S1_M1);
        inc(S_Time_S1_M2,Time_S1_M2);
        inc(S_Time_S2_M1,Time_S2_M1);
        inc(S_Time_S2_M2,Time_S2_M2);
        inc(S_Time_S3_M1,Time_S3_M1);
        inc(S_Time_S3_M2,Time_S3_M2);
        inc(S_Time_S4_M1,Time_S4_M1);
        inc(S_Time_S4_M2,Time_S4_M2);
        inc(S_Time_S5_M1,Time_S5_M1);
        inc(S_Time_S5_M2,Time_S5_M2);



        for i:=1 to Z1 do
            begin
                 M1[i]:=Random(65355);
            end;
        for i:=1 to Z1 do
            begin
                 M2[i]:=M1[i];
            end;
        for i:=Z1+1 to Z2 do
            begin
                 M2[i]:=Random(65355);
            end;

        Sorting(M1,M1,10);
        Sorting(M2,M2,1000);

{Sort-1, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Buble_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S1_M1:=s*100+ms;

        if Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S1_M1 div 100;
        Mod_Time:=Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100,32+30+20+10,strk1_1+','+strk1_2+' мсек.');


{Sort-1, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Buble_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S1_M2:=s*100+ms;
        str(Time_S1_M2,strk1);

        setcolor(12);
        outtextxy(100,32+30+20+80+10,strk1+' мсек.');


{Sort-2, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Selection_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S2_M1:=s*100+ms;


        if Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S2_M1 div 100;
        Mod_Time:=Time_S2_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100+210,32+30+20+10,strk1_1+','+strk1_2+' мсек.');


{Sort-2, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Selection_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S2_M2:=s*100+ms;
        str(Time_S2_M2,strk1);

        setcolor(12);
        outtextxy(100+210,32+30+20+80+10,strk1+' мсек.');


{Sort-3, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Insertion_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S3_M1:=s*100+ms;


        if Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S3_M1 div 100;
        Mod_Time:=Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100+210+210,32+30+20+10,strk1_1+','+strk1_2+' мсек.');


{Sort-3, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Insertion_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S3_M2:=s*100+ms;
        str(Time_S3_M2,strk1);

        setcolor(12);
        outtextxy(100+210+210,32+30+20+80+10,strk1+' мсек.');


{Sort-4, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Shell_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S4_M1:=s*100+ms;


        if Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S4_M1 div 100;
        Mod_Time:=Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100,32+30+20+200+10,strk1_1+','+strk1_2+' мсек.');


{Sort-4, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Shell_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S4_M2:=s*100+ms;
        str(Time_S4_M2,strk1);

        setcolor(12);
        outtextxy(100,32+30+20+80+200+10,strk1+' мсек.');

{Sort-5, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Hoare_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S5_M1:=s*100+ms;


        if Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S5_M1 div 100;
        Mod_Time:=Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100+315,32+30+20+200+10,strk1_1+','+strk1_2+' мсек.');


{Sort-5, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Hoare_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S5_M2:=s*100+ms;
        str(Time_S5_M2,strk1);

        setcolor(12);
        outtextxy(100+315,32+30+20+80+200+10,strk1+' мсек.');




        inc(S_Time_S1_M1,Time_S1_M1);
        inc(S_Time_S1_M2,Time_S1_M2);
        inc(S_Time_S2_M1,Time_S2_M1);
        inc(S_Time_S2_M2,Time_S2_M2);
        inc(S_Time_S3_M1,Time_S3_M1);
        inc(S_Time_S3_M2,Time_S3_M2);
        inc(S_Time_S4_M1,Time_S4_M1);
        inc(S_Time_S4_M2,Time_S4_M2);
        inc(S_Time_S5_M1,Time_S5_M1);
        inc(S_Time_S5_M2,Time_S5_M2);




        for i:=1 to Z1 do
            begin
                 M1[i]:=Random(65355);
            end;
        for i:=1 to Z1 do
            begin
                 M2[i]:=M1[i];
            end;
        for i:=Z1+1 to Z2 do
            begin
                 M2[i]:=Random(65355);
            end;

        Sorting(M1,M1,10);
        Sorting(M2,M2,1000);

{Sort-1, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Buble_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S1_M1:=s*100+ms;


        if Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S1_M1 div 100;
        Mod_Time:=Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100,32+30+20+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-1, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Buble_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S1_M2:=s*100+ms;
        str(Time_S1_M2,strk1);

        setcolor(10);
        outtextxy(100,32+30+20+80+10+10,strk1+' мсек.');


{Sort-2, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Selection_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S2_M1:=s*100+ms;


        if Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S2_M1 div 100;
        Mod_Time:=Time_S2_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100+210,32+30+20+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-2, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Selection_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S2_M2:=s*100+ms;
        str(Time_S2_M2,strk1);

        setcolor(10);
        outtextxy(100+210,32+30+20+80+10+10,strk1+' мсек.');


{Sort-3, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Insertion_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S3_M1:=s*100+ms;


        if Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S3_M1 div 100;
        Mod_Time:=Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100+210+210,32+30+20+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-3, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Insertion_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S3_M2:=s*100+ms;
        str(Time_S3_M2,strk1);

        setcolor(10);
        outtextxy(100+210+210,32+30+20+80+10+10,strk1+' мсек.');


{Sort-4, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Shell_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S4_M1:=s*100+ms;


        if Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S4_M1 div 100;
        Mod_Time:=Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100,32+30+20+200+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-4, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Shell_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S4_M2:=s*100+ms;
        str(Time_S4_M2,strk1);

        setcolor(10);
        outtextxy(100,32+30+20+80+200+10+10,strk1+' мсек.');

{Sort-5, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Hoare_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S5_M1:=s*100+ms;


        if Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S5_M1 div 100;
        Mod_Time:=Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100+315,32+30+20+200+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-5, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Hoare_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S5_M2:=s*100+ms;
        str(Time_S5_M2,strk1);

        setcolor(10);
        outtextxy(100+315,32+30+20+80+200+10+10,strk1+' мсек.');



        inc(S_Time_S1_M1,Time_S1_M1);
        inc(S_Time_S1_M2,Time_S1_M2);
        inc(S_Time_S2_M1,Time_S2_M1);
        inc(S_Time_S2_M2,Time_S2_M2);
        inc(S_Time_S3_M1,Time_S3_M1);
        inc(S_Time_S3_M2,Time_S3_M2);
        inc(S_Time_S4_M1,Time_S4_M1);
        inc(S_Time_S4_M2,Time_S4_M2);
        inc(S_Time_S5_M1,Time_S5_M1);
        inc(S_Time_S5_M2,Time_S5_M2);



        S_Time_S1_M1:=S_Time_S1_M1 div 3;
        S_Time_S1_M2:=S_Time_S1_M2 div 3;
        S_Time_S2_M1:=S_Time_S2_M1 div 3;
        S_Time_S2_M2:=S_Time_S2_M2 div 3;
        S_Time_S3_M1:=S_Time_S3_M1 div 3;
        S_Time_S3_M2:=S_Time_S3_M2 div 3;
        S_Time_S4_M1:=S_Time_S4_M1 div 3;
        S_Time_S4_M2:=S_Time_S4_M2 div 3;
        S_Time_S5_M1:=S_Time_S5_M1 div 3;
        S_Time_S5_M2:=S_Time_S5_M2 div 3;


        S_Time_S1_M1_Sort:=S_Time_S1_M1;
        S_Time_S1_M2_Sort:=S_Time_S1_M2;
        S_Time_S2_M1_Sort:=S_Time_S2_M1;
        S_Time_S2_M2_Sort:=S_Time_S2_M2;
        S_Time_S3_M1_Sort:=S_Time_S3_M1;
        S_Time_S3_M2_Sort:=S_Time_S3_M2;
        S_Time_S4_M1_Sort:=S_Time_S4_M1;
        S_Time_S4_M2_Sort:=S_Time_S4_M2;
        S_Time_S5_M1_Sort:=S_Time_S5_M1;
        S_Time_S5_M2_Sort:=S_Time_S5_M2;


        setcolor(1);


        if S_Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S1_M1 div 100;
        Mod_Time:=S_Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80,32+30+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S2_M1 div 100;
        Mod_Time:=S_Time_S2_M1 mod 100;


        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80+210,32+30+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S3_M1 div 100;
        Mod_Time:=S_Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80+210+210,32+30+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S4_M1 div 100;
        Mod_Time:=S_Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80,32+30+200+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S5_M1 div 100;
        Mod_Time:=S_Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80+315,32+30+200+60,strk1_1+','+strk1_2+' мсек.');





        str(S_Time_S1_M2,strk2);
        str(S_Time_S2_M2,strk4);
        str(S_Time_S3_M2,strk6);
        str(S_Time_S4_M2,strk8);
        str(S_Time_S5_M2,strk10);



        OutTextXY(20+80,32+30+60+80,strk2+' мсек.');
        OutTextXY(20+80+210,32+30+60+80,strk4+' мсек.');
        OutTextXY(20+80+210+210,32+30+60+80,strk6+' мсек.');
        OutTextXY(20+80,32+30+200+60+80,strk8+' мсек.');
        OutTextXY(20+80+315,32+30+200+60+80,strk10+' мсек.');



   end;



   procedure Grafiki_Sort;
   const Min_Draw=160;
         Max_Draw=540;
         Y1=110;
         Y2=130;
         Y3=150;
         Y4=170;
         Y5=190;
         Y6=290;
         Y7=310;
         Y8=330;
         Y9=350;
         Y10=370;


   procedure Polosa(y,Dlina:word);
   begin
        setcolor(1);
        line(Min_Draw,y,Min_Draw+Dlina,y);
        setcolor(1);
        line(Min_Draw,y+1,Min_Draw+Dlina,y+1);
        setcolor(2);
        line(Min_Draw,y+2,Min_Draw+Dlina,y+2);
        setcolor(2);
        line(Min_Draw,y+3,Min_Draw+Dlina,y+3);
        setcolor(3);
        line(Min_Draw,y+4,Min_Draw+Dlina,y+4);
        setcolor(3);
        line(Min_Draw,y+5,Min_Draw+Dlina,y+5);
        setcolor(2);
        line(Min_Draw,y+6,Min_Draw+Dlina,y+6);
        setcolor(2);
        line(Min_Draw,y+7,Min_Draw+Dlina,y+7);
        setcolor(2);
        line(Min_Draw,y+8,Min_Draw+Dlina,y+8);
        setcolor(1);
        line(Min_Draw,y+9,Min_Draw+Dlina,y+9);
        setcolor(1);
        line(Min_Draw,y+10,Min_Draw+Dlina,y+10);

        setcolor(1);
        line(Min_Draw,y,Min_Draw,y+10);
        line(Min_Draw+Dlina,y,Min_Draw+Dlina,y+10);

   end;


   begin
        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);


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
        line(557,435,557,475);

        risovanie_key(570-3,445,625+4,465,10,'Возврат');



        Init_mouse;


        Setcolor(15);
        OutTextXY(10,10,'                    Графики времени выполнения сортировок');

        Setcolor(0);
        OutTextXY(20,450,'Для продолжения работы нажмите клавишу ''Возврат''');




        Ramka_1(10,56,630,214);

        Ramka_2(14,60,626,80);
        Setcolor(9);
        OutTextXY(250,65,'Размер массива - 10 чисел');

        Ramka_2(20,106,150,124);
        Ramka_2(20,126,150,144);
        Ramka_2(20,146,150,164);
        Ramka_2(20,166,150,184);
        Ramka_2(20,186,150,204);

        Setcolor(10);
        OutTextXY(26,111,'Метод пузырька');
        OutTextXY(26,131,'Простой выбор');
        OutTextXY(26,151,'Простые вставки');
        OutTextXY(26,171,'Метод Шелла');
        OutTextXY(26,191,'Метод Хоара');


        Setcolor(0);
        Line(154,84,154,208);
        Setcolor(15);
        Line(16,101,624,101);
        Line(155,84,155,208);
        Setcolor(0);
        Line(16,100,624,100);

        Setcolor(15);
        OutTextXY(60,86,'Метод');
        Setcolor(0);
        OutTextXY(61,87,'Метод');

        Setcolor(15);
        OutTextXY(320,86,'Время выполнения');
        Setcolor(0);
        OutTextXY(321,87,'Время выполнения');



        Ramka_1(10,56+180,630,214+180);

        Ramka_2(14,60+180,626,80+180);
        Setcolor(9);
        OutTextXY(250,65+180,'Размер массива - 1000 чисел');

        Ramka_2(20,106+180,150,124+180);
        Ramka_2(20,126+180,150,144+180);
        Ramka_2(20,146+180,150,164+180);
        Ramka_2(20,166+180,150,184+180);
        Ramka_2(20,186+180,150,204+180);

        Setcolor(10);
        OutTextXY(26,111+180,'Метод пузырька');
        OutTextXY(26,131+180,'Простой выбор');
        OutTextXY(26,151+180,'Простые вставки');
        OutTextXY(26,171+180,'Метод Шелла');
        OutTextXY(26,191+180,'Метод Хоара');

        Setcolor(0);
        Line(154,84+180,154,208+180);
        Setcolor(15);
        Line(16,101+180,624,101+180);
        Line(155,84+180,155,208+180);
        Setcolor(0);
        Line(16,100+180,624,100+180);

        Setcolor(15);
        OutTextXY(60,86+180,'Метод');
        Setcolor(0);
        OutTextXY(61,87+180,'Метод');

        Setcolor(15);
        OutTextXY(320,86+180,'Время выполнения');
        Setcolor(0);
        OutTextXY(321,87+180,'Время выполнения');

        { Начинаем рисовать    -  Min_Draw }
        { Заканчиваем рисовать -  Max_Draw }








        Polosa(Y1,S_Time_S1_M1);
        Polosa(Y2,S_Time_S2_M1);
        Polosa(Y3,S_Time_S3_M1);
        Polosa(Y4,S_Time_S4_M1);
        Polosa(Y5,S_Time_S5_M1);
        Polosa(Y6,S_Time_S1_M2 div 10);
        Polosa(Y7,S_Time_S2_M2 div 10);
        Polosa(Y8,S_Time_S3_M2 div 10);
        Polosa(Y9,S_Time_S4_M2 div 10);
        Polosa(Y10,S_Time_S5_M2 div 10);


        Setcolor(1);

        if S_Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S1_M1 div 100;
        Mod_Time:=S_Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S1_M1+10,Y1+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S2_M1 div 100;
        Mod_Time:=S_Time_S2_M1 mod 100;


        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S2_M1+10,Y2+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S3_M1 div 100;
        Mod_Time:=S_Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S3_M1+10,Y3+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S4_M1 div 100;
        Mod_Time:=S_Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S4_M1+10,Y4+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S5_M1 div 100;
        Mod_Time:=S_Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S5_M1+10,Y5+1,strk1_1+','+strk1_2+' мсек.');






        str(S_Time_S1_M2,strk2);
        str(S_Time_S2_M2,strk4);
        str(S_Time_S3_M2,strk6);
        str(S_Time_S4_M2,strk8);
        str(S_Time_S5_M2,strk10);

        OutTextXY((Min_Draw+S_Time_S1_M2 div 10)+10,Y6+1,strk2+' мсек.');
        OutTextXY((Min_Draw+S_Time_S2_M2 div 10)+10,Y7+1,strk4+' мсек.');
        OutTextXY((Min_Draw+S_Time_S3_M2 div 10)+10,Y8+1,strk6+' мсек.');
        OutTextXY((Min_Draw+S_Time_S4_M2 div 10)+10,Y9+1,strk8+' мсек.');
        OutTextXY((Min_Draw+S_Time_S5_M2 div 10)+10,Y10+1,strk10+' мсек.');




        Show_Mouse;


   end;






  begin

        Run_Rocedure:

        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);
        Init_mouse;

        ramka_fon;
        Setcolor(15);
        OutTextXY(10,10,'                       Массив упорядочен по возрастанию');

        M_T;

        setcolor(1);
        OutTextXY(20,32+30+60,'Среднее:');
        OutTextXY(20+210,32+30+60,'Среднее:');
        OutTextXY(20+210+210,32+30+60,'Среднее:');
        OutTextXY(20,32+30+200+60,'Среднее:');
        OutTextXY(20+315,32+30+200+60,'Среднее:');
        setcolor(1);
        OutTextXY(20,32+30+60+80,'Среднее:');
        OutTextXY(20+210,32+30+60+80,'Среднее:');
        OutTextXY(20+210+210,32+30+60+80,'Среднее:');
        OutTextXY(20,32+30+200+60+80,'Среднее:');
        OutTextXY(20+315,32+30+200+60+80,'Среднее:');


        Clear_Sort:=true;
        Graf_On:=false;


        repeat
              vedenie_kursora(10);
              vedenie_kursora(47);
              if Clear_Sort
                 then
                     vedenie_kursora(48);
              if (not Clear_Sort)
                 then
                     vedenie_kursora(49);
              if Graf_On
                 then
                     vedenie_kursora(46);




              if keypress(47,3)
                 then
                     begin
                          Hide_Mouse;
                          Temnenie_Monitora(0);
                          cleardevice;
                          Izmenenie_Palitri(2);
                          Init_mouse;

                          Pcx_Photo('.\DS_data\img\DS_TS.pcx',0,0);

                          show_mouse;
                          risovanie_key_for_palitra(570-3,445,625+4,465,10,'Возврат');

                          repeat
                                vedenie_kursora_for_palitra(10);
                          until keypress_for_palitra(10,3);

                          Hide_Mouse;
                          Temnenie_Monitora(0);
                          cleardevice;
                          Izmenenie_Palitri(1);
                          goto Run_Rocedure;

                     end;

              if (Clear_Sort) and (keypress(48,3))
                 then
                     begin
                          Hide_Mouse;
                          setcolor(2);

                          pcx_photo('.\DS_data\img\ds_wait.pcx',500,380);


                          Times_Sort;

                          setfillstyle(1,14);
                          bar(490,380,620,412);


                          Show_Mouse;

                          Clear_Sort:=false;
                          Graf_On:=True;
                     end;

              if (Graf_On) and (keypress(46,3))
                 then
                     begin
                          Grafiki_Sort;

                          Show_Mouse;

                          repeat
                                vedenie_kursora(10);
                          until keypress(10,3);

                          Graf_On:=false;

                          Hide_Mouse;
                          Temnenie_Monitora(0);
                          cleardevice;
                          Izmenenie_Palitri(1);
                          goto Run_Rocedure;
                     end;

              if (not Clear_Sort) and (keypress(49,3))
                 then
                     begin
                          goto Run_Rocedure;
                     end;




        until keypress(10,3);

        exit;

   end;






































  procedure M_Un_Sort;
  label Run_Rocedure;

  var S_Time_S1_M1,
    S_Time_S1_M2,
    S_Time_S2_M1,
    S_Time_S2_M2,
    S_Time_S3_M1,
    S_Time_S3_M2,
    S_Time_S4_M1,
    S_Time_S4_M2,
    S_Time_S5_M1,
    S_Time_S5_M2:word;

    Mod_Time,Div_Time:byte;
    strk1,strk2,strk3,strk4,strk5,strk6,strk7,strk8,strk9,strk10:string[6];
    strk1_1,strk1_2:string[3];
    tmp_strk:string[3];

    Clear_Sort:boolean;
    Graf_On:boolean;




procedure Times_Un_Sort;

   procedure Buble_Sorting(Massiv:array of word;NN:word);
   var i,j:word;
       x:word;
       begin
            for i:=2 to NN do
                for j:=NN downto i do
                    if Massiv[j-1] > Massiv[j]
                       then
                           begin
                                x:=Massiv[j-1];
                                Massiv[j-1]:=Massiv[j];
                                Massiv[j]:=x;
                           end;
       end;

   procedure Selection_Sorting(Massiv:array of word;NN:word);
   var i,j,k:word;
       x:word;
       begin
            for i:=1 to NN-1 do
            begin
                 k:=i;
                 x:=Massiv[i];
                 for j:=i+1 to NN do
                     if Massiv[j]<x
                        then
                            begin
                                 x:=Massiv[j];
                                 k:=j;
                            end;
                 Massiv[k]:=Massiv[i];
                 Massiv[i]:=x;

            end;
       end;

   procedure Insertion_Sorting(Massiv:array of word;NN:word);
   var i,j,k:word;
       b:word;
       begin
            for i:=2 to NN do
                begin
                     b:=Massiv[i];
                     j:=1;
                     while (b>Massiv[j]) do
                           j:=j+1;
                     for k:=i-1 downto j do
                         Massiv[k+1]:=Massiv[k];
                         Massiv[j]:=b;
                end;
       end;

   procedure Shell_Sorting(Massiv:array of word;NN:word);
   var Jump:word;
       i,j:word;
       Temp:word;
       End_Sort:boolean;
       begin
            Jump:=NN;
            while Jump>1 do
                  begin
                       Jump:=Jump div 2;
                       repeat
                             End_Sort:=true;
                             for i:=1 to (NN-Jump) do
                                 begin
                                      j:=i+Jump;
                                      if Massiv[i]>Massiv[j]
                                         then
                                             begin
                                                  Temp:=Massiv[i];
                                                  Massiv[i]:=Massiv[j];
                                                  Massiv[j]:=Temp;
                                                  End_Sort:=False;
                                             end;
                                 end;
                       until End_Sort;
                  end;
       end;


   Procedure Hoare_Sorting(Massiv:array of word;NN:word);
   var i,j,L,R:word;
       x,w:word;
       s:word;
       stack:array [1..1000] of record L,R:word end;
   begin
        s:=1;
        stack[1].L:=1;
        stack[s].R:=NN;

        repeat (* выбор из стека последнего запроса *)
               L:=stack[s].L;
               R:=stack[s].R;
               s:=s-1;
               repeat (* разделение Sort_Massiv[L] ...Sort_Massiv[R] *)
                      i:=L;
                      J:=R;
                      X:=Massiv[(L+R) div 2];
                      repeat
                            while Massiv[i] < x DO
                                  begin
                                       i:=i+1
                                  end;
                            while x < Massiv[j] DO
                                  begin
                                       j:=j-1
                                  end;
                            If i<=j
                               then
                                   begin
                                        w:=Massiv[i];
                                        Massiv[i]:=Massiv[j];
                                        Massiv[j]:=w;
                                        i:=i+1;
                                        j:=j-1
                                   end
                      until i>j;
                      If i < R
                         then (* запись в стек запроса из правой части *)
                              begin
                                   s:=s+1;
                                   stack[s].L:=i;
                                   stack[s].R:=R
                              end;
                      R:=j; (* теперь L и R ограничивают левую часть *)
               until L>=R
        until s=0
   end;

{   procedure Hoare_Sorting(l,r:word;Massiv:array of word);
   var b,tmp:word;
       i,j:word;
       begin
            i:=l;
            j:=r;
            b:=Massiv[(l+r) div 2];
            while i<=j do
                  begin
                       while Massiv[i]<b do
                             inc(i);
                       while Massiv[j]>b do
                             dec(j);
                       if i<=j
                          then
                              begin
                                   tmp:=Massiv[i];
                                   Massiv[i]:=Massiv[j];
                                   Massiv[j]:=tmp;

                                   inc(i);
                                   dec(j);
                              end;
                       if l<j
                          then
                              Hoare_Sorting(l,j,Massiv);
                       if i<r
                          then
                              Hoare_Sorting(i,r,Massiv);
                  end;
       end;
}

   const Z1=10;
         Z2=1000;
         Circle_1_1=10;
         Circle_1_2=10000;
         Circle_2=100;
   var M1:array[0..Z1] of word;
       M2:array[0..Z2] of word;
       i,q:word;
       h,min,s,ms:word;

       Time_S1_M1,
       Time_S1_M2,
       Time_S2_M1,
       Time_S2_M2,
       Time_S3_M1,
       Time_S3_M2,
       Time_S4_M1,
       Time_S4_M2,
       Time_S5_M1,
       Time_S5_M2:word;



   begin

        s:=0;
        ms:=0;
        h:=0;
        min:=0;
        s:=0;
        ms:=0;

        Time_S1_M1:=0;
        Time_S1_M2:=0;
        Time_S2_M1:=0;
        Time_S2_M2:=0;
        Time_S3_M1:=0;
        Time_S3_M2:=0;
        Time_S4_M1:=0;
        Time_S4_M2:=0;
        Time_S5_M1:=0;
        Time_S5_M2:=0;


        S_Time_S1_M1:=0;
        S_Time_S1_M2:=0;
        S_Time_S2_M1:=0;
        S_Time_S2_M2:=0;
        S_Time_S3_M1:=0;
        S_Time_S3_M2:=0;
        S_Time_S4_M1:=0;
        S_Time_S4_M2:=0;
        S_Time_S5_M1:=0;
        S_Time_S5_M2:=0;

        Mod_Time:=0;
        Div_Time:=0;

        for i:=1 to Z1 do
            begin
                 M1[i]:=Random(65355);
            end;
        for i:=1 to Z1 do
            begin
                 M2[i]:=M1[i];
            end;
        for i:=Z1+1 to Z2 do
            begin
                 M2[i]:=Random(65355);
            end;


        UnSorting(M1,M1,10);
        UnSorting(M2,M2,1000);


{Sort-1, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Buble_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S1_M1:=s*100+ms;


        if Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S1_M1 div 100;
        Mod_Time:=Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100,32+30+20,strk1_1+','+strk1_2+' мсек.');


{Sort-1, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Buble_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S1_M2:=s*100+ms;
        str(Time_S1_M2,strk1);

        setcolor(13);
        outtextxy(100,32+30+20+80,strk1+' мсек.');


{Sort-2, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Selection_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S2_M1:=s*100+ms;

        if Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S2_M1 div 100;
        Mod_Time:=Time_S2_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100+210,32+30+20,strk1_1+','+strk1_2+' мсек.');


{Sort-2, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Selection_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S2_M2:=s*100+ms;
        str(Time_S2_M2,strk1);

        setcolor(13);
        outtextxy(100+210,32+30+20+80,strk1+' мсек.');


{Sort-3, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Insertion_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S3_M1:=s*100+ms;


        if Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S3_M1 div 100;
        Mod_Time:=Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100+210+210,32+30+20,strk1_1+','+strk1_2+' мсек.');


{Sort-3, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Insertion_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S3_M2:=s*100+ms;
        str(Time_S3_M2,strk1);

        setcolor(13);
        outtextxy(100+210+210,32+30+20+80,strk1+' мсек.');


{Sort-4, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Shell_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S4_M1:=s*100+ms;


        if Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S4_M1 div 100;
        Mod_Time:=Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100,32+30+20+200,strk1_1+','+strk1_2+' мсек.');


{Sort-4, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Shell_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S4_M2:=s*100+ms;
        str(Time_S4_M2,strk1);

        setcolor(13);
        outtextxy(100,32+30+20+80+200,strk1+' мсек.');

{Sort-5, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Hoare_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S5_M1:=s*100+ms;

        if Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S5_M1 div 100;
        Mod_Time:=Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        str(s,strk1);
        str(ms,strk2);
        setcolor(13);
        outtextxy(100+315,32+30+20+200,strk1_1+','+strk1_2+' мсек.');


{Sort-5, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Hoare_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S5_M2:=s*100+ms;
        str(Time_S5_M2,strk1);

        setcolor(13);
        outtextxy(100+315,32+30+20+80+200,strk1+' мсек.');



        inc(S_Time_S1_M1,Time_S1_M1);
        inc(S_Time_S1_M2,Time_S1_M2);
        inc(S_Time_S2_M1,Time_S2_M1);
        inc(S_Time_S2_M2,Time_S2_M2);
        inc(S_Time_S3_M1,Time_S3_M1);
        inc(S_Time_S3_M2,Time_S3_M2);
        inc(S_Time_S4_M1,Time_S4_M1);
        inc(S_Time_S4_M2,Time_S4_M2);
        inc(S_Time_S5_M1,Time_S5_M1);
        inc(S_Time_S5_M2,Time_S5_M2);



        for i:=1 to Z1 do
            begin
                 M1[i]:=Random(65355);
            end;
        for i:=1 to Z1 do
            begin
                 M2[i]:=M1[i];
            end;
        for i:=Z1+1 to Z2 do
            begin
                 M2[i]:=Random(65355);
            end;

        UnSorting(M1,M1,10);
        UnSorting(M2,M2,1000);

{Sort-1, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Buble_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S1_M1:=s*100+ms;

        if Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S1_M1 div 100;
        Mod_Time:=Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100,32+30+20+10,strk1_1+','+strk1_2+' мсек.');


{Sort-1, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Buble_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S1_M2:=s*100+ms;
        str(Time_S1_M2,strk1);

        setcolor(12);
        outtextxy(100,32+30+20+80+10,strk1+' мсек.');


{Sort-2, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Selection_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S2_M1:=s*100+ms;


        if Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S2_M1 div 100;
        Mod_Time:=Time_S2_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100+210,32+30+20+10,strk1_1+','+strk1_2+' мсек.');


{Sort-2, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Selection_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S2_M2:=s*100+ms;
        str(Time_S2_M2,strk1);

        setcolor(12);
        outtextxy(100+210,32+30+20+80+10,strk1+' мсек.');


{Sort-3, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Insertion_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S3_M1:=s*100+ms;


        if Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S3_M1 div 100;
        Mod_Time:=Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100+210+210,32+30+20+10,strk1_1+','+strk1_2+' мсек.');


{Sort-3, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Insertion_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S3_M2:=s*100+ms;
        str(Time_S3_M2,strk1);

        setcolor(12);
        outtextxy(100+210+210,32+30+20+80+10,strk1+' мсек.');


{Sort-4, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Shell_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S4_M1:=s*100+ms;


        if Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S4_M1 div 100;
        Mod_Time:=Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100,32+30+20+200+10,strk1_1+','+strk1_2+' мсек.');


{Sort-4, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Shell_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S4_M2:=s*100+ms;
        str(Time_S4_M2,strk1);

        setcolor(12);
        outtextxy(100,32+30+20+80+200+10,strk1+' мсек.');

{Sort-5, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Hoare_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S5_M1:=s*100+ms;


        if Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S5_M1 div 100;
        Mod_Time:=Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100+315,32+30+20+200+10,strk1_1+','+strk1_2+' мсек.');


{Sort-5, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Hoare_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S5_M2:=s*100+ms;
        str(Time_S5_M2,strk1);

        setcolor(12);
        outtextxy(100+315,32+30+20+80+200+10,strk1+' мсек.');




        inc(S_Time_S1_M1,Time_S1_M1);
        inc(S_Time_S1_M2,Time_S1_M2);
        inc(S_Time_S2_M1,Time_S2_M1);
        inc(S_Time_S2_M2,Time_S2_M2);
        inc(S_Time_S3_M1,Time_S3_M1);
        inc(S_Time_S3_M2,Time_S3_M2);
        inc(S_Time_S4_M1,Time_S4_M1);
        inc(S_Time_S4_M2,Time_S4_M2);
        inc(S_Time_S5_M1,Time_S5_M1);
        inc(S_Time_S5_M2,Time_S5_M2);




        for i:=1 to Z1 do
            begin
                 M1[i]:=Random(65355);
            end;
        for i:=1 to Z1 do
            begin
                 M2[i]:=M1[i];
            end;
        for i:=Z1+1 to Z2 do
            begin
                 M2[i]:=Random(65355);
            end;

        UnSorting(M1,M1,10);
        UnSorting(M2,M2,1000);

{Sort-1, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Buble_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S1_M1:=s*100+ms;


        if Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S1_M1 div 100;
        Mod_Time:=Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100,32+30+20+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-1, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Buble_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S1_M2:=s*100+ms;
        str(Time_S1_M2,strk1);

        setcolor(10);
        outtextxy(100,32+30+20+80+10+10,strk1+' мсек.');


{Sort-2, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Selection_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S2_M1:=s*100+ms;


        if Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S2_M1 div 100;
        Mod_Time:=Time_S2_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100+210,32+30+20+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-2, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Selection_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S2_M2:=s*100+ms;
        str(Time_S2_M2,strk1);

        setcolor(10);
        outtextxy(100+210,32+30+20+80+10+10,strk1+' мсек.');


{Sort-3, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Insertion_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S3_M1:=s*100+ms;


        if Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S3_M1 div 100;
        Mod_Time:=Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100+210+210,32+30+20+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-3, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Insertion_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S3_M2:=s*100+ms;
        str(Time_S3_M2,strk1);

        setcolor(10);
        outtextxy(100+210+210,32+30+20+80+10+10,strk1+' мсек.');


{Sort-4, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Shell_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S4_M1:=s*100+ms;


        if Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S4_M1 div 100;
        Mod_Time:=Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100,32+30+20+200+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-4, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Shell_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S4_M2:=s*100+ms;
        str(Time_S4_M2,strk1);

        setcolor(10);
        outtextxy(100,32+30+20+80+200+10+10,strk1+' мсек.');

{Sort-5, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Hoare_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S5_M1:=s*100+ms;


        if Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S5_M1 div 100;
        Mod_Time:=Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100+315,32+30+20+200+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-5, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Hoare_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S5_M2:=s*100+ms;
        str(Time_S5_M2,strk1);

        setcolor(10);
        outtextxy(100+315,32+30+20+80+200+10+10,strk1+' мсек.');



        inc(S_Time_S1_M1,Time_S1_M1);
        inc(S_Time_S1_M2,Time_S1_M2);
        inc(S_Time_S2_M1,Time_S2_M1);
        inc(S_Time_S2_M2,Time_S2_M2);
        inc(S_Time_S3_M1,Time_S3_M1);
        inc(S_Time_S3_M2,Time_S3_M2);
        inc(S_Time_S4_M1,Time_S4_M1);
        inc(S_Time_S4_M2,Time_S4_M2);
        inc(S_Time_S5_M1,Time_S5_M1);
        inc(S_Time_S5_M2,Time_S5_M2);



        S_Time_S1_M1:=S_Time_S1_M1 div 3;
        S_Time_S1_M2:=S_Time_S1_M2 div 3;
        S_Time_S2_M1:=S_Time_S2_M1 div 3;
        S_Time_S2_M2:=S_Time_S2_M2 div 3;
        S_Time_S3_M1:=S_Time_S3_M1 div 3;
        S_Time_S3_M2:=S_Time_S3_M2 div 3;
        S_Time_S4_M1:=S_Time_S4_M1 div 3;
        S_Time_S4_M2:=S_Time_S4_M2 div 3;
        S_Time_S5_M1:=S_Time_S5_M1 div 3;
        S_Time_S5_M2:=S_Time_S5_M2 div 3;


        S_Time_S1_M1_UnSort:=S_Time_S1_M1;
        S_Time_S1_M2_UnSort:=S_Time_S1_M2;
        S_Time_S2_M1_UnSort:=S_Time_S2_M1;
        S_Time_S2_M2_UnSort:=S_Time_S2_M2;
        S_Time_S3_M1_UnSort:=S_Time_S3_M1;
        S_Time_S3_M2_UnSort:=S_Time_S3_M2;
        S_Time_S4_M1_UnSort:=S_Time_S4_M1;
        S_Time_S4_M2_UnSort:=S_Time_S4_M2;
        S_Time_S5_M1_UnSort:=S_Time_S5_M1;
        S_Time_S5_M2_UnSort:=S_Time_S5_M2;


        setcolor(8);


        if S_Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S1_M1 div 100;
        Mod_Time:=S_Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80,32+30+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S2_M1 div 100;
        Mod_Time:=S_Time_S2_M1 mod 100;


        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80+210,32+30+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S3_M1 div 100;
        Mod_Time:=S_Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80+210+210,32+30+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S4_M1 div 100;
        Mod_Time:=S_Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80,32+30+200+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S5_M1 div 100;
        Mod_Time:=S_Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80+315,32+30+200+60,strk1_1+','+strk1_2+' мсек.');





        str(S_Time_S1_M2,strk2);
        str(S_Time_S2_M2,strk4);
        str(S_Time_S3_M2,strk6);
        str(S_Time_S4_M2,strk8);
        str(S_Time_S5_M2,strk10);



        OutTextXY(20+80,32+30+60+80,strk2+' мсек.');
        OutTextXY(20+80+210,32+30+60+80,strk4+' мсек.');
        OutTextXY(20+80+210+210,32+30+60+80,strk6+' мсек.');
        OutTextXY(20+80,32+30+200+60+80,strk8+' мсек.');
        OutTextXY(20+80+315,32+30+200+60+80,strk10+' мсек.');



   end;



   procedure Grafiki_Un_Sort;
   const Min_Draw=160;
         Max_Draw=540;
         Y1=110;
         Y2=130;
         Y3=150;
         Y4=170;
         Y5=190;
         Y6=290;
         Y7=310;
         Y8=330;
         Y9=350;
         Y10=370;


   procedure Polosa(y,Dlina:word);
   begin
        setcolor(9);
        line(Min_Draw,y,Min_Draw+Dlina,y);
        setcolor(9);
        line(Min_Draw,y+1,Min_Draw+Dlina,y+1);
        setcolor(8);
        line(Min_Draw,y+2,Min_Draw+Dlina,y+2);
        setcolor(8);
        line(Min_Draw,y+3,Min_Draw+Dlina,y+3);
        setcolor(7);
        line(Min_Draw,y+4,Min_Draw+Dlina,y+4);
        setcolor(7);
        line(Min_Draw,y+5,Min_Draw+Dlina,y+5);
        setcolor(8);
        line(Min_Draw,y+6,Min_Draw+Dlina,y+6);
        setcolor(8);
        line(Min_Draw,y+7,Min_Draw+Dlina,y+7);
        setcolor(8);
        line(Min_Draw,y+8,Min_Draw+Dlina,y+8);
        setcolor(9);
        line(Min_Draw,y+9,Min_Draw+Dlina,y+9);
        setcolor(9);
        line(Min_Draw,y+10,Min_Draw+Dlina,y+10);

        setcolor(9);
        line(Min_Draw,y,Min_Draw,y+10);
        line(Min_Draw+Dlina,y,Min_Draw+Dlina,y+10);

   end;


   begin
        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);


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
        line(557,435,557,475);

        risovanie_key(570-3,445,625+4,465,10,'Возврат');


        Init_mouse;



        Setcolor(15);
        OutTextXY(10,10,'                    Графики времени выполнения сортировок');

        Setcolor(0);
        OutTextXY(20,450,'Для продолжения работы нажмите клавишу ''Возврат''');




        Ramka_1(10,56,630,214);

        Ramka_2(14,60,626,80);
        Setcolor(9);
        OutTextXY(250,65,'Размер массива - 10 чисел');

        Ramka_2(20,106,150,124);
        Ramka_2(20,126,150,144);
        Ramka_2(20,146,150,164);
        Ramka_2(20,166,150,184);
        Ramka_2(20,186,150,204);

        Setcolor(10);
        OutTextXY(26,111,'Метод пузырька');
        OutTextXY(26,131,'Простой выбор');
        OutTextXY(26,151,'Простые вставки');
        OutTextXY(26,171,'Метод Шелла');
        OutTextXY(26,191,'Метод Хоара');


        Setcolor(0);
        Line(154,84,154,208);
        Setcolor(15);
        Line(16,101,624,101);
        Line(155,84,155,208);
        Setcolor(0);
        Line(16,100,624,100);

        Setcolor(15);
        OutTextXY(60,86,'Метод');
        Setcolor(0);
        OutTextXY(61,87,'Метод');

        Setcolor(15);
        OutTextXY(320,86,'Время выполнения');
        Setcolor(0);
        OutTextXY(321,87,'Время выполнения');



        Ramka_1(10,56+180,630,214+180);

        Ramka_2(14,60+180,626,80+180);
        Setcolor(9);
        OutTextXY(250,65+180,'Размер массива - 1000 чисел');

        Ramka_2(20,106+180,150,124+180);
        Ramka_2(20,126+180,150,144+180);
        Ramka_2(20,146+180,150,164+180);
        Ramka_2(20,166+180,150,184+180);
        Ramka_2(20,186+180,150,204+180);

        Setcolor(10);
        OutTextXY(26,111+180,'Метод пузырька');
        OutTextXY(26,131+180,'Простой выбор');
        OutTextXY(26,151+180,'Простые вставки');
        OutTextXY(26,171+180,'Метод Шелла');
        OutTextXY(26,191+180,'Метод Хоара');

        Setcolor(0);
        Line(154,84+180,154,208+180);
        Setcolor(15);
        Line(16,101+180,624,101+180);
        Line(155,84+180,155,208+180);
        Setcolor(0);
        Line(16,100+180,624,100+180);

        Setcolor(15);
        OutTextXY(60,86+180,'Метод');
        Setcolor(0);
        OutTextXY(61,87+180,'Метод');

        Setcolor(15);
        OutTextXY(320,86+180,'Время выполнения');
        Setcolor(0);
        OutTextXY(321,87+180,'Время выполнения');

        { Начинаем рисовать    -  Min_Draw }
        { Заканчиваем рисовать -  Max_Draw }








        Polosa(Y1,S_Time_S1_M1);
        Polosa(Y2,S_Time_S2_M1);
        Polosa(Y3,S_Time_S3_M1);
        Polosa(Y4,S_Time_S4_M1);
        Polosa(Y5,S_Time_S5_M1);
        Polosa(Y6,S_Time_S1_M2 div 10);
        Polosa(Y7,S_Time_S2_M2 div 10);
        Polosa(Y8,S_Time_S3_M2 div 10);
        Polosa(Y9,S_Time_S4_M2 div 10);
        Polosa(Y10,S_Time_S5_M2 div 10);

        Setcolor(9);


        if S_Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S1_M1 div 100;
        Mod_Time:=S_Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S1_M1+10,Y1+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S2_M1 div 100;
        Mod_Time:=S_Time_S2_M1 mod 100;


        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S2_M1+10,Y2+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S3_M1 div 100;
        Mod_Time:=S_Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S3_M1+10,Y3+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S4_M1 div 100;
        Mod_Time:=S_Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S4_M1+10,Y4+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S5_M1 div 100;
        Mod_Time:=S_Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S5_M1+10,Y5+1,strk1_1+','+strk1_2+' мсек.');






        str(S_Time_S1_M2,strk2);
        str(S_Time_S2_M2,strk4);
        str(S_Time_S3_M2,strk6);
        str(S_Time_S4_M2,strk8);
        str(S_Time_S5_M2,strk10);

        OutTextXY((Min_Draw+S_Time_S1_M2 div 10)+10,Y6+1,strk2+' мсек.');
        OutTextXY((Min_Draw+S_Time_S2_M2 div 10)+10,Y7+1,strk4+' мсек.');
        OutTextXY((Min_Draw+S_Time_S3_M2 div 10)+10,Y8+1,strk6+' мсек.');
        OutTextXY((Min_Draw+S_Time_S4_M2 div 10)+10,Y9+1,strk8+' мсек.');
        OutTextXY((Min_Draw+S_Time_S5_M2 div 10)+10,Y10+1,strk10+' мсек.');




        Show_Mouse;


   end;






  begin

        Run_Rocedure:

        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);
        Init_mouse;

        ramka_fon;
        Setcolor(15);
        OutTextXY(10,10,'                        Массив упорядочен по убыванию');

        M_T;

        setcolor(8);
        OutTextXY(20,32+30+60,'Среднее:');
        OutTextXY(20+210,32+30+60,'Среднее:');
        OutTextXY(20+210+210,32+30+60,'Среднее:');
        OutTextXY(20,32+30+200+60,'Среднее:');
        OutTextXY(20+315,32+30+200+60,'Среднее:');
        setcolor(8);
        OutTextXY(20,32+30+60+80,'Среднее:');
        OutTextXY(20+210,32+30+60+80,'Среднее:');
        OutTextXY(20+210+210,32+30+60+80,'Среднее:');
        OutTextXY(20,32+30+200+60+80,'Среднее:');
        OutTextXY(20+315,32+30+200+60+80,'Среднее:');



        Clear_Sort:=true;
        Graf_On:=false;


        repeat
              vedenie_kursora(10);
              vedenie_kursora(47);
              if Clear_Sort
                 then
                     vedenie_kursora(48);
              if (not Clear_Sort)
                 then
                     vedenie_kursora(49);
              if Graf_On
                 then
                     vedenie_kursora(46);




              if keypress(47,3)
                 then
                     begin
                          Hide_Mouse;
                          Temnenie_Monitora(0);
                          cleardevice;
                          Izmenenie_Palitri(2);
                          Init_mouse;

                          Pcx_Photo('.\DS_data\img\ds_tuns.pcx',0,0);

                          show_mouse;
                          risovanie_key_for_palitra(570-3,445,625+4,465,10,'Возврат');

                          repeat
                                vedenie_kursora_for_palitra(10);
                          until keypress_for_palitra(10,3);

                          Hide_Mouse;
                          Temnenie_Monitora(0);
                          cleardevice;
                          Izmenenie_Palitri(1);
                          goto Run_Rocedure;

                     end;

              if (Clear_Sort) and (keypress(48,3))
                 then
                     begin
                          Hide_Mouse;

                          pcx_photo('.\DS_data\img\ds_wait.pcx',500,380);


                          Times_Un_Sort;

                          setfillstyle(1,14);
                          bar(490,380,620,412);


                          Show_Mouse;

                          Clear_Sort:=false;
                          Graf_On:=True;
                     end;

              if (Graf_On) and (keypress(46,3))
                 then
                     begin
                          Grafiki_Un_Sort;

                          Show_Mouse;

                          repeat
                                vedenie_kursora(10);
                          until keypress(10,3);

                          Graf_On:=false;

                          Hide_Mouse;
                          Temnenie_Monitora(0);
                          cleardevice;
                          Izmenenie_Palitri(1);
                          goto Run_Rocedure;
                     end;

              if (not Clear_Sort) and (keypress(49,3))
                 then
                     begin
                          goto Run_Rocedure;
                     end;




        until keypress(10,3);

        exit;

   end;














  procedure M_Random;
  label Run_Rocedure;

  var S_Time_S1_M1,
    S_Time_S1_M2,
    S_Time_S2_M1,
    S_Time_S2_M2,
    S_Time_S3_M1,
    S_Time_S3_M2,
    S_Time_S4_M1,
    S_Time_S4_M2,
    S_Time_S5_M1,
    S_Time_S5_M2:word;

    Mod_Time,Div_Time:byte;
    strk1,strk2,strk3,strk4,strk5,strk6,strk7,strk8,strk9,strk10:string[6];
    strk1_1,strk1_2:string[3];
    tmp_strk:string[3];

    Clear_Sort:boolean;
    Graf_On:boolean;




procedure Times_Random;

   procedure Buble_Sorting(Massiv:array of word;NN:word);
   var i,j:word;
       x:word;
       begin
            for i:=2 to NN do
                for j:=NN downto i do
                    if Massiv[j-1] > Massiv[j]
                       then
                           begin
                                x:=Massiv[j-1];
                                Massiv[j-1]:=Massiv[j];
                                Massiv[j]:=x;
                           end;
       end;

   procedure Selection_Sorting(Massiv:array of word;NN:word);
   var i,j,k:word;
       x:word;
       begin
            for i:=1 to NN-1 do
            begin
                 k:=i;
                 x:=Massiv[i];
                 for j:=i+1 to NN do
                     if Massiv[j]<x
                        then
                            begin
                                 x:=Massiv[j];
                                 k:=j;
                            end;
                 Massiv[k]:=Massiv[i];
                 Massiv[i]:=x;

            end;
       end;

   procedure Insertion_Sorting(Massiv:array of word;NN:word);
   var i,j,k:word;
       b:word;
       begin
            for i:=2 to NN do
                begin
                     b:=Massiv[i];
                     j:=1;
                     while (b>Massiv[j]) do
                           j:=j+1;
                     for k:=i-1 downto j do
                         Massiv[k+1]:=Massiv[k];
                         Massiv[j]:=b;
                end;
       end;

   procedure Shell_Sorting(Massiv:array of word;NN:word);
   var Jump:word;
       i,j:word;
       Temp:word;
       End_Sort:boolean;
       begin
            Jump:=NN;
            while Jump>1 do
                  begin
                       Jump:=Jump div 2;
                       repeat
                             End_Sort:=true;
                             for i:=1 to (NN-Jump) do
                                 begin
                                      j:=i+Jump;
                                      if Massiv[i]>Massiv[j]
                                         then
                                             begin
                                                  Temp:=Massiv[i];
                                                  Massiv[i]:=Massiv[j];
                                                  Massiv[j]:=Temp;
                                                  End_Sort:=False;
                                             end;
                                 end;
                       until End_Sort;
                  end;
       end;

   Procedure Hoare_Sorting(Massiv:array of word;NN:word);
   var i,j,L,R:word;
       x,w:word;
       s:word;
       stack:array [1..1000] of record L,R:word end;
   begin
        s:=1;
        stack[1].L:=1;
        stack[s].R:=NN;

        repeat (* выбор из стека последнего запроса *)
               L:=stack[s].L;
               R:=stack[s].R;
               s:=s-1;
               repeat (* разделение Sort_Massiv[L] ...Sort_Massiv[R] *)
                      i:=L;
                      J:=R;
                      X:=Massiv[(L+R) div 2];
                      repeat
                            while Massiv[i] < x DO
                                  begin
                                       i:=i+1
                                  end;
                            while x < Massiv[j] DO
                                  begin
                                       j:=j-1
                                  end;
                            If i<=j
                               then
                                   begin
                                        w:=Massiv[i];
                                        Massiv[i]:=Massiv[j];
                                        Massiv[j]:=w;
                                        i:=i+1;
                                        j:=j-1
                                   end
                      until i>j;
                      If i < R
                         then (* запись в стек запроса из правой части *)
                              begin
                                   s:=s+1;
                                   stack[s].L:=i;
                                   stack[s].R:=R
                              end;
                      R:=j; (* теперь L и R ограничивают левую часть *)
               until L>=R
        until s=0
   end;



{   procedure Hoare_Sorting(l,r:word;Massiv:array of word);
   var b,tmp:word;
       i,j:word;
       begin
            i:=l;
            j:=r;
            b:=Massiv[(l+r) div 2];
            while i<=j do
                  begin
                       while Massiv[i]<b do
                             inc(i);
                       while Massiv[j]>b do
                             dec(j);
                       if i<=j
                          then
                              begin
                                   tmp:=Massiv[i];
                                   Massiv[i]:=Massiv[j];
                                   Massiv[j]:=tmp;

                                   inc(i);
                                   dec(j);
                              end;
                       if l<j
                          then
                              Hoare_Sorting(l,j,Massiv);
                       if i<r
                          then
                              Hoare_Sorting(i,r,Massiv);
                  end;
       end;
}

   const Z1=10;
         Z2=1000;
         Circle_1_1=10;
         Circle_1_2=10000;
         Circle_2=100;
   var M1:array[0..Z1] of word;
       M2:array[0..Z2] of word;
       i,q:word;
       h,min,s,ms:word;

       Time_S1_M1,
       Time_S1_M2,
       Time_S2_M1,
       Time_S2_M2,
       Time_S3_M1,
       Time_S3_M2,
       Time_S4_M1,
       Time_S4_M2,
       Time_S5_M1,
       Time_S5_M2:word;



   begin

        s:=0;
        ms:=0;
        h:=0;
        min:=0;
        s:=0;
        ms:=0;

        Time_S1_M1:=0;
        Time_S1_M2:=0;
        Time_S2_M1:=0;
        Time_S2_M2:=0;
        Time_S3_M1:=0;
        Time_S3_M2:=0;
        Time_S4_M1:=0;
        Time_S4_M2:=0;
        Time_S5_M1:=0;
        Time_S5_M2:=0;


        S_Time_S1_M1:=0;
        S_Time_S1_M2:=0;
        S_Time_S2_M1:=0;
        S_Time_S2_M2:=0;
        S_Time_S3_M1:=0;
        S_Time_S3_M2:=0;
        S_Time_S4_M1:=0;
        S_Time_S4_M2:=0;
        S_Time_S5_M1:=0;
        S_Time_S5_M2:=0;

        Mod_Time:=0;
        Div_Time:=0;

        for i:=1 to Z1 do
            begin
                 M1[i]:=Random(65355);
            end;
        for i:=1 to Z1 do
            begin
                 M2[i]:=M1[i];
            end;
        for i:=Z1+1 to Z2 do
            begin
                 M2[i]:=Random(65355);
            end;


{Sort-1, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Buble_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S1_M1:=s*100+ms;


        if Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S1_M1 div 100;
        Mod_Time:=Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100,32+30+20,strk1_1+','+strk1_2+' мсек.');


{Sort-1, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Buble_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S1_M2:=s*100+ms;
        str(Time_S1_M2,strk1);

        setcolor(13);
        outtextxy(100,32+30+20+80,strk1+' мсек.');


{Sort-2, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Selection_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S2_M1:=s*100+ms;

        if Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S2_M1 div 100;
        Mod_Time:=Time_S2_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100+210,32+30+20,strk1_1+','+strk1_2+' мсек.');


{Sort-2, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Selection_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S2_M2:=s*100+ms;
        str(Time_S2_M2,strk1);

        setcolor(13);
        outtextxy(100+210,32+30+20+80,strk1+' мсек.');


{Sort-3, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Insertion_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S3_M1:=s*100+ms;


        if Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S3_M1 div 100;
        Mod_Time:=Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100+210+210,32+30+20,strk1_1+','+strk1_2+' мсек.');


{Sort-3, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Insertion_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S3_M2:=s*100+ms;
        str(Time_S3_M2,strk1);

        setcolor(13);
        outtextxy(100+210+210,32+30+20+80,strk1+' мсек.');


{Sort-4, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Shell_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S4_M1:=s*100+ms;


        if Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S4_M1 div 100;
        Mod_Time:=Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(13);
        outtextxy(100,32+30+20+200,strk1_1+','+strk1_2+' мсек.');


{Sort-4, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Shell_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S4_M2:=s*100+ms;
        str(Time_S4_M2,strk1);

        setcolor(13);
        outtextxy(100,32+30+20+80+200,strk1+' мсек.');

{Sort-5, Mas-1, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Hoare_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S5_M1:=s*100+ms;

        if Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S5_M1 div 100;
        Mod_Time:=Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        str(s,strk1);
        str(ms,strk2);
        setcolor(13);
        outtextxy(100+315,32+30+20+200,strk1_1+','+strk1_2+' мсек.');


{Sort-5, Mas-2, Proh-1}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Hoare_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S5_M2:=s*100+ms;
        str(Time_S5_M2,strk1);

        setcolor(13);
        outtextxy(100+315,32+30+20+80+200,strk1+' мсек.');


        inc(S_Time_S1_M1,Time_S1_M1);
        inc(S_Time_S1_M2,Time_S1_M2);
        inc(S_Time_S2_M1,Time_S2_M1);
        inc(S_Time_S2_M2,Time_S2_M2);
        inc(S_Time_S3_M1,Time_S3_M1);
        inc(S_Time_S3_M2,Time_S3_M2);
        inc(S_Time_S4_M1,Time_S4_M1);
        inc(S_Time_S4_M2,Time_S4_M2);
        inc(S_Time_S5_M1,Time_S5_M1);
        inc(S_Time_S5_M2,Time_S5_M2);



        for i:=1 to Z1 do
            begin
                 M1[i]:=Random(65355);
            end;
        for i:=1 to Z1 do
            begin
                 M2[i]:=M1[i];
            end;
        for i:=Z1+1 to Z2 do
            begin
                 M2[i]:=Random(65355);
            end;


{Sort-1, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Buble_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S1_M1:=s*100+ms;

        if Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S1_M1 div 100;
        Mod_Time:=Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100,32+30+20+10,strk1_1+','+strk1_2+' мсек.');


{Sort-1, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Buble_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S1_M2:=s*100+ms;
        str(Time_S1_M2,strk1);

        setcolor(12);
        outtextxy(100,32+30+20+80+10,strk1+' мсек.');


{Sort-2, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Selection_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S2_M1:=s*100+ms;


        if Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S2_M1 div 100;
        Mod_Time:=Time_S2_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100+210,32+30+20+10,strk1_1+','+strk1_2+' мсек.');


{Sort-2, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Selection_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S2_M2:=s*100+ms;
        str(Time_S2_M2,strk1);

        setcolor(12);
        outtextxy(100+210,32+30+20+80+10,strk1+' мсек.');


{Sort-3, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Insertion_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S3_M1:=s*100+ms;


        if Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S3_M1 div 100;
        Mod_Time:=Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100+210+210,32+30+20+10,strk1_1+','+strk1_2+' мсек.');


{Sort-3, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Insertion_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S3_M2:=s*100+ms;
        str(Time_S3_M2,strk1);

        setcolor(12);
        outtextxy(100+210+210,32+30+20+80+10,strk1+' мсек.');


{Sort-4, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Shell_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S4_M1:=s*100+ms;


        if Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S4_M1 div 100;
        Mod_Time:=Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100,32+30+20+200+10,strk1_1+','+strk1_2+' мсек.');


{Sort-4, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Shell_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S4_M2:=s*100+ms;
        str(Time_S4_M2,strk1);

        setcolor(12);
        outtextxy(100,32+30+20+80+200+10,strk1+' мсек.');

{Sort-5, Mas-1, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Hoare_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S5_M1:=s*100+ms;


        if Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S5_M1 div 100;
        Mod_Time:=Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(12);
        outtextxy(100+315,32+30+20+200+10,strk1_1+','+strk1_2+' мсек.');


{Sort-5, Mas-2, Proh-2}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Hoare_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S5_M2:=s*100+ms;
        str(Time_S5_M2,strk1);

        setcolor(12);
        outtextxy(100+315,32+30+20+80+200+10,strk1+' мсек.');




        inc(S_Time_S1_M1,Time_S1_M1);
        inc(S_Time_S1_M2,Time_S1_M2);
        inc(S_Time_S2_M1,Time_S2_M1);
        inc(S_Time_S2_M2,Time_S2_M2);
        inc(S_Time_S3_M1,Time_S3_M1);
        inc(S_Time_S3_M2,Time_S3_M2);
        inc(S_Time_S4_M1,Time_S4_M1);
        inc(S_Time_S4_M2,Time_S4_M2);
        inc(S_Time_S5_M1,Time_S5_M1);
        inc(S_Time_S5_M2,Time_S5_M2);




        for i:=1 to Z1 do
            begin
                 M1[i]:=Random(65355);
            end;
        for i:=1 to Z1 do
            begin
                 M2[i]:=M1[i];
            end;
        for i:=Z1+1 to Z2 do
            begin
                 M2[i]:=Random(65355);
            end;


{Sort-1, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Buble_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S1_M1:=s*100+ms;


        if Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S1_M1 div 100;
        Mod_Time:=Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100,32+30+20+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-1, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Buble_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S1_M2:=s*100+ms;
        str(Time_S1_M2,strk1);

        setcolor(10);
        outtextxy(100,32+30+20+80+10+10,strk1+' мсек.');


{Sort-2, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Selection_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S2_M1:=s*100+ms;


        if Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S2_M1 div 100;
        Mod_Time:=Time_S2_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100+210,32+30+20+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-2, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Selection_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S2_M2:=s*100+ms;
        str(Time_S2_M2,strk1);

        setcolor(10);
        outtextxy(100+210,32+30+20+80+10+10,strk1+' мсек.');


{Sort-3, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Insertion_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S3_M1:=s*100+ms;


        if Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S3_M1 div 100;
        Mod_Time:=Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100+210+210,32+30+20+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-3, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Insertion_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S3_M2:=s*100+ms;
        str(Time_S3_M2,strk1);

        setcolor(10);
        outtextxy(100+210+210,32+30+20+80+10+10,strk1+' мсек.');


{Sort-4, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Shell_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S4_M1:=s*100+ms;


        if Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S4_M1 div 100;
        Mod_Time:=Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100,32+30+20+200+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-4, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Shell_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S4_M2:=s*100+ms;
        str(Time_S4_M2,strk1);

        setcolor(10);
        outtextxy(100,32+30+20+80+200+10+10,strk1+' мсек.');

{Sort-5, Mas-1, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_1_1 do
            for q:=1 to Circle_1_2 do
                Hoare_Sorting(M1,Z1);

        gettime(h,min,s,ms);
        Time_S5_M1:=s*100+ms;


        if Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=Time_S5_M1 div 100;
        Mod_Time:=Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;


        setcolor(10);
        outtextxy(100+315,32+30+20+200+10+10,strk1_1+','+strk1_2+' мсек.');


{Sort-5, Mas-2, Proh-3}
        settime(0,0,0,0);

        for i:=1 to Circle_2 do
            Hoare_Sorting(M2,Z2);

        gettime(h,min,s,ms);
        Time_S5_M2:=s*100+ms;
        str(Time_S5_M2,strk1);

        setcolor(10);
        outtextxy(100+315,32+30+20+80+200+10+10,strk1+' мсек.');



        inc(S_Time_S1_M1,Time_S1_M1);
        inc(S_Time_S1_M2,Time_S1_M2);
        inc(S_Time_S2_M1,Time_S2_M1);
        inc(S_Time_S2_M2,Time_S2_M2);
        inc(S_Time_S3_M1,Time_S3_M1);
        inc(S_Time_S3_M2,Time_S3_M2);
        inc(S_Time_S4_M1,Time_S4_M1);
        inc(S_Time_S4_M2,Time_S4_M2);
        inc(S_Time_S5_M1,Time_S5_M1);
        inc(S_Time_S5_M2,Time_S5_M2);



        S_Time_S1_M1:=S_Time_S1_M1 div 3;
        S_Time_S1_M2:=S_Time_S1_M2 div 3;
        S_Time_S2_M1:=S_Time_S2_M1 div 3;
        S_Time_S2_M2:=S_Time_S2_M2 div 3;
        S_Time_S3_M1:=S_Time_S3_M1 div 3;
        S_Time_S3_M2:=S_Time_S3_M2 div 3;
        S_Time_S4_M1:=S_Time_S4_M1 div 3;
        S_Time_S4_M2:=S_Time_S4_M2 div 3;
        S_Time_S5_M1:=S_Time_S5_M1 div 3;
        S_Time_S5_M2:=S_Time_S5_M2 div 3;


        S_Time_S1_M1_Rnd:=S_Time_S1_M1;
        S_Time_S1_M2_Rnd:=S_Time_S1_M2;
        S_Time_S2_M1_Rnd:=S_Time_S2_M1;
        S_Time_S2_M2_Rnd:=S_Time_S2_M2;
        S_Time_S3_M1_Rnd:=S_Time_S3_M1;
        S_Time_S3_M2_Rnd:=S_Time_S3_M2;
        S_Time_S4_M1_Rnd:=S_Time_S4_M1;
        S_Time_S4_M2_Rnd:=S_Time_S4_M2;
        S_Time_S5_M1_Rnd:=S_Time_S5_M1;
        S_Time_S5_M2_Rnd:=S_Time_S5_M2;





        setcolor(15);


        if S_Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S1_M1 div 100;
        Mod_Time:=S_Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80,32+30+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S2_M1 div 100;
        Mod_Time:=S_Time_S2_M1 mod 100;


        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80+210,32+30+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S3_M1 div 100;
        Mod_Time:=S_Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80+210+210,32+30+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S4_M1 div 100;
        Mod_Time:=S_Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80,32+30+200+60,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S5_M1 div 100;
        Mod_Time:=S_Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(20+80+315,32+30+200+60,strk1_1+','+strk1_2+' мсек.');





        str(S_Time_S1_M2,strk2);
        str(S_Time_S2_M2,strk4);
        str(S_Time_S3_M2,strk6);
        str(S_Time_S4_M2,strk8);
        str(S_Time_S5_M2,strk10);



        OutTextXY(20+80,32+30+60+80,strk2+' мсек.');
        OutTextXY(20+80+210,32+30+60+80,strk4+' мсек.');
        OutTextXY(20+80+210+210,32+30+60+80,strk6+' мсек.');
        OutTextXY(20+80,32+30+200+60+80,strk8+' мсек.');
        OutTextXY(20+80+315,32+30+200+60+80,strk10+' мсек.');



   end;



   procedure Grafiki_Random;
   const Min_Draw=160;
         Max_Draw=540;
         Y1=110;
         Y2=130;
         Y3=150;
         Y4=170;
         Y5=190;
         Y6=290;
         Y7=310;
         Y8=330;
         Y9=350;
         Y10=370;


   procedure Polosa(y,Dlina:word);
   begin
        setcolor(10);
        line(Min_Draw,y,Min_Draw+Dlina,y);
        setcolor(11);
        line(Min_Draw,y+1,Min_Draw+Dlina,y+1);
        setcolor(12);
        line(Min_Draw,y+2,Min_Draw+Dlina,y+2);
        setcolor(13);
        line(Min_Draw,y+3,Min_Draw+Dlina,y+3);
        setcolor(14);
        line(Min_Draw,y+4,Min_Draw+Dlina,y+4);
        setcolor(15);
        line(Min_Draw,y+5,Min_Draw+Dlina,y+5);
        setcolor(14);
        line(Min_Draw,y+6,Min_Draw+Dlina,y+6);
        setcolor(13);
        line(Min_Draw,y+7,Min_Draw+Dlina,y+7);
        setcolor(12);
        line(Min_Draw,y+8,Min_Draw+Dlina,y+8);
        setcolor(11);
        line(Min_Draw,y+9,Min_Draw+Dlina,y+9);
        setcolor(10);
        line(Min_Draw,y+10,Min_Draw+Dlina,y+10);

        setcolor(10);
        line(Min_Draw,y,Min_Draw,y+10);
        line(Min_Draw+Dlina,y,Min_Draw+Dlina,y+10);

   end;


   begin
        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);


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
        line(557,435,557,475);

        risovanie_key(570-3,445,625+4,465,10,'Возврат');


        Init_mouse;




        Setcolor(15);
        OutTextXY(10,10,'                    Графики времени выполнения сортировок');

        Setcolor(0);
        OutTextXY(20,450,'Для продолжения работы нажмите клавишу ''Возврат''');




        Ramka_1(10,56,630,214);

        Ramka_2(14,60,626,80);
        Setcolor(9);
        OutTextXY(250,65,'Размер массива - 10 чисел');

        Ramka_2(20,106,150,124);
        Ramka_2(20,126,150,144);
        Ramka_2(20,146,150,164);
        Ramka_2(20,166,150,184);
        Ramka_2(20,186,150,204);

        Setcolor(10);
        OutTextXY(26,111,'Метод пузырька');
        OutTextXY(26,131,'Простой выбор');
        OutTextXY(26,151,'Простые вставки');
        OutTextXY(26,171,'Метод Шелла');
        OutTextXY(26,191,'Метод Хоара');


        Setcolor(0);
        Line(154,84,154,208);
        Setcolor(15);
        Line(16,101,624,101);
        Line(155,84,155,208);
        Setcolor(0);
        Line(16,100,624,100);

        Setcolor(15);
        OutTextXY(60,86,'Метод');
        Setcolor(0);
        OutTextXY(61,87,'Метод');

        Setcolor(15);
        OutTextXY(320,86,'Время выполнения');
        Setcolor(0);
        OutTextXY(321,87,'Время выполнения');



        Ramka_1(10,56+180,630,214+180);

        Ramka_2(14,60+180,626,80+180);
        Setcolor(9);
        OutTextXY(250,65+180,'Размер массива - 1000 чисел');

        Ramka_2(20,106+180,150,124+180);
        Ramka_2(20,126+180,150,144+180);
        Ramka_2(20,146+180,150,164+180);
        Ramka_2(20,166+180,150,184+180);
        Ramka_2(20,186+180,150,204+180);

        Setcolor(10);
        OutTextXY(26,111+180,'Метод пузырька');
        OutTextXY(26,131+180,'Простой выбор');
        OutTextXY(26,151+180,'Простые вставки');
        OutTextXY(26,171+180,'Метод Шелла');
        OutTextXY(26,191+180,'Метод Хоара');

        Setcolor(0);
        Line(154,84+180,154,208+180);
        Setcolor(15);
        Line(16,101+180,624,101+180);
        Line(155,84+180,155,208+180);
        Setcolor(0);
        Line(16,100+180,624,100+180);

        Setcolor(15);
        OutTextXY(60,86+180,'Метод');
        Setcolor(0);
        OutTextXY(61,87+180,'Метод');

        Setcolor(15);
        OutTextXY(320,86+180,'Время выполнения');
        Setcolor(0);
        OutTextXY(321,87+180,'Время выполнения');

        { Начинаем рисовать    -  Min_Draw }
        { Заканчиваем рисовать -  Max_Draw }








        Polosa(Y1,S_Time_S1_M1);
        Polosa(Y2,S_Time_S2_M1);
        Polosa(Y3,S_Time_S3_M1);
        Polosa(Y4,S_Time_S4_M1);
        Polosa(Y5,S_Time_S5_M1);
        Polosa(Y6,S_Time_S1_M2 div 10);
        Polosa(Y7,S_Time_S2_M2 div 10);
        Polosa(Y8,S_Time_S3_M2 div 10);
        Polosa(Y9,S_Time_S4_M2 div 10);
        Polosa(Y10,S_Time_S5_M2 div 10);


        setcolor(0);

        if S_Time_S1_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S1_M1 div 100;
        Mod_Time:=S_Time_S1_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S1_M1+10,Y1+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S2_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S2_M1 div 100;
        Mod_Time:=S_Time_S2_M1 mod 100;


        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S2_M1+10,Y2+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S3_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S3_M1 div 100;
        Mod_Time:=S_Time_S3_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S3_M1+10,Y3+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S4_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S4_M1 div 100;
        Mod_Time:=S_Time_S4_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S4_M1+10,Y4+1,strk1_1+','+strk1_2+' мсек.');


        if S_Time_S5_M1 < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S5_M1 div 100;
        Mod_Time:=S_Time_S5_M1 mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S5_M1+10,Y5+1,strk1_1+','+strk1_2+' мсек.');






        str(S_Time_S1_M2,strk2);
        str(S_Time_S2_M2,strk4);
        str(S_Time_S3_M2,strk6);
        str(S_Time_S4_M2,strk8);
        str(S_Time_S5_M2,strk10);

        OutTextXY((Min_Draw+S_Time_S1_M2 div 10)+10,Y6+1,strk2+' мсек.');
        OutTextXY((Min_Draw+S_Time_S2_M2 div 10)+10,Y7+1,strk4+' мсек.');
        OutTextXY((Min_Draw+S_Time_S3_M2 div 10)+10,Y8+1,strk6+' мсек.');
        OutTextXY((Min_Draw+S_Time_S4_M2 div 10)+10,Y9+1,strk8+' мсек.');
        OutTextXY((Min_Draw+S_Time_S5_M2 div 10)+10,Y10+1,strk10+' мсек.');




        Show_Mouse;


   end;






  begin

        Run_Rocedure:

        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);
        Init_mouse;

        ramka_fon;
        Setcolor(15);
        OutTextXY(10,10,'                      Массив заполнен случайным образом');

        M_T;

        setcolor(15);
        OutTextXY(20,32+30+60,'Среднее:');
        OutTextXY(20+210,32+30+60,'Среднее:');
        OutTextXY(20+210+210,32+30+60,'Среднее:');
        OutTextXY(20,32+30+200+60,'Среднее:');
        OutTextXY(20+315,32+30+200+60,'Среднее:');
        setcolor(15);
        OutTextXY(20,32+30+60+80,'Среднее:');
        OutTextXY(20+210,32+30+60+80,'Среднее:');
        OutTextXY(20+210+210,32+30+60+80,'Среднее:');
        OutTextXY(20,32+30+200+60+80,'Среднее:');
        OutTextXY(20+315,32+30+200+60+80,'Среднее:');

        Clear_Sort:=true;
        Graf_On:=false;


        repeat
              vedenie_kursora(10);
              vedenie_kursora(47);
              if Clear_Sort
                 then
                     vedenie_kursora(48);
              if (not Clear_Sort)
                 then
                     vedenie_kursora(49);
              if Graf_On
                 then
                     vedenie_kursora(46);




              if keypress(47,3)
                 then
                     begin
                          Hide_Mouse;
                          Temnenie_Monitora(0);
                          cleardevice;
                          Izmenenie_Palitri(2);
                          Init_mouse;

                          Pcx_Photo('.\DS_data\img\ds_trnd.pcx',0,0);

                          show_mouse;
                          risovanie_key_for_palitra(570-3,445,625+4,465,10,'Возврат');

                          repeat
                                vedenie_kursora_for_palitra(10);
                          until keypress_for_palitra(10,3);

                          Hide_Mouse;
                          Temnenie_Monitora(0);
                          cleardevice;
                          Izmenenie_Palitri(1);
                          goto Run_Rocedure;

                     end;

              if (Clear_Sort) and (keypress(48,3))
                 then
                     begin
                          Hide_Mouse;

                          pcx_photo('.\DS_data\img\ds_wait.pcx',500,380);

                          Times_Random;

                          setfillstyle(1,14);
                          bar(490,380,620,412);


                          Show_Mouse;

                          Clear_Sort:=false;
                          Graf_On:=True;
                     end;

              if (Graf_On) and (keypress(46,3))
                 then
                     begin
                          Grafiki_Random;

                          Show_Mouse;

                          repeat
                                vedenie_kursora(10);
                          until keypress(10,3);

                          Graf_On:=false;

                          Hide_Mouse;
                          Temnenie_Monitora(0);
                          cleardevice;
                          Izmenenie_Palitri(1);
                          goto Run_Rocedure;
                     end;

              if (not Clear_Sort) and (keypress(49,3))
                 then
                     begin
                          goto Run_Rocedure;
                     end;




        until keypress(10,3);

        exit;

   end;


































































  procedure M_All_Graph;
  label Run_Rocedure;

  var Mod_Time,Div_Time:byte;
      strk1,strk2,strk3,strk4,strk5,strk6,strk7,strk8,strk9,strk10:string[6];
      strk1_1,strk1_2:string[3];
      tmp_strk:string[3];



















   procedure Grafiki_All_Graph;
   const Min_Draw=170;
         Max_Draw=540;
         Y1=61;
         Y2=70;
         Y3=79;
         Y4=93;
         Y5=102;
         Y6=111;
         Y7=125;
         Y8=134;
         Y9=143;
         Y10=157;
         Y11=166;
         Y12=175;
         Y13=189;
         Y14=198;
         Y15=207;


         Y16=229;
         Y17=238;
         Y18=247;

         Y19=261;
         Y20=270;
         Y21=279;

         Y22=293;
         Y23=302;
         Y24=311;

         Y25=325;
         Y26=334;
         Y27=343;

         Y28=357;
         Y29=366;
         Y30=375;



   procedure Polosa_Sort(y,Dlina:word);
   begin
        setcolor(1);
        line(Min_Draw,y+2,Min_Draw+Dlina,y+2);
        setcolor(2);
        line(Min_Draw,y+3,Min_Draw+Dlina,y+3);
        setcolor(3);
        line(Min_Draw,y+4,Min_Draw+Dlina,y+4);
        setcolor(3);
        line(Min_Draw,y+5,Min_Draw+Dlina,y+5);
        setcolor(2);
        line(Min_Draw,y+6,Min_Draw+Dlina,y+6);
        setcolor(2);
        line(Min_Draw,y+7,Min_Draw+Dlina,y+7);
        setcolor(1);
        line(Min_Draw,y+8,Min_Draw+Dlina,y+8);

        setcolor(1);
        line(Min_Draw,y+2,Min_Draw,y+8);
        line(Min_Draw+Dlina,y+2,Min_Draw+Dlina,y+8);

   end;
   procedure Polosa_UnSort(y,Dlina:word);
   begin
        setcolor(9);
        line(Min_Draw,y+2,Min_Draw+Dlina,y+2);
        setcolor(8);
        line(Min_Draw,y+3,Min_Draw+Dlina,y+3);
        setcolor(7);
        line(Min_Draw,y+4,Min_Draw+Dlina,y+4);
        setcolor(7);
        line(Min_Draw,y+5,Min_Draw+Dlina,y+5);
        setcolor(8);
        line(Min_Draw,y+6,Min_Draw+Dlina,y+6);
        setcolor(8);
        line(Min_Draw,y+7,Min_Draw+Dlina,y+7);
        setcolor(9);
        line(Min_Draw,y+8,Min_Draw+Dlina,y+8);

        setcolor(9);
        line(Min_Draw,y+2,Min_Draw,y+8);
        line(Min_Draw+Dlina,y+2,Min_Draw+Dlina,y+8);

   end;
   procedure Polosa_Rnd(y,Dlina:word);
   begin
        setcolor(0);
        line(Min_Draw,y+2,Min_Draw+Dlina,y+2);
        setcolor(12);
        line(Min_Draw,y+3,Min_Draw+Dlina,y+3);
        setcolor(15);
        line(Min_Draw,y+4,Min_Draw+Dlina,y+4);
        setcolor(15);
        line(Min_Draw,y+5,Min_Draw+Dlina,y+5);
        setcolor(14);
        line(Min_Draw,y+6,Min_Draw+Dlina,y+6);
        setcolor(12);
        line(Min_Draw,y+7,Min_Draw+Dlina,y+7);
        setcolor(0);
        line(Min_Draw,y+8,Min_Draw+Dlina,y+8);

        setcolor(0);
        line(Min_Draw,y+2,Min_Draw,y+8);
        line(Min_Draw+Dlina,y+2,Min_Draw+Dlina,y+8);

   end;


   begin

        Hide_Mouse;

        Setcolor(0);
        OutTextXY(20,450,'Для перехода в меню нажмите клавишу ''Меню''');












        Ramka_1(10,30,630,392);


        Setcolor(12);
        Line(14,221,625,221);
        Line(14,53,625,53);
        Setcolor(15);
        Line(14,225,625,225);
        Line(14,57,625,57);




        Ramka_2(20+10,60,150+10,90);
        Ramka_2(20+10,92,150+10,122);
        Ramka_2(20+10,124,150+10,154);
        Ramka_2(20+10,156,150+10,186);
        Ramka_2(20+10,188,150+10,218);

        Ramka_2(20+10,228,150+10,258);
        Ramka_2(20+10,260,150+10,290);
        Ramka_2(20+10,292,150+10,322);
        Ramka_2(20+10,324,150+10,354);
        Ramka_2(20+10,356,150+10,386);

        Setcolor(0);
        OutTextXY(26+10,70,'Метод пузырька');
        OutTextXY(26+10,102,'Простой выбор');
        OutTextXY(26+10,134,'Простые вставки');
        OutTextXY(26+10,166,'Метод Шелла');
        OutTextXY(26+10,198,'Метод Хоара');

        OutTextXY(26+10,238,'Метод пузырька');
        OutTextXY(26+10,270,'Простой выбор');
        OutTextXY(26+10,302,'Простые вставки');
        OutTextXY(26+10,334,'Метод Шелла');
        OutTextXY(26+10,366,'Метод Хоара');




        Ramka_2(15,60,28,218);
        Ramka_2(15,60+168,28,218+168);

        Setcolor(9);
        Settextstyle(defaultfont,vertdir,1);
        OutTextXY(26,71,'массив - 10 чисел');
        OutTextXY(26,230,'массив - 1000 чисел');
        Settextstyle(defaultfont,horizdir,1);




        Setcolor(0);
        Line(154+10,35,154+10,51);
        Line(154+10,59,154+10,219);
        Line(154+10,227,154+10,386);
        Setcolor(15);
        Line(155+10,35,155+10,51);
        Line(155+10,59,155+10,219);
        Line(155+10,227,155+10,386);

        Setcolor(15);
        OutTextXY(60+10,90-50,'Метод');
        Setcolor(0);
        OutTextXY(61+10,91-50,'Метод');

        Setcolor(15);
        OutTextXY(310+10,90-50,'Время выполнения');
        Setcolor(0);
        OutTextXY(311+10,91-50,'Время выполнения');
















        Ramka_1(10,396,630,426);

        Setcolor(0);
        OutTextXY(25,407,'Массив упорядочен:');

        Setcolor(1);
        line(170+2,402,170+2,420);
        Setcolor(2);
        line(171+2,402,171+2,420);
        Setcolor(3);
        line(172+2,402,172+2,420);
        Setcolor(3);
        line(173+2,402,173+2,420);
        Setcolor(2);
        line(174+2,402,174+2,420);
        Setcolor(2);
        line(175+2,402,175+2,420);
        Setcolor(1);
        line(176+2,402,176+2,420);
        Setcolor(1);
        line(170+2,402,176+2,402);
        Setcolor(1);
        line(170+2,420,176+2,420);
        Setcolor(1);
        OutTextXY(180+2,407,'по возрастанию');

        Setcolor(9);
        line(300+2,402,300+2,420);
        Setcolor(8);
        line(301+2,402,301+2,420);
        Setcolor(7);
        line(302+2,402,302+2,420);
        Setcolor(7);
        line(303+2,402,303+2,420);
        Setcolor(8);
        line(304+2,402,304+2,420);
        Setcolor(8);
        line(305+2,402,305+2,420);
        Setcolor(9);
        line(306+2,402,306+2,420);
        Setcolor(9);
        line(300+2,402,306+2,402);
        Setcolor(9);
        line(300+2,420,306+2,420);
        Setcolor(9);
        OutTextXY(310+2,407,'по убыванию');

        Setcolor(0);
        line(400+4,402,400+4,420);
        Setcolor(12);
        line(401+4,402,401+4,420);
        Setcolor(14);
        line(402+4,402,402+4,420);
        Setcolor(15);
        line(403+4,402,403+4,420);
        Setcolor(15);
        line(404+4,402,404+4,420);
        Setcolor(14);
        line(405+4,402,405+4,420);
        Setcolor(12);
        line(406+4,402,406+4,420);
        Setcolor(0);
        line(400+4,402,406+4,402);
        Setcolor(0);
        line(400+4,420,406+4,420);
        Setcolor(0);
        OutTextXY(410+4,407,'заполнен случайным образом');





        Polosa_Sort(Y1,S_Time_S1_M1_Sort);
        Polosa_Sort(Y4,S_Time_S2_M1_Sort);
        Polosa_Sort(Y7,S_Time_S3_M1_Sort);
        Polosa_Sort(Y10,S_Time_S4_M1_Sort);
        Polosa_Sort(Y13,S_Time_S5_M1_Sort);
        Polosa_Sort(Y16,S_Time_S1_M2_Sort div 10);
        Polosa_Sort(Y19,S_Time_S2_M2_Sort div 10);
        Polosa_Sort(Y22,S_Time_S3_M2_Sort div 10);
        Polosa_Sort(Y25,S_Time_S4_M2_Sort div 10);
        Polosa_Sort(Y28,S_Time_S5_M2_Sort div 10);

        Polosa_UnSort(Y2,S_Time_S1_M1_UnSort);
        Polosa_UnSort(Y5,S_Time_S2_M1_UnSort);
        Polosa_UnSort(Y8,S_Time_S3_M1_UnSort);
        Polosa_UnSort(Y11,S_Time_S4_M1_UnSort);
        Polosa_UnSort(Y14,S_Time_S5_M1_UnSort);
        Polosa_UnSort(Y17,S_Time_S1_M2_UnSort div 10);
        Polosa_UnSort(Y20,S_Time_S2_M2_UnSort div 10);
        Polosa_UnSort(Y23,S_Time_S3_M2_UnSort div 10);
        Polosa_UnSort(Y26,S_Time_S4_M2_UnSort div 10);
        Polosa_UnSort(Y29,S_Time_S5_M2_UnSort div 10);

        Polosa_Rnd(Y3,S_Time_S1_M1_Rnd);
        Polosa_Rnd(Y6,S_Time_S2_M1_Rnd);
        Polosa_Rnd(Y9,S_Time_S3_M1_Rnd);
        Polosa_Rnd(Y12,S_Time_S4_M1_Rnd);
        Polosa_Rnd(Y15,S_Time_S5_M1_Rnd);
        Polosa_Rnd(Y18,S_Time_S1_M2_Rnd div 10);
        Polosa_Rnd(Y21,S_Time_S2_M2_Rnd div 10);
        Polosa_Rnd(Y24,S_Time_S3_M2_Rnd div 10);
        Polosa_Rnd(Y27,S_Time_S4_M2_Rnd div 10);
        Polosa_Rnd(Y30,S_Time_S5_M2_Rnd div 10);


        setcolor(1);

        if S_Time_S1_M1_Sort < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S1_M1_Sort div 100;
        Mod_Time:=S_Time_S1_M1_Sort mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S1_M1_Sort+10,Y1+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S2_M1_Sort < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S2_M1_Sort div 100;
        Mod_Time:=S_Time_S2_M1_Sort mod 100;


        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S2_M1_Sort+10,Y4+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S3_M1_Sort < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S3_M1_Sort div 100;
        Mod_Time:=S_Time_S3_M1_Sort mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S3_M1_Sort+10,Y7+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S4_M1_Sort < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S4_M1_Sort div 100;
        Mod_Time:=S_Time_S4_M1_Sort mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S4_M1_Sort+10,Y10+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S5_M1_Sort < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S5_M1_Sort div 100;
        Mod_Time:=S_Time_S5_M1_Sort mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S5_M1_Sort+10,Y13+1,strk1_1+','+strk1_2+' мс.');






        str(S_Time_S1_M2_Sort,strk2);
        str(S_Time_S2_M2_Sort,strk4);
        str(S_Time_S3_M2_Sort,strk6);
        str(S_Time_S4_M2_Sort,strk8);
        str(S_Time_S5_M2_Sort,strk10);

        OutTextXY((Min_Draw+S_Time_S1_M2_Sort div 10)+10,Y16+1,strk2+' мс.');
        OutTextXY((Min_Draw+S_Time_S2_M2_Sort div 10)+10,Y19+1,strk4+' мс.');
        OutTextXY((Min_Draw+S_Time_S3_M2_Sort div 10)+10,Y22+1,strk6+' мс.');
        OutTextXY((Min_Draw+S_Time_S4_M2_Sort div 10)+10,Y25+1,strk8+' мс.');
        OutTextXY((Min_Draw+S_Time_S5_M2_Sort div 10)+10,Y28+1,strk10+' мс.');




















        setcolor(9);

        if S_Time_S1_M1_UnSort < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S1_M1_UnSort div 100;
        Mod_Time:=S_Time_S1_M1_UnSort mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S1_M1_UnSort+10,Y2+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S2_M1_UnSort < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S2_M1_UnSort div 100;
        Mod_Time:=S_Time_S2_M1_UnSort mod 100;


        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S2_M1_UnSort+10,Y5+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S3_M1_UnSort < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S3_M1_UnSort div 100;
        Mod_Time:=S_Time_S3_M1_UnSort mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S3_M1_UnSort+10,Y8+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S4_M1_UnSort < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S4_M1_UnSort div 100;
        Mod_Time:=S_Time_S4_M1_UnSort mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S4_M1_UnSort+10,Y11+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S5_M1_UnSort < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S5_M1_UnSort div 100;
        Mod_Time:=S_Time_S5_M1_UnSort mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S5_M1_UnSort+10,Y14+1,strk1_1+','+strk1_2+' мс.');






        str(S_Time_S1_M2_UnSort,strk2);
        str(S_Time_S2_M2_UnSort,strk4);
        str(S_Time_S3_M2_UnSort,strk6);
        str(S_Time_S4_M2_UnSort,strk8);
        str(S_Time_S5_M2_UnSort,strk10);

        OutTextXY((Min_Draw+S_Time_S1_M2_UnSort div 10)+10,Y17+1,strk2+' мс.');
        OutTextXY((Min_Draw+S_Time_S2_M2_UnSort div 10)+10,Y20+1,strk4+' мс.');
        OutTextXY((Min_Draw+S_Time_S3_M2_UnSort div 10)+10,Y23+1,strk6+' мс.');
        OutTextXY((Min_Draw+S_Time_S4_M2_UnSort div 10)+10,Y26+1,strk8+' мс.');
        OutTextXY((Min_Draw+S_Time_S5_M2_UnSort div 10)+10,Y29+1,strk10+' мс.');











        setcolor(0);

        if S_Time_S1_M1_Rnd < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S1_M1_Rnd div 100;
        Mod_Time:=S_Time_S1_M1_Rnd mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S1_M1_Rnd+10,Y3+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S2_M1_Rnd < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S2_M1_Rnd div 100;
        Mod_Time:=S_Time_S2_M1_Rnd mod 100;


        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S2_M1_Rnd+10,Y6+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S3_M1_Rnd < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S3_M1_Rnd div 100;
        Mod_Time:=S_Time_S3_M1_Rnd mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S3_M1_Rnd+10,Y9+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S4_M1_Rnd < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S4_M1_Rnd div 100;
        Mod_Time:=S_Time_S4_M1_Rnd mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S4_M1_Rnd+10,Y12+1,strk1_1+','+strk1_2+' мс.');


        if S_Time_S5_M1_Rnd < 100
           then
               Div_Time:=0
           else
               Div_Time:=S_Time_S5_M1_Rnd div 100;
        Mod_Time:=S_Time_S5_M1_Rnd mod 100;

        str(Div_Time,strk1_1);
        str(Mod_Time,strk1_2);

        if Mod_Time < 10
           then
               begin
                    tmp_strk:='0'+strk1_2;
                    strk1_2:=tmp_strk;
               end;

        OutTextXY(Min_Draw+S_Time_S5_M1_Rnd+10,Y15+1,strk1_1+','+strk1_2+' мс.');






        str(S_Time_S1_M2_Rnd,strk2);
        str(S_Time_S2_M2_Rnd,strk4);
        str(S_Time_S3_M2_Rnd,strk6);
        str(S_Time_S4_M2_Rnd,strk8);
        str(S_Time_S5_M2_Rnd,strk10);

        OutTextXY((Min_Draw+S_Time_S1_M2_Rnd div 10)+10,Y18+1,strk2+' мс.');
        OutTextXY((Min_Draw+S_Time_S2_M2_Rnd div 10)+10,Y21+1,strk4+' мс.');
        OutTextXY((Min_Draw+S_Time_S3_M2_Rnd div 10)+10,Y24+1,strk6+' мс.');
        OutTextXY((Min_Draw+S_Time_S4_M2_Rnd div 10)+10,Y27+1,strk8+' мс.');
        OutTextXY((Min_Draw+S_Time_S5_M2_Rnd div 10)+10,Y30+1,strk10+' мс.');







        Show_Mouse;


   end;














  begin

        Run_Rocedure:

        Hide_Mouse;
        Temnenie_Monitora(0);
        cleardevice;
        Izmenenie_Palitri(1);
        Init_mouse;

        ramka_fon;
        Setcolor(15);
        OutTextXY(10,10,'                      Графическое представление времени');



        Grafiki_All_Graph;



        show_mouse;




        repeat
              vedenie_kursora(10);




        until keypress(10,3);

        exit;

   end;















































































begin
        S_Time_S1_M1_Sort:=0;
        S_Time_S1_M2_Sort:=0;
        S_Time_S2_M1_Sort:=0;
        S_Time_S2_M2_Sort:=0;
        S_Time_S3_M1_Sort:=0;
        S_Time_S3_M2_Sort:=0;
        S_Time_S4_M1_Sort:=0;
        S_Time_S4_M2_Sort:=0;
        S_Time_S5_M1_Sort:=0;
        S_Time_S5_M2_Sort:=0;

        S_Time_S1_M1_UnSort:=0;
        S_Time_S1_M2_UnSort:=0;
        S_Time_S2_M1_UnSort:=0;
        S_Time_S2_M2_UnSort:=0;
        S_Time_S3_M1_UnSort:=0;
        S_Time_S3_M2_UnSort:=0;
        S_Time_S4_M1_UnSort:=0;
        S_Time_S4_M2_UnSort:=0;
        S_Time_S5_M1_UnSort:=0;
        S_Time_S5_M2_UnSort:=0;

        S_Time_S1_M1_Rnd:=0;
        S_Time_S1_M2_Rnd:=0;
        S_Time_S2_M1_Rnd:=0;
        S_Time_S2_M2_Rnd:=0;
        S_Time_S3_M1_Rnd:=0;
        S_Time_S3_M2_Rnd:=0;
        S_Time_S4_M1_Rnd:=0;
        S_Time_S4_M2_Rnd:=0;
        S_Time_S5_M1_Rnd:=0;
        S_Time_S5_M2_Rnd:=0;

end.