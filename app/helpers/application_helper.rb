module ApplicationHelper

  def hn(str = '')
    h(str).gsub("\n", '<br/>').strip
  end

  def show?(str)
    str && !str.empty?
  end

  def empty?(str)
    !show(str)
  end

end
