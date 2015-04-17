class Producer
	include Mongoid::Document

	field :food_type, type: String
	field :quantity, type: Integer
	field :expiration, type: DateTime
	field :address, type: String
	field :schedule, type: String
end