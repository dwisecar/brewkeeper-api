brewery_db = BreweryDB::Client.new do |config|
  config.api_key = '76f3c806d6a8023b8a0a8d1aad162299'
end

Style.all.destroy_all
Fermentable.all.destroy_all
Hop.all.destroy_all
Yeast.all.destroy_all

brewery_db.fermentables.all.each do |f|
  Fermentable.create(
    name: f.name,
    description: f.description,
    srm_id: f.srm_id,
    srm_precise: f.srm_precise,
    moisture_content: f.moisture_content,
    course_fine_difference: f.course_fine_difference,
    dry_yield: f.dry_yield,
    potential: f.potential,
    protein: f.protein
  )
end

brewery_db.hops.all.each do |h|
  Hop.create(
    name: h.name,
    description: h.description,
    country_of_origin: h.country_of_origin,
    alpha_acid_min: h.alpha_acid_min,
    beta_acid_min: h.beta_acid_min,
    beta_acid_max: h.beta_acid_max,
    humulene_min: h.humulene_min,
    humulene_max: h.humulene_max,
    caryophyllene_min: h.caryophyllene_min,
    caryophyllene_max: h.caryophyllene_max,
    myrcene_min: h.myrcene_min,
    myrcene_max: h.myrcene_max,
    farnesene_min: h.farnesene_min,
    farnesene_max: h.farnesene_max
  )
end

brewery_db.yeasts.all.each do |y|
  Yeast.create(
    name: y.name,
    description: y.description,
    yeast_type: y.yeast_type,
    attenuation_min: y.attenuation_min,
    attenuation_max: y.attenuation_max,
    ferment_temp_min: y.ferment_temp_min,
    ferment_temp_max: y.ferment_temp_max,
    alcohol_tolerance_min: y.alcohol_tolerance_min,
    alcohol_tolerance_max: y.alcohol_tolerance_max,
    supplier: y.supplier,
    yeast_format: y.yeast_format
  )
end

brewery_db.styles.all.each do |s|
  Style.create(
  name: s.name,
  short_name: s.short_name,
  description: s.description,
  ibu_min: s.ibu_min,
  ibu_max: s.ibu_max,
  abv_min: s.abv_min,
  abv_max: s.abv_max,
  srm_min: s.srm_min,
  srm_max: s.srm_max,
  og: s.og,
  fg_min: s.fg_min,
  fg_max: s.fg_max
  )
end

images = ["red-short", "red-short", "red-short", "pilsner", "pilsner", "stout", "pilsner", "red-short", "red-short", "red-short", "brown", "pale-ale", "red-short", "stout", "stout", "red-tall", "stout", "pale-tall", "pale-tall", "stout", "stout", "pale-ale", "pale-ale", "pale-ale", "red-tall", "red-short", "stout", "pilsner", "pilsner", "brown", "stout", "pilsner", "stout", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "red-tall", "pilsner", "red-short", "red-short", "red-short", "pilsner", "brown", "pilsner", "brown", "pilsner", "pilsner", "pilsner", "pale-tall", "pilsner", "pilsner", "red-short", "red-short", "pilsner", "red-short", "red-short", "red-short", "red-short", "red-short", "stout", "red-short", "brown", "brown", "pilsner", "pilsner", "pilsner", "pilsner", "brown", "brown", "brown", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "red-tall", "pale-ale", "pale-tall", "pale-tall", "pale-tall", "pilsner", "pilsner", "pilsner", "pale-tall", "pale-tall", "pale-tall", "pale-tall", "brown", "brown", "brown", "brown", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "stout", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "pale-tall", "pilsner", "pilsner", "pilsner", "pale-ale", "pale-ale", "pale-ale", "red-short", "brown", "red-short", "stout", "pale-tall", "stout", "brown", "pilsner", "pilsner", "stout", "stout", "stout", "pale-tall", "pale-tall", "pale-tall", "pale-tall", "pale-tall", "pale-tall", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pale-ale", "red-short", "brown", "pale-tall", "pale-tall", "brown", "brown", "red-tall", "red-tall", "red-tall", "pilsner", "pilsner", "pilsner", "pale-ale", "pale-ale"]

i = 0
Style.all.each do |s|
  s.image = images[i]
  s.save
  i + 1
end

two_row = Fermentable.find(47)
two_row.name = "2-Row Pale Malt"
two_row.save

Fermentable.all.each do |f|
  if !f.potential
    f.potential = 1.036
    f.save
  end
end
