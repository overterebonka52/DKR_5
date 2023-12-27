program dkr5;
uses crt; //консоль
type
  ms = array [1..9999] of integer;
var
  mal, out: text;
  xz: integer;

procedure sortObw;
var
  arr: array[-999..999] of integer;
  i, y, x: integer;
begin
  Assign(mal, 'D:\мал.txt'); //связывает файловую 
                               //переменную с файлом на диске
  Reset(mal);                 //открывает файл для чтения
  Writeln('Наш массив: ');
  for i := -999 to 999 do   
    arr[i] := 0;
  while not eof(mal) do //возвращает true, когда конец файла
  begin
    readln(mal, x);
    writeln(x, '  ');
    inc(arr[x]);
  end;
  Assign(out, 'D:\output.txt');
  ReWrite(out);                 //создает файл на запись
  writeln;
  writeln('Отсортированный массив: ');
  if xz = 1 then
  begin
    for i := -999 to 999 do
      for y := 1 to arr[i] do
      begin
        writeln(out, i);
        write(i);
      end;
  end;
  
  if xz = 2 then
  begin
    for i := 999 downto -999 do
      for y := 1 to arr[i] do
      begin
        writeln(out, i);
        write(i);
      end;
  end;
  close(out);                    //закрывает файл
  close(mal);
end;

procedure sliynie(var a: ms; p, q: integer);
var
  r, i, y, k: integer;
  b: ms;
begin
  r := (p + q) div 2;
  i := p;
  y := r + 1;
  for k := p to q do
    if (i <= r) and ((y > q) or (a[i] < a[y])) then
    
    begin
      b[k] := a[i];
      i := i + 1;
    end
    else
    begin
      b[k] := a[y];
      y := y + 1;
    end;
  for k := p to q do
    a[k] := b[k];
end;

procedure sortprost(var a: ms; p, q: integer);
begin
  if p < q then 
  begin
    sortprost(a, p, (p + q) div 2);
    sortprost(a, (p + q) div 2 + 1, q);
    sliynie(a, p, q);
  end;
end;

procedure sortLoc;
var
  a: ms;
  n, i, x: integer;
  mal, inp: text;

begin
  clrscr;
  writeln('Наш массив: ');
  Assign(mal, 'D:\мал.txt');
  Reset(mal);
  n := 0;
  repeat
    readln(mal, x);
    inc(n);
  until eof(mal);
  Reset(mal);
  for i := 1 to n do
  begin
    readln(mal, a[i]);
    writeln(a[i]);
  end;
  close(mal);
  writeln;
  sortprost(a, 1, n);
  writeln('Отсортированный массив: ');
  Assign(out, 'D:\output.txt');
  ReWrite(out);
  if xz = 1 then
  begin
    for i := 1 to n do
    begin
      writeln(out, a[i]);
      writeln(a[i]);
    end;
  end;
  if xz = 2 then
  begin
    for i := n downto 1 do
    begin
      writeln(out, a[i]);
      writeln(a[i]);
    end;
  end;
  close(out);
end;

begin
  repeat
    clrScr;
    writeln('1. Сортировка подсчетом');
    writeln('2. Сортировка слиянием');
    writeln('3. Выход');
    write('Выберите пункт: ');
    readln(xz);
    case xz of
      1:
        begin
          clrscr; 
          writeln('1. Отсортировать по возрастанию');
          writeln('2. Отсортировать по убыванию');
          write('Выберите пункт: ');
          readln(xz);
          case xz of 
            1:
              begin
                clrScr;
                sortObw;
                readln;
              end;
            
            2:
              begin;
                clrScr;
                sortObw;
                readln;
              end;
          end;
        end;
      
      2:
        begin
          clrscr; 
          writeln('1. Отсортировать по возрастанию');
          writeln('2. Отсортировать по убыванию');
          write('Выберите пункт: ');
          readln(xz);
          case xz of 
            1:
              begin
                clrScr;
                sortLoc;
                readln;
              end;
            
            2:
              begin;
                clrScr;
                sortLoc;
                readln;
              end;
          end;
        end;
      
      3: exit;
    end;
  until xz = 3;
end.