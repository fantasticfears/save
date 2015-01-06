class User < ActiveRecord::Base
  attr_accessor :remember_token

  before_validation :downcase_email

  validates_presence_of :name
  validate :name_validator
  validates :email, presence: true, uniqueness: true
  validates :email, email: true, if: :email_changed?
  validate :password_validator, on: [:create]

  before_save :ensure_password_is_hashed

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.max_password_length
    200
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def name_validator
    existing = User.find_by(username: username.downcase)
    if name_changed? && existing && existing.id != self.id
      errors.add(:name, I18n.t('user.name.unique'))
    end
  end

  def downcase_email
    self.email.downcase! if self.email
  end

  def password=(password)
    @raw_password = password unless password.blank?
  end

  def password
    @raw_password
  end

  def password_validator
    PasswordValidator.new(attributes: :password).validate_each(self, :password, @raw_password)
  end

  def ensure_password_is_hashed
    if @raw_password
      self.salt = SecureRandom.hex(16)
      self.password_hash = hash_password(@raw_password, salt)
    end
  end

  def hash_password(password, salt)
    raise 'password is too long' if password.length > User.max_password_length
    Pbkdf2.hash_password(password, salt, Rails.configuration.pbkdf2_iterations, Rails.configuration.pbkdf2_algorithm)
  end

  def set_default_active
    self.active = true
  end

  def authenticate!(password)
    return false unless password_hash && salt
    self.password_hash == hash_password(password, salt)
  end

  def remember
    self.remember_token = User.new_token
    update_column(:remember_hash, User.digest(self.remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_hash).is_password?(remember_token)
  end

  def forget
    update_column(:remember_hash, nil)
  end

end

# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string           default(""), not null
#  password_hash :string(64)
#  salt          :string(32)
#  remember_hash :string(60)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  email         :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_name   (name) UNIQUE
#
