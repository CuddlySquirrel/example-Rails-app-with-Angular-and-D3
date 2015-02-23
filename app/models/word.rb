class Word < ActiveRecord::Base
  validates :name, presence: true
end
