class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      t.column(:name, :string)
      t.column(:park_type, :string)
      t.column(:info, :text)
      t.column(:state_id, :integer)

      t.timestamps
    end
  end
end
