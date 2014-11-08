class AngularCsrfGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer_file
    copy_file 'angular_csrf.rb', 'config/initializers/angular_csrf.rb'
  end
end
