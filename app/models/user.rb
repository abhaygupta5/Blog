class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :posts
  has_many :comments
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png", validate_media_type: false
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_attached_file :timeline, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", validate_media_type: false
  	validates_attachment_content_type :timeline, content_type: /\Aimage\/.*\z/
end
