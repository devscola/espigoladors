module ChancesHelper
  def tag_links(tags)
    tags.split(",").map{ |tag| link_to tag.strip, chance_path(tag.strip), class: 'tag' }.join(", ") 
  end
end