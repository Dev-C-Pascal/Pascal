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
  Min := 0;
  for I := 0 to N - 1 do
  begin
    if (A[I] < A[min]) then Min := I;
    if (A[I] mod 2 = 0) and (max = -1) then Max := I;
  end; 
  if (Min < Max) then begin
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