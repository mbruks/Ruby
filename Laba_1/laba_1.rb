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
