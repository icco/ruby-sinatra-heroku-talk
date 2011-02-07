#!/usr/bin/env ruby

require 'sinatra'

get '/' do
   erb :index
end

# Translate what was posted into pig-latin
post '/' do
   words = params[:awesome]
   
   vowels = %w{a e i o u}
   words = words.split(/[^\w\']+/).map {|word|
      # Periods, single letters
      if word.length <= 1 then
         word

      # Vowel rules according to wikipedia
      elsif vowels.include? word[0] then
         word + '-ay'

      # Normal words
      else
         word[1..word.length] + "-#{word[0]}ay"
      end
   }.join " "

   erb :done, :locals => {:words => words}
end
