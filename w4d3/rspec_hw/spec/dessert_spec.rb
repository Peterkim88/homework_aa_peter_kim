require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Peter") }
  let(:cake) { Dessert.new("cream cake", 20, chef) }

  describe "#initialize" do

    it "sets a type" do
      expect(cake.type).to eq("cream cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(20)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cream cake", "20", chef) }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do

    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("flour")
      expect(cake.ingredients).to include("flour")
    end

  end

  describe "#mix!" do

    it "shuffles the ingredient array" do
    ingredients = ["dough", "milk", "eggs", "yeast"]

    ingredients.each { |ingredient| cake.add_ingredient(ingredient) }

    expect(cake.ingredients).to eq(ingredients)
    cake.mix!
    expect(cake.ingredients).not_to eq(ingredients)
    expect(cake.ingredients.sort).to eq(ingredients.sort)
    end

  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      cake.eat(10)
      expect(cake.quantity).to eq(10)
    end
  
    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(21) }.to raise_error("not enough left!")
    end

  end

  describe "#serve" do

    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Peter the Great Baker")
      expect(cake.serve).to eq("Chef Peter the Great Baker has made 20 cream cakes!")
    end

  end

  describe "#make_more" do

    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end

  end

end
