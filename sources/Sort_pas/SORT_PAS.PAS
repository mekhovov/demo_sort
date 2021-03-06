Program DS_Sortirovki;
Uses CRT;
Const N=10; {�����୮�� ���ᨢ� (10 �ᥫ)}
Var Massiv:array[0..N] of Integer; {���ᨢ, ����� �㤥� �������� ��砩�� ��ࠧ��}
    Sort_Massiv:array[0..N] of Integer; {�����஢���� ���ᨢ}


   procedure Vvod_Massiva(var Massiv:array of Integer);
   {��楤�� �������� ���ᨢ ��砩�� ��ࠧ��, �᫠ ��室���� �� �஬���⪥ [10..99]}
   var i:Integer;
       begin
            for i:=1 to N do
                Massiv[i]:=Random(90)+10;
       end;

   procedure Vivod_Massiva(Massiv:array of Integer);
   {��楤�� �뢮��� ���ᨢ �� ��࠭}
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
   {��楤�� ���஢�� ��⮤�� ����쪠}
   var i,j:Integer;
       x:Integer;
       begin
            {������塞 ���ᨢ(Sort_Massiv), ����� �㤥� �����஢��, ���뭭� ���ᨢ�� (Massiv)}
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            {�����㥬 ���ᨢ}
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
            {������塞 ���ᨢ(Sort_Massiv), ����� �㤥� �����஢��, ���뭭� ���ᨢ�� (Massiv)}
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            {�����㥬 ���ᨢ}
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
            {������塞 ���ᨢ(Sort_Massiv), ����� �㤥� �����஢��, ���뭭� ���ᨢ�� (Massiv)}
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            {�����㥬 ���ᨢ}
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
   {��楤�� ���஢�� ��⮤�� �����}
   var Jump:Integer;
       i,j:Integer;
       Temp:Integer;
       End_Sort:boolean;
       begin
            {������塞 ���ᨢ(Sort_Massiv), ����� �㤥� �����஢��, ���뭭� ���ᨢ�� (Massiv)}
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            {�����㥬 ���ᨢ}
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
            {������塞 ���ᨢ(Sort_Massiv), ����� �㤥� �����஢��, ���뭭� ���ᨢ�� (Massiv)}
            for i:=1 to N do
                Sort_Massiv[i]:=Massiv[i];
            {�����㥬 ���ᨢ}
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
     ClrScr; {���⪠ ��࠭�}
     Randomize; {�롮� ��砩���� ������� ������㥬��� �᫠}
     Vvod_Massiva(Massiv); {������ �ந������ ���ᨢ}
     TextColor(15);
     WriteLn;
     WriteLn('���ᨢ, ���������� ��砩�� ��ࠧ��:');
     Vivod_Massiva(Massiv); {�뢮��� �ந������ ���ᨢ �� ��࠭}
     WriteLn('--------------------------------------------------------------------------------');
     Delay(8500); {����প�}


     Buble_Sorting(Massiv,Sort_Massiv); {�����㥬 ���ᨢ ��⮤�� ����쪠}
     WriteLn;
     WriteLn('���ᨢ, ��᫥ ���஢�� ��⮤�� ����쪠:');
     Vivod_Massiva(Sort_Massiv); {�뢮��� �����஢���� ���ᨢ �� ��࠭}
     Delay(8500); {����প�}

     Selection_Sorting(Massiv,Sort_Massiv); {�����㥬 ���ᨢ ��⮤�� ���⮣� �롮�}
     WriteLn;
     WriteLn('���ᨢ, ��᫥ ���஢�� ��⮤�� ���⮣� �롮�:');
     Vivod_Massiva(Sort_Massiv); {�뢮��� �����஢���� ���ᨢ �� ��࠭}
     Delay(8500); {����প�}

     Insertion_Sorting(Massiv,Sort_Massiv); {�����㥬 ���ᨢ ����묨 ��⠢����}
     WriteLn;
     WriteLn('���ᨢ, ��᫥ ���஢�� ����묨 ��⠢����:');
     Vivod_Massiva(Sort_Massiv); {�뢮��� �����஢���� ���ᨢ �� ��࠭}
     Delay(8500); {����প�}

     Shell_Sorting(Massiv,Sort_Massiv); {�����㥬 ���ᨢ ��⮤�� �����}
     WriteLn;
     WriteLn('���ᨢ, ��᫥ ���஢�� ��⮤�� �����:');
     Vivod_Massiva(Sort_Massiv); {�뢮��� �����஢���� ���ᨢ �� ��࠭}
     Delay(8500); {����প�}

     Hoare_Sorting(1,N,Massiv,Sort_Massiv); {�����㥬 ���ᨢ ��⮤�� ����}
     WriteLn;
     WriteLn('���ᨢ, ��᫥ ���஢�� ��⮤�� ����:');
     Vivod_Massiva(Sort_Massiv); {�뢮��� �����஢���� ���ᨢ �� ��࠭}
     Delay(13000); {����প�}

     WriteLn;
     WriteLn;
     WriteLn;
     GotoXY(55,24);
     TextColor(15);
     WriteLn('������ ���� �������');
     ReadKey;
end.
