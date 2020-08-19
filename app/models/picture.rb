class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :image_or_text, presence: true

  private
  def image_or_text
    image.presence or text.presence
  end
end
