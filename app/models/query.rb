class Query < ApplicationRecord

  openai_api_key = ENV['OPENAI_SECRET_KEY']

  def askGPT
    response = HTTParty.post('https://api.openai.com/v1/completions', :body => {:model => "text-davinci-002", :prompt => self["prompt"], :temperature => 0, :max_tokens => 400}.to_json, :headers => {"Content-Type": "application/json", "Authorization": "Bearer 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"})
    response["choices"][0]["text"].strip
  end

end