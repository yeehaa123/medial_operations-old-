# == Schema Information
#
# Table name: references
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  date       :date
#  medium     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string(255)
#  type_id    :integer
#  collection :boolean          default(FALSE)
#  pages      :string(255)
#

require 'spec_helper'

describe Reference do
  let(:reference) { build(:reference) }

  subject { reference }
  
  it { should respond_to(:authors) }
  it { should respond_to(:title) }
  it { should respond_to(:translators) }
  it { should respond_to(:editors) }
  it { should respond_to(:publisher) }
  it { should respond_to(:date) }
  it { should respond_to(:medium) }
  it { should respond_to(:site_articles) }
  it { should respond_to(:courses) }
  it { should respond_to(:sessions) }
  it { should respond_to(:pages) }

  it { should validate_presence_of(:authors) }
  it { should validate_presence_of(:title) }

  it { should be_valid }
    
  it { should have(1).authors }
  it { should have(2).translators }
  it { should have(2).editors }
  it { should have(3).sessions }  
  it { should have(4).site_articles }

  its(:to_s) do
    should == "#{ reference.authors.first } - #{ reference.title }"
  end
end
