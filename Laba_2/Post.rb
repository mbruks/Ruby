current_path = File.dirname(__FILE__)
require 'yaml'
require 'yaml/store'
require "#{current_path}/Department_list.rb"
require "#{current_path}/laba_2.rb"

class Post
  def initialize(otdel,name,oklad,vak)
    @otdel = otdel
    @name = name
    @oklad = oklad
    @vakantnost = vak
  end

  attr_accessor :otdel
  attr_accessor :name
  attr_accessor :oklad
  attr_reader :vakantnost

  def vakantnost=(vak)
    if Post.check_vak?(vak)
      @vakantnost = vak
    else raise ArgumentError.new("Vakantnost должна быть 0 или 1s!")
    end
  end

  def Post.check_vak?(vak)
    vak == (0 || 1)
  end
  def Post.word_vak
    if @vakantnost
      "Занята"
    else "Свободна"
    end
  end

  def to_s
    "Отдел: #{otdel};\nНазвание: #{name};\nОклад: #{oklad};\nДолжность: #{Post.word_vak}"
  end
  def to_yaml
      YAML.dump(self)
  end

  def Post.from_yaml(file)
    store = YAML::Store.new file
    posts = ""
    File.open(file,"r") do |f|
      while (line = f.gets)
        posts+= line
      end
    end
    store.load(posts)
  end


end



def yaml_to_file(file,yaml)
  File.open(file,"w") do |f|
    f.puts yaml
  end

end
