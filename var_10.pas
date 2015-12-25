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
  assign(f, 'st.txt'); {устанавливаем связь файловой переменной с физическим файлом на диске}
  assign(f1, 'st2.txt');{устанавливаем связь файловой переменной с физическим файлом на диске}
  reset(f);{открываем первый файл для чтения}
  rewrite(f1);{открываем второй файл для записи}
  writeln('№':3,'Тип чая':8, 'Форма упаковки':17, 'Производитель':15, 'Цена':5, 'Количество':11,' Сумма');
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
    {Выводим во втором файл критерий вывода и заголовок}
    writeln('Информация о закупке черного чая:');
    writeln('Тип чая':8, 'Форма упаковки':17, 'Производитель':15, 'Цена':5, 'Количество':11,' Сумма');{Выводим заголовок}
    {Последовательно проверяем записи и записываем во второй файл}
    for i:=1 to n do
    {условия для поиска студентов,живущие в Нижегороской области}
    if (Trim(teas[i].tea_type) = 'Черный')then 
    begin
      with teas[i] do
        writeln(tea_type:10, form:6, manufacturer:14, price:12, count:3,full_price:13);
    end;
    writeln();
    {Выводим студентов,которые проживают в доме,номер которого состоит из 1 цифры}
    writeln('Продукция, заказанная в количестве более 40:');
    writeln('Тип чая':8, 'Форма упаковки':17, 'Производитель':15, 'Цена':5, 'Количество':11,' Сумма');{Выводим заголовок}
    for i:=1 to n do 
      with teas[i] do
      begin
        {условия для поиска студентов, у которых номер дома состоит из 1 цифры}
        if (count > 40) then
          writeln(tea_type:10, form:6, manufacturer:14, price:12, count:3,full_price:13); 
      end;
   close(f);{заканчиваем работу с первым файлом}
   close(f1);{заканчиваем работу со всторым файлом}
   end.
