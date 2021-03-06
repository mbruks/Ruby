current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/Store'
require "#{current_path}/Department_list.rb"
class Department
  attr_accessor :name, :phone, :dep, :post_list

  def initialize (name, phone, posts = Post_list.new(), dep)
    @name = name
    self.phone= phone
    @dep = dep
    @post_list = posts
    @index_dep = 0
  end

  def to_s
    "Name: #{name}\nPhone: #{phone}; \nDep:\n#{dep}\nPosts:#{post_list}\n"
  end

  def phone=(phone)
    if Department.check_phone?(phone)
      @phone = phone
    else raise ArgumentError.new("Некорректный номер телефона!")
    end
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
  
  def Department.check_phone(phone)
    /8\-?([0-9]{3})\-?([ .-]?)([0-9]{3})\2([0-9]{3})/ =~ phone
  end
  
   def set_post(val)
    @post_list.add_note(val)
  end

  def choose_post(index)
    @post_list.choose_note(index)
  end

  def delete_post
    @post_list.delete_note
  end

  def get_post
    @post_list.get_note
  end

  def update_post(new)
    @post_list.change_note(new)
  end

  def vak_posts
    @post_list.find_vak_posts
  end
end

def print_post(post)
  post.each { |x| puts(x) }
end

def read_from_txt(file)
  reg_name = /^"[\w| |,|.]+/
  reg_phone = /8\-?([0-9]{3})\-?([ .-]?)([0-9]{3})\2([0-9]{4})/
  reg_post = /\(["[\w| |,|.|']+"]*\)$/
  post = []
  File.open(file,"r") do |f|
    while (line = f.gets)
      name = reg_name.match(line).to_s
      name[0]=''
      phone = reg_phone.match(line).to_s
      duties = reg_post.match(line).to_s
      pp = Department.find_duties(duties)
      pos = Department.new(name, phone)
      (0..pp.length-1).each { |x| pos.add_post(pp[x]) }
      post.append(pos)
    end
  end
  post
end

def write_to_txt(file, post)
  File.open(file,"w") do |f|
    post.each do |x|
      f.puts "\"#{x.name}\", #{x.phone}, (#{x.post_in_file})"
    end
  end
end

def write_to_yaml(file, post)
  File.open(file,"w") do |f|
    f.puts YAML.dump(post)
  end
  
  def Department.from_yaml(file)
    store = YAML::Store.new file
    deps = ""
    File.open(file,"r") do |f|
      while (line = f.gets)
        deps+= line
      end
    end
    store.load(deps)
  end

  def Department.deserialize_yaml(file)
    Department.from_yaml(file)
  end

  def to_yaml
    d = Department.new(@name,@phone,@duties)
    a = YAML.dump(d)
    a[-15..-2]=""
    t=@post_list.to_yaml[38..@post_list.to_yaml.length-1]
    l=""
    t.each_line { |line| l+="  "+line }
    a + l
  end
  
   def count_vak
    @post_list.find_vak_posts.length
  end
  
  def list_post
    s = ""
    @post_list.each { |p| s += @post_list.index(p).to_s + ". " + p.name + "; должность: " + p.word_vak + "\n" }
    s
  end

  def to_s_big
    "Name: #{name}\nPhone: #{phone}; \nDuties:\n#{duties}Posts:\n#{post_list}\n"
  end
  
end

def read_from_yaml(file)
  docum = YAML::Docum.new file
  post = ""
  File.open(file,"r") do |f|
    while (line = f.gets)
      post+= line
    end
  end
  docum.load(post)
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

#Номер телефона
sotr1.phone = "8-918-574-8544"
puts sotr1



sotr1 = Department.new("Maria", "8-718-433-8558", "Customer")
sotr2 = Department.new("Astra", "8-918-433-8558", "Baker")
print_post(read_from_txt("Department.txt"))

post = read_from_txt("Department_Post.txt")
puts ("Из файла")
print_post(post)
post.append(Department.new("Petya", "8-785-145-5557","Waiters"))

#Работа с YAML файлом
post.append(Department.new("Nikita", "8-785-145-5557","Staff"))
puts "С новым объектом:", post
write_to_yaml("yaml_text.yaml", post)

puts dep.post_list

puts dep
puts "\n\nВакантные должности:\n",dep.vak_posts
puts "\n\nВсе должности:\n",dep.post_list
