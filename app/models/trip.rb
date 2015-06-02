class Trip < ActiveRecord::Base
  belongs_to :park
  belongs_to :user
  mount_uploaders :park_photos, ParkPhotosUploader

  def start_formatted
    start_date.strftime('%B %e, %Y')
  end

  def end_formatted
    end_date.strftime('%B %e, %Y')
  end

  def start_formatted_sm
    start_date.strftime('%m/%e/%y')
  end

  def end_formatted_sm
    end_date.strftime('%m/%e/%y')
  end

end
