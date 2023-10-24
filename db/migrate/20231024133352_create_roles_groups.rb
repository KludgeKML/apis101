class CreateRolesGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :roles_groups do |t|
      t.references :role, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
