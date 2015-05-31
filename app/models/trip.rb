class Trip < ActiveRecord::Base
  belongs_to :park
  belongs_to :user

  def start_formatted
    start_date.strftime('%B %e, %Y')
  end

  def end_formatted
    end_date.strftime('%B %e, %Y')
  end

end
