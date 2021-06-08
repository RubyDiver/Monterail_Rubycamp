# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reservations

  validates_presence_of :name, :age, :email, :real_user
end
