var
    f: file of char;
    c: char;
    i, n: byte;
 
begin
    assign (f, 'D:\file.txt');
    rewrite (f);
 
    write ('Количество символов: ');
    readln (n);
 
    for i:=1 to n do begin
        write ('Введите символ: ');
        readln (c);
        write (f, c);
    end;
 
    close (f);
 
end.