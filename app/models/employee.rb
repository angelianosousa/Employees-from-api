class Employee < ApplicationRecord
  paginates_per 12

  def full_name
    "#{self.title} #{self.firstname} #{self.lastname}"
  end
end
