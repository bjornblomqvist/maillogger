require 'fileutils'
require 'mail'

class MailLogger

  def self.delivery_method clazz,options
    @@clazz = clazz
    @@options = options
  end
  
  def self.log_path path
    @@path = path
  end

  def initialize(value)
    @@path ||= "./log/emails/"
    @settings = {}
  end
  
  attr_accessor :settings

  def deliver!(mail)
    # run super
    @@clazz.new(@@options).deliver!(mail)
    
    # save to disk
    log(mail)
  end
  
  private 
  
  def log mail
     
     FileUtils.mkdir_p(@@path) unless File.exist?(@@path)
     
     file_name = "#{Time.now.utc.strftime("%Y%m%d_%H%M.%S-UTC")}.eml"
     
     File.open("#{@@path}/#{file_name}",'w') do |file|
       file.write(mail.to_s)
     end
     
  end
  
end