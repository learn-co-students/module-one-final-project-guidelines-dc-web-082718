require_relative '../config/environment.rb'

describe User do

  subject do
    User.find_or_create_by(name: 'testname', username: 'testuser', password: 'testpassword')
  end

  describe 'attributes' do

    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:username) }
    it { is_expected.to respond_to(:age) }

  end

end

describe Movie do

  describe 'attributes' do

    subject do
      Movie.find(1)
    end

    describe "name" do
      it "is a string" do
        expect(subject.name).to be_a(String)
      end
    end

    describe "slug" do
      it "is downcase" do
        expect(subject.slug).to eql(subject.slug.downcase)
      end
    end

  end

  describe 'methods' do

    describe 'order_by_tomatometer' do
      it 'returns a list of movie objects' do
        expect(Movie.order_by_tomatometer).to start_with(Movie.order(tomatometer: :desc).first)
      end
    end

    describe 'top_ten' do
      it 'only has ten items in it' do
        expect(Movie.top_ten.length).to eql(10)
      end
    end

    describe 'worst' do
      it 'returns the lowest rated movie' do
        expect(Movie.worst).to eql(Movie.order(tomatometer: :asc).first)
      end
    end

    describe 'family_friendly' do
      it 'returns an array' do
        expect(Movie.family_friendly).to be_instance_of(Array)
      end
    end

  end

end
