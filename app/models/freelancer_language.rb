class FreelancerLanguage < ApplicationRecord

  belongs_to :user ,   class_name: "User", foreign_key: "user_id", optional: true
  belongs_to :language ,   class_name: "Language", foreign_key: "language_id", optional: true

end