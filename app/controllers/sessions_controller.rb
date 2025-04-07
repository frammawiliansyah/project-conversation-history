class SessionsController < ApplicationController
  def login; end
  def register; end

  def signin
    user = User.find_by(email_address: params[:email_address].downcase.strip)

    if user.password == Digest::MD5.hexdigest(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: { status: true, title: "Login successful", content: "Welcome to the dashboard" }
    else
      redirect_to login_sessions_path, notice: { status: false, title: "Login failed", content: "Please check your email and password" }
    end
  end

  def signup
    user = User.new
    user.name = params[:name].upcase
    user.email_address = params[:email_address].downcase.strip
    user.password = Digest::MD5.hexdigest(params[:password])

    if params[:password] == params[:password_confirm] and user.save
      redirect_to root_path, notice: { status: true, title: "Registration successful", content: "You can now log in to the dashboard" }
    else
      redirect_to register_sessions_path, notice: { status: false, title: "Registration failed", content: "Please check your input data" }
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: { status: true, title: "Logout successful", content: "See you again soon" }
  end

  private
  def register_params
    params.expect(session: [ :name, :email_address, :password ])
  end

  # def login
  #   if params[:password].present? and params[:password]
  #     user_account = User.new user_params
      
  #     if user_account.save
  #       flash[:notice] = "Account registration successful."
  #       redirect_to projects_path(email_address: params[:email_address])
  #     else
  #       flash[:notice] = "Account registration failed: #{user_account.errors.full_messages.to_sentence}"
  #       redirect_to projects_path(register: true, name: params[:name], email_address: params[:email_address])
  #     end
  #   else
  #     flash[:notice] = "Password does not match."
  #     redirect_to projects_path(register: true, name: params[:name], email_address: params[:email_address])
  #   end
  # end

  # def register
  #   if params[:password].present? and params[:password] == params[:password_confirm]
  #     user_account = User.new user_params
      
  #     if user_account.save
  #       flash[:notice] = "Account registration successful."
  #       redirect_to projects_path(email_address: params[:email_address])
  #     else
  #       flash[:notice] = "Account registration failed: #{user_account.errors.full_messages.to_sentence}"
  #       redirect_to projects_path(register: true, name: params[:name], email_address: params[:email_address])
  #     end
  #   else
  #     flash[:notice] = "Password does not match."
  #     redirect_to projects_path(register: true, name: params[:name], email_address: params[:email_address])
  #   end
  # end

  # private
  # def user_params
  #   {
  #     name: params[:name].upcase,
  #     email_address: params[:email_address].downcase.strip,
  #     password: Digest::MD5.hexdigest(params[:password])
  #   }
  # end
end
