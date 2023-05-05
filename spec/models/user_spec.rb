require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'John Doe', email: 'john@example.com', password: 'password') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'has many expenses' do
    expect(subject).to respond_to(:expenses)
  end

  it 'has many groups' do
    expect(subject).to respond_to(:groups)
  end
end
