class Status < ActiveRecord::Base
  belongs_to :user
end

# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  content    :string           default(""), not null
#  stress     :string           default(""), not null
#  details    :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
