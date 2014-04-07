class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile_picture
      t.string :twitter_name
      t.string :github_name

      t.timestamps
    end
  end
end
