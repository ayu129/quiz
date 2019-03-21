require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
    if Result.all.length == 0
        Result.create(score:0)
    end

    @questions = Array.new
    @questions.push(["Webサービスプログラミングコースで学んでいる、赤色の宝石の名前を使っている言語は？","Garnet","Ruby","Amethyst","Opal","2"])
    @questions.push(["Life is Tech!のキャンプのコースはいくつあるでしょう？","14","15","16","17","4"])
end

get '/question/:id' do
    @number = params[:id].to_i
    erb :question
end
