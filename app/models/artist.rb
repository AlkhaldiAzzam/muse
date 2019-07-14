class Artist < ApplicationRecord

    has_many :songs, dependent: :destroy #This will make a dependency case for artists and songs, so an artist will have many songs. But a song only has one artist. + when delete an artist it will delete the song with it.
end
