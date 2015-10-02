class Search < ActiveRecord::Base
  validates :query, presence: true
  belongs_to :user
end
