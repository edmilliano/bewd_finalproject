class Question < ActiveRecord::Base
	has_many :answers, :dependent => :destroy
	belongs_to :user
	has_and_belongs_to_many :topics
	#validates :text, presence: true
	#validates :topic, presence: true

	def self.search_for(query)
    where('text LIKE :query', query: "%#{query}%")
  	end
end
