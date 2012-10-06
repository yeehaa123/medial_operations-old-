# == Schema Information
#
# Table name: references
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  date          :date
#  medium        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  type          :string(255)
#  type_id       :integer
#  collection    :boolean          default(FALSE)
#  pages         :string(255)
#  volume        :integer
#  issue         :integer
#  isbn          :string(255)
#  url           :string(255)
#  publisher_id  :integer
#  periodical_id :integer
#

require 'spec_helper'

describe Journal do
  let(:journal) { build(:journal) }

  subject { journal }

  it { should be_kind_of(Periodical) }
  it { should respond_to(:name) }
  it { should respond_to(:articles) }
  it { should respond_to(:publisher) }


  it { should validate_presence_of(:publisher) }

  it { should be_valid }
  
  context "defined reference" do
    let(:journal) { build(:defined_journal) }
    
    it { should be_valid }
    
    it { should have(5).articles }
  end
end
