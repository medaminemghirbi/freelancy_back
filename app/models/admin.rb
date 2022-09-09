class Admin < User
  has_secure_password
  validates_presence_of :role, presence: true, default: 'admin'
  validates_uniqueness_of :email
end
