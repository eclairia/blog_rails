class AddCategoreyForeignKeyToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :category, index: true
  end
end
