lib = File.expand_path(File.dirname(__FILE__))
lib_rb_files = File.join(lib, 'tic_tac_toe', '**', '*.rb')
Dir.glob(lib_rb_files).each do |f|
  require f
end
