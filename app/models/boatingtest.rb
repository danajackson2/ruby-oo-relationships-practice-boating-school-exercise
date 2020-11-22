class BoatingTest
    attr_reader :student, :testname, :instructor
    attr_accessor :status

    @@all = []

    def initialize(student, testname, status, instructor)
        @student = student
        @testname = testname
        @status = status
        @instructor = instructor
        @@all << self
    end

    def self.all
        @@all
    end
end
