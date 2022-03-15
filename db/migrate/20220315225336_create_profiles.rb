class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.date :birth
      t.string :position
      t.string :project_role
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
