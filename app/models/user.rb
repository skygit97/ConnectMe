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
class User < ApplicationRecord
  attr_reader :password

  validates :first_name, :last_name, :email, :password_digest, :birth_date, :gender, :session_token, presence: true
  validates :email, exuniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    confirmation: { case_sensitive: false }
  validates :session_token, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :gender, inclusion: { in: %w[Male Female Other] }

  after_initialize :ensure_session_token

  has_many :posts, dependent: :destroy

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Passsword.new(password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
