# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  title        :string(255)
#  description  :text
#  slug         :string(255)
#  title_prefix :string(255)
#

require 'spec_helper'

describe Course do

  let(:course) { build(:course) }

  subject { course }

  it { should respond_to(:title) }
  it { should respond_to(:title_prefix) }
  it { should respond_to(:description) }
  it { should respond_to(:sections) }
  it { should respond_to(:meetings) }
  
  it { should be_valid }

  it { should validate_presence_of(:title) }

  its(:to_s) { should == "#{ course.title }" }
end
