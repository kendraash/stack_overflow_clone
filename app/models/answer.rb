class Answer<ActiveRecord::Base
  validates_presence_of :content
  belongs_to :question
  belongs_to :user
end
