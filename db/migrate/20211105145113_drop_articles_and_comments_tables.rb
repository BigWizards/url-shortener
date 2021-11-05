class DropArticlesAndCommentsTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :articles, force: :cascade
    drop_table :comments
  end
end
