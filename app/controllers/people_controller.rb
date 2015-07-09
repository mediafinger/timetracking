class PeopleController < ApplicationController
  def new
    @person = Person.new
    @projects = Project.pluck(:name, :id)
  end

  def create
    @person  = Person.new(name: person_params[:name])
    @project = Project.find(params[:project_id])

    if @person.valid? && @project.present?
      @person.save

      @project.people << @person

      redirect_to project_path(@project), notice: "#{@person.name} added to this project."
    else
      render :new
    end
  end

  private

  def person_params
    params.require(:person).permit(:name) #, participation_attributes: [:project_id])
  end
end
