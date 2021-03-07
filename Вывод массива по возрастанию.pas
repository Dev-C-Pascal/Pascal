const nmax=10000;
var a:array[1..nmax] of byte;
    n,i,j,x,k:byte;
begin

repeat
write('Введите N до ',nmax-1,' N=');





readln(n);
until (n>0)and(n<10000);
writeln('Последовательность');

for i:=1 to n do read(a[i]);

for i:=1 to n-1 do
for j:=i+1 to n do
if a[i]<a[j] then
 begin
  k:=a[i];
  a[i]:=a[j];
  a[j]:=k;
 end;
for i:=1 to n do
write(a[i]:4);
writeln;
repeat
write('x=[140..200] x=');
readln(x);
until x in [140..200];
n:=n+1;
if x<=a[n-1] then k:=n
else
 begin
  i:=n;
  while (i>=1) and(x>a[i]) do
  i:=i-1;
  k:=i+1;
 end;
write('Номер=',k);
readln
end.