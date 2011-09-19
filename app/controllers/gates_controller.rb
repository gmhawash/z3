class GatesController < ApplicationController
  # GET /gates
  # GET /gates.xml
  def index
    @gates = Gate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gates }
    end
  end

  # GET /gates/1
  # GET /gates/1.xml
  def show
    @gate = Gate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gate }
    end
  end

  # GET /gates/new
  # GET /gates/new.xml
  def new
    @gate = Gate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gate }
    end
  end

  # GET /gates/1/edit
  def edit
    @gate = Gate.find(params[:id])
  end

  # POST /gates
  # POST /gates.xml
  def create
    @gate = Gate.new(params[:gate])

    respond_to do |format|
      if @gate.save
        format.html { redirect_to(@gate, :notice => 'Gate was successfully created.') }
        format.xml  { render :xml => @gate, :status => :created, :location => @gate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gates/1
  # PUT /gates/1.xml
  def update
    @gate = Gate.find(params[:id])

    respond_to do |format|
      if @gate.update_attributes(params[:gate])
        format.html { redirect_to(@gate, :notice => 'Gate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gates/1
  # DELETE /gates/1.xml
  def destroy
    @gate = Gate.find(params[:id])
    @gate.destroy

    respond_to do |format|
      format.html { redirect_to(gates_url) }
      format.xml  { head :ok }
    end
  end
end
