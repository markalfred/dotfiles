function pullr -d "When called without options, create a new request for the upstream branch tracked by local master"
  if [ (count $argv) -eq 0 ]
    # Pullr takes the "local" style name. Never show "origin".
    command pullr -n -i (_git_upstream_branch master | sed -e 's/^origin\///')
  else
    command pullr $argv
  end
end
