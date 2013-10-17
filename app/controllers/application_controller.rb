class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index
    filter = []

    if !params[:paid].blank?
      paid = params[:paid]
      filter << ["copay_received = '#{paid.to_s}'"]
    end

    if !params[:junk].blank?
      junk = params[:junk][:effective_on]
      filter << ["clients.effective_on >= '#{junk.to_s}'"]
    end 

    @unpaids = Appointment.joins(:client).where(filter.join(" AND "))   

    #@search = Appointment.new  
    #if params
    #  @unpaids = @search.where(@search.junk)    
    #else
    #  @unpaids = Appointment.where(copay_received: false)    
    #  render "appointments/index"
    #end
  end
end
