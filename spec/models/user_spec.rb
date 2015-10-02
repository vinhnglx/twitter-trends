require "rails_helper"

describe User do

  describe "validations" do
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:provider) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:uid) }
  end

  describe "relations" do
    it { should have_many(:searches) }
  end

end
