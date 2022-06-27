class Query < ApplicationRecord

  openai_api_key = Rails.application.credentials[:OPENAI_API_KEY]

  def askGPT
    response = HTTParty.post('https://api.openai.com/v1/completions',
      :body => {
        :model => "text-davinci-002",
        :prompt => self["prompt"],
        :temperature => 0,
        :max_tokens => 400
      }.to_json,
        :headers => {
          "Content-Type": "application/json",
          "Authorization": openai_api_key
        })
    response["choices"][0]["text"].strip
  end

end