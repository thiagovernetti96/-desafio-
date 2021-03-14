class CreateSenders < ActiveRecord::Migration[6.0]
  def change
    create_table :senders do |t|
      t.json :body
      t.references :evento
      t.timestamps
    end
  end
end
