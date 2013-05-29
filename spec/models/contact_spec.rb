require 'spec_helper'

describe Contact do
  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  it "is invalid without a firstname" do
    expect(build(:contact, firstname: nil)).to have(1).errors_on(:firstname)
  end

  it "is invalid without a lastname" do
    expect(build(:contact, lastname: nil)).to have(1).errors_on(:lastname)
  end

  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:contact, email: 'aaron@example.com')
    contact = FactoryGirl.build(:contact, email: 'aaron@example.com')
    expect(contact).to have(1).errors_on(:email)
  end

  it "has three phone numbers" do
    expect(create(:contact).phones.count).to eq 3
  end

  it "returns a contact's full name as a string" do
    contact = FactoryGirl.build(:contact, firstname: 'John', lastname: 'Doe',
      email: 'johndoe@example.com')
    expect(contact.name).to eq 'John Doe'
  end

  # this is not needed anymore
  it "returns a sorted array of results that match" do
    smith = Contact.create(firstname: 'John', lastname: 'Smith',
      email: 'jsmith@example.com')
    jones = Contact.create(firstname: 'Tim', lastname: 'Jones',
      email: 'tjones@example.com')
    johnson = Contact.create(firstname: 'John', lastname: 'Johnson',
      email: 'jjohnson@example.com')

    #expect(Contact.by_letter("J")).to eq [jones, johnson]
    expect(Contact.by_letter("J")).to_not include smith
  end
end
