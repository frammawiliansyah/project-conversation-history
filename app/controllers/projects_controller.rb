class ProjectsController < ApplicationController
  before_action :redirect_login
  before_action :set_project, only: %i[ show edit update comment ]

  def index
    @projects = Project.order(updated_at: :desc)
  end

  def show
    @project_statuses = ProjectStatus.select(:id, :name).order(:sequence)
    @project_histories = @project.project_histories.order(created_at: :desc).limit(10)
    @comments = @project.comments.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = @current_user.projects.new(project_params)
    @project.project_status_id = ProjectStatus.find_by(sequence: 1).id

    if @project.save
      redirect_to @project, notice: { status: true, title: "Project created", content: "Project data was successfully saved." }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.project_status_id != project_params[:project_status_id] and @project.update(project_params)
      if project_params[:project_status_id].present?
        metadata = JSON.parse @project.to_json
        metadata['product_status'] = @project.project_status.name

        @project.project_histories.create user_id: session[:user_id], metadata: metadata 
      end
      redirect_to @project, notice: { status: true, title: "Project updated", content: "Project data was successfully changed." }, status: :see_other
    else
      redirect_to @project, notice: { status: false, title: "Project update failed", content: "Please check your project data." }, status: :see_other
    end
  end

  def comment
    @comment = @project.comments.new
    @comment.content = params.expect(:content)
    @comment.user_id = session[:user_id]

    if @comment.save
      redirect_to @project, notice: { status: true, title: "Comment created", content: "Comment data was successfully saved." }
    else
      redirect_to @project, notice: { status: false, title: "Comment create failed", content: "Please check your comment content." }
    end
  end

  private
  def set_project
    @project = Project.find(params.expect(:id))
  end

  def project_params
    params.expect(project: [ :title, :content, :project_status_id ])
  end

  def comment_params
    params.expect(:content)
  end
end
