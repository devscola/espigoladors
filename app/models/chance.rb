class Chance
	include Mongoid::Document
	has_many :products
	has_and_belongs_to_many :tags

	accepts_nested_attributes_for :products

	field :title, type: String
	field :address, type: String
	field :schedule, type: String
	field :email, type: String
end