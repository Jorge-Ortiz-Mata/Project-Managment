class CreateConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :connections do |t|
      t.references :project, null: false, foreign_key: true
      t.references :worker, references: :users, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
