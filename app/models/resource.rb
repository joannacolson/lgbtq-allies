class Resource < ApplicationRecord
	has_and_belongs_to_many :categories

	geocoded_by :address
	after_validation :geocode
end
