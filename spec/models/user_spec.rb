# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(name: "Paweł", age: 24, email: "pawel@example.com", real_user: true)}

  it 'create user with valid and correct info' do
    expect(user).to be_valid
  end

  it 'create user not valid without name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'create user not valid without age' do
    user.age = nil
    expect(user).not_to be_valid
  end

  it 'create user not valid without email' do
    user.email = nil
    expect(user).not_to be_valid
  end
end
