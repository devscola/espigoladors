class Chance
	include Mongoid::Document

	field :title, type: String
	field :address, type: String
	field :schedule, type: String
end