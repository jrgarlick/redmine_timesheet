class TimesheetController < ApplicationController
  unloadable

  def index

    @date = Date.today.to_s
    if (params.has_key?(:date))
      @date = params[:date]
    end

    @entries = TimeEntry.where("date(spent_on) = ? AND user_id = ?", @date, User.current.id)

    @activity = ""
    @total_hours = 0
    @entries.each do |entry|
      if defined?(entry.issue.id) then
          @activity << "(##{entry.issue.id}) "
      end
      @activity << entry.comments + "; "
      @total_hours = @total_hours + entry.hours
    end

    @recent_timesheets = 
            TimeEntry.select("distinct spent_on")
                    .where("user_id = ?", User.current.id)
                    .order("spent_on DESC")
                    .limit(10)
  end
end
