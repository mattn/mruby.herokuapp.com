#!mruby

get "/test" do
'こんにちわ世界'
end

Sinatic.run :host => '0.0.0.0', :port => (ENV['PORT']||8080).to_i
