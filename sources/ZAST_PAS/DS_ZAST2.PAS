program DS_Zast;
uses ds_bc,crt,graph,DS_Ginit,DS_Photo,DS_Efect;

{-----��楤�� �६����� ����প�, �� ������饩 �� ⠪⮢�� �����--------}
   Procedure NewDelay(Time:Longint);
   var Timer  : Longint absolute $0040:$006C;
       BegTime: Longint;
   begin
        BegTime:=Timer;
        While BegTime=Timer do;
        While Timer-BegTime<Time do;
   end;
{-----��楤�� "���⪨" ���� ����������----------------------------------}
   procedure Ochistka_bufera_klaviaturi;
   var ch:char;
   begin
        while
             KeyPressed
        do ch:=Readkey;
   end;



{---��楤�� �ᮢ�� �� ���⠢��--------------------------------------------}
   procedure Zastavka;
   var name,a:string;
       f1,f2:text;
       v,gd,gm,x,y:integer;
       l:char;
       pp:pointer;
       af:integer;
       q:byte;
       klav:char;
       vih:boolean;
   begin
        clrscr;
        vih:=false;
        Init_VGA_256;
        Ochistka_Bufera_Klaviaturi;
        SetGraphMode(2);
        setcolor(1);

        if keypressed
           then
               vih:=true;

        if not vih
           then
               Temnenie_Stroki(4,0,200,'��楩 ���ଠ樮���� ��孮����� ',1);

        if keypressed
           then
               vih:=true;

        if not vih
           then
               Temnenie_Stroki(4,180,200,'�।�⠢���',1);

        if keypressed
           then
               vih:=true;

        if not vih
           then
               Temnenie_Stroki(4,160,200,'���ᮢ�� ࠡ���',1);

        if keypressed
           then
               vih:=true;

        if not vih
           then
               Temnenie_Stroki(4,130,200,'�祭��� 10-� �����',1);

        if keypressed
           then
               vih:=true;

        if not vih
           then
               begin
                    settextstyle(1,0,4);
                    setcolor(255);
                    outtextxy(130,200,'��客��� ����ᠭ��');
                    setrgbpalette(1,0,0,0);
                    Shade(255,63,0,0,1);
                    stroka_lava;
               end;

        LoadBmp('DS_Zast.bmp');
        Ochistka_Bufera_Klaviaturi;

        repeat until (keypressed);

        Temnenie_Monitora(1);

        settextstyle(0,0,0);
        closegraph;
   end;

begin
    Zastavka;
end.