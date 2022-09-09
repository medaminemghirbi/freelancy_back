class MissionLanguage < ApplicationRecord

  belongs_to :mission ,   class_name: "Mission", foreign_key: "mission_id", optional: true
  belongs_to :language ,   class_name: "Language", foreign_key: "language_id", optional: true

end