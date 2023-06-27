Redmine::Plugin.register :redmine_timesheet do

  name 'Timesheet plugin'
  author 'Jim Garlick'
  description 'This is a plugin that shows you a summary of the activites for your daily work.'
  version '0.0.2'
  url 'https://github.com/jrgarlick/redmine_timesheet'
  author_url 'https://github.com/jrgarlick'

  permission :redmine_timesheet, { :timesheet => [:index] }, :public => true

  menu :top_menu, :redmine_timesheet, { :controller => 'timesheet', :action => 'index' }, :caption => 'My Timesheet'

end
