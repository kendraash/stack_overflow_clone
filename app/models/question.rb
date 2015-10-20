class Question<ActiveRecord::Base
  validates_presence_of :title
  belongs_to :user
  has_many :answers

  default_scope {order('created_at DESC')}

  before_save :append_question_mark

  private
  def append_question_mark
    unless self.title.scan(/[?]/).any?
      self.title += "?"
    end
  end
end
