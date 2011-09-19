class CircuitsController < ApplicationController
  # GET /circuits
  # GET /circuits.xml
  def index
    @circuits = Circuit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @circuits }
    end
  end


  # GET /circuits/1
  # GET /circuits/1.xml
  def show
    @circuit = Circuit.find(params[:id])

    @gates = @circuit.gates.map do |target|
      helpers.render_term(target)
    end.transpose

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @circuit }
    end
  end

  # GET /circuits/new
  # GET /circuits/new.xml
  def new
    @circuit = Circuit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @circuit }
    end
  end

  # GET /circuits/1/edit
  def edit
    @circuit = Circuit.find(params[:id])
    @gates = @circuit.gates.map do |target|
      helpers.render_term(target)
    end.transpose
  end

  # POST /circuits
  # POST /circuits.xml
  def create
    @circuit = Circuit.new(params[:circuit])
    raise @circuit.inspect

    respond_to do |format|
      if @circuit.save
        format.html { redirect_to(@circuit, :notice => 'Circuit was successfully created.') }
        format.xml  { render :xml => @circuit, :status => :created, :location => @circuit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @circuit.errors, :status => :unprocessable_entity }
      end
    end
  rescue Exception => e
    flash[:alert] =  e.message
    render :action => :new
  end

  # PUT /circuits/1
  # PUT /circuits/1.xml
  def update
    @circuit = Circuit.find(params[:id])

    respond_to do |format|
      if @circuit.update_attributes(params[:circuit])
        format.html { redirect_to :action => :edit }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @circuit.errors, :status => :unprocessable_entity }
      end
    end
  rescue Exception => e
    flash[:alert] =  e.message
    render :action => :edit
  end

  # DELETE /circuits/1
  # DELETE /circuits/1.xml
  def destroy
    @circuit = Circuit.find(params[:id])
    @circuit.destroy

    respond_to do |format|
      format.html { redirect_to(circuits_url) }
      format.xml  { head :ok }
    end
  end
end
