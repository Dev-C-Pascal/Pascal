type
  TMass = array of Int64;
var
  N, I : Int64; 
  A : TMass;
  Sum, Max, Min : Int64;
begin
  Read(N);
  SetLength(A, N);
  Sum := 0;
  for I := 0 to N - 1 do 
    Read(A[I]);
  Max := -1; 
  Min := -1;
  for I := 0 to N - 1 do
  begin
    if (A[I] < 0) and (Min = -1) then Min := I;
    if (A[I] > 0) and (Max = -1) then Max := I;
  end; 
  
  if (min = -1) or (max = -1) then
  begin
    Min := 0;
    Max := N - 1;
  end;
  if (MIN < Max) then begin
  for i := min to max do
    begin
        Sum := Sum + a[i];
    end;
  end
  else begin
    for i := max to min do
    begin
        Sum := Sum + a[i];
    end;
  end;
  writeln (Sum);
end.