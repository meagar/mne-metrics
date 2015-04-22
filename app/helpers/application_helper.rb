module ApplicationHelper

  def team_name(team_id)
    Event::TEAMS.find { |t| t.last.to_s == team_id.to_s }.first
  end

  def weekly_window_path
    path = request.path
    if path[/date=(.*)/]
      path.gsub(/date=(.*?)/, 'date=month')
    elsif path['?']
      "#{path}&date=month"
    else
      "#{path}?date=month"
    end
  end

  def all_dates_path
    path = request.path
    if path[/date=(.*)/]
      path.gsub(/date=(.*?)/, 'date=all')
    elsif path['?']
      "#{path}&date=all"
    else
      "#{path}?date=all"
    end
  end
end
