class Course < ApplicationRecord
  validates :api_courseid, presence: true, length: { maximum: 255 }
  validates :api_coursename, presence: true, length: { maximum: 255 }
  validates :api_coursereserve_url, presence: true, length: { maximum: 255 }
  validates :api_courseimage_url, presence: true, length: { maximum: 255 }
end