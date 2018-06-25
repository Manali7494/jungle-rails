# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates_length_of :password, minimum: 6

  def self.authenticate_with_credentials(email, password)
    new_email = email.downcase
    user = User.find_by_email(new_email)
    # If the user exists AND the password entered is correct.
    user if user&.authenticate(password)
  end
end
