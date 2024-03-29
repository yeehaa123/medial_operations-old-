# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Publisher do
  let(:publisher) { create(:publisher) }

  subject { publisher }

  it { should respond_to(:magazines) }
  it { should respond_to(:magazine_articles) }
  it { should respond_to(:monographs) }
  it { should respond_to(:chapters) }
  it { should respond_to(:name) }
  it { should respond_to(:location) }

  it { should be_valid } 

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_uniqueness_of(:location).scoped_to(:name) }

  its(:to_s) do
    name = publisher.name.titleize
    location = publisher.location.titleize
    should == "#{ location }: #{ name }"
  end
end
