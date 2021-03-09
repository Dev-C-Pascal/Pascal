var
a,b:longint;
 
begin
readln(a);
repeat;
b:=b*10+a mod 10;
a:=a div 10;
until a=0;
writeln(b);
readln;
end.
