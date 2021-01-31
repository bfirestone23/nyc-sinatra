class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find_by(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find_by(params[:id])
    @titles = Title.all
    @figures = Figure.all
    erb :'landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect to "/landmarks/#{@landmark.id}"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    @landmark.update(params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end

end