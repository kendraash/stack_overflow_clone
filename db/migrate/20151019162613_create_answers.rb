class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.column :content, :text
      t.column :votes, :integer
      t.column :user_id, :integer
      t.column :question_id, :integer

      t.timestamps
    end
  end
end
