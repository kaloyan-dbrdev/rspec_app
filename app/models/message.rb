class Message < ActiveRecord::Base
  attr_accessible :name, :email, :message

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :message, presence: true
end
