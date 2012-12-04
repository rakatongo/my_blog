TruncateHtml.configure do |config|
  config.length       = 4000
  config.omission     = '...'
  config.word_boundary = true
end