param(
  [Parameter(Mandatory=$true)]
  [string]$TargetDir,

  [ValidateSet('', 'node-pnpm', 'python-uv', 'rust', 'go')]
  [string]$Profile = ''
)

$RootDir = Split-Path -Parent $PSScriptRoot
$BaseDir = Join-Path $RootDir 'templates/base'

New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Write-Host "Applying base template to: $TargetDir"
Copy-Item -Path (Join-Path $BaseDir '*') -Destination $TargetDir -Recurse -Force
Copy-Item -Path (Join-Path $BaseDir '.*') -Destination $TargetDir -Recurse -Force -ErrorAction SilentlyContinue

if ($Profile -ne '') {
  $ProfileDir = Join-Path $RootDir "templates/$Profile"
  if (-not (Test-Path $ProfileDir)) {
    throw "Unknown profile: $Profile"
  }
  Write-Host "Applying profile: $Profile"
  Copy-Item -Path (Join-Path $ProfileDir '*') -Destination $TargetDir -Recurse -Force
  Copy-Item -Path (Join-Path $ProfileDir '.*') -Destination $TargetDir -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host "Done. Next steps:"
Write-Host "  cd $TargetDir"
Write-Host "  ./scripts/setup-hooks.ps1"
Write-Host "  git checkout -b chore/issue-1-initialize-repository"
Write-Host "  git add ."
Write-Host "  git commit -m 'chore(init): initialize repository`n`nRefs: #1'"
