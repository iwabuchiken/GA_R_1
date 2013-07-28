require 'fileutils'
#require File.expand_path(File.dirname(__FILE__) + '/cont_helpers/genes_cont_helper.rb')
require 'genes_cont_helper'

class AdminsController < ApplicationController
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
    
    #@message = File:::SEPARATOR
    @message2 = message
    
    # Setup => Log
    _index_setup_log 
    
    # log
    write_log("index", __FILE__, __LINE__)
    write_log("config.root=#{config.root}", __FILE__, __LINE__)
    write_log("Rails.root.to_s=#{Rails.root.to_s}", __FILE__, __LINE__)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admins }
    end
  end
  
    def _index_setup_log
    
        # Directory
        log_dir = "doc/mylog"
        
        if !File.exists?(log_dir)
            
            FileUtils.mkdir(log_dir)
        
        end
        
        # File
        log_file = "log.log"
        
        if !File.exists?([log_dir, log_file].join(File::SEPARATOR))
        
            FileUtils.touch([log_dir, log_file].join(File::SEPARATOR))
            
            @message = "Log file => Created: #{[log_dir, log_file].join(File::SEPARATOR)}"
        
        else
        
            @message = "File exists: #{[log_dir, log_file].join(File::SEPARATOR)}"
        
        end
        
        # Read file
        log_file = "doc/mylog/log.log"
        
        if File.exists?(log_file)
      
          # => http://www.ruby-forum.com/topic/66733
          @contentArray = File.readlines(log_file)
    
        else
          
          @contentArray = ["NO DATA"]
          
        end

        
        
    end#  def _index_setup_log

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/new
  # GET /admins/new.json
  def new
    @admin = Admin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/1/edit
  def edit
    @admin = Admin.find(params[:id])
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(params[:admin])

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render json: @admin, status: :created, location: @admin }
      else
        format.html { render action: "new" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admins/1
  # PUT /admins/1.json
  def update
    @admin = Admin.find(params[:id])
    
    #debug
    write_log(
            "@admin.genes_per_generation => #{@admin.genes_per_generation}",
            __FILE__, __LINE__)    
    
    #debug  
    write_log(
            "admin[genes_per_generation] => #{params[:admin][:genes_per_generation]}",
            __FILE__, __LINE__)

      
    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end
end
