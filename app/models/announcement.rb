class Announcement < ActiveRecord::Base

  #scope :active_announcement, ->{ where('starts_at<=: now and ends_at>= :now', now: Time.zone.now) } #add class method


  def self.active_announcement(hidden_ids = nil)
    result = where('starts_at <= :now and ends_at >= :now', now: Time.zone.now)
    result = result.where("id not in (?)", hidden_ids) if hidden_ids.present?
    result
  end
end
