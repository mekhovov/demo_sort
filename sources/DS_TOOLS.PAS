unit DS_Tools;
interface

  Procedure NewDelay(Time:Longint);{��楤�� �६����� ����প�, �� ������饩 �� ⠪⮢�� �����}
  procedure Control_Files;{��楤�� �஢�ન ������ 䠩���}
  procedure Ochistka_Bufera_Klaviaturi;{��楤�� "���⪨" ���� ����������}
  procedure Izmenenie_Palitri(get_or_set:byte);{��������� ������� ��� ����祭�� ᯥ���(1-10) � ��⥭��� �ண�(11-15)}

implementation
uses crt,graph,dos;
{-----��楤�� �६����� ����প�, �� ������饩 �� ⠪⮢�� �����--------}
   Procedure NewDelay(Time:Longint);
   var Timer  : Longint absolute $0040:$006C;
       BegTime: Longint;
   begin
        BegTime:=Timer;
        While BegTime=Timer do;
        While Timer-BegTime<Time do;
   end;
{-----��楤�� �஢�ન ������ 䠩���------------------------------------}
   Procedure Control_Files;
   Var s:searchrec;
       file_name:string;
   Begin
        writeln('�஢�ઠ ������ 䠩���...');
        file_name := '.\DS_data\dst\ds_absor.dst';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\dst\ds_sprav.dst';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\dst\ds_sort.dst';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_zast.gif';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_end.gif';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_vopr.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_voskl.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_gerb1.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_gerb2.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_gerb3.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_gerb4.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_gerb5.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_gerb6.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_1.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_comp1.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_comp2.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_comp3.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_comp4.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_wait.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_5.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_TS.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_TUnS.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_TRnd.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_fon.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_bls_1.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_bls_2.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_bls_3.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
        file_name := '.\DS_data\img\ds_bls_4.pcx';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;

        file_name := '.\DS_data\bgi\svga256.bgi';
        findfirst(file_name,archive,s);
        if dosError=18
           then
               begin
                    writeln('File not found: ' + file_name);
                    writeln ('�ணࠬ�� �� ����� ���� �믮�����.');
                    halt;
               end;
   end;
{-----��楤�� "���⪨" ���� ����������----------------------------------}
   procedure Ochistka_bufera_klaviaturi;
   var ch:char;
   begin
        while
             KeyPressed
        do ch:=Readkey;
   end;
{-----��������� ������� ��� ����祭�� ᯥ���(1-10) � ��⥭��� �ண�(11-15)-}
   procedure izmenenie_palitri(get_or_set:byte);
   type rgbrec=record
        red,green,blue:integer;
        colornum:integer;
   end;
   const rgb:array[0..maxcolors] of rgbrec = (
         (red:0;green:0;blue:0;colornum:0),
         (red:0;green:0;blue:40;colornum:1),
         (red:0;green:40;blue:0;colornum:2),
         (red:0;green:40;blue:40;colornum:3),
         (red:40;green:7;blue:7;colornum:4),
         (red:40;green:0;blue:40;colornum:5),
         (red:40;green:30;blue:0;colornum:20),
         (red:49;green:49;blue:49;colornum:7),
         (red:26;green:26;blue:26;colornum:56),
         (red:0;green:0;blue:63;colornum:57),
         (red:9;green:63;blue:9;colornum:58),
         (red:0;green:63;blue:63;colornum:59),
         (red:63;green:10;blue:10;colornum:60),
         (red:44;green:0;blue:63;colornum:61),
         (red:63;green:63;blue:18;colornum:62),
         (red:63;green:63;blue:63;colornum:63) );
   var i:integer;
       procedure setrgb(i,redval,greenval,blueval:integer);
       begin
            with rgb[i] do
            setrgbpalette(colornum,redval,greenval,blueval);
       end;

       procedure getrgb;
       var i:byte;
       begin
            for i:=0 to 15 do
            with rgb[i] do
                 setrgbpalette(colornum,red,green,blue);

       end;
   begin
        case get_or_set of
             1:begin
                    setrgb(0,0,0,0);     { ����                  }
                    setrgb(1,35,7,7);    { ����� ����           }
                    setrgb(2,50,7,7);    { ����                 }
                    setrgb(3,63,30,9);   { �࠭����               }
                    setrgb(4,63,63,18);  { �����                  }
                    setrgb(5,20,63,10);  { ����⮢�               }
                    setrgb(6,0,63,55);   { ���⫮ ���㡮�          }
                    setrgb(7,0,38,63);   { ���㡮�                 }
                    setrgb(8,0,20,55);   { �����                   }
                    setrgb(9,20,0,40);   { ����� ᨭ��             }

                    setrgb(10,15,15,15); { �����-�����-����� ��� }
                    setrgb(11,20,20,20); { �����-����� ���       }
                    setrgb(12,26,26,26); { ����� ���             }
                    setrgb(13,35,35,35); { ����                   }
                    setrgb(14,49,49,49); { ���⫮ ���            }
                    setrgb(15,63,63,63); { ����                   }
               end;
             2:getrgb;
        end;
   end;

end.