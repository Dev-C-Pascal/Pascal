type
  TMass = array of Integer;
var
  N, I, s : Integer; 
  A : TMass;
  
begin
  s := 1;

  Read(N);
  SetLength(A, N);
  for I := 0 to N - 1 do 
    Read(A[I]);
  for I := 1 to N - 1 do begin
      if (a[i-1] < a[i]) then s:=s+1;
  end;
  writeln(s);
end.