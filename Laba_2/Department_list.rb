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
 end
