Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-feeds'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Feeds engine for Refinery CMS'
  s.date              = '2012-09-26'
  s.summary           = 'Feeds engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
end
