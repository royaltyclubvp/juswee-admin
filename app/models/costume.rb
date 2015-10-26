# == Schema Information
#
# Table name: costumes
#
#  id         :integer          not null, primary key
#  section_id :integer          indexed
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :string
#  slug       :string           indexed
#
# Indexes
#
#  index_costumes_on_section_id  (section_id)
#  index_costumes_on_slug        (slug) UNIQUE
#

class Costume < ActiveRecord::Base
  # Pretty URLs using costume names
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Image Uploader
  attachment :image

  # Belongs to a section
  belongs_to :section, inverse_of: :costumes

  # Has many costume variants
  has_many :costume_variants, inverse_of: :costume
end
