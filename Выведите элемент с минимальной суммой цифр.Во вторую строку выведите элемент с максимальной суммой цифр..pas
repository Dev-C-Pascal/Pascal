type
  TMass = array of Integer;
var,
  N, I, s : Integer; 
  A : TMass;
  Min, Max, temp, min_i, max_i : Integer;
  

function smp (T: integer): integer;
  var 
  K: integer;
  x, sum : Integer;
  b : boolean;
begin
  K:=abs(T);
  sum := 0;
  b := true;
  while K <> 0 do begin
    x := K mod 10;
    sum := sum + x;
    K := K div 10;
  end;
  smp := sum;
end;  
  
begin
  Read(N);
  SetLength(A, N);
  for I := 0 to N - 1 do Read(A[I]);
  min := 36; 
  max := 0; 
  for I := 0 to N - 1 do begin
    temp := smp(a[i]);
    if (temp < min) or ((temp=min) and (a[i]<a[min_i])) then begin 
      min := temp;
      min_i := i;
    end;
      if (temp > max) or ((temp=max) and (a[i]>a[max_i])) then begin 
        max := temp;
        max_i := i;
      end;
  end;
  writeln(a[min_i]);
  writeln(a[max_i]);
end.