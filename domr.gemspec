Gem::Specification.new do |s|
  s.name        = 'domr'
  s.version     = '0.1.6'
  s.date        = '2012-07-12'
  s.summary     = "Domainr quick search"
  s.authors     = ["Nick Shvelidze"]
  s.email       = 'shveloo@gmail.com'
  s.files       = ['lib/domr.rb','bin/domr','ext/mkrf_conf.rb','Gemfile']
  s.add_runtime_dependency 'json'
  s.add_runtime_dependency 'rainbow'
  s.executables << 'domr'
  s.requirements << 'Internet connection'
  s.extensions << 'ext/mkrf_conf.rb'
  s.has_rdoc    = true
  s.homepage    = 'http://shvelo.github.com/domr'
  s.extra_rdoc_files = ['index']
  s.description = <<-EOF
    Quickly search for available domain names from command line.
  EOF
end