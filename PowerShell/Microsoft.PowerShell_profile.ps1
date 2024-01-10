#-----------------------------------------------------------
# Prompt theme engine
# https://ohmyposh.dev/
#-----------------------------------------------------------
#Import-Module posh-git
# interesting themes: cobalt2 multiverse-neon peru powerlevel10k_rainbow
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\the-unnamed.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\powerlevel10k_rainbow.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\multiverse-neon.omp.json" | Invoke-Expression

## Set default start folder
if (Test-Path -Path c:\git){
    Set-Location c:\git
} else {
    Set-Location d:\git
}

#-----------------------------------------------------------
# Scrolling/searching through history
#-----------------------------------------------------------
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward


#-----------------------------------------------------------
# Winget auto completer
# https://github.com/microsoft/winget-cli/blob/master/doc/Completion.md
#-----------------------------------------------------------
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

#-----------------------------------------------------------
# Set default location
#-----------------------------------------------------------
Set-Location /git

#-----------------------------------------------------------
# General aliases/overview
#-----------------------------------------------------------
function Get-Aliases {
    Get-Alias ?
    Get-Alias ??
}
New-Alias a Get-Aliases
#-----------------------------------------------------------
function Set-Title {
    param(
        [string]
        $title
    )
    $Host.UI.RawUI.WindowTitle = $title
}
#-----------------------------------------------------------
function Open-MyPowershellProfile {
    code $PROFILE
}
New-Alias opprof Open-MyPowershellProfile
#-----------------------------------------------------------
function Open-NotepadPlusPlus {
    start notepad++.exe
}
New-Alias opnpp Open-NotepadPlusPlus
#-----------------------------------------------------------
function Get-MyPathListedOnePerLine {
    $Env:Path.split(";")
}
New-Alias path Get-MyPathListedOnePerLine
#-----------------------------------------------------------
function Update-Applications {
    write-output GitHub.cli Microsoft.PowerToys JanDeDobbeleer.OhMyPosh Git.Git | 
    ForEach-Object { 
        & Write-output "Upgrading $_ ..." && 
        winget upgrade --id $_ --source winget }
}
New-Alias u Update-Applications

#-----------------------------------------------------------
# One letter aliases
#-----------------------------------------------------------
#-----------------------------------------------------------
function Get-GitBranch {
    git branch
}
New-Alias b Get-GitBranch
#-----------------------------------------------------------
function Set-LocationGit {
    Set-Location \git\
}
New-Alias g Set-LocationGit
#-----------------------------------------------------------
function Get-GitLogTree {
    git fetch
    git log --all --graph --decorate --oneline
}
New-Alias logtree Get-GitLogTree
New-Alias l Get-GitLogTree
#-----------------------------------------------------------
function Get-GitStatus {
    git status
}
New-Alias s Get-GitStatus
#-----------------------------------------------------------
function Set-TitleBranch {
    $Host.UI.RawUI.WindowTitle = git branch --show-current
}
New-Alias t Set-TitleBranch

#-----------------------------------------------------------
# Location aliases
#-----------------------------------------------------------
function Get-MyLocationAliases {
    Get-Alias slgit
}
New-Alias gloc Get-MyLocationAliases

#-----------------------------------------------------------
# Git aliases
#-----------------------------------------------------------
#-----------------------------------------------------------
function Remove-Branch {
    git branch --show-current| ForEach-Object { & git checkout master && git branch -d $_ && git pull }
}
New-Alias deleteBranch Remove-Branch
#-----------------------------------------------------------
function Remove-Branch-Main {
    git branch --show-current| ForEach-Object { & git checkout main && git branch -d $_ && git pull }
}
New-Alias deleteBranchMain Remove-Branch-Main
#-----------------------------------------------------------
#-----------------------------------------------------------
function Get-MyGitAliases {
    Get-Alias ggitv, istash, ipop, uPullMaster, uPullMain | Format-Table -AutoSize
}
New-Alias ggit Get-MyGitAliases
#-----------------------------------------------------------
#-----------------------------------------------------------
#-----------------------------------------------------------
function Get-GitVersion {
    git --version
}
New-Alias ggitv Get-GitVersion
#-----------------------------------------------------------
function Invoke-MyGitStash {
    git stash
}
New-Alias istash Invoke-MyGitStash
#-----------------------------------------------------------
function Invoke-MyGitPop {
    git stash pop
}
New-Alias ipop Invoke-MyGitPop
#-----------------------------------------------------------
function Push-Branch {
    git branch --show-current| ForEach-Object { & git push --set-upstream origin $_ }
}
New-Alias pushBranch Push-Branch

#-----------------------------------------------------------
function Get-GitBranches {
    g && Get-ChildItem dev1| ForEach-Object {& Write-Output $_ && Set-Location $_ && git branch}
    g && Get-ChildItem dev2| ForEach-Object {& Write-Output $_ && Set-Location $_ && git branch}
    g && Get-ChildItem dev3| ForEach-Object {& Write-Output $_ && Set-Location $_ && git branch}
    g
}
New-Alias showBranches Get-GitBranches
New-Alias sb Get-GitBranches
#-----------------------------------------------------------
function Update-MyGitBranchPullAndRebaseMaster {
    git pull --rebase origin master
}
New-Alias uPullMaster Update-MyGitBranchPullAndRebaseMaster
#-----------------------------------------------------------
function Update-MyGitBranchPullAndRebaseMain {
    git pull --rebase origin master
}
New-Alias uPullMain Update-MyGitBranchPullAndRebaseMain

#-----------------------------------------------------------
# Cypress aliases
#-----------------------------------------------------------
function Get-MyCypressAliases {
    Get-Alias cypopendev, cypopentest, cyprundev, cypruntest
}
New-Alias cypa Get-MyCypressAliases
#-----------------------------------------------------------
#-----------------------------------------------------------
function Open-CypressGui-Dev {
    npx cypress open
}
New-Alias cypopendev Open-CypressGui-Dev

#-----------------------------------------------------------
# Notes
#-----------------------------------------------------------
# git branch --show-current | ForEach-Object { & git switch master && git pull }
