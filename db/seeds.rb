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

images = ["pale-ale", "pale-ale", "red-short", "red-short", "red-short", "pilsner", "pilsner", "red-short", "red-short", "red-short", "red-short", "brown", "brown", "pale-ale", "red-short", "stout", "red-short", "stout", "stout", "stout", "stout", "red-tall", "stout", "stout", "pale-tall", "pale-tall", "pale-tall", "stout", "pale-ale", "pale-ale", "pale-ale", "red-tall", "red-short", "brown", "pilsner", "pilsner", "brown", "stout", "pilsner", "pilsner", "stout", "stout", "stout", "stout", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "red-tall", "pilsner", "red-short", "red-short", "red-short", "brown", "pilsner", "pale-tall", "pale-tall", "brown", "pilsner", "pilsner", "pilsner", "pale-ale", "pilsner", "pilsner", "red-short", "red-short", "pale-tall", "pale-tall", "pilsner", "pilsner", "pilsner", "red-short", "red-short", "pilsner", "red-short", "red-short", "red-short", "stout", "red-short", "red-short", "brown", "brown", "brown", "brown", "brown", "brown", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "red-tall", "pilsner", "stout", "pilsner", "pilsner", "pilsner", "pale-ale", "pale-tall", "pale-tall", "pale-tall", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pale-tall", "pale-tall", "pale-tall", "pale-tall", "pale-tall", "brown", "brown", "brown", "brown", "brown", "brown", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "pale-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "pale-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "stout", "red-tall", "red-tall", "red-tall", "red-tall", "red-tall", "pale-tall", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pilsner", "pale-tall", "pale-ale", "pale-ale", "pale-ale", "pale-tall"] 
i = 0
Style.all.each do |s|
  s.image = images[i]
  s.save
  i + 1
end

Fermentable.all.each do |f|
  if !f.potential
    f.potential = 1.036
  end
  if !f.srm_id
    f.srm_id = 4
  end
  f.save
end

f = Fermentable.all.find_by(name: "Two-Row Pale Malt")
f.name = "2-Row Pale Malt"
f.save

hop_aa = [13.0, 8.0, 14.0, 5.5, 5.5, 6.0, 6.5, 12.0, 11.0, 3.5, 4.0, 11.0, 3.3, 4.0, 5.0, 6.5, 15.0, 2.0, 4.8, 13.0, 14.0, 4.0, 4.1, 4.0, 3.5, 10.2, 3.0, 3.0, 6.0, 12.0, 7.0, 3.0, 4.0, 14.0, 15.5, 11.5, 6.0, 12.0, 8.0, 3.0, 12.0, 4.5, 3.0, 17.5, 4.0, 15.0, 4.0, 8.0, 8.0, 8.0, 8.0] 
j = 0
Hop.all.each do |h|
  h.alpha_acid_min = hop_aa[j]
  h.save
  j + 1
end

Yeast.all.each do |y|
  if !y.attenuation_min
    y.attenuation_min = 72
  end
  if !y.attenuation_max
    y.attenuation_max = 75
  end
  y.save
end