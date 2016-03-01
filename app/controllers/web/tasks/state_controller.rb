class Web::Tasks::StateController < ApplicationController

  def update
    @task = Task.find(params[:task_id])
    @task.to_state!(params[:id])
  end
end

