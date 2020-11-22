require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

s1 = Student.new("Randy")
s2 = Student.new("Willow")

i1 = Instructor.new("Boballa")
i2 = Instructor.new("Smurfina")         

b1 = BoatingTest.new(s1, "Sail Folding", "pass", i1)
b2 = BoatingTest.new(s2, "Capsizing", "pass", i1)
b3 = BoatingTest.new(s1, "Water Stuff", "pass", i2)
b4 = BoatingTest.new(s1, "Capsizing", "fail", i1)
b5 = BoatingTest.new(s2, "Eating Lunch", "pass", i1)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line