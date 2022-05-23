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
 end
