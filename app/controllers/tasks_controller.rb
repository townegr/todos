class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @task = Task.new
    @tasks = current_user.tasks.includes(:user)
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to tasks_path, notice: 'Successfully created task.'
    else
      render 'index'
    end
  end

  def show
  end

  def destroy
    @task.destroy
      redirect_to tasks_path, notice: 'Successfully deleted.'
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Successfully updated.'
    else
      render 'edit'
    end
  end

  def complete
    params[:tasks_checkbox].each do |check|
      task_id = check
        t = Task.find_by_id(task_id)
      t.update_attribute(:completed, !t.completed)
    end
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed).merge(user: current_user)
  end
end
