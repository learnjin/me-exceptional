class MeExceptional::Mailer < ::ActionMailer::Base 

  def exceptional(message, params)
    @message, @params = message, params
    @hostname = get_hostname(params[:client_ip])
    @loc = geocode_ip(params[:client_ip])
    mail(:from => MeExceptional.mailer_from, :to => MeExceptional.mailer_to, :subject => message)
  end

  private

  def get_hostname(ip)
    Socket.do_not_reverse_lookup = false
    Socket.getaddrinfo(ip, nil)[0][2]
  end 

  def geocode_ip(ip)
    GeoKit::Geocoders::MultiGeocoder.geocode(ip)
  end


end


