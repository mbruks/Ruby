current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/laba_2.rb"

class Department_list
  def initialize(*list)
    @dep_list = Array.new
    list.each { |i| add_note(i) }
    @index = 0
  end
  
    # добавить запись
  def add_note(dep) 
    @dep_list.append(dep)
  end

  # выделить запись
  def choose_note(index)
    @index = index
  end

  # заменить запись
  def change_note(new_dep)
    @dep_list[@index] = new_dep
  end

  # возвращающий выбранную запись
  def get_note
    @dep_list[@index]
  end

  # удаляющий выбранную запись
  def delete_note
    @dep_list.delete_at(@index)
    @index-=1
  end

  def to_s
    s = "\n"
    @dep_list.each_index { |i| s += "#{i}}  "+@dep_list[i].to_s }
    s
  end
  
  def Department_list.from_txt(file)
    reg_name = /^"[\w| |,|.]+/
    reg_phone = /8\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
    reg_duties = /\(["[\w| |,|.]+"]*\)$/
    deps = Department_list.new
    File.open(file,"r") do |f|
      while (line = f.gets)
        name = reg_name.match(line).to_s
        name[0]=''
        phone = reg_phone.match(line).to_s
        duties = reg_duties.match(line).to_s
        d = find_duties(duties)
        dep = Department.new(name, phone)
        (0..d.length-1).each { |x| dep.set_duty(d[x]) }
        deps.add_note(dep)
      end
    end
    deps
  end

  def each
    @dep_list.each  do |dep|
     yield dep
    end
  end

  def Department_list.to_txt(file, deps)
    File.open(file,"w") do |f|
      deps.each do |x|
        f.puts "\"#{x.name}\", #{x.phone}, (#{x.duties_for_txt})"
      end
    end
  end

  def Department_list.from_yaml(file)
    store = YAML::Store.new file
    arr_lines = ""
    File.open(file,"r") do |f|
      while (line = f.gets)
        arr_lines+= line
      end
    end
    deps = store.load(arr_lines)
    d = Department_list.new
    deps.each { |i| d.add_note(i) }
    d
  end

  def Department_list.to_yaml(file, deps)
    File.open(file,"w") do |f|
      f.puts YAML.dump(deps)
    end
  end
  
   def Department_list.deserialize_yaml(file)
    @index = 0
    @dep_list = Department_list.from_yaml(file)
  end

  def Department_list.deserialize_txt(file)
    @index = 0
    @dep_list = Department_list.from_txt(file)
  end
  
  def sort_notes_by_name!
    @dep_list.sort! {|a, b| a.name <=> b.name}
  end
 end


=begin
b = Department_list.from_yaml "yaml_text.yaml"
puts b
Department_list.to_txt("Department.txt",b)
a = Department_list.from_txt("Department.txt")
puts a
Department_list.to_yaml("yaml_text.yaml",a)
end
c=Department_list.deserialize_yaml "yaml_text.yaml"
puts "c", c
d=Department_list.deserialize_txt "Department.txt"
puts "d", d
