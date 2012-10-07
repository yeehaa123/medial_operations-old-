# == Schema Information
#
# Table name: periodicals
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  publisher_id :integer
#  type         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  medium       :string(255)
#

require 'spec_helper'

describe Magazine do
  let(:magazine) { build(:magazine) }

  subject { magazine }
  
  it { should respond_to(:name) }
  it { should respond_to(:articles) }
  it { should respond_to(:publisher) }

  it { should be_valid } 

  describe "defined_magazine" do
    let(:magazine) { build(:defined_magazine) }

    it { should have(3).articles }
  end
end
