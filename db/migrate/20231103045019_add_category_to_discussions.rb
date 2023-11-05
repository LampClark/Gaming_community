class AddCategoryToDiscussions < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :category, :string
  end
end
