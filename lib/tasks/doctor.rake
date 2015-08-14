require 'mechanize'
require 'nokogiri'

namespace :doctor do
  desc "get doctor office phone # and add insert into db"
  task :get_phone_number => [:environment] do
    doctor = Doctor.last
  end


end