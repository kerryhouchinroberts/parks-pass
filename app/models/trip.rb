class Trip < ActiveRecord::Base
  belongs_to :park
  belongs_to :user
  mount_uploaders :park_photos, ParkPhotosUploader
  validate :end_date_cannot_be_before_start

  def start_formatted
    start_date.strftime('%B %e, %Y')
  end

  def end_formatted
    end_date.strftime('%B %e, %Y')
  end

  def start_formatted_sm
    start_date.strftime('%m/%d/%y')
  end

  def end_formatted_sm
    end_date.strftime('%m/%d/%y')
  end

  def end_date_cannot_be_before_start
    if end_date < start_date
      errors.add(:end_date, "cannot be before start date.")
    end
  end

end
