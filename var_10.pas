program menu;
type rez=record
  tea_type, form, manufacturer: string[9];
  price, count, full_price :integer;
end;
  
  var
    i,n:integer;
    teas:array[1..10]of rez;
    f: text;
    f1:text;

  begin
  assign(f, 'st.txt'); {������������� ����� �������� ���������� � ���������� ������ �� �����}
  assign(f1, 'st2.txt');{������������� ����� �������� ���������� � ���������� ������ �� �����}
  reset(f);{��������� ������ ���� ��� ������}
  rewrite(f1);{��������� ������ ���� ��� ������}
  writeln('�':3,'��� ���':8, '����� ��������':17, '�������������':15, '����':5, '����������':11,' �����');
  i:=1;
  n:=10;
  while not eof (f) do
  with teas[i] do
    begin
     readln(f,tea_type, form, manufacturer, price, count);
     full_price := price * count;
     writeln(i:3,tea_type:10, form:6, manufacturer:14, price:12, count:3,full_price:13);
     i:=i+1;
    end;
    {������� �� ������ ���� �������� ������ � ���������}
    writeln('���������� � ������� ������� ���:');
    writeln('��� ���':8, '����� ��������':17, '�������������':15, '����':5, '����������':11,' �����');{������� ���������}
    {��������������� ��������� ������ � ���������� �� ������ ����}
    for i:=1 to n do
    {������� ��� ������ ���������,������� � ������������ �������}
    if (Trim(teas[i].tea_type) = '������')then 
    begin
      with teas[i] do
        writeln(tea_type:10, form:6, manufacturer:14, price:12, count:3,full_price:13);
    end;
    writeln();
    {������� ���������,������� ��������� � ����,����� �������� ������� �� 1 �����}
    writeln('���������, ���������� � ���������� ����� 40:');
    writeln('��� ���':8, '����� ��������':17, '�������������':15, '����':5, '����������':11,' �����');{������� ���������}
    for i:=1 to n do 
      with teas[i] do
      begin
        {������� ��� ������ ���������, � ������� ����� ���� ������� �� 1 �����}
        if (count > 40) then
          writeln(tea_type:10, form:6, manufacturer:14, price:12, count:3,full_price:13); 
      end;
   close(f);{����������� ������ � ������ ������}
   close(f1);{����������� ������ �� ������� ������}
   end.
