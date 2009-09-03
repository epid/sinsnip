class Snippet < Sequel::Model

  # Validations
  def validate
    errors[:title] << "must be specified" if title.empty?
    errors[:body] << "must be specfied" if body.empty?
    errors[:language] << "must be specified" if language.empty?
  end

  # Hooks
  def before_create
    self.created_at = Time.now
    self.updated_at = Time.now
  end

  self.plugin(:schema)
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

  def view!
    self.update(:views => (self.views+1))
  end

  def line_count
    count = 0
    self.body.each_line { |l| count += 1 }
    count
  end

  def summary( max = PREVIEW_LINES )
    lc = self.line_count
    return self.body if lc <= max
    self.body.match(/^(.*\n?){0,#{max}}/)[0]
  end

end
