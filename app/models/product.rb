class Product
  include Mongoid::Document

  field :food_type
  field :quantity
  field :expiration
  #field :refrigeration, type: Boolean, :default => False

  belongs_to :chance
  has_and_belongs_to_many :tags

  index "food_type" => 1

end