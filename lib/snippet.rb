class Snippet < Sequel::Model

  # Validations
  validates_presence_of :title, :body, :language

  # Hooks
  before_create do
    self.created_at = Time.now
    self.updated_at = Time.now
  end

  unless table_exists?
    set_schema do
      primary_key :id
      string      :title
      text        :body
      string      :language
      string      :tags
      integer     :views, :default => 0
      datetime    :created_at
      datetime    :updated_at
    end
    create_table
  end
  
  def self.most_recent( n = 3 )
    reverse_order(:updated_at).limit( n )
  end

  def self.most_viewed( n = 3 )
    order(:views.desc).limit( n )
  end

end
