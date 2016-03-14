require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  answer = answer(message)
  erb :index, :locals => {:answer => answer, :message => message}
end

def check_guess(guess)
  case
  when guess == 0
    "Make a guess!"
  when guess > (SECRET_NUMBER + 5)
    "Way too high!"
  when guess < (SECRET_NUMBER - 5)
    "Way too low!"
  when guess > SECRET_NUMBER
    "Too high!"
  when guess < SECRET_NUMBER
    "Too low!"
  when guess == SECRET_NUMBER
    "You got it right!"
  end
end

def answer(message)
  case
  when message == "You got it right!"
    "The SECRET NUMBER is #{SECRET_NUMBER}"
  when message != "Make a guess!"
    "Try again!"
  end 
end
