Program List1;
Uses crt;

Const max = 100;

Type
  intr = record
    a: integer;
    next: integer; 
  end;

Var
  List: array[1..max] of intr;
  Head: integer; 
  Size: integer; 

Procedure NtCreat(a: integer);
Begin
  if Size = 0 then
  begin
    Inc(Size);
    List[Size].a := a;
    List[Size].next := 0;
    Head := 1;
  end
  else
  begin
    Inc(Size);
    List[Size].a := a;
    List[Size].next := Head;
    Head := Size;
  end;
end;

Procedure View;
Var
  i, idx: integer;
Begin
  idx := Head;      
  if Size = 0 then
  begin
    WriteLn('Список пуст! ');
    readLn;
    exit;
  end
  else
  repeat
    WriteLn(List[idx].a);
    Write('0-Далее 1-Назад 2-Закончить просмотр ');
    readLn(i);     
    case i of
      0: begin 
          if List[idx].next <>0 then  
            idx := List[idx].next
          else 
            begin
            Writeln('Это последний элемент');
            readln;
          end;
          end;
      1: begin
           for i := 1 to Size do
           begin
             if List[i].next = idx then
             begin
               idx := i;
               break;
             end;
           end;
         end;
      2: break;
    end;
  until false;
end;

Procedure remove(idx: integer);
Var
  i: integer;
Begin
  for i := 1 to Size do
  begin
    if List[i].next = idx then
    begin
      List[i].next := List[idx].next; 
      break;
    end;
  end;
  if Head = idx then
    Head := List[idx].next; 
  List[idx].next := 0; 
end;


Function Show: boolean;
Var
  i: string;
Begin
  Show := true;
  WriteLn('1- Создать элемент списка ');
  Writeln('2- Просмотреть весь список ');
  WriteLn('3- Удаление элемента списка');
  Writeln('4- Выход'); 
  readLn(i);
  case i of
    '1': begin
           Write('Введите а: ');
           readLn(i);
           NtCreat(StrToInt(i));
         end;
    '2': View;
    '3': begin
           WriteLn('Введите номер элемента для удаления: ');
           readLn(i);
           if i = '' then write('Нечего удалять')
           else
           remove(StrToInt(i));
         end;
    '4': Show := false;
    
  end;
end;

Var
  F: boolean;

Begin
  ClrScr;
  Size := 0;
  repeat
    F := Show;
    clrscr;
  until not F;
End.
