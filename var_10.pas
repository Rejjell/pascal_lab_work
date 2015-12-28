program tea_purchase;
type rez=record
  tea_type, form, manufacturer: string[9];
  price, count, full_price :integer;
end;
  var
    i,N:integer;
    teas:array[1..10]of rez;
    f: text;
    f1:text;
  begin
  assign(f, 'st.txt'); {устанавливаем связь файловой переменной с внешним файлом на диске}
  assign(f1, 'st2.txt');{устанавливаем связь файловой переменной с внешним файлом на диске}
  reset(f);{открываем первый файл для чтения}
  rewrite(f1);{открываем второй файл для записи}
  writeln('№':3,'Тип чая':8, 'Форма упаковки':17, 'Производитель':15, 'Цена':5, 'Количество':11,' Сумма');
  i:=1;
  N:=10;
  while not eof (f) do
  with teas[i] do
    begin
     readln(f,tea_type, form, manufacturer, price, count);
     full_price := price * count;
     writeln(i:3,tea_type:10, form:6, manufacturer:14, price:12, count:3,full_price:13);
     i:=i+1;
    end;
    {Вывод во втором файл продукции черного чая}
    writeln(f1,'Информация о закупке черного чая:');
    writeln(f1,'Тип чая':8, 'Форма упаковки':17, 'Производитель':15, 'Цена':5, 'Количество':11,' Сумма');{Выводим заголовок}
    {Последовательно проверяем записи и записываем во второй файл}
    for i:=1 to N do
    {условия для вывода продукции черного чая}
    if (Trim(teas[i].tea_type) = 'Черный')then 
    begin
      with teas[i] do
        writeln(f1,tea_type:10, form:6, manufacturer:14, price:12, count:3,full_price:13);
    end;
    writeln(f1);
    {Вывод строкс количесвтом больше 40}
    writeln(f1,'Продукция, заказанная в количестве более 40:');
    writeln(f1,'Тип чая':8, 'Форма упаковки':17, 'Производитель':15, 'Цена':5, 'Количество':11,' Сумма');{Выводим заголовок}
    for i:=1 to N do 
      with teas[i] do
      begin
        {условия для вывода строк с количесвтом больше 40}
        if (count > 40) then
          writeln(f1,tea_type:10, form:6, manufacturer:14, price:12, count:3,full_price:13); 
      end;
   close(f);{закрваем первый файл}
   close(f1);{закрваем всторой файл}
   end.
