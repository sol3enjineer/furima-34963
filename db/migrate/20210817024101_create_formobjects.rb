class CreateFormobjects < ActiveRecord::Migration[6.0]
  def change
    create_table :formobjects do |t|

      t.timestamps
    end
  end
end
