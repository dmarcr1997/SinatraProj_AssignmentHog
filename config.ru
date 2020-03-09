require './config/environment'


if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

set(:css_dir) { File.join(views, 'css') }

use Rack::MethodOverride
use StudentController
use AssignmentController
use StudentClassController
use MessageController
run ApplicationController