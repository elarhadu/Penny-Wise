class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[edit update destroy]
  before_action :set_group, only: %i[index new edit create update destroy]
  before_action :set_user, only: %i[index edit create update destroy]
  # GET /expenses or /expenses.json
  def index
    @expenses = @group.expenses.order(created_at: :desc)
  end

  # GET group/expenses/new
  def new
    @expense = Expense.new
  end

  # GET group/expenses/1/edit
  def edit; end

  # POST group/expenses
  def create
    @expense = Expense.new(author: @author, **expense_params)
    if @expense.save
      @group_expense = GroupExpense.create(group: @group, expense: @expense)
      redirect_to group_expenses_url(@group), notice: 'Expense was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT group/expenses/1
  def update
    if @expense.update(expense_params)
      redirect_to group_expenses_url, notice: 'Expense was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE group/expenses/1
  def destroy
    @expense.destroy
    redirect_to group_expenses_url(@group), notice: 'Expense was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @author = current_user
  end

  def set_group
    @group = set_user.groups.find(params[:group_id])
  end

  def set_expense
    @expense = set_user.expenses.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end