require "rubygems"
require "bundler"

# example usage:
# ruby capyx.rb "https://some_url" 2  ".filelist_file a.file_name"

Bundler.require(:default, :test)

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :chrome

url_to_visit = ARGV[0] || abort("Need URL")
sleep_time = ARGV[1] || abort("Need wait time")
selector = ARGV[2] || abort("Add selector")

browser = Capybara.current_session
browser.visit(url_to_visit)

sleep(sleep_time.to_i)

result = browser.all(selector)
puts result.map(&:text)
