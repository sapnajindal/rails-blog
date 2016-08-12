class Comment < ActiveRecord::Base
  belongs_to :blog
  validates :commenter, presence: true, length: { minimum: 5 }
  validates_each :commenter do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
  validates :body, presence: true, length: { in: 6..200 }
end
