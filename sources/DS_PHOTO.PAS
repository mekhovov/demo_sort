unit DS_Photo;
interface

   procedure PCX_Photo(pcximage:string;x,y:word);{��楤�� �⥭�� .PCX ��㭪�}

implementation
uses crt,graph,pcx_tp;

{---��楤�� �⥭�� .PCX ��㭪�-------------------------------------------}
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
                                writeln('�訡�� ',pcximage,' ��㭪� : ���� �� ������.');
                                halt;
                           end;
                    closegraph;
                    writeln('�訡�� ',pcximage,' ��㭪� : [',dispret,']');
                    halt;
               end;
   end;

end.