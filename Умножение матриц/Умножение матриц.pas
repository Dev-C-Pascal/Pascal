type
    atype = array[1..3,1..4] of integer;
    btype = array[1..4,1..2] of real;
    ctype = array[1..3,1..2] of real;
 
var
    a: atype; b: btype; c: ctype;
    n,i,j,k: integer;
 
begin
    for n := 1 to 3 do
        readln(a[n,1],a[n,2],a[n,3],a[n,4]);
 
    for n := 1 to 4 do
        readln(b[n,1],b[n,2]);
 
    for i := 1 to 3 do
        for j := 1 to 2 do begin
            c[i,j] := 0;
            for k := 1 to 4 do
                c[i,j] := c[i,j] + a[i,k] * b[k,j];
        end;
 
    for n := 1 to 3 do
        writeln(c[n,1]:8:2, c[n,2]:8:2);
 
readln
end.
