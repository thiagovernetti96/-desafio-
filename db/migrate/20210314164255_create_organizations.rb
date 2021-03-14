class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.json :body
      t.references :evento

      t.timestamps
    end
  end
end
