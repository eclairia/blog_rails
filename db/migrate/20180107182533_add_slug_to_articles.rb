class AddSlugToArticles < ActiveRecord::Migration[5.1]
  def up
    add_column :articles, :slug, :string
  end

  def down
    remove_column :articles, :slug
  end
end
