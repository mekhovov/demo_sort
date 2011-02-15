unit DS_Photo;
interface

   procedure PCX_Photo(pcximage:string;x,y:word);{Процедура чтения .PCX рисунка}

implementation
uses crt,graph,pcx_tp;

{---Процедура чтения .PCX рисунка-------------------------------------------}
   procedure PCX_Photo(pcximage:string;x,y:word);
   const pcxtype=pcxVGA_12;
   var retcode:integer;
       dispret:integer;
   begin
        retcode := pcxSetDisplay(pcxtype);
        retcode := pcxSetMode(pcxGRAPHICS);
        if (retcode = pcxSUCCESS)
           then
               dispret := pcxFileDisplay(pcximage,x,y,0);
        if (dispret <> pcxSUCCESS)
           then
               begin
                    if (dispret = -1)
                       then
                           begin
                                closegraph;
                                writeln('Ошибка ',pcximage,' рисунка : Файл не найден.');
                                halt;
                           end;
                    closegraph;
                    writeln('Ошибка ',pcximage,' рисунка : [',dispret,']');
                    halt;
               end;
   end;

end.