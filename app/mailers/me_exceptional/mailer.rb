class MeExceptional::Mailer < ActionMailer::Base 

  default :from => MeExceptional.mailer_from

  def exceptional(message, params)
    @message, @params = message, params
    @hostname = get_hostname(params[:client_ip])
    @loc = geocode_ip(params[:client_ip])[0]
    mail(:from => MeExceptional.mailer_from, :to => MeExceptional.mailer_to, :subject => message)
  end

  def error_mail(message, params)
    @message, @params = message, params
    subject = "[EXCEPTION] #{message}"
    mail(:from => MeExceptional.mailer_from, :to => MeExceptional.mailer_to, :subject => subject)
  end

  private

  def get_hostname(ip)
    Socket.do_not_reverse_lookup = false
    Socket.getaddrinfo(ip, nil)[0][2]
  end 

  def geocode_ip(ip)
    Geocoder.search(ip)
  end


end


