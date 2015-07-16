
class Photographer < ActiveRecord::Base
  unless ActiveRecord::Base.connection.table_exists?(:photographers)
    ActiveRecord::Base.connection.create_table :photographers do |t|
      t.string :name
    end
  end
end