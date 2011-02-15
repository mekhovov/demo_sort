unit DS_BC;

interface
         procedure egavga_bgi;
         procedure trip_chr;
         {procedure Svga256_driver;}
implementation
uses graph,dos;
{i svga256.inc}
{$L egavga.obj}    procedure egavga_bgi;   external;
{$L trip.obj}      procedure trip_chr;     external;
{L svga256.obj } { procedure Svga256_driver; external;}

begin
     if registerbgidriver(@egavga_bgi)<0
        then
            begin
                 writeln('Žè¨¡ª  egavga.bgi');
                 readln;
                 halt;
            end;
     {if registerbgidriver(@Svga256_driver)<0
        then
            begin
                 writeln('Žè¨¡ª  Svga256_driver');
                 readln;
                 halt;
            end;}
     if registerbgifont(@trip_chr)<0
        then
            begin
                 writeln('Žè¨¡ª  Trip.chr');
                 readln;
                 halt;
            end;
end.