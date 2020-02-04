class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash,k| hash[k] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            true
        else
            false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        (@students.length / @teachers.length)
    end

    def add_grade(student, grade)
        return false if !enrolled?(student)
        @grades[student] << grade
        true
    end

    def num_grades(student)
        @grades[student].count
    end

    def average_grade(student)
        @grades[student].length > 0 ? @grades[student].sum / @grades[student].length : nil
    end
end
