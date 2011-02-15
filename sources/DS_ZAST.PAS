unit DS_zast;

interface

  procedure Zastavka;

implementation

uses DS_Efect, DS_Gif, CRT, Dos,graph;
var  TheGif: PGif;

{-----Процедура "очистки" буфера клавиатуры----------------------------------}
   procedure Ochistka_bufera_klaviaturi;
   var ch:char;
   begin
        while
             KeyPressed
        do ch:=Readkey;
   end;




  procedure Zastavka;
  begin
       TheGif := New(PGif, Init('.\DS_data\img\ds_zast.gif'));

       TheGif^.Decode(True);

       Ochistka_bufera_klaviaturi;

       repeat until keypressed;

       Temnenie_Monitora(1);

       Dispose(TheGif, Done);
  end;

end.