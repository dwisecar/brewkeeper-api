class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_fermentables
  has_many :fermentables, through: :recipe_fermentables
  accepts_nested_attributes_for :recipe_fermentables
  has_many :recipe_hops
  has_many :hops, through: :recipe_hops
  accepts_nested_attributes_for :recipe_hops
  has_many :recipe_yeasts
  has_many :yeasts, through: :recipe_yeasts
  has_many :recipe_styles
  has_many :styles, through: :recipe_styles

  def index

  end

  def show

  end

  def create

  end

  def update

  end

  def destroy

  end
  
  private


end
