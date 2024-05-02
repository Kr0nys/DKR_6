Program List1;
Uses crt;
Type Pint=^intr;
     intr=record
       a:integer;
       next:Pint;
     end;
Procedure NtCreat(Var Hed:Pint);  
Var C,B:Pint;
    a:integer;
begin
  New(C);
  Write('Введите а ');
  readLn(C^.a);
  if hed=nil then
    begin
      hed:=c;
      hed^.next:=Hed;  
    end      else
    begin
      b:=hed;
      while b^.next<>hed do
        b:=b^.next;
      c^.next:=Hed;
      b^.next:=c;
    end;
end;
 
Procedure View(Var Hed:Pint);  
Var C,S:Pint;
    i:integer;
begin
  c:=Hed;     
  S:=nil;
  if c=nil then
  begin
   WriteLn('Список пуст! ');
   readLn;
   exit;
  end;
 repeat
    WriteLn(C^.a);  
    Write('0-Далее 1-Назад 2-Закончить просмотр ');
    readLn(i);     
    case i of
    0:c:=C^.next;   
    1:begin
        s:=C;
        c:=hed;
         While C^.next<>s do
           c:=c^.next;
      end;
    2:begin
        break;
      end;
    end;
 until false;
end;
 
Function Show(Var Sp:pint):boolean;
Var i:char;
begin
  Show:=true;
  WriteLn('1- Создать элемент списка ');
  Writeln('2- Просмотреть весь список ');
  WriteLn('3- Выход ');
  readLn(i);
  case i of
    '1':NtCreat(Sp);
    '2':View(sp);
    '3':Show:=false;
  end;
end;
Var Spisok:Pint;
    F:boolean;
Begin
  ClrScr;
  Spisok:=nil;
  repeat
    f:=show(Spisok);
    clrscr;
  until not F;
end.