# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  birth_date      :date             not null
#  gender          :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'
require 'uri'


RSpec.describe User, type: :model do
  subject(:user) do
    User.new(
      first_name: 'Sky',
      last_name: 'Kumtong',
      email: 'skumtong@gmail.com',
      password: 'sky_password',
      birth_date: '1997-04-18',
      gender: 'Male'
    )
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_confirmation_of(:email) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_inclusion_of(:gender).in_array(%w[Male Female Other]) }
  end

  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
  end
end
