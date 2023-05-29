class RemoveTextFromPrototypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :prototypes, :text, :text
  end
end
