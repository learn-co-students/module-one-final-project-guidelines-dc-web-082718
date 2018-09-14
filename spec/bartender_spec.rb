require_relative '../config/environment.rb'

describe "Bartender" do

  let (:checker) {Bartender.new(name: "NewBartender")}

  it "Has a name." do
    expect(checker.name).to eq "NewBartender"
  end

  it "Is a Bartender." do
    expect(checker.class).to be Bartender
  end

end
