class SandboxController < ApplicationController
  def main
  end

  def sub1
  end

  def sub2
  end

  def sub3
      
      Time.zone = 'Tokyo'
      
      #REF Time.new http://www.tutorialspoint.com/ruby/ruby_date_time.htm
      @time_label = Time.new.strftime("%d/%m/%Y %H:%M:%S")
      # @time_label = Time.local.strftime("%d/%m/%Y %H:%M:%S")
      @time_label_time = Time.new.strftime("%H:%M:%S")
      
  end
  
end
