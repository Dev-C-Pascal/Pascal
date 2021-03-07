var a: array [-100..100] of integer; 
    i, n, k: integer;
begin
  Read(n);
  i:=0;
  k:=0;
  for i := 0 to n-1 do begin 
    read(a[i]);
    if a[i] > 0 then k:=k+1;
  
  end;
  writeln(k);
end.