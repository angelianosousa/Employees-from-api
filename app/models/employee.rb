class Employee < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  
  paginates_per 12

  def full_name
    "#{self.title} #{self.firstname} #{self.lastname}"
  end
end
