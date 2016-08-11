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
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
end
