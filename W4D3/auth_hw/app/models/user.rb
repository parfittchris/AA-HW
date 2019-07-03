class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, length: {minimum: 6}, allow_blank: true
  validate :password_digest_presence


  attr_reader :password

  def password_digest_presence
    if !password_digest.presence
      errors[:password_digest] << 'Password can\'t be blank'
    end
  end

  def self.find_by_credentials(username, password)
    name = User.find_by(username: username)
    pass = BCRYPT:: Password.new(user.password_digest).is_password?(password)
    return name if name && pass
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    return self.session_token
  end

  def ensure_session_token
    if !self.session_token
      User.generate_session_token
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
