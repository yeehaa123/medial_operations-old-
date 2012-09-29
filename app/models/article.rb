class Article < ActiveRecord::Base
  include FriendlyId
  default_scope order(:created_at).reverse_order

  attr_accessible :content, :title, :references

  has_many :cited_works
  has_many :references, through: :cited_works

  validates_presence_of :title
  before_validation { self.title = $1 if content.match(/\A\s*#\s*(.+)\s*$/)}

  friendly_id :title, use: :slugged

  def to_s
    title
  end


end