class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name, :references, :referencable, :full_name
  before_validation :name_downcase
  after_initialize :name_downcase
  default_scope order(:last_name)
  
  has_many :authorships
  has_many :references, through: :authorships
  has_many :coauthorships
  has_many :coreferences, through: :coauthorships, source: :reference
  
  validates_length_of :middle_name, minimum: 1, allow_nil: true
  validates_uniqueness_of :last_name, scope: [:first_name, :middle_name]

  def name_downcase
    self.last_name = last_name.downcase if last_name
    self.middle_name = middle_name.downcase if middle_name
    self.first_name = first_name.downcase if first_name
  end

  def to_s
    "#{ last_name.capitalize }, #{ first_name.capitalize }"
  end

  def full_name
    "#{ first_name.capitalize } #{ last_name.capitalize }"
  end
end