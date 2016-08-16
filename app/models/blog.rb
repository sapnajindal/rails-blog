# == Schema Information
#
# Table name: blogs
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  text       :text(65535)
#  title      :string(255)
#  updated_at :datetime         not null
#

class Blog < ActiveRecord::Base
  has_many :comments, dependent: :delete_all
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { in: 6..200 }
end
