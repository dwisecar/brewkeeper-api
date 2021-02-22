class FermentableSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category_display, :srm_id, :srm_precise, :moisture_content, :course_fine_difference, :dry_yield, :potential, :protein
end
