class AddCategoryToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :category, :string, default: "none", null: false
  end
end
