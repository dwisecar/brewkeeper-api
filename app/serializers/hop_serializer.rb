class HopSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :country_of_origin, :alpha_acid_min, :beta_acid_min, :beta_acid_max, :humulene_min, :humulene_max, :caryophyllene_min, :caryophyllene_max, :cohumulone_min, :cohumulone_max, :myrcene_min, :myrcene_max, :farnesene_min, :farnesene_max
end
