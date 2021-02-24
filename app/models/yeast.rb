class Yeast < ApplicationRecord
  has_many :recipe_yeasts
  has_many :recipes, through: :recipe_yeasts

  def self.yo 
    Yeast.create(
      "name": "California Lager",
      "description": "Wyeast 2112 California Lager is particularly suited for producing 19th century-style West Coast beers.",
      "yeast_type": "ale",
      "attenuation_min": 67,
      "attenuation_max": 71,
      "ferment_temp_min": 58,
      "ferment_temp_max": 68,
      # "alcohol_tolerance_min": ,
      # "alcohol_tolerance_max": ,
      "supplier": "Wyeast",
      "yeast_format": "liquid"
    )
  end
end
