class Client < User
  has_secure_password
  validates_presence_of :role, presence: true, default: 'client'
  validates_uniqueness_of :email
  has_many :missions, dependent: :destroy
end
