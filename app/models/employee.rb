class Employee < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  paginates_per 12

  validates :title, :email, :gender, presence: true

  def full_name
    "#{self.title} #{self.firstname} #{self.lastname}"
  end
end
