require 'rails_helper'

RSpec.describe CinemaHall, type: :model do

  it { should validate_presence_of(:volume)}
  it { should validate_presence_of(:hall_name)}


end