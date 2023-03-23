require 'rails_helper'

RSpec.describe Pack, type: :model do
  describe "relationships" do
    it { should belong_to :brand }
  end
end