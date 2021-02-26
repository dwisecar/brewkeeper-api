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

end
