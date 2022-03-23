class Department
  attr_accessor :name, :phone

  def initialize(name, phone, post)
    @name = name
    @phone = phone
    @post = post
  end

  def to_s
    "#{@name}, #{@phone}, #{@post}"
  end
  
end

sotr1 = Department.new("Maria", "8-918-261-02-68")
sotr2 = Department.new("Astra", "8-918-433-85-78")
puts sotr1, sotr2
