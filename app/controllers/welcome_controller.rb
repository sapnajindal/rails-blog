class WelcomeController < ApplicationController
def home
  @current_users = User.all
  render 'welcome/homePage'
end
end