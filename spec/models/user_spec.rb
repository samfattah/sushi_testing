require 'rails_helper'

RSpec.describe User, type: :model do
  # bundle exec rails db:drop db:create db:migrate
  # bundle exec rails db:migrate RAILS_ENV=test
  # bundle exec rspec spec/models/user_spec.rb:7
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:gender) }

    it do
      should validate_inclusion_of(:gender).
        in_array(['Male', 'Female', 'Other'])
    end
  end
end