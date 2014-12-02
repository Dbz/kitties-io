class User < ActiveRecord::Base
  attr_reader :password
  has_many :reviews
  has_one :image
  
  validates :username, :session_token, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token
  after_create :create_default_image, :create_empty_cart
  
  def is_password?(password)
    @password = password
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def ensure_session_token
    self.session_token = SecureRandom.base64(16)
  end
  
  def reset_session_token!
    ensure_session_token
    save!
    self.session_token
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    return user.is_password?(password) ? user : nil
  end
  
  def create_default_image
    Image.create(user_id: self.id) unless self.image
  end
  
  def create_empty_cart
    Cart.create(user_id: self.id)
  end
      
end
