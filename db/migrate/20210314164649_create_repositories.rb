class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.json :body
      t.references :evento
      t.timestamps
    end
  end
end
