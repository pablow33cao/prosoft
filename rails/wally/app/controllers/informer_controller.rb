class InformerController < ApplicationController

  def newinformer
    @dato = Informer.new
  end

  def create
    @dato = Informer.new(params[:post].permit(:name, :lastname, :phone, :email, :docutype, :identification))

    respond_to do |format|
      #  if @dato.save
      if @dato.validate
        #format.html { redirect_to :action => :show, :id =>@dato.id}
        puts '---------------------------------------------'
        puts @dato.identification
        puts '---------------------------------------------'
        format.html { redirect_to url_for(:controller => :missing, :action => :new, :param_name => @dato.name,
                                          :param_lastname => @dato.lastname, :param_phone => @dato.phone, :param_email => @dato.email, :param_docutype => @dato.docutype, :param_id => @dato.identification) }

      else
        format.html { render :newinformer }

      end
    end
  end


end
