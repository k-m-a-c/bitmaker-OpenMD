namespace :doctor do
  desc "get doctor office phone # and add insert into db"
  task :get_phone_number => [:environment] do
    require 'mechanize'
    require 'nokogiri'

    doctor = Doctor.first

    # Format the URL to query
    cpso_number = doctor.doctor_uid.to_s
    remote_url = 'http://www.cpso.on.ca/Public-Register/doctor-details.aspx?view=1&id=%20' + cpso_number

    # Instantiate a Mechanize crawler
    agent = Mechanize.new

    # Get the doctor profile page data
    profile_page = agent.get(remote_url)
    profile_page_data = profile_page.search('div#profile-content')

    # Divide the profile page data into manageable chunks
    data_to_parse = []
    profile_page_data.xpath('//p').each do |node|
      element = node.text
      data_to_parse << element
    end

    # Parse the relevant chunk to get clean data
    def get_phone_number(arr)
      number = arr[3].gsub(/[\n\r\t\s]/, "").match(/Phone:(.+?)Fax:/)
      phone_number = number[1].strip.gsub(/\u00A0/, "").gsub(/[^\d]/, "").to_i
    end

    # Sanity check
    puts "Dr. #{doctor.last_name}'s office phone number: " + get_phone_number(data_to_parse).to_s

    # Save phone number to Doctor object
    doctor.phone_number = get_phone_number(data_to_parse)
    doctor.save
  end
end