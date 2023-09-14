require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validate category" do
    it "should create a valid category" do
    catagory = Category.new(name: "Time pass")
    expect(catagory.valid?).to be(true)
    end
  end

  describe "validating categories" do
    it 'name should be present' do
      category = Category.new()
      expect(category.save).to be(false)
    end
    it 'name should be unique' do
      category1 = Category.new(name: "Time Pass")
      category1.save
      category2 = Category.new(name: "Time Pass")
      expect(category2.save).to be(false)
    end

    it 'name should be not too long' do
      category = Category.new(name: "neeeeeeeeeeeewwwwwwwwwwwwwww")
      expect(category.save).to be(false)
    end
    it 'name should be not too short' do
      category = Category.new(name: "hi")
      expect(category.save).to be(false)
    end


  end

end