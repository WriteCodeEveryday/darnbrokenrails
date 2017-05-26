class SoftwareController < ApplicationController
  before_action :verify_simple_password, :only => :index
  before_action :verify_session, :only => [:upload_new_software_file, :upload_alternative_software_file]
  
  http_basic_authenticate_with :name => "user", :password => "secret_password", :except => :index
  # XXX This code violates the "Basic Authentication" portion of Brakeman.
  # This call to the method uses http_basic_authenticate_with against a hard-coded password.
  # You may find the documentation relating to this below.
  # Source: http://brakemanscanner.org/docs/warning_types/basic_authentication/
  
  def verify_simple_password
    if params[:password] != 'abcd1234'
      redirect_to software_unathorized_path
    end
    # XXX This code violates the "Authentication" portion of Brakeman.
    # This method checks the password against a hard-coded password.
    # You may find the documentation relating to this below.
    # Source: http://brakemanscanner.org/docs/warning_types/authentication/
  end
  
  def verify_session
    software_name = session[params[:id]]
    software = Software.find_by_name(software_name)
    if !software
      redirect_to software_unathorized_path
    end
    # XXX This code violates the "Session Manipulation" portion of Brakeman.
    # This call to the method uses the session to find the software by name.
    # You may find the documentation relating to this below.
    # Source: http://brakemanscanner.org/docs/warning_types/session_manipulation/
  end
  
  def index
    if params[:date].present?
      software = Software.where("created_at > #{params[:date]}")
    else
      software = Software.all.paginate(:page => params[:page], :per_page => 20 )
    end
    # XXX This code violates the "SQL Injection" portion of Brakeman.
    # This SQL call uses parameters from the big scary internet.
    # You may find the documentation relating to this below.
    # Additionally since .each is being used against "purchaser" in the else on 
    # the view, this will cause N+1 Queries
    # Source: http://brakemanscanner.org/docs/warning_types/sql_injection/
    # Source: https://rails-bestpractices.com/posts/2010/07/25/fix-n-1-queries/
      
    timestamp = `date #{params[:format]}`
    # XXX This code violates the "Command Injection" portion of Brakeman.
    # This call to the method uses command execution with internet parameters.
    # You may find the documentation relating to this below.
    # Source: http://brakemanscanner.org/docs/warning_types/command_injection/
    
    attrs = {:email => 'guy@example.com</script><script>alert(document.domain)//'}
    # XXX This code does not violate the "Cross Site Scripting (JSON)" portion of Brakeman.
    #This section is just an example of what a malicious user might do.
    #Source: http://brakemanscanner.org/docs/warning_types/cross_site_scripting_to_json/
    
    expired = Software.include(:purchaser).where('expiration_date < ?', DateTime.now)
    expiring = Software.include(:purchaser).where('expiration_date < ?', DateTime.now + 1.month)
    renewed = Software.include(:purchaser).where('expiration_date > ? AND created_at < ?', DateTime.now + 11.month, DateTime.now - 1.year)
    # XXX This code should be scoped inside of the Model (easier to maintain)
    # Source: https://rails-bestpractices.com/posts/2010/07/14/move-finder-to-named_scope/
  end
  
  def show
    timestamp = eval("DateTime.now.strftime(\"" + params[:format] + "\")")
    # XXX This code violates the "Dangerous Evaluation" portion of Brakeman.
    # This call to the method uses command evaluation with internet parameters.
    # You may find the documentation relating to this below.
    # Source: http://brakemanscanner.org/docs/warning_types/dangerous_eval/
    
    software = Software.find_by_id(params[:id])
    # XXX This code can be put into a "before_filter" to ensure there's no unnecessary repetition.
    # Source: https://rails-bestpractices.com/posts/2010/07/24/use-before_filter/
  end
  
  def new
    timestamp = DateTime.now.to_i
    # XXX This code uses DateTime.now which is not recommended since it bypases 
    # the timezone configuration.
    # Source: https://rails-bestpractices.com/posts/2014/10/22/use-time-zone-now-instead-of-time-now/
    
    software = Software.new(params[:software])
    # XXX This code violates the "Mass Assignment" portion of Brakeman.
    # This creation of Software just takes whatever is sent in from a user.
    # You may find the documentation relating to this below.
    # Source: http://brakemanscanner.org/docs/warning_types/mass_assignment/
  end
  
  def edit
    timestamp = DateTime.now.to_i
    # XXX This code also uses DateTime.now which is not recommended since it bypases 
    # the timezone configuration.
    # Source: https://rails-bestpractices.com/posts/2014/10/22/use-time-zone-now-instead-of-time-now/
    
    software = Software.find_by_id(params[:id])
  end
  
  def execute_method
    method = params[:method]
    @result = Software.send(method.to_sym)
    # XXX This code violates the "Dangerous Send" portion of Brakeman.
    # This call to the method uses dangerous sends to the underlying model.
    # You may find the documentation relating to this below.
    # Additionally, it also violates the "Denial of Service" portion.
    # Additionally, it also violates the "Remote Code Execution" portion.
    # Source: http://brakemanscanner.org/docs/warning_types/dangerous_send/
    # Source: http://brakemanscanner.org/docs/warning_types/denial_of_service/
    # Source: http://brakemanscanner.org/docs/warning_types/remote_code_execution/
    
    render json: @result
  end
  
  def upload_new_software_file
    file = File.open("/tmp/#{params[:file]}.csv")
    # XXX This code violates the "File Access" portion of Brakeman.
    # This call to the method uses dangerous params to access files.
    # You may find the documentation relating to this below.
    # Source: http://brakemanscanner.org/docs/warning_types/file_access/
  end
  
  def upload_yaml_software_file
    file = YAML.load(params[:file])
    # XXX This code violates the "Remote Code Execution in YAML.Load" portion of Brakeman.
    # This call reads a YAML file from a parameter.
    # You may find the documentation relating to this below.
    # Source: http://brakemanscanner.org/docs/warning_types/remote_code_execution_yaml_load/
  end
  
  def upload_marshaled_software_file
    file = Marshal.load(params[:file])
    # XXX This code violates the "Unsafe Deserialization" portion of Brakeman.
    # This call reads a YAML file from a parameter.
    # You may find the documentation relating to this below.
    # Source: http://brakemanscanner.org/docs/warning_types/unsafe_deserialization/
  end
  
  def confirm_software_expiration
    software = Software.find_by_id(params[:id])
    
    begin
      uri = URI.parse(software.verification_endpoint)
      params = { :key => software.license_key }
      uri.query = URI.encode_www_form( params )
      http = Net::HTTP.new(uri.host, uri.port, uri.query)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      # XXX This code violates the "SSL Verification Bypass" portion of Brakeman.
      # This code will run but will skip SSL verification.
      # You may find the documentation relating to this below.
      # Source: http://brakemanscanner.org/docs/warning_types/ssl_verification_bypass/
      
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      render json: response
    rescue Exception => e
      hash = { error: "Something went wrong retrieving the expiration" }
      render json: hash
    end
    # XXX Rescuing Exception is not a good choice. Subpar code in an Exception-rescue can
    # fail in Production without a clear reason.
    # Source: https://rails-bestpractices.com/posts/2012/11/01/don-t-rescue-exception-rescue-standarderror/
  end
  
  def get_cloud_link
    software = CloudSoftware.find(params[:id])
    # XXX This code violates the "Unscoped Find" portion of Brakeman.
    # This code will run but may allow someone to access models above the target model
    # You may find the documentation relating to this below.
    # Source: http://brakemanscanner.org/docs/warning_types/unscoped_find/
    
    link = software.get_cloud_link
    if link
      redirect_to link
      # XXX This code violates the "Redirect" portion of Brakeman.
      # Redirection outside of your software using a link that is user-provided.
      # Source: http://brakemanscanner.org/docs/warning_types/redirect/
    else
      redirect_to :back
    end
  end
end
