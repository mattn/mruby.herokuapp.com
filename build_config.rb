MRuby::Build.new do |conf|
  toolchain :gcc

  #enable_debug

  conf.gembox 'default'

  conf.gem :github => 'iij/mruby-env'
  conf.gem :github => 'mattn/mruby-http'
  conf.gem :github => 'mattn/mruby-uv'
  conf.gem :github => 'mattn/mruby-sinatic'
end
