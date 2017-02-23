require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'db.sqlite3'
)

class ApplicationMigration < ActiveRecord::Migration

  def change
    create_table "ipsums", force: true do |t|
      t.text  "name"
      t.text  "paragraph"
    end
  end

end
