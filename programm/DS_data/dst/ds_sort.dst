Program DS_Sortirovki;
Uses CRT;
Const N=10; {Размернось массива (10 чисел)}
Var Massiv:array[0..N] of Integer; {Массив, который будет заполнен случайным образом}
    Sort_Massiv:array[0..N] of Integer; {Отсортированный массив}


   procedure Vvod_Massiva(var Massiv:array of Integer);
   {Процедура заполняет массив случайным образом, числа находятся на промежутке [10..99]}
   var i:Integer;
       begin
            for i:=1 to N do
                Massiv[i]:=Random(90)+10;
       end;

   procedure Vivod_Massiva(Massiv:array of Integer);
   {Процедура выводит массив на экран}
   var i:Integer;
       begin
            TextColor(7);
            Write('  ');
            for i:=1 to N-1 do
                begin
                     Write(Massiv[i],',     ');
                     Delay(1000);
                end;
            Write(massiv[n],'.');
            WriteLn;
            TextColor(15);
       end;




   procedure Buble_Sorting(Massiv:array of Integer;var Sort_Massiv:array of Integer);
   {Процедура сортировки методом пузырька}
   var i,j:Integer;
       x:Integer;
       begin
            {Заполняем массив(Sort_Massiv), который будет отсортирован, задынным массивом (Massiv)}
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            {Сортируем массив}
            for i:=2 to N do
                for j:=N downto i do
                    if Sort_Massiv[j-1] > Sort_Massiv[j]
                       then
                           begin
                                x:=Sort_Massiv[j-1];
                                Sort_Massiv[j-1]:=Sort_Massiv[j];
                                Sort_Massiv[j]:=x;
                           end;
       end;



   procedure Selection_Sorting(Massiv:array of Integer;var Sort_Massiv:array of Integer);
   var i,j,k:Integer;
       x:Integer;
       begin
            {Заполняем массив(Sort_Massiv), который будет отсортирован, задынным массивом (Massiv)}
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            {Сортируем массив}
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



   procedure Insertion_Sorting(Massiv:array of Integer;var Sort_Massiv:array of Integer);
   var i,b,j,k:integer;
       begin
            {Заполняем массив(Sort_Massiv), который будет отсортирован, задынным массивом (Massiv)}
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            {Сортируем массив}
            for i:=2 to N do
                begin
                     b:=Sort_Massiv[i];
                     j:=1;
                     while (b>Sort_Massiv[j]) do
                           j:=j+1;
                     for k:=i-1 downto j do
                         Sort_Massiv[k+1]:=Sort_Massiv[k];
                         Sort_Massiv[j]:=b;
                end;
       end;






   procedure Shell_Sorting(Massiv:array of Integer;var Sort_Massiv:array of Integer);
   {Процедура сортировки методом Шелла}
   var Jump:Integer;
       i,j:Integer;
       Temp:Integer;
       End_Sort:boolean;
       begin
            {Заполняем массив(Sort_Massiv), который будет отсортирован, задынным массивом (Massiv)}
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            {Сортируем массив}
            Jump:=N;
            while Jump>1 do
                  begin
                       Jump:=Jump div 2;
                       repeat
                             End_Sort:=true;
                             for i:=1 to (N-Jump) do
                                 begin
                                      j:=i+Jump;
                                      if Sort_Massiv[i]>Sort_Massiv[j]
                                         then
                                             begin
                                                  Temp:=Sort_Massiv[i];
                                                  Sort_Massiv[i]:=Sort_Massiv[j];
                                                  Sort_Massiv[j]:=Temp;
                                                  End_Sort:=False;
                                             end;
                                 end;
                       until End_Sort;
                  end;
       end;

















   procedure Hoare_Sorting(l,r:Integer;Massiv:array of Integer;var Sort_Massiv:array of Integer);
   var b,tmp:integer;
       i,j:Integer;
       begin
            {Заполняем массив(Sort_Massiv), который будет отсортирован, задынным массивом (Massiv)}
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            {Сортируем массив}
            i:=l;
            j:=r;
            b:=Sort_Massiv[(l+r) div 2];
            while i<=j do
                  begin
                       while Sort_Massiv[i]<b do
                             inc(i);
                       while Sort_Massiv[j]>b do
                             dec(j);
                       if i<=j
                          then
                              begin
                                   tmp:=Sort_Massiv[i];
                                   Sort_Massiv[i]:=Sort_Massiv[j];
                                   Sort_Massiv[j]:=tmp;

                                   inc(i);
                                   dec(j);
                              end;
                       if l<j
                          then
                              Hoare_Sorting(l,j,Sort_Massiv,Sort_Massiv);
                       if i<r
                          then
                              Hoare_Sorting(i,r,Sort_Massiv,Sort_Massiv);
                  end;
       end;





begin
     ClrScr; {Очистка экрана}
     Randomize; {Выбор случайного генератора генерируемого числа}
     Vvod_Massiva(Massiv); {Вводим произвольный массив}
     TextColor(15);
     WriteLn;
     WriteLn('Массив, заполненный случайным образом:');
     Vivod_Massiva(Massiv); {Выводим произвольный массив на экран}
     WriteLn('--------------------------------------------------------------------------------');
     Delay(8500); {Задержка}


     Buble_Sorting(Massiv,Sort_Massiv); {Сортируем массив методом пузырька}
     WriteLn;
     WriteLn('Массив, после сортировки методом пузырька:');
     Vivod_Massiva(Sort_Massiv); {Выводим отсортированный массив на экран}
     Delay(8500); {Задержка}

     Selection_Sorting(Massiv,Sort_Massiv); {Сортируем массив методом простого выбора}
     WriteLn;
     WriteLn('Массив, после сортировки методом простого выбора:');
     Vivod_Massiva(Sort_Massiv); {Выводим отсортированный массив на экран}
     Delay(8500); {Задержка}

     Insertion_Sorting(Massiv,Sort_Massiv); {Сортируем массив простыми вставками}
     WriteLn;
     WriteLn('Массив, после сортировки постыми вставками:');
     Vivod_Massiva(Sort_Massiv); {Выводим отсортированный массив на экран}
     Delay(8500); {Задержка}

     Shell_Sorting(Massiv,Sort_Massiv); {Сортируем массив методом Шелла}
     WriteLn;
     WriteLn('Массив, после сортировки методом Шелла:');
     Vivod_Massiva(Sort_Massiv); {Выводим отсортированный массив на экран}
     Delay(8500); {Задержка}

     Hoare_Sorting(1,N,Massiv,Sort_Massiv); {Сортируем массив методом Хоара}
     WriteLn;
     WriteLn('Массив, после сортировки методом Хоара:');
     Vivod_Massiva(Sort_Massiv); {Выводим отсортированный массив на экран}
     Delay(13000); {Задержка}

     WriteLn;
     WriteLn;
     WriteLn;
     GotoXY(55,24);
     TextColor(15);
     WriteLn('Нажмите любую клавишу');
     ReadKey;
end.
