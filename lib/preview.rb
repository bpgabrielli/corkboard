class Preview
  def initialize(url)
    @client = Embedly::API.new(key: ENV['EMBEDLY_KEY'])
    @result = @client.oembed(url: url).first
  end

  def title
    @result.title
  end
end
