module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the signup page/
      sign_up_path
    when /the login page/
      sign_in_path
    when /the dashboard page/
      dashboard_path
    when /the projects page/
      projects_path
    when /the milestones page/
      project = Project.find_by_id(1) || FactoryGirl.create(:project, :id => 1)
      project_milestones_path(project)

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
