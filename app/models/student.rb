class Student
    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(testname, status, instructor)
        BoatingTest.new(self, testname, status, instructor)
    end

    def boating_tests
        BoatingTest.all.select{|bt| bt.student == self}
    end

    def all_instructors
        self.boating_tests.map{|bt| bt.instructor}
    end

    def self.find_student(name)
        self.all.find{|students| students.first_name == name}
    end

    def grade_percentage 
        pass = self.boating_tests.select{|bt| bt.status == "pass"}.count
        all = self.boating_tests.count
        (pass/all.to_f).round(2)
    end

end