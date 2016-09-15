class Image < ApplicationRecord
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "500x500>"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, :presence => true
end
