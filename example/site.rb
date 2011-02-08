#!/usr/bin/env ruby

require 'sinatra'

get '/' do
   erb :index
end

# Translate what was posted into pig-latin
post '/' do
   words = params[:awesome]
   
   vowels = %w{a e i o u}
   translated = words.gsub(/\w+/) {|word|
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
   }

   # Display the file views/done.erb with these variables.
   erb :done, :locals => {:words => words, :translated => translated}
end
