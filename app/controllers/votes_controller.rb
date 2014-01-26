class VotesController < ApplicationController
  def up_vote
    set_up
    update_vote(1)
    redirect_to word_path(@word) 
  end

  def down_vote
    set_up
    update_vote(-1)
    redirect_to word_path(@word) 
  end

  def current_ip
    request.remote_ip.to_s
  end

  def user
    User.find_or_create_by ip: current_ip
  end

  def set_up
    @word = Word.friendly.find(params[:word_id])
    @user = user
    @vote = @word.votes.where(user_id: user.id).first
  end

  def update_vote(new_value)
    if @vote
      @vote.update_attribute(:value, new_value)
    else
      @word.votes.create(value: new_value, user_id: @user.id)
    end
  end
end
