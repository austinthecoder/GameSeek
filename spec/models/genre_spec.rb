require 'spec_helper'

describe Genre do
  describe ".data" do
    it "is a list of the genre data" do
      expect(Genre.data).to eq [
        {:id => 1, :name => 'Action'},
        {:id => 2, :name => 'Shooting'},
        {:id => 3, :name => 'Sports'}
      ]
    end
  end

  it { should be_a(ActiveHash::Base) }
end