class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string   "title"
      t.string   "from"
      t.string   "to"       #  serialize in model
      t.datetime "schedule"
      t.text     "content"
      t.boolean  "is_sent"
      t.boolean  "visible"
      t.timestamps null: false
    end
  end
end
