class Department
  attr_accessor :name, :phone, :post

  def initialize(name, phone, *post)
    @name = name
    @phone = phone
    @post = post
  end

  def to_s
    "#{@name}, #{@phone}, #{@post}"
  end
  
  #Метод добавления обязанности
  def add_post(value)
    @post.append(value)
  end

#Метод выделения обязанности
  def just_post(index)
    @index = index
  end

#Метод удаления обязанности
  def delete_post
    @post.delete(@post[@index])
    @index = -1
  end

#Метод получить текст выделенной обязанности
  def text_post
    @post[@index]
  end

#Метод заменить текст выделенной обязанности
  def change_post(value)
    @post[@index] = value
  end

#Метод вывода
  def print_post
    w = ""
    @post.each_index { |i| w += "#{i}) #{@post[i]}\n" }
    w
  end
  
end

def ask_post(pos)
  puts "Какую обязанность выбрать?"
  puts pos.print_post
  pp = gets.chomp
  pos.just_post(pp.to_i)
end

sotr1 = Department.new("Maria", "8-918-261-02-68")
sotr2 = Department.new("Astra", "8-918-433-85-78")
puts sotr1, sotr2

#Добавление
sotr1.add_post("aaaaa")
puts sotr1
#Удаление
ask_post(sotr1)
sotr1.delete_post
puts sotr1

#Вывести выделенную обязанность
sotr1.just_post(0)
puts sotr1.text_post

#Изменить выделенную обязанность
sotr1.just_post(1)
sotr1.change_post("KAKA")
puts sotr1
