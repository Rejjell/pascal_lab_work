program menu;
type rez=record
  category, name: string[13];
  price, mass, caloric :integer;
  price_for_100 : real;
end;
  
  var
    i,n:integer;
    full_caloric: real;
    dish:array[1..10]of rez;
    f: text;
    f1:text;

  begin
  assign(f, 'st.txt'); {������������� ����� �������� ���������� � ���������� ������ �� �����}
  assign(f1, 'st2.txt');{������������� ����� �������� ���������� � ���������� ������ �� �����}
  reset(f);{��������� ������ ���� ��� ������}
  rewrite(f1);{��������� ������ ���� ��� ������}
  writeln('�':3,'���������':11, '������������':16, '���� �.':9, '�����':6, '������������':13,' ���� �� 100 �.');
  i:=1;
  n:=10;
  while not eof (f) do
  with dish[i] do
    begin
     readln(f,category, name, price, mass, caloric);
     price_for_100 := price / mass * 100;
     writeln(i:3,category:15, name:13, price:4, mass:8, caloric:6,price_for_100:16:2);
     i:=i+1;
    end;
    {������� �� ������ ���� �������� ������ � ���������}
    writeln('������ �������:');
    writeln('�':3,'���������':11, '������������':16, '���� �.':9, '�����':6, '������������':13,' ���� �� 100 �.');{������� ���������}
    {��������������� ��������� ������ � ���������� �� ������ ����}
    for i:=1 to n do
    {������� ��� ������ ���������,������� � ������������ �������}
    if (Trim(dish[i].category) = '������')then 
    begin
      with dish[i] do
        writeln(i:3,category:15, name:13, price:4, mass:8, caloric:6,price_for_100:16:2);
    end;
    writeln(f1);
    {������� ���������,������� ��������� � ����,����� �������� ������� �� 1 �����}
    writeln('������ ������ ���� � ����� ������������� ����� 20000 �������:');
    writeln('�':3,'���������':11, '������������':16, '���� �.':9, '�����':6, '������������':13,' ���� �� 100 �.');{������� ���������}
    for i:=1 to n do 
      with dish[i] do
      begin
        {������� ����� ������������ ��� �����}
        full_caloric := mass * caloric / 100;
        {������� ��� ������ ���������, � ������� ����� ���� ������� �� 1 �����}
        if (true or (full_caloric < 20000)) then
          writeln(i:3,category:15, name:13, price:4, mass:8, caloric:6,price_for_100:16:2, full_caloric:5); 
      end;
   close(f);{����������� ������ � ������ ������}
   close(f1);{����������� ������ �� ������� ������}
   end.
