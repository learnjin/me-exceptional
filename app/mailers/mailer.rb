
class MeExceptional::Mailer < ActionMailer::Base 

  def exceptional(message, params)
    @message, @params = message, params
    @hostname = get_hostname(params[:client_ip])
    @loc = geocode_ip(params[:client_ip])
    mail(:to => 'app+exception@doxter.de', :subject => message)
  end

end


