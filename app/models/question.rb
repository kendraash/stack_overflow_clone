class Question<ActiveRecord::Base
  validates_presence_of :title
  belongs_to :user
  has_many :answers

  default_scope {order('created_at DESC')}
end
