class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.integer :number
      t.integer :project_id
      t.integer :owner_id
      t.integer :executor_id
      t.string :priority
      t.string :gravity
      t.string :frequency
      t.string :product_version
      t.string :category_id
      t.date :send_date
      t.string :os
      t.string :os_version
      t.string :platform
      t.string :visibility
      t.integer :status_id
      t.integer :resolution_id
      t.string :version_code
      t.integer :issue_type_id
      t.text :summary
      t.timestamps
    end
  end
end
