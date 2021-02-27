class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_fermentables, dependent: :destroy
  has_many :fermentables, through: :recipe_fermentables
  accepts_nested_attributes_for :recipe_fermentables
  has_many :recipe_hops, dependent: :destroy
  has_many :hops, through: :recipe_hops
  accepts_nested_attributes_for :recipe_hops
  has_many :recipe_yeasts, dependent: :destroy
  has_many :yeasts, through: :recipe_yeasts
  accepts_nested_attributes_for :recipe_yeasts
  has_many :recipe_styles, dependent: :destroy
  has_many :styles, through: :recipe_styles
  accepts_nested_attributes_for :recipe_styles
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates_presence_of [:name, :volume]


  def average_rating
    '%.2f' % (self.ratings.map{|r| r.stars }.sum.to_f / self.ratings.length)
  end

  def original_gravity
    total_potential = self.recipe_fermentables.sum {|f| f.amount.to_f * ((f.fermentable.potential.to_f * 1000) - 1000)}
    efficiency = (total_potential * 0.75) * (self.recipe_yeasts.first.yeast.attenuation_min * 0.01)
    (((efficiency / self.volume) / 1000) + 1).round(3)
  end

  def final_gravity
    rate = ((self.original_gravity * 1000) - 1000) * 0.25
    ((rate + 1000) * 0.001).round(3)
  end

  def abv 
    ((self.original_gravity - self.final_gravity) * 131.25).round(2)
  end

  def ibu
    ga = (self.original_gravity - 1.050) / 0.2
    boil_hops = self.recipe_hops.select {|h|h.boil_addition == true}
    ibus = boil_hops.sum do |h|
        utilization = 18.11 + (13.86 * Math.tanh((h.addition_time - 31.21) / 18.27))
        (h.amount * (utilization * 0.01) * (h.hop.alpha_acid_min * 0.01) * 7462) / (self.volume * (1 + ga))
    end
    ibus.round(1)
  end

  def srm
    mcu = self.recipe_fermentables.sum {|f| (f.fermentable.srm_id * f.amount) / self.volume }
    (1.4922 * (mcu ** 0.6859)).round()
  end

end
