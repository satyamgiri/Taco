require 'rails_helper'

RSpec.describe Taco, type: :model do
  it { should define_enum_for(:meat).with_values(%i[Chicken Steak Carnitas]) }
end
