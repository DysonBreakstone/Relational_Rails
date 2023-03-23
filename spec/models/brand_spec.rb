require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe "relationships" do
    it { should have_many :packs }
  end
end