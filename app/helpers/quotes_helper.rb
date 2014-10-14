module QuotesHelper
  
  def random_quote
    @random_quote ||= Quote.random.first
  end
  
end
