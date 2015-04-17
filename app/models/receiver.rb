class Receiver
	include Mongoid::Document

	field :food_type, type: String
	field :quantity, type: Integer
	field :maximum_storage_time, type: String
	field :address, type: String
	field :time, type: String
	field :people, type: Integer

end