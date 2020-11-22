class Instructor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def boating_tests
        BoatingTest.all.select{|bt| bt.instructor == self}
    end

    def passed_students
        self.boating_tests.select{|bt| bt.status == "pass"}.map{|bt| bt.student}.uniq
    end

    def pass_student(student, testname)
        test = BoatingTest.all.find{|bt| bt.student == student && bt.testname == testname} 
        if test == nil
            test = BoatingTest.new(student, testname, "pass", self)     
        else
            test.status = "pass"   
        end
        test
        #  More concise, all on one line but not pretty!

        #   BoatingTest.all.find{|bt| bt.student == student && bt.testname == testname} ? BoatingTest.all.find{|bt| bt.student == student && bt.testname == testname}.status = "pass" : BoatingTest.new(student, testname, "pass", self)
    end

    def fail_student(student, testname)
        test = BoatingTest.all.find{|bt| bt.student == student && bt.testname == testname} 
        if test == nil
            test = BoatingTest.new(student, testname, "fail", self)     
        else
            test.status = "fail"   
        end
        test
    end

    def all_students
        self.boating_tests.map{|bt| bt.student}
    end
end
