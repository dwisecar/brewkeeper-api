# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brewery_db = BreweryDB::Client.new do |config|
  config.api_key = '76f3c806d6a8023b8a0a8d1aad162299'
end

# brewery_db.fermentables.all.each do |f|
#   Fermentable.create(
#     name: f.name,
#     description: f.description,
#     srm_id: f.srm_id,
#     srm_precise: f.srm_precise,
#     moisture_content: f.moisture_content,
#     course_fine_difference: f.course_fine_difference,
#     dry_yield: f.dry_yield,
#     potential: f.potential,
#     protein: f.protein
#   )
# end

# brewery_db.hops.all.each do |h|
#   Hop.create(
#     name: h.name,
#     description: h.description,
#     country_of_origin: h.country_of_origin,
#     alpha_acid_min: h.alpha_acid_min,
#     beta_acid_min: h.beta_acid_min,
#     beta_acid_max: h.beta_acid_max,
#     humulene_min: h.humulene_min,
#     humulene_max: h.humulene_max,
#     caryophyllene_min: h.caryophyllene_min,
#     caryophyllene_max: h.caryophyllene_max,
#     myrcene_min: h.myrcene_min,
#     myrcene_max: h.myrcene_max,
#     farnesene_min: h.farnesene_min,
#     farnesene_max: h.farnesene_max
#   )
# end

# brewery_db.yeasts.all.each do |y|
#   Yeast.create(
#     name: y.name,
#     description: y.description,
#     yeast_type: y.yeast_type,
#     attenuation_min: y.attenuation_min,
#     attenuation_max: y.attenuation_max,
#     ferment_temp_min: y.ferment_temp_min,
#     ferment_temp_max: y.ferment_temp_max,
#     alcohol_tolerance_min: y.alcohol_tolerance_min,
#     alcohol_tolerance_max: y.alcohol_tolerance_max,
#     supplier: y.supplier,
#     yeast_format: y.yeast_format
#   )
# end

# brewery_db.styles.all.each do |s|
#   Style.create(
#   name: s.name,
#   short_name: s.short_name,
#   description: s.description,
#   ibu_min: s.ibu_min,
#   ibu_max: s.ibu_max,
#   abv_min: s.abv_min,
#   abv_max: s.abv_max,
#   srm_min: s.srm_min,
#   srm_max: s.srm_max,
#   og: s.og,
#   fg_min: s.fg_min,
#   fg_max: s.fg_max
#   )
# end
