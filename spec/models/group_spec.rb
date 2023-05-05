require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    described_class.new(
      id: 1,
      name: 'Education',
      icon: 'picture.png',
      user_id: 1,
      created_at: '29/04/23',
      updated_at: '30/04/23'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with an icon' do
    expect(subject).to be_valid
  end

  it 'has many expenses' do
    expect(subject).to respond_to(:expenses)
  end

  it 'has many group expenses' do
    expect(subject).to respond_to(:group_expenses)
  end
end
