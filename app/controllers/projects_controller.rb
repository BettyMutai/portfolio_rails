class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @skill = @project.skills.all
  end

  # GET /projects/new
  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to skill_projects_url, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to skill_path(@project.skill), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to skill_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def github_repos
    @github_repos = Github.repos.list user: 'BettyMutai'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      # @skill = Skill.find(params[:skill_id])
      # @project = @skill.projects.find(params[:id])
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :picture, :link, :description, :skill_id)
    end
end
