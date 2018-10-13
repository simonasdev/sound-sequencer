class CreateSounds < ActiveRecord::Migration[5.2]
  def change
    create_table :sounds do |t|
      t.jsonb 'data', null: false, default: {}
      t.timestamps
    end
  end
end
