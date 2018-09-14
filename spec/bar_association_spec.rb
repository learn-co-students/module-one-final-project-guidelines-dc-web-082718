require_relative '../config/environment.rb'

describe "Bar Association" do
  before do
    @bar = Bar.find_or_create_by(name: "Mad Hatter")
  end

  it "Has a name." do
    expect(@bar.name).to eq "Mad Hatter"
  end

  it "has bartenders." do
    expect(@bar.bartenders.size).to eq(3)
  end

  it "has drinks." do
    expect(@bar.drinks.size).to eq(6)
  end 

end
