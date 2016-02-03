Redmine::Plugin.register :timesheet do

  name 'Timesheet plugin'
  author 'Jim Garlick'
  description 'This is a plugin that shows you your daily work'
  version '0.0.2'
  url 'https://bitbucket.org/jgarlick/timesheet'
  author_url 'https://bitbucket.org/jgarlick'

  permission :timesheet, { :timesheet => [:index] }, :public => true

  menu :top_menu, :timesheet, { :controller => 'timesheet', :action => 'index' }, :caption => 'Timesheet'

end
