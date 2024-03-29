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
#  volume     :integer
#  issue      :integer
#  isbn       :string(255)
#  url        :string(255)
#

# require 'spec_helper'

# describe MagazineReference do
#   let(:reference) { build(:magazine_reference) }

#   subject { reference }

#   it { should be_kind_of(Reference) } 
#   it { should respond_to(:articles) }

#   it { should_not validate_presence_of(:authors) }

#   it { should be_valid }
  
#   context "defined reference" do
#     let(:reference) { build(:defined_magazine_reference) }
    
#     it { should be_valid }

#     it { should be_a_collection}
    
#     it { should have(2).authors }
#     it { should have(3).sessions } 
#     it { should have(4).site_articles }
#     it { should have(5).articles }
#   end
# end
