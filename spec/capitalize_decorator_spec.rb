require_relative "../capitalize_decorator"
require_relative "../person"

describe CapitalizeDecorator do
  let(:person) { Person.new(18, "Roniy", 1) }
  let(:decorator) { CapitalizeDecorator.new(person) }

  describe "#correct_name" do
    it "should return the correct name" do
      expect(decorator.correct_name).to eq("Roniy")
    end
  end
  
  describe "#correct_name=" do
    it "should set the correct name" do
      person.name = "Rebecca"
      expect(decorator.correct_name).to eq("Rebecca")
    end
  end
end