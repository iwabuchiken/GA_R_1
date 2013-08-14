class SandboxController < ApplicationController
  def main
  end

  def sub1
  end

  def sub2
  end

  def sub3
      
      @time_label = Time.new.strftime("%d/%m/%Y %H:%M:%S")
      
  end
  
end
