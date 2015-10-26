# == Schema Information
#
# Table name: costume_variant_images
#
#  id                 :integer          not null, primary key
#  file_id            :string
#  description        :string
#  costume_variant_id :integer          indexed
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_costume_variant_images_on_costume_variant_id  (costume_variant_id)
#

class CostumeVariantImage < ActiveRecord::Base
  # Image Uploader
  attachment :file

  # Belongs to a costume variant
  belongs_to :costume_variant, inverse_of: :costume_variant_images
end
