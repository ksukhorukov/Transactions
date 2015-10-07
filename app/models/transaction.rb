class Transaction  < ActiveRecord::Base
  self.inheritance_column = nil
  validates :type, presence: true
  validates :amount, presence: true
end
