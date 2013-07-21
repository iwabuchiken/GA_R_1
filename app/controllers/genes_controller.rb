#require File.expand_path(File.dirname(__FILE__) + '/genes_cont_helper.rb')
#require File.expand_path(File.dirname(__FILE__) + '/cont_helpers/genes_cont_helper.rb')

require 'genes_cont_helper'

class GenesController < ApplicationController
  # GET /genes
  # GET /genes.json
  def index
    @genes = Gene.all
    
    @message = message
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @genes }
    end
  end

  # GET /genes/1
  # GET /genes/1.json
  def show
    @gene = Gene.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gene }
    end
  end

  # GET /genes/new
  # GET /genes/new.json
  def new
    @gene = Gene.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gene }
    end
  end

  # GET /genes/1/edit
  def edit
    @gene = Gene.find(params[:id])
  end

  # POST /genes
  # POST /genes.json
  def create
    @gene = Gene.new(params[:gene])

    respond_to do |format|
      if @gene.save
        format.html { redirect_to @gene, notice: 'Gene was successfully created.' }
        format.json { render json: @gene, status: :created, location: @gene }
      else
        format.html { render action: "new" }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /genes/1
  # PUT /genes/1.json
  def update
    @gene = Gene.find(params[:id])

    respond_to do |format|
      if @gene.update_attributes(params[:gene])
        format.html { redirect_to @gene, notice: 'Gene was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genes/1
  # DELETE /genes/1.json
  def destroy
    @gene = Gene.find(params[:id])
    @gene.destroy

    respond_to do |format|
      format.html { redirect_to genes_url }
      format.json { head :no_content }
    end
  end

    def generate_genes
        
        # Get => Generation serial
        admin = Admin.first
        
        generation_serial = -1
        
        if admin == nil
            
            admin = Admin.new
            
            admin.current_generation = 1
            admin.num_of_gene_elements = 6
            
            admin.save
        
        else
            
            admin.current_generation += 1
            
            admin.update_attributes(
                        :current_generation => admin.current_generation)

        end
        
        # if admin != nil and admin.current_generation != nil
#             
            # generation_serial = admin.current_generation
#             
        # else
#             
            # generation_serial = 5
#             
        # end
        
        # Generate => Genes
        4.times do |i|
            
            gene = Gene.new
            
            gene.generation = admin.current_generation
            gene.in_generation_serial = i + 1
            
            gene.save
            
        end
        
        
        flash['notice'] = "Genes generated"
        
        redirect_to :controller => 'genes', :action => 'index'
        
    end#    def generate_genes

    def remove_all_genes
        # Remove genes
        genes = Gene.all()
        
        genes.each do |gene|
               
               gene.destroy
        
        end#        genes.each do
     
        # Reset generation number
        admin = Admin.first()
        
        admin.current_generation = 0
        
        admin.save
        
        flash['notice'] = "Genes removed"
        
        redirect_to :controller => 'genes', :action => 'index'
     
     
    end#    def remove_all_genes
    
end#class GenesController < ApplicationController
