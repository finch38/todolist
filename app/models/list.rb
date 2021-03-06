class List < ActiveRecord::Base
	belongs_to :user
	has_many :tasks, dependent: :destroy
	default_scope -> { order('created_at DESC') }
	validates :title, presence: true, length: { maximum: 69 }
	validates :description, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true
end
