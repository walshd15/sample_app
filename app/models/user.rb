class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#REGEX =regular expression, Ruby constants start with a capital letter by convention
	#More on regular expressions: rubular regular expression editor
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, length: { minimum: 6 }
end
