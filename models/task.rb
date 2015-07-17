
class User < ActiveRecord::Base
  unless ActiveRecord::Base.connection.table_exists?(:users)
    ActiveRecord::Base.connection.create_table :users do |t|
      t.text :admin
      t.text :password
    end
  end
end

# User.create({admin:"sammers", password:"DeadMau5"})

class Photographer < ActiveRecord::Base
  has_many :photos
  unless ActiveRecord::Base.connection.table_exists?(:photographers)
    ActiveRecord::Base.connection.create_table :photographers do |t|
      t.string :name
      t.text :about
    end
  end
end


class Photo < ActiveRecord::Base
  has_and_belongs_to_many :albums
  validates :title, :photographer_id, presence: true
  unless ActiveRecord::Base.connection.table_exists?(:photos)
    ActiveRecord::Base.connection.create_table :photos do |t|
      t.string :title
      t.integer :photographer_id
      t.text :description
    end
  end

  # Photographer: Travis Rhoads
  # Image
  #
  #
  #
  #
  #
  #





  # IF photo is in at least 3 albums, call that photo "top photo"
  #
  #
  #
  # Returns boolean
  def top_photo?
    if (self.albums.length >= 3)
      return true
    else
      return false
    end
  end

end

class Album < ActiveRecord::Base
  has_and_belongs_to_many :photos
  unless ActiveRecord::Base.connection.table_exists?(:albums)
    ActiveRecord::Base.connection.create_table :albums do |t|
      t.string :genre
    end
  end
end


## @photo.albums returns an "[]" if photo doesn't belong to an album
# if adding an album to a preexisting photo, push it like so
## @photo = Photo.find(3)
## @album = Album.find(2)
## @photo.albums << @album



# setting up a bridge between albums_photos
unless ActiveRecord::Base.connection.table_exists?(:albums_photos)
  ActiveRecord::Base.connection.create_table :albums_photos, id: false do |t|  #must set id to false or there is an id
    t.integer :album_id
    t.integer :photo_id
  end
end
