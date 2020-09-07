class Taco < ApplicationRecord
	enum meat: %i[Chicken Steak Carnitas]

	#validates :notes, presence: true
end
