Uses graph,crt;
Const m_0=$9C;
      r_0=$90;
     path='cursor.dat';
 mask:array[0..5] of byte = ($90,$48,$20,$0C,$12,$01);
 jump:array[0..5] of word = ($406F,$20B7,$98DF,$02F3,$01ED,$1CFE);
Var
  i,j,counter,number:integer;
  flag_of_exit:boolean;
  ok:word;
  bm:integer;
  ScrMask:array[1..64] of byte;
  r,m,old_m,old_r:byte;
  f:file of byte;
  procedure Init_Graph_Mode;
  var
    Driver,
    Mode,
    ErrCode: Integer;
  begin
   Driver := Detect;
   InitGraph(Driver, Mode, '');

   ErrCode := GraphResult;
   if ErrCode <> grOk then
   begin
     Writeln('Ошибка графического режима:',
                                     GraphErrorMSG(ErrCode));
     Halt(1);
  end;
  SetTextStyle(DefaultFont, HorizDir, 1);
  SetColor(15);
  SetLineStyle(0,0,1);
  SetFillStyle(1,0)
  end;
  function Init_Mouse:word;
  begin
    asm
      push ax
      mov ax,00h
      int 33h
      mov @Result,ax
      pop ax
    end
  end;
  procedure Show_Mouse;
  begin
    asm
      push ax
      mov ax,01h
      int 33h
      pop ax
    end
  end;
  procedure Hide_Mouse;
  begin
    asm
      push ax
      mov ax,02h
      int 33h
      pop ax
    end
  end;
  procedure Set_Graph_Cursor(segm,ofst:word;x,y:integer);
  begin
    asm
      push ax
      push bx
      push cx
      push dx
      mov bx,x
      mov cx,y
      mov es,segm
      mov dx,ofst
      mov ax,09h
      int 33h
      pop dx
      pop cx
      pop bx
      pop ax
    end
  end;
  procedure Get_Mouse_State(var bt,x,y:integer);
  begin
    asm
      push ax
      push bx
      push cx
      push dx
      mov ax,03h
      int 33h
      lds di,bt
      mov [di],bx
      lds di,x
      mov [di],cx
      lds di,y
      mov [di],dx
      pop dx
      pop cx
      pop bx
      pop ax
    end
  end;
  procedure Get_Web_State;
  begin
    r := 0;
    for counter:= 0 to 5 do
      if (mask[counter] and m) = mask[counter] then
        r := r or ($80 shr counter)
  end;
  procedure Design_Kernel;
  begin
    OutTextXY(190,20,'Распределение ресурсов для');
    OutTextXY(207,27,'случая двух процессов');
    for counter := 0 to 2 do
      Circle(150,counter*150+50,15);
    for counter := 0 to 2 do
      Circle(450,counter*150+50,15);
    for counter := 0 to 1 do
      Circle(300,counter*150+120,15);
    for counter := 0 to 2 do
      begin
        Line(140,counter*150+123,160,counter*150+123);
        Line(140,counter*150+127,160,counter*150+127);
        Line(140,counter*150+123,140,counter*150+127);
        Line(160,counter*150+123,160,counter*150+127)
      end;
    for counter := 0 to 2 do
      begin
        Line(440,counter*150+123,460,counter*150+123);
        Line(440,counter*150+127,460,counter*150+127);
        Line(440,counter*150+123,440,counter*150+127);
        Line(460,counter*150+123,460,counter*150+127)
      end;
    for counter := 0 to 1 do
      begin
        Line(counter*300+150,65,counter*300+150,123);
        Line(counter*300+150,127,counter*300+150,185);
        Line(counter*300+150,215,counter*300+150,273);
        Line(counter*300+150,277,counter*300+150,335);
        Line(counter*300+150,365,counter*300+150,423);
        Line(counter*300+150,123,counter*300+148,114);
        Line(counter*300+150,123,counter*300+152,114);
        Line(counter*300+150,185,counter*300+148,176);
        Line(counter*300+150,185,counter*300+152,176);
        Line(counter*300+150,273,counter*300+148,264);
        Line(counter*300+150,273,counter*300+152,264);
        Line(counter*300+150,335,counter*300+148,326);
        Line(counter*300+150,335,counter*300+152,326);
        Line(counter*300+150,423,counter*300+148,414);
        Line(counter*300+150,423,counter*300+152,414)
      end;
    Arc(120,427,180,360,25);Arc(480,427,180,360,25);
    Arc(122,35,0,180,27);Arc(478,35,0,180,27);
    Line(95,35,95,425);Line(505,35,505,425);
    Line(293,134,163,431);Arc(159,427,180,330,5);
    Line(290,281,170,436);Arc(162,427,180,320,12);
    Line(307,134,436,431);Arc(440,427,210,360,5);
    Line(310,281,429,436);Arc(438,427,220,360,12);
    Line(283,117,169,106);Arc(171,121,80,180,15);
    Line(312,129,439,262);Arc(429,273,0,45,15);
    Line(283,267,169,256);Arc(171,271,80,180,15);
    Line(311,257,426,110);Arc(432,121,0,160,12);
    Line(150,35,145,26);Line(150,35,150,26);
    Line(450,35,455,26);Line(450,35,450,26);
    Line(155,123,156,114);Line(155,123,159,115);
    Line(155,273,156,264);Line(155,273,159,265);
    Line(445,123,444,114);Line(445,123,440,115);
    Line(445,123,444,114);Line(445,123,441,116);
    Line(445,273,444,264);Line(445,273,440,265);
    Line(293,135,287,142);Line(293,135,291,143);
    Line(307,135,309,143);Line(307,135,312,142);
    Line(290,282,282,288);Line(290,282,285,290);
    Line(311,282,315,290);Line(311,282,317,288);
    SetFillStyle(1,8);
    for counter := 0 to 1 do
      begin
        Line(540,counter*70+150,600,counter*70+150);
        Line(540,counter*70+170,600,counter*70+170);
        Line(600,counter*70+150,600,counter*70+170);
        Line(540,counter*70+150,540,counter*70+170);
        FloodFill(570,counter*70+160,15)
      end;
    SetFillStyle(1,15);
    OutTextXY(543,159,'Restore');
    OutTextXY(555,229,'Exit');
  end;
  procedure Design_Mark_and_Jumps;
  begin
      SetColor(15);
      SetLineStyle(0,0,3);
      SetFillStyle(1,15);
      Hide_Mouse;
      for counter := 0 to 2 do
        if ((m shr (7 - counter)) and 1) = 1 then
          begin
            SetColor(15);
            SetFillStyle(1,15);
            FillEllipse(150,counter*150+50,1,1)
          end
          else
          begin
            SetColor(0);
            SetFillStyle(1,0);
            FillEllipse(150,counter*150+50,1,1)
          end;
      for counter := 3 to 4 do
        if ((m shr (7 - counter)) and 1) = 1 then
          begin
            SetColor(15);
            SetFillStyle(1,15);
            FillEllipse(300,(counter-3)*150+120,1,1)
          end
          else
          begin
            SetColor(0);
            SetFillStyle(1,0);
            FillEllipse(300,(counter-3)*150+120,1,1)
          end;
      for counter := 5 to 7 do
        if ((m shr (7 - counter)) and 1) = 1 then
          begin
            SetColor(15);
            SetFillStyle(1,15);
            FillEllipse(450,(counter-5)*150+50,1,1)
          end
          else
          begin
            SetColor(0);
            SetFillStyle(1,0);
            FillEllipse(450,(counter-5)*150+50,1,1)
          end;
      for counter := 0 to 2 do
        if ((r shr (7 - counter)) and 1) = 1 then
          begin
            SetFillStyle(1,10);
            FloodFill(150,counter*150+125,15)
          end
          else
          begin
            SetFillStyle(1,12);
            FloodFill(150,counter*150+125,15)
          end;
      for counter := 3 to 5 do
        if ((r shr (7 - counter)) and 1) = 1 then
          begin
            SetFillStyle(1,10);
            FloodFill(450,(counter-3)*150+125,15)
          end
          else
          begin
            SetFillStyle(1,12);
            FloodFill(450,(counter-3)*150+125,15)
          end;
      SetColor(15);
      SetFillStyle(1,15);
      Show_Mouse
  end;
  Begin
    Init_Graph_Mode;
    ok := Init_Mouse;
    flag_of_exit := false;
    m := m_0;
    r := r_0;
    old_m := 0;
    old_r := 0;
    if ok = $FFFF then
      begin
{$I-}   assign(f,path);
        reset(f);
        ok := filesize(f);
{$I+}   if (IOResult = 0) and (ok = 64) then
          begin
           for i := 1 to 63 do
              read(f,ScrMask[i]);
            Set_Graph_Cursor(seg(ScrMask),ofs(ScrMask),2,2)
          end;
        Design_Kernel;
        Show_Mouse;
        repeat
          Get_Mouse_State(bm,i,j);
          if (m <> old_m) or (r <> old_r) then
            begin
              Get_Web_State;
              Design_Mark_and_Jumps;
              old_m := m;
              old_r := r
            end;
          if bm = 1 then
          begin
            number := 6;
            for counter := 0 to 2 do
              if (i < 165) and (i > 135) and
                 (j < counter*150+130) and (j > counter*150+120)
              then
                number := counter;
            for counter := 3 to 5 do
              if (i < 465) and (i > 435) and
                 (j < (counter-3)*150+130) and (j > (counter-3)*150+120)
              then
                number := counter;
            if (number < 6) and (((1 shl (7-number)) and r) <> 0) then
              begin
                m := m and (jump[number] and $FF);
                m := m or (jump[number] shr 8)
              end;
            if (i < 600) and (i > 540) and (j < 170) and (j > 150)
              then
                m := m_0;
            if (i < 600) and (i > 540) and (j < 240) and (j > 220)
              then
                flag_of_exit := true
          end;
        until flag_of_exit;
        Hide_Mouse;
        CloseGraph
      end
      else
        begin
          CloseGraph;
          WriteLn('Ошибка мыши: Device or driver not found.')
        end
  End.