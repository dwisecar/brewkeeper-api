class YeastSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :yeast_type, :attenuation_min, :attenuation_max, :ferment_temp_min, :ferment_temp_max, :alcohol_tolerance_min, :alcohol_tolerance_max, :supplier, :yeast_format
end
