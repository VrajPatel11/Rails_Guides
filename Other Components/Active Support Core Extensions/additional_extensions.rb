#Extensions to File

#atomic_write
File.atomic_write(joined_asset_path) do |cache|
    cache.write(join_asset_file_contents(asset_paths))
end
#atomic_write creates a temporary file and if the target file exists, then atomic_write overwrites it keeping owner and permission
#in some cases it cannot change ownership or permissions then this error is caught and skipped in user/filesystem


#Extensions to Marshal

#load
#Active Support adds constant autoloading support to load
File.open(file_name) { |f| Marshal.load(f) }


#Extensions to NameError
#Active Support adds missing_name? to NameError, which tests whether the exception was raised because of the name passed as argument
def default_helper_module!
    module_name = name.delete_suffix("Controller")
    module_path = module_name.underscore
    helper module_path
  rescue LoadError => e
    raise e unless e.is_missing? "helpers/#{module_path}_helper"
  rescue NameError => e
    raise e unless e.missing_name? "#{module_name}Helper"
end


# Extensions to LoadError
def default_helper_module!
    module_name = name.delete_suffix("Controller")
    module_path = module_name.underscore
    helper module_path
  rescue LoadError => e
    raise e unless e.is_missing? "helpers/#{module_path}_helper"
  rescue NameError => e
    raise e unless e.missing_name? "#{module_name}Helper"
end
#giving a path name is_missing?, checks whether exception was raised due to that particular file  
