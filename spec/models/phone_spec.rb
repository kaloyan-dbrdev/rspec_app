require 'spec_helper'

describe Phone do
  it "allows two contacts to share a phone number" do
    create(:home_phone, phone: '785-555-1234')
    expect(build(:home_phone, phone: '785-555-1234')).to be_valid
  end
end
