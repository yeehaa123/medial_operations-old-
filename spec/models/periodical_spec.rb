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

describe Periodical do
  let(:periodical) { build(:periodical) }

  subject { periodical }
  
  it { should respond_to(:name) }
  it { should respond_to(:medium) }
  it { should respond_to(:publisher) }

  it { should be_valid } 
end
