class User < ActiveRecord::Base
  has_secure_password
  

  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
  

  def self.authenticate_with_credentials(email, password)
    user = User.find_by("lower(email) = ?", email.downcase.strip)
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(password)
        # Save the user id inside the browser cookie. This is how we keep the user 
        # logged in when they navigate around our website.
        user
      else
      # If user's login doesn't work, send them back to the login form.
        nil
      end
  end


end