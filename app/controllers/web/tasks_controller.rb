class Web::TasksController < Web::ApplicationController
  before_action :load_task, only: [:show, :next_state]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def show
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :file)
  end

  def load_task
    @task = Task.find(params[:id])
  end
end

