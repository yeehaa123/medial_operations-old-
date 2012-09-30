class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name, :references, :referencable, :full_name
  before_validation :format_name
  after_initialize :format_name

  default_scope order(:last_name)

  has_many :authorships
  has_many :references, through: :authorships

  validates_length_of :middle_name, minimum: 1, allow_nil: true
  validates_uniqueness_of :last_name, scope: [:first_name, :middle_name]

  def format_name
    self.last_name = last_name.downcase.titleize if last_name
    self.middle_name = middle_name.downcase.titleize if middle_name
    self.first_name = first_name.downcase.titleize if first_name
  end

  def to_s
    "#{ last_name }, #{ first_name }"
  end

  def full_name
    "#{ first_name } #{ last_name }"
  end
end