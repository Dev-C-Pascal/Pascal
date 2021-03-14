var
    arr: array[1..100] of integer;
    i, min, max: byte;
    sum, n: integer;
begin
read(n);
    for i := 1 to N do begin
        read(arr[i]);
    end;
    writeln;
    
    min := 1;
    max := 1;
    for i := 2 to N do begin
        if arr[i] < arr[min] then min := i else
        if arr[i] > arr[max] then max := i;
    end;
    
    if min > max then begin
        i := min;
        min := max;
        max := i;
    end;
    
    sum := 0;
    for i:=min to max do begin
        if (arr[i]=0) then inc(sum);
    end;
    writeln(sum);
end.