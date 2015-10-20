class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.column :count, :integer
      t.column :user_id, :integer
      t.references :votable, polymorphic: true, index: true
    end
  end
end
