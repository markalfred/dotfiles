function make_project
  echo 'PATH_add ./node_modules/.bin' > .envrc

  set -l project_file (basename $PWD).sublime-project
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
