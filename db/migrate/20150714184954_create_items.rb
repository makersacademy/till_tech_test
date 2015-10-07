class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description

    end
  end
end
