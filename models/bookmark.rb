require_relative 'db_base'

class Bookmark < DBBase
  attributes( {:name => :string, :url => :text, :category => :string} )
end

