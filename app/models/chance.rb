class Chance
  include Mongoid::Document
  include Mongoid::Search

  has_many :products
  #has_and_belongs_to_many :tags

  accepts_nested_attributes_for :products

  field :title, type: String
  field :address, type: String
  field :schedule, type: String
  field :email, type: String


  search_in :products => :food_type

  # def all_tags=(names)
  #   self.tags = names.split(",").map do |name|
  #     Tag.where(name: name.strip).first_or_create!
  #   end
  # end
 
  # def all_tags
  #   self.tags.map(&:name).join(", ")
  # end

  # def self.tagged_with(name)
  #   Tag.find_by(name: name).chances
  # end

end