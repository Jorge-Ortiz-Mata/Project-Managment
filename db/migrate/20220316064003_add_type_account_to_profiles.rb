class AddTypeAccountToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :plan, :string
  end
end
