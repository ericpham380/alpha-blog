class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: {case_sensitive: false}, 
  length: {minimum: 4, maximum: 25}
  
  VALID_EMAIL_REGEX: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false},
  length: {maximum: 250}
end