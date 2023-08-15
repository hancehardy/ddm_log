class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.float :contract_amount
      t.date :contract_date
      t.boolean :status

      t.timestamps
    end
  end
end
