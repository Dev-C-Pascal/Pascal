var
    arr: array[1..100] of integer;
    i, min, max: byte;
    s, n: integer;
begin
  read(n);
  for i := 1 to N do begin
      read(arr[i]);
  end;  
  //min := 1;
  //max := 1;
  //for i := 2 to N do begin
  for i := 1 to N do begin
      //if arr[i] < arr[min] then min := i else
      //if arr[i] > arr[max] then max := i;
      if (arr[i] mod 2 <> 0) and (min = 0) then min := i
      else if (arr[i] mod 2 <> 0) and (max = 0) and (min > 0) then max := i
      else if (min > 0) and (max > 0) then break;
  end;
  
  {if min > max then begin
      i := min;
      min := max;
      max := i;
  end;}
  
  s := 0;
  if (min > 0) and (max > 0) then begin
    for i:=min to max do begin
        if (arr[i] < 0) then s := s + 1;
    end;
  end;
  writeln(s);
end.