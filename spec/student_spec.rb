require "rspec"
require "./student"

describe Student do
  before(:each) do
    @student = Student.new(25, "Rebecca", nil, "Maths")
  end
  context "when creating a new book" do
    it "should create a new student" do
      student = Student.new(25, "Rebecca", nil, "Maths")
      expect(student.class.name).to eq("Student")
    end

    it "student should play hooky" do
      expect(@student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
