class User < ActiveRecord::Base
  has_many :articles
  before_save { self.email = email.downcase }
  
  validates :username, presence: true, 
            uniqueness: {case_sensitive: false}, 
            length: {minimum: 4, maximum: 25}
  
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, 
            uniqueness: {case_sensitive: false},
            length: {maximum: 250}, format: {with: VALID_EMAIL_REGEX}
  
  has_secure_password
end