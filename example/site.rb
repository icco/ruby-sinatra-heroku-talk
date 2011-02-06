#!/usr/bin/env ruby

require 'sinatra'

get '/' do
   erb :index
end

# Translate what was posted into pig-latin
post '/' do
   words = params[:awesome]
   
   vowels = %w{a e i o u}
   words = words.split.map {|word|
      if vowels.include? word[0] then
         word + '-ay'
      else
         word[1..word.length] + "-#{word[0]}ay"
      end
   }.join " "

   erb :done, :locals => {:words => words}
end
