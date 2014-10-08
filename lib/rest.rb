class Rest
  def self.get(url: url, options: options)
    HTTParty.get(url, query: options)
  end
end
