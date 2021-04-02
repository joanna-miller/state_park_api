Swagger::Docs::Config.base_api_controller = ActionController::API

Swagger::Docs::Config.register_apis({
  "1.0" => {
    # location where our api doc files will be generated, as of now we will store files under public directory
    :api_file_path => "public/",
    # base path url of our application
    # while using production mode, point it to production url
    :base_path => "http://localhost:3000",
    # setting this option true tells swagger to clean all files generated in api_file_path directory before any files are generated
    :clean_directory => false,
    # As we are using Rails-API, our ApplicationController inherits ActionController::API instead of ActionController::Base
    # Hence, we need to add ActionController::API instead of default ActionController::Base
    :base_api_controller => ActionController::API,
    # parent_controller needs to be specified if API controllers are inheriting some other controller than ApplicationController
    #:parent_controller => ApplicationController,
    :attributes => {
      :info => {
        "title" => "State Park API",
        "description" => "An API to search parks in the U.S.",
        "contact" => "joannadawnmiller@gmail.com"
      }
    }
  }
})