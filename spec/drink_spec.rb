require_relative '../config/environment.rb'

describe "Drink" do

  let (:checker) {Drink.new(name: "Coffee")}

  it "Has a name." do
    expect(checker.name).to eq "Coffee"
  end

  it "Is a Drink." do
    expect(checker.class).to be Drink
  end

end
