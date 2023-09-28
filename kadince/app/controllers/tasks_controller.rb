class TasksController < ApplicationController
    def index
        @pending_tasks = Task.where(completed: false).order(id: :asc)
        @completed_tasks = Task.where(completed: true).order(id: :asc)
    end

    def create
        Task.create(description: params[:task][:description], completed: false)
        redirect_to root_path
    end

    def destroy
        Task.destroy(params[:id])
        redirect_to root_path
    end

    def update
      task = Task.find(params[:id])
      if params.has_key?(:task) && params[:task].has_key?(:description)
        task.update(description: params[:task][:description])
      elsif task.completed
        task.update(completed: false)
      else
        task.update(completed: true)
      end
      redirect_to root_path
    end

    def edit
        @task = Task.find(params[:id])
    end
end
