class EntriesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @entries = @project.entries.where("date >= ?", 1.month.ago)
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
  end

  def create
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new(entry_params)

    if @entry.valid?
      @entry.save
      redirect_to project_entries_path(@project), notice: "Entry successfully added!"
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @entry = Entry.find_by(id: params[:id]).try(:destroy)

    redirect_to project_entries_path(@project), notice: "Entry #{@entry.inspect} was destroyed."
  end

  private

  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end
end
