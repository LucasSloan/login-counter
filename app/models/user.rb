class User < ActiveRecord::Base
  validates :Username, presence: true
  validates :Password, presence: true
  validates :count, presence: true
end
