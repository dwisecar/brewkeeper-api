class Fermentable < ApplicationRecord
  has_many :recipe_fermentables
  has_many :recipes, through: :recipe_fermentables

  def self.add_og
    self.all.each do |r|
      if !r.potential
        r.potential = 1.074
        r.save
      end
    end
  end
end
