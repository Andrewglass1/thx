class CreateThanks < ActiveRecord::Migration
  def change
    create_table :thanks do |t|
      t.references :sender
      t.references :recipient
      t.text :message

      t.timestamps
    end
  end
end
