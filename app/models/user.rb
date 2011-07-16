class User < OmniAuth::Identity::Models::ActiveRecord
  has_many :services
  
  attr_accessible :name, :email, :password, :password_confirmation
end
