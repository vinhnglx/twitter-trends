require "rails_helper"

RSpec.describe User, :type => :model do

  context "validations" do
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:provider) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:uid) }
  end

  context "relations" do
    it { should have_many(:searches) }
  end

  context "find_or_create_from_auth_hash" do

    let(:twitter_hash) do
      {
        uid: '123abcde',
        image: 'http://example.com/example.png',
        token: 'th1s-is-t0k3n',
        secret: 'th4t-is-s3cr3t'
      }
    end

    let(:user) { User.find_or_create_from_auth_hash(mock_auth_hash(twitter_hash)) }

    it "returns a user's attributes" do
      expect(user.provider).to eq("twitter")
      expect(user.uid).to eq(twitter_hash[:uid])
      expect(user.access_token).to eq(twitter_hash[:token])
      expect(user.twitter_secret).to eq(twitter_hash[:secret])
      expect(user.avatar).to eq(twitter_hash[:image])
    end

  end

end
