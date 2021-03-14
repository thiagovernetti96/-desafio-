class CreateEventos < ActiveRecord::Migration[6.0]
  def change
    create_table :eventos do |t|
      t.json :body
      t.integer :evento
      t.timestamps
    end
  end
end
