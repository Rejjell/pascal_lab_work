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
  assign(f, 'st.txt'); {устанавливаем связь файловой переменной с физическим файлом на диске}
  assign(f1, 'st2.txt');{устанавливаем связь файловой переменной с физическим файлом на диске}
  reset(f);{открываем первый файл для чтения}
  rewrite(f1);{открываем второй файл для записи}
  writeln('№':3,'Категория':11, 'Наименование':16, 'Цена р.':9, 'Масса':6, 'Калорийность':13,' Цена за 100 г.');
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
    {Выводим во втором файл критерий вывода и заголовок}
    writeln('Список салатов:');
    writeln('№':3,'Категория':11, 'Наименование':16, 'Цена р.':9, 'Масса':6, 'Калорийность':13,' Цена за 100 г.');{Выводим заголовок}
    {Последовательно проверяем записи и записываем во второй файл}
    for i:=1 to n do
    {условия для поиска студентов,живущие в Нижегороской области}
    if (Trim(dish[i].category) = 'Салаты')then 
    begin
      with dish[i] do
        writeln(i:3,category:15, name:13, price:4, mass:8, caloric:6,price_for_100:16:2);
    end;
    writeln(f1);
    {Выводим студентов,которые проживают в доме,номер которого состоит из 1 цифры}
    writeln('Список первых блюд с общей калорийностью менее 20000 калорий:');
    writeln('№':3,'Категория':11, 'Наименование':16, 'Цена р.':9, 'Масса':6, 'Калорийность':13,' Цена за 100 г.');{Выводим заголовок}
    for i:=1 to n do 
      with dish[i] do
      begin
        {находим общую калорийность для блюда}
        full_caloric := mass * caloric / 100;
        {условия для поиска студентов, у которых номер дома состоит из 1 цифры}
        if (true or (full_caloric < 20000)) then
          writeln(i:3,category:15, name:13, price:4, mass:8, caloric:6,price_for_100:16:2, full_caloric:5); 
      end;
   close(f);{заканчиваем работу с первым файлом}
   close(f1);{заканчиваем работу со всторым файлом}
   end.
