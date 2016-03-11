require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:num => SECRET_NUMBER, :message => message, :guess => guess}
end

def check_guess(guess)
  if guess > (SECRET_NUMBER + 5)
    "Way too high!"
  elsif guess < (SECRET_NUMBER - 5)
    "Way too low!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  else
    "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end
