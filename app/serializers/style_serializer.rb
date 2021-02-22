class StyleSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_name, :description, :ibu_min, :ibu_max, :abv_min, :abv_max, :srm_min, :srm_max, :og, :fg_min, :fg_max
end
