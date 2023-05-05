require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'John') }
  let(:group) { Group.create(name: 'Education', user:) }

  subject do
    described_class.new(
      name: 'Books',
      amount: 100,
      author: user
    )
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a negative amount' do
    subject.amount = -100
    expect(subject).to_not be_valid
  end

  it 'is valid with a zero amount' do
    subject.amount = 0
    expect(subject).to be_valid
  end

  it 'is valid with a positive amount' do
    subject.amount = 100
    expect(subject).to be_valid
  end

  it 'belongs to an author' do
    expect(subject.author).to eq(user)
  end

  it 'has many groups through group expenses' do
    subject.groups << group
    expect(subject.groups).to eq([group])
  end
end
