class ActivitiesController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @activities = PublicActivity::Activity.order('created_at DESC').page(params[:page]).per(100)
  end
end
