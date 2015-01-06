class Activity < ActiveRecord::Base
  has_and_belongs_to_many :couples
end

# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  content    :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
