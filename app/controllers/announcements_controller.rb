class AnnouncementsController < ApplicationController



  def hide
    ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
    cookies.permanent.signed[:hidden_announcement_ids] = ids
    redirect_to :back #redirect to the current page after the message is hide
  end



end
