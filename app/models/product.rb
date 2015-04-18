class Product
  include Mongoid::Document
  include Mongoid::Search

  field :food_type
  field :quantity
  field :expiration
  #field :refrigeration, type: Boolean, :default => False

  belongs_to :chance
  has_and_belongs_to_many :tags

  search_in :food_type, :tags => :name

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
 
  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by(name: name).products
  end

end