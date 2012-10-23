require 'spec_helper'

describe Platform do
  describe ".data" do
    it "is a list of the platform data" do
      expect(Platform.data).to eq [
        {:id => 1, :name => 'Xbox 360'},
        {:id => 2, :name => 'PlayStation 3'}
      ]
    end
  end

  it { should be_a(ActiveHash::Base) }
end