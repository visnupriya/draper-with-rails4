class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :published_by
      t.datetime :published_at
      t.boolean :published

      t.timestamps
    end
  end
end
