class User < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :images
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg image/png)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
