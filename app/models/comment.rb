# -*- SkipSchemaAnnotations
class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.commenter == "Bad"
      record.errors[:base] << "Bad cannot be the name"
    end
  end
end


class Comment < ActiveRecord::Base
  belongs_to :blog
  validates :commenter, presence: true, length: { minimum: 3, message: "commenter should be min 3 in length"}
  validates_each :commenter do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
  validates :body, presence: true, length: { in: 6..200 }
  validates_with GoodnessValidator
  before_create do
    puts ">>>>>>>Comment Created!"
  end
end
