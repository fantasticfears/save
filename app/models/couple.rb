class Couple < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :activities
  has_many :statuses

  def add_user(user)
    self.users << user if self.users < 2
  end
end

# == Schema Information
#
# Table name: couples
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
