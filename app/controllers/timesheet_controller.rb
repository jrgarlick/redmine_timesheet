class TimesheetController < ApplicationController
  unloadable


  def index
#    @project = Project.find(params[:project_id])

    @date = Date.today.to_s
    if (params.has_key?(:date))
      @date = params[:date]
    end

    @entries = TimeEntry.where("date(spent_on) = ? AND user_id = ?", @date, User.current.id)

    @activity = ""
    @total_hours = 0
    @entries.each do |entry|
      if entry.issue.custom_value_for(6).value then
        @activity << "(ATI-TKT " + entry.issue.custom_value_for(6).value + ") "+entry.comments+"; "
      else 
        @activity << entry.comments + "; "
      end
      @total_hours = @total_hours + entry.hours
    end

    @recent_timesheets = TimeEntry.select("distinct spent_on").order("spent_on DESC").limit(10)
  end
end
