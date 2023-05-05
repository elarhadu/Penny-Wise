class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update destroy]
  before_action :set_user, only: %i[index new create edit update destroy]

  # GET /groups or /groups.json
  def index
    @groups = current_user.groups
  end

  # GET /groups/new
  def new
    @group = current_user.groups.new
  end

  # GET /groups/1/edit
  def edit; end

  def show
    @group = current_user.groups.find(params[:id])
  end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    if @group.update(group_params)
      redirect_to groups_url, notice: 'Group was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: 'Group was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  def set_group
    @group = current_user.groups.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
