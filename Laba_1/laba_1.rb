# задание 1.1
puts "Hello world" 

# задание 1.2
puts "Hello, " + ARGV[0] 

# задание 1.3
puts "Какой язык у вас любимый?" 
puts "Если C#, введите 1"
puts "Если Ruby, введите 2"
puts "Если Python, введите 3"
puts "Если C++, введите 4"
puts "Если Java, введите 5"
language = gets.to_i

case language
when 1
	puts "Фу, это не интересно :( "
when 2
	puts "Ты подлиза!!"
when 3
	puts "Просто и легко"
when 4
	puts "Скууучно"
when 5
	puts "Что-то на неизвестном"
else 
	puts "Скоро будет Ruby!!"
end

#условный оператор
#var 1
if language == 2 then
	puts "Ты подлиза!!"
else 
	puts "Скоро будет Ruby!!"
end
#var 2
puts "Ты подлиза!!" if language.chomp == "Ruby"
#var 3
unless language != 2 then
	puts "Ты подлиза!!"
else 
	puts "Скоро будет Ruby!!"
end

	
# задание 1.4
puts "Введите команду языка Ruby:" #4
rb = gets.chomp
puts eval(rb)
puts "Введите команду ОС:"
oc = gets.chomp
puts(`#{oc}`)

# задание 2.1
def sum_digit(num) 
	sum = 0 
	while (num > 0 ) 
		sum += num%10
		num = num/10
	end
	sum
end

	
# задание 2.2
def multip_digit(num) 
	multip = 1 
	while (num > 0 ) 
		multip *= num%10
		num = num/10
	end
	multip
end

def max_digit(num)
	max = 0
	while (num > 0 ) 
		c = num%10
		if max < c then 
			max = c
			num = num/10
		else
			num = num/10
		end
	end
	max
end

def min_digit(num)
	min = 9
	while (num > 0 ) 
		c = num%10
		if min >= c then 
			min = c
			num = num/10
		else
			num = num/10
		end
	end
	min
end

	
# задание 2.3.1
def prost_digit(num) 
	k=0 				
	if num > 1
		(1 .. num).each do |n|
			if num % n == 0 
				k += 1
			end
		end
		if k == 2
			return true
		else 
			return false
		end
	end
end

def sum_delit(num) 
	sum2 = 0
	(1 .. num).each do |i|
		if (num % i == 0 && prost_digit(i) == true)
			sum2 += i
		end
	end
	sum2
end

# задание 2.3.2
def nechet_digit(num)
	kol = 0 
	while num > 0 
		if ((num%10)%2!=0 && (num%10)>3)
			kol = kol + 1
		end
		num = num/10
	end
	kol
end

def sum_digit(num) #1
	sum = 0 
	while (num > 0 ) 
		sum += num%10
		num = num/10
	end
	sum
end

# задание 2.3.3
def proiz_sum_digit(num) 
	pr = 1
	(1 .. num).each do |i| 
		if (num % i == 0 && (sum_digit(i) < sum_digit(num)))
			pr = pr * i 
		end	
	end
	pr
end

num = ARGV[0].to_i
puts "Найти сумму цифр числа - 1" #3
puts "Найти произведение цифр числа - 2"
puts "Найти max цифру числа - 3"
puts "Найти min цифру числа - 4"
puts "Найти сумму простых делителей числа - 5"
puts "Найти количество нечетных цифр числа, больших 3 - 6"
puts "Найти произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа - 7"
puts "Введите номер метода который вы хотите использовать: " 

meth = ARGV[1].to_i
puts "Результат: " 

case meth
when 1 
	puts sum_digit num 
when 2
	puts multip_digit num
when 3
	puts max_digit num 
when 4
	puts min_digit num
when 5
	puts sum_delit num
when 6
	puts nechet_digit num
when 7
	puts proiz_sum_digit num
else
	puts "Неверный метод!"
end

	
# задание 3.1
def min_list(list)
	min = list[0]
		list.each do |a| 
			if min > a
				min = a
			end
		end
		return min
end

def max_list(list)
	max = list[0]
		list.each do |a| 
			if max < a
				max = a
			end
		end	
		return max	
end

def sum_list(list)
	sum = 0
		list.each do |a| 
			sum += a 
		end
		return sum
end

def proiz_list(list)
	proiz = 1
		list.each do |a| 
			proiz *= a 
		end
		return proiz
end

