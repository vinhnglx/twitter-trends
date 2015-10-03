require "rails_helper"

RSpec.describe Search, :type => :model do

  context "validations" do
    let(:search) { build(:search) }

    it "requires query" do
      expect(search).to validate_presence_of(:query)
    end
  end

  context "relations" do
    it { should belong_to(:user) }
  end

end
