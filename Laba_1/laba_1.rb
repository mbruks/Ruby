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
