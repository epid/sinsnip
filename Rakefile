require 'sinsnip'

desc "Add test data to the database"
task :make_snippets do
  Snippet.destroy_all  
  Snippet.create( :title => 'Snippet 1',
                  :body => "My first snippet\nLine 2\nHere is a long(ish) line - Let's see how it looks when it needs to wrap",
                  :language => 'text',
                  :tags => 'tag1 tag2 tag3' )
  Snippet.create( :title => 'Snippet 2',
                  :body => "My second snippet",
                  :language => 'text',
                  :tags => 'tag3 tag4' )
  Snippet.create( :title => 'Snippet 3',
                  :body => "Also, I'd like to see how the software handles the situation when text is really long and wraps lines",
                  :language => 'text',
                  :tags => 'tag4 tag5 tag6' )
  Snippet.create( :title => 'Snippet 4',
                  :body => "My fourth snippet",
                  :language => 'text',
                  :tags => 'tag4 tag6' )
  Snippet[1].update(:updated_at => Time.now - 60*10)
  Snippet[2].update(:updated_at => Time.now - 86400*12)
  Snippet[3].update(:updated_at => Time.now - 86400)
  Snippet[4].update(:updated_at => Time.now - 3600*8)
end
desc "Reset the view counter for all snippets"
task :reset_views do
  Snippet.all.each { |s| s.update(:views => 0) }
end
