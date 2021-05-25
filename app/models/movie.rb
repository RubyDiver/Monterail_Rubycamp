class Movie < ApplicationRecord

  has_many :seances

  validates_presence_of :name, :genre
end
