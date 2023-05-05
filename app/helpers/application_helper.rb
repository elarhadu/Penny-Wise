module ApplicationHelper
  def group_total(group)
    total = 0
    return total if group.expenses.empty?

    expenses = group.expenses
    expenses.each do |expense|
      total += expense.amount
    end
    total
  end
end
