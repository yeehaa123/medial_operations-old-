require 'spec_helper'

describe ApplicationDecorator do

  let(:model) { mock_model "Model" }

  subject { ApplicationDecorator.new(model) }

  context "description" do
    describe "returns nil if the model has no description" do
      before do
        model.should_receive(:description).and_return(nil)
      end
      its(:description) { should be_nil }
    end

    describe "returns string if the model has a description" do
      before do
        model.should_receive(:description).exactly(2).times.and_return("content")
      end
      its(:description) { should == "<p><p>content</p>\n</p>" }
    end
  end

  context "heading" do
    describe "returns the model" do
      before do
        model.should_receive(:to_s).and_return("content")
      end
      its(:heading) { should be_true }
    end
  end
end