# задание 3.2
puts "Выберите метод: "
puts "Минимальный элемент списка - 1"
puts "Максимальный элемент списка - 2"
puts "Сумма элементов списка - 3"
puts "Произведение элементов списка - 4"
num = gets.to_i
puts "Выберите откуда вы хотите считать данные?"
puts "С клавиатуры - 1"
puts "С файла - 2"
from_where=gets.chop.to_i
arr = Array.new
if from_where == 2
	file=gets.chop
	File.open(file, "r") do |f|
		while (line = f.gets)
			arr.append(line.to_i)
		end
	end
else 
	if from_where == 1
		el = gets
		until el == "\n"
			arr.append(el.to_i)
			el = gets
		end
	end
end

case num
when 1 
	puts min_list arr
when 2
	puts max_list arr
when 3
	puts sum_list arr
when 4
	puts proiz_list arr
else
	puts "Ошибка!"
end

# задание 4
def sdvig_two(list)
	return list.rotate(-2)
end

def sdvig_one(list)
	return list.rotate(-1)
end

def chetn(list)
	return list.count{ |list| list.even? }
end

def min(list)
	return list.count(list.min)
end

puts "Выберите метод: "
puts "Циклический сдвиг элементов массива вправо на две позиции - 1"
puts "Циклический сдвиг элементов массива вправо на одну позицию - 2"
puts "Найти количество четных элементов - 3"
puts "Найти количество минимальных элементов - 4"

num = gets.to_i
puts "Выберите откуда вы хотите считать данные?"
puts "С клавиатуры - 1"
puts "С файла - 2"
from_where=gets.chop.to_i
arr = Array.new
if from_where == 2
	puts "Введите путь файла: " #D:\Sublime Text 3\Projects\text.txt
	file=gets.chop
	File.open(file, "r") do |f|
		while (line = f.gets)
			arr.append(line.to_i)
		end
	end
else 
	if from_where == 1
		puts "Введите массив: "
		el = gets
		until el == "\n"
			arr.append(el.to_i)
			el = gets
		end
	end
end

case num
when 1 
	puts sdvig_two arr
when 2
	puts sdvig_one arr
when 3
	puts chetn arr
when 4
	puts min arr
else
	puts "Ошибка!"
end

# задание 5
def words str # задание 5.1 
	coun = str.count "А-я"
	coun
end

def palindrom str # задание 5.9
	a = str.scan(/[a-z]/)
	a == a.reverse
end

def date str # задание 5.18 (задание 2)
	str.scan(/([0-2]\d|3[0-1]).(0[1-9]|1[0-2]).(\d{4})/).map{|e| e.join('.')}.join(" ")
	str.scan(/([0-2]\d|3[0-1]).(0[1-9]|1[0-2]|January|February|March|April|May|June|July|August|September|October|November|December).(\d{4})/).map{|e| e.join('.')}.join(" ")
end

puts "Введите номер желаемого задания: "
puts "Дана строка. Необходимо найти общее количество русских символов - 1"
puts "Дана строка. Необходимо проверить образуют ли строчные символы латиницы палиндром - 2"
puts "Найти в тексте даты формата «день.месяц.год» - 3"
num = gets.to_i

case num
when 1 
	puts words "ывDDDффф"
when 2
	puts palindrom "pas11ASDAAhsap"
when 3
	puts date " 23.02.2001 23 February 2007 ddddsds"
else
	puts "Ошибка!"
end


def max  # задание 1.1 String
	str = "2.2 1.34 1.11 -11.11"
	real = str.scan(/\-\d+\.\d+|\d+\.\d+/).map{ |n| n.to_f }.max
	puts real
end

def min  # задание 1.9 String
	str = "1/2+4/3-2.5/7.8=0.0"
	ration = str.scan(/[-+]?\d+\/\d+|[-+]?\d+\.\d+/).map{|e| e.to_f}.min
	puts ration
end

def kol # задание 1.18 String
	str = "12a8976b"
	puts str.split(/\D+/).map{ |x| x.size }.max
end

puts "Введите номер желаемого задания: "
puts "Дана строка. Необходимо найти максимальное из имеющихся в ней вещественных чисел - 1"
puts "Дана строка. Необходимо найти минимальное из имеющихся в ней рациональных чисел - 2"
puts "Дана строка. Необходимо найти наибольшее количество идущих подряд цифр - 3"
num = gets.to_i
#puts "Введите строку: "
#str = gets.chomp

case num
when 1 
	puts max 
when 2
	puts min 
when 3
	puts kol 
else
	puts "Ошибка!"
end

=end
