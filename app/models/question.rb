class Question < ActiveRecord::Base
	has_many :answers
	belongs_to :user
	has_and_belongs_to_many :topics
	validates_presence_of :text, :topic

	def self.search_for(query)
    where('text LIKE :query', query: "%#{query}%")
  end
end
