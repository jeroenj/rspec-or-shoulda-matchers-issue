class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :groups, null: false, default: []

      t.timestamps null: false
    end
  end
end
