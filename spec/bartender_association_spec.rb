require_relative '../config/environment.rb'

describe "Bartender Association" do
  before do
    @bartender = Bartender.find_or_create_by(name: "Dru")
  end

  it "Has a name." do
    expect(@bartender.name).to eq "Dru"
  end

  it "has drinks." do
    expect(@bartender.drinks.size).to eq(2)
  end

  it "belongs to a Bar." do
    expect(@bartender.bar.class).to be(Bar)
  end

end
