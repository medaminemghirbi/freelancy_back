class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  before_create :confirmation_token
  has_secure_password
  validates_presence_of :email, :firstname, :lastname, :role
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates_uniqueness_of :email
  has_many :education, dependent: :destroy
  enum role: %i[freelancer client admin]
  has_many :experience, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  validates :reviews_count, inclusion: { in: 0..10 }
  has_many :reviews, dependent: :destroy
  has_many :freelancer_languages, dependent: :destroy
  #has_and_belongs_to_many :conversations, dependent: :destroy

  has_many :favoris, dependent: :destroy
  # has_one_attached :avatar

  def user_image_url
    # Get the URL of the associated image
    avatar.attached? ? url_for(avatar) : nil
  end

  # def generate_password(len=4)
  #  chars     = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  # password  = Array.new(len){ chars[rand(chars.size)] }.join
  # self.password = self.password_confirmation = password
  # end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
  end

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_password(self).deliver # This sends an e-mail with a link for the user to reset the password
  end

  # This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
