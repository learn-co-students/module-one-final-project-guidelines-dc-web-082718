require_relative '../config/environment.rb'

describe "Bar" do

  let (:checker) {Bar.new(name: "NewBar")}

  it "Has a name." do
    expect(checker.name).to eq "NewBar"
  end

  it "Is a Bar." do
    expect(checker.class).to be Bar
  end

end
