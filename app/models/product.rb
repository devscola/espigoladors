class Product
  include Mongoid::Document

  field :food_type
  field :quantity
  field :expiration
  #field :refrigeration, type: Boolean, :default => False

  belongs_to :chance
end