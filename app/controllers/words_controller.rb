class WordsController < ApplicationController
  def index
    @list = Word.all.to_a.sort_by.sort_by{|k|k['name'].downcase}
  end
  def create
    Word.create :name => params[:name]
    redirect_to words_path
  end
  def new
  end
  def edit
    @word = Word.find params['id']
  end
  def show
    puts 'sssssssssssssssssssssssssssssssssssssssssss'
    puts 'sssssssssssssssssssssssssssssssssssssssssss'
    puts 'sssssssssssssssssssssssssssssssssssssssssss'
    puts 'sssssssssssssssssssssssssssssssssssssssssss'
    @word = Word.find params['id']
  end
  def update
    Word.find(params['id']).update(:name => params['name'])
    redirect_to words_path
  end
  def destroy
    puts 'lllllllllllllllllllllllllllllllllllllllllllllllllllllll'
    puts 'lllllllllllllllllllllllllllllllllllllllllllllllllllllll'
    puts 'lllllllllllllllllllllllllllllllllllllllllllllllllllllll'
    puts 'lllllllllllllllllllllllllllllllllllllllllllllllllllllll'
    Word.find(params['id']).destroy
    redirect_to words_path
  end
end
