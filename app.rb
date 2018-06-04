require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get "/reversename/:name" do
    @name_reversed = params["name"].reverse
    erb :reversename
  end

  get "/square/:number" do
    @squared = params["number"].to_i**2
    erb :square
  end

  get "/say/:number/:phrase" do
    @message = ""
    params['number'].to_i.times do
      @message = "#{@message}#{params['phrase']} "
    end
    erb :say_number_phrase
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    @message = params['word1'] + " " + params['word2'] + " " + params['word3'] + " " + params['word4'] + " " + params['word5'] + "."
    erb :say_concatenate_period
  end

  get "/:operation/:number1/:number2" do
    @result = 0
    case params["operation"]
    when "add"
      @result = params["number1"].to_i + params["number2"].to_i
    when "subtract"
      @result = params["number1"].to_i - params["number2"].to_i
    when "divide"
      @result = params["number1"].to_i / params["number2"].to_i
    when "multiply"
      @result = params["number1"].to_i * params["number2"].to_i
    end
    erb :operations
  end
end
