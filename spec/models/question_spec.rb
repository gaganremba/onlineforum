require "rails_helper"
RSpec.describe Question, type: :model do
  describe 'Check Title validations' do
    it { should validate_presence_of(:title) }
  end
  describe 'Check Title validations' do
    it { should validate_presence_of(:description) }
  end

  describe 'Check Title length is less than 1 characters' do
    it { should validate_length_of(:title).is_at_least(1) }
  end
  describe 'Check Title length no more 100 characters' do
    it { should validate_length_of(:title).is_at_most(100) }
  end

  describe 'Check description length is less than 1 characters' do
    it { should validate_length_of(:description).is_at_least(1) }
  end
  describe 'Check description length no more 500 characters' do
    it { should validate_length_of(:description).is_at_most(500) }
  end

end