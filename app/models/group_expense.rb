class GroupExpense < ApplicationRecord
  belongs_to :group, dependent: :destroy
  belongs_to :expense, dependent: :destroy
end
