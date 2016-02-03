Redmine::Plugin.register :timesheet do

  name 'Timesheet plugin'
  author 'Jim Garlick'
  description 'This is a plugin that shows you your daily work'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  permission :timesheet, { :timesheet => [:index] }, :public => true

  menu :top_menu, :timesheet, { :controller => 'timesheet', :action => 'index' }, :caption => 'Timesheet'

end
