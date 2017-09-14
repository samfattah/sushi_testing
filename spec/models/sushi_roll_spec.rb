require 'rails_helper'

RSpec.describe SushiRoll, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:fish_type) }
    it { should validate_presence_of(:price) }   
    it { should validate_presence_of(:spicy) }
  end

end
