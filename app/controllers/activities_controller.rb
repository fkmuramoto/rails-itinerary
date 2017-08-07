class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.order(date: :asc)
    .group_by(&:date)
    .map do |date, activities|
      [
        date,
        activities.group_by(&:period).sort_by do |period, activities|
          ["Morning", "Afternoon", "Evening"].index(period)
        end
      ]
    end
  end

  def date(date)
    @activities.where(date: date)
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def create
    activity = Activity.new(activity_params)
    activity.save
    redirect_to activities_path
  end

  def edit
  end

  def update
    @activity.update(activity_params)
    redirect_to activities_path
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
  end

private

  def activity_params
    params.require(:activity).permit(:activity, :date, :period, :description, :comments)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
