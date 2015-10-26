# == Schema Information
#
# Table name: sections
#
#  id           :integer          not null, primary key
#  section_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  image_id     :string
#  slug         :string           indexed
#
# Indexes
#
#  index_sections_on_slug  (slug) UNIQUE
#

class Section < ActiveRecord::Base
  # Pretty URLs using section names
  extend FriendlyId
  friendly_id :section_name, use: :slugged

  # Image Uploader
  attachment :image

  # Has many costumes
  has_many :costumes, -> {order(:name)}, inverse_of: :section
end
