function make_project
  set -l project_file (_current_directory).sublime-project
  echo \
'{
  "folders":
  [
     {
        "follow_symlinks": true,
        "path": "."
     }
  ],
  "settings":
  {
    // Project-specific, package-specific settings
    // "CoffeeScript":
    // {
    //   "compileOnSave": true,
    //   "sourceMaps":false
    // }
  }
}
' > $project_file
  subl $project_file
end
