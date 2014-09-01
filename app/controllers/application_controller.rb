class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper :all
  require 'json'
  before_filter  :run_before_filter

  def run_before_filter
    @params = params
    @con = params[:controller]
    @act = params[:action]
  #     puts "#{@con}##{@act}  <----------"
#     @serverIp = serverIp
  #     puts "\n\n","request_uri:  #{request.headers['REQUEST_URI']}"
  end
  def dumpDebug
    puts
    puts "+ + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +"
    puts
    puts "      request.headers['HTTP_ACCEPT']:  #{request.headers['HTTP_ACCEPT']}"
    puts "     request.headers['HTTP_REFERER']:  #{request.headers['HTTP_REFERER']}"
    puts "                 self.request.method:  #{request.method}"
    puts "                         request_uri:  #{request.headers['REQUEST_URI']}"
    puts "                   request.remote_ip:  #{request.remote_ip}"
#     puts "                           server ip:  #{@serverIp}"
  #     puts "                  request.user_agent:  #{request.user_agent}"
  #     puts "                          redirected:  #{@redirected}"
  #     puts "                  anybody_signed_in?:  #{anybody_signed_in?}"
  #     puts "                  devise_controller?:  #{devise_controller?}"
    puts "                   CONTROLLER (\@con):  #{params[:controller]}"
    puts "                       ACTION (\@act):  #{params[:action]}"
  #    puts "         params[:ajax]:  #{params[:ajax]?params[:ajax]:nil}"
  #    puts "           ajax header:  #{request.headers['HTTP_X_REQUESTED_WITH']}"
  #    puts "      @response_status:  #{@response_status}"
  #     dumpSession
    dumpParams
  #     dumpFlash
    puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
    puts
    puts
    puts
  end
  def serverIp
    orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true  # turn off reverse DNS resolution temporarily
    UDPSocket.open do |s|
      s.connect '64.233.187.99', 1
      s.addr.last
    end
  ensure
    Socket.do_not_reverse_lookup = orig
  end
  def dumpSession
    puts "s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s"
    puts
    puts session.to_yaml
    puts
  end
  def dumpParams
    puts "p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p p"
    puts
    puts 'params:'
    puts params.to_yaml
    puts
  end
  def dumpFlash
    puts "f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f f"
    puts
    puts 'flash:'
    puts flash.to_yaml
    puts
  end
  ### include helpers
  # include ApplicationHelper

  ### handle some problems...
  # rescue_from ActionController::InvalidAuthenticityToken, 
  #   :with => Proc.new{
  #     flash[:other]='Bad Authenticity Token';puts '- '*30;puts "Bad Authenticity Token";puts request.inspect;puts '- '*30;:after_sign_in_path_for
  #   }
  # rescue_from ActionController::MethodNotAllowed, 
  #   :with => Proc.new{
  #     flash[:other]='Exception: Method Not Allowed';
  #     puts '- '*30;
  #     puts "Exception: Method Not Allowed", "#{request.headers['HTTP_X_REQUESTED_WITH']}", "#{request.headers['REQUEST_URI']}", "#{request.method}"; 
  #     puts '-'*40;
  #     puts request.inspect;
  #     puts '- '*30;
  #     redirect_to root_path
  #   }
  # rescue_from ActionController::RoutingError, 
  #   :with => Proc.new{
  #     flash[:error]='Exception: Routing error';
  #     puts '- '*30;
  #     puts "Exception: Routing Error "; 
  #     puts request.request_uri, "#{request.method}";
  #     puts '- '*30;
  #     redirect_to root_path
  #   }


  end
