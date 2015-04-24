
class NewsLettersController < ApplicationController

  def index
    @news_letters = NewsLetter.order('id desc').all
  end

  def create
    @news_letter = NewsLetter.new
    @news_letter.send!
    @news_letter.save!
    redirect_to news_letters_path
  end

end

