get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb :'bookmarks/index'
end

get '/bookmarks/new' do
  @bookmark = Bookmark.new
  erb :'bookmarks/new'
end

post '/bookmarks' do
  @bookmark = Bookmark.new(params[:bookmark])
  @bookmark.save
  redirect to('/bookmarks')
end

get '/bookmarks/:id/show' do
  @bookmark = Bookmark.find(params[:id])
  erb :'bookmarks/show'
end

get '/bookmarks/:id/edit' do
  @bookmark = Bookmark.find(params[:id])
  erb :'bookmarks/edit'
end

post '/bookmarks/:id' do
  @bookmark = Bookmark.find(params[:id])
  @bookmark.update_attributes(params[:bookmark])
  redirect to('/bookmarks')
end

post '/bookmarks/:id/delete' do
  bookmark = Bookmark.find(params[:id])
  bookmark.destroy
  redirect to('/bookmarks')
end

# get '/bookmarks/search' do
#   erb :'bookmarks/search'
# end

post '/bookmarks/search/new' do
  sql = "SELECT * FROM bookmarks WHERE lower(category) LIKE '%#{params[:search].downcase}%' OR lower(name) LIKE '%#{params[:search].downcase}%'"

  conn = PG.connect(dbname: 'bookmarks_app', host: 'localhost')
    @result = conn.exec(sql)
    conn.close
  @result
  erb :'bookmarks/search_results'

end






