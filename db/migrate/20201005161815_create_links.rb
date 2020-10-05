class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :lookup_code
      t.string :orginal_url

      t.timestamps
    end
  end
end
