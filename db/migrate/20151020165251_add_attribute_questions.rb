class AddAttributeQuestions < ActiveRecord::Migration
  def change
    change_column :answers, :votes, :integer, :default => 0
    add_column :questions, :votes, :integer, :default => 0

  end
end
