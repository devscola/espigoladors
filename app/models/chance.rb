class Chance
	include Mongoid::Document
	has_many :products

	accepts_nested_attributes_for :products

	field :title, type: String
	field :address, type: String
	field :schedule, type: String
end