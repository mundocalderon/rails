class StaticPagesController < ApplicationController

  def admin_home
    @announcements = Announcement.all.order('post_date desc').limit(6)
    @gigs = Gig.where("date >= ?",Date.today).sort_by &:date
    @videos = Video.all
  end
  
  def home
    
  end
  
  def joel
    @announcements = Announcement.joins(:announcement_types).where(announcement_types: {id: 1}).order('post_date desc').limit(6)
    @gigs = Gig.where("date >= ?",Date.today).sort_by &:date
    @videos = Video.joins(:video_types).where(video_types: {id: 1})
  end
  
  def tpc
    @announcements = Announcement.joins(:announcement_types).where(announcement_types: {id: 2}).order('post_date desc').limit(6)
    @gigs = Gig.where("date >= ?",Date.today).sort_by &:date
    @videos = Video.joins(:video_types).where(video_types: {id: 2})
  end
end
