class Journal < ActiveRecord::Base
    has_many :entries
    has_man :users, through: :entries
end 