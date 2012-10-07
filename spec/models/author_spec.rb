# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  first_name  :string(255)
#  last_name   :string(255)
#  middle_name :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  particle    :string(255)
#

require 'spec_helper'

describe Author do
  let(:author) { create(:author) }

  subject { author }

  it { should respond_to(:references) }
  it { should respond_to(:volumes) }
  it { should respond_to(:translations) }
  it { should respond_to(:first_name) }
  it { should respond_to(:middle_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:references) } 

  it { should ensure_length_of(:middle_name).is_at_least(1) }
  it { should validate_uniqueness_of(:last_name).scoped_to(:first_name, :middle_name) }

  it { should be_valid } 

  context(:to_s) do

    its(:to_s) do
      last_name = author.last_name
      first_name = author.first_name
      should == "#{ last_name }, #{ first_name }"
    end

    describe "author with particle" do
      before { author.particle = "de"}

      its(:to_s) do
        last_name = author.last_name
        first_name = author.first_name
        should == "#{ last_name }, #{ first_name } de"
      end
    end
  end
  context(:full_name) do

    its(:full_name) do
      last_name = author.last_name
      first_name = author.first_name
      should == "#{ first_name } #{ last_name }"
    end

    describe "author with particle" do
      before { author.particle = "de"}

      its(:full_name) do
        last_name = author.last_name
        first_name = author.first_name
        should == "#{ first_name } de #{ last_name }"
      end    
    end
  end

  context "author with references" do
    let(:author) { build(:author_with_references) }

    it { should have(5).references }
    it { should have(0).translations }
    it { should have(0).volumes }
  end

  context "author with translations" do
    let(:author) { build(:author_with_translations) }

    it { should have(5).translations }
    it { should have(0).references }
    it { should have(0).volumes }
  end

  context "author with volumes" do
    let(:author) { build(:author_with_volumes) }

    it { should have(0).translations }
    it { should have(0).references }
    it { should have(5).volumes }
  end
end
