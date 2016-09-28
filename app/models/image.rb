class Image < ApplicationRecord
  has_and_belongs_to_many :tags
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "350x350#"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, :address, :presence => true
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
