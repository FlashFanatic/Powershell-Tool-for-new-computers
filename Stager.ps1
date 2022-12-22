function Out-Default{}
function Main{
Set-ExecutionPolicy -ExecutionPolicy Bypass
Add-Type -AssemblyName PresentationFramework

$xamlFile = "Circle.xaml"
$inputXaml = Get-Content -Path $xamlFile -Raw
$inputXaml = $inputXaml -replace 'mc:Ignorable="d"', '' -replace "x:N", "N" -replace '^<Win.*', '<Window'
[XML]$XAML = $inputXaml

[System.Xml.XmlNodeReader]$reader = $XAML
try{
    $form1 = [Windows.Markup.XamlReader]::Load($reader)
}catch{
    Write-Host $_.Exception
    throw
}

$xaml.SelectNodes("//*[@Name]") | ForEach-Object {
    try{
        Set-Variable -Name "var_$($_.Name)" -Value $form1.FindName($_.Name) -ErrorAction Stop
    }catch{
        throw
    }
}

function DriveFinder{
$Drives = @("A:\", "B:\", "C:\", "D:\", "E:\", "F:\", "G:\", "H:\", "I:\", "J:\", "K:\", "L:\", "M:\", "N:\", "O:\", "P:\", "Q:\", "R:\", "S:\", "T:\", "U:\", "V:\", "W:\", "X:\", "Y:\", "Z:\")

foreach($d in $Drives)
{

$pas = $d + "Staging Tool\PSWindowsUpdate"

$right = Test-Path $pas 

if($right -eq $true)
{

$Global:rightpath = $pas

}  

}

}

Function Get-PSScriptPath {

if ([System.IO.Path]::GetExtension($PSCommandPath) -eq '.ps1') {
  $psScriptPath = $PSCommandPath
  } else {
    # This enables the script to be compiles and get the directory of it.
    $psScriptPath = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
  }
  return $psScriptPath
}

function CheckedBoxes{
param($info)
if($info.IsChecked)
{

$installlist.add($info.content)

}

if($info.IsChecked -eq $false)
{

$dontinstalllist.Add($info.content)

}

if($info -eq $var_ddg_done)
{
$form1.Close()
}
}

function Check_Uncheck{
$fulllist[0].Add_Checked({CheckedBoxes -info $fulllist[0]})
$fulllist[0].Add_UnChecked({CheckedBoxes -info $fulllist[0]})
$fulllist[1].Add_Checked({CheckedBoxes -info $fulllist[1]})
$fulllist[1].Add_UnChecked({CheckedBoxes -info $fulllist[1]})
$fulllist[2].Add_Checked({CheckedBoxes -info $fulllist[2]})
$fulllist[2].Add_UnChecked({CheckedBoxes -info $fulllist[2]})
$fulllist[3].Add_Checked({CheckedBoxes -info $fulllist[3]})
$fulllist[3].Add_UnChecked({CheckedBoxes -info $fulllist[3]})
$fulllist[4].Add_Checked({CheckedBoxes -info $fulllist[4]})
$fulllist[4].Add_UnChecked({CheckedBoxes -info $fulllist[4]})
$fulllist[5].Add_Checked({CheckedBoxes -info $fulllist[5]})
$fulllist[5].Add_UnChecked({CheckedBoxes -info $fulllist[5]})
$fulllist[6].Add_Checked({CheckedBoxes -info $fulllist[6]})
$fulllist[6].Add_UnChecked({CheckedBoxes -info $fulllist[6]})
$fulllist[7].Add_Checked({CheckedBoxes -info $fulllist[7]})
$fulllist[7].Add_UnChecked({CheckedBoxes -info $fulllist[7]})
$fulllist[8].Add_Checked({CheckedBoxes -info $fulllist[8]})
$fulllist[8].Add_UnChecked({CheckedBoxes -info $fulllist[8]})
$fulllist[9].Add_Checked({CheckedBoxes -info $fulllist[9]})
$fulllist[9].Add_UnChecked({CheckedBoxes -info $fulllist[9]})
$fulllist[10].Add_Checked({CheckedBoxes -info $fulllist[10]})
$fulllist[10].Add_UnChecked({CheckedBoxes -info $fulllist[10]})
$fulllist[11].Add_Checked({CheckedBoxes -info $fulllist[11]})
$fulllist[11].Add_UnChecked({CheckedBoxes -info $fulllist[11]})
$fulllist[12].Add_Checked({CheckedBoxes -info $fulllist[12]})
$fulllist[12].Add_UnChecked({CheckedBoxes -info $fulllist[12]})
$fulllist[13].Add_Checked({CheckedBoxes -info $fulllist[13]})
$fulllist[13].Add_UnChecked({CheckedBoxes -info $fulllist[13]})
$fulllist[14].Add_Checked({CheckedBoxes -info $fulllist[14]})
$fulllist[14].Add_UnChecked({CheckedBoxes -info $fulllist[14]})
$fulllist[15].Add_Checked({CheckedBoxes -info $fulllist[15]})
$fulllist[15].Add_UnChecked({CheckedBoxes -info $fulllist[15]})
$fulllist[16].Add_Checked({CheckedBoxes -info $fulllist[16]})
$fulllist[16].Add_UnChecked({CheckedBoxes -info $fulllist[16]})
$fulllist[17].Add_Checked({CheckedBoxes -info $fulllist[17]})
$fulllist[17].Add_UnChecked({CheckedBoxes -info $fulllist[17]})
$fulllist[18].Add_Checked({CheckedBoxes -info $fulllist[18]})
$fulllist[18].Add_UnChecked({CheckedBoxes -info $fulllist[18]})
$var_ddg_done.Add_Click({CheckedBoxes -info $var_ddg_done})
}

function Prompts{
#Generates and stores input prompt answers
foreach($items in $installlist.ToArray())
{
if($items -eq "Join Domain"){
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
$global:isdomain = $true
$title = "Domain"
$msg   = 'Enter Domain Name:'

$global:DomainName = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = "Domain"
$msg   = 'Enter Domain Username:'

$DomainUser = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = "Domain"
$msg   = 'Enter Password:'

$DomainPass = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
$secpasswd = ConvertTo-SecureString $DomainPass -AsPlainText -Force
$global:Cred = New-Object System.Management.Automation.PSCredential ($DomainUser, $secpasswd)
}
if($items -eq "Change Name"){
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = "Name Change"
$msg   = 'Enter new computer name:'

$global:ComputerNae = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
}
if($items -eq "Automate")
{
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'Automate'
$msg   = 'Enter The full path to Automate Agent(Must be .exe):'

$global:AutomatePath = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
}
}
}

function Download_List{
foreach($objt in $installlist)
{
if($objt -eq "Windows Updates" -or $objt -eq "Join Domain" -or $objt -eq "Automate" -or $objt -eq "Change Name" -or $objt -eq "Sleep Settings" -or $objt -eq "Enable RDP")
{

}
else
{
$obj2 = $Global:exepath + $objt + ".exe"
Write-Host $obj2
Start-Process $obj2
$active = $true
while($active -eq $true){
if([bool](Get-Process -Name Ninite))
{
Start-Process "C:\Users\christian.gonzalez\Desktop\Staging Tool 2\main.exe" -Verbose
$mainlocation = $Global:exepath + 'main.exe'
$mainlocation = "C:\Users\christian.gonzalez\Desktop\Staging Tool 2\main.exe"
$pinfo = New-Object System.Diagnostics.ProcessStartInfo
$pinfo.FileName = $mainlocation
$pinfo.RedirectStandardError = $true
$pinfo.RedirectStandardOutput = $true
$pinfo.UseShellExecute = $false
$p = New-Object System.Diagnostics.Process
$p.StartInfo = $pinfo
$p.Start() #| Out-Null
$p.WaitForExit()
$stdout = $p.StandardOutput.ReadToEnd()
$stderr = $p.StandardError.ReadToEnd()
$checker = "stdout: $stdout"
Write-Host $checker

Write-Host $checkers

$programheh = $true

if($checker -match 'retry')
{

$active = $false
Get-Process -Name Ninite | Stop-Process
}
}
}
}

}
if($programheh -eq $true)
{
function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp "Programs have been installed" "Programs"
}

}

#Establishes list of programs
$fulllist = @($var_ddg_Automate, $var_ddg_EnableRDP, $var_ddg_Chrome, $var_ddg_Domain, $var_ddg_FileZilla, $var_ddg_Firefox, $var_ddg_Foxit, $var_ddg_Greenshot, $var_ddg_Java, $var_ddg_Libre, $var_ddg_NameChg, $var_ddg_Netframe, $var_ddg_Notepad, $var_ddg_Putty, $var_ddg_Sleep, $var_ddg_Updates, $var_ddg_Windir, $var_ddg_Zip, $var_ddg_Zoom)

$installlist = New-Object System.Collections.Generic.List[System.Object]

$dontinstalllist = New-Object System.Collections.Generic.List[System.Object]

$global:isdomain = $false

$wupdate = $false

DriveFinder

#Calls the Function that sets properties of all the boxes
Check_Uncheck

#Shows the GUI
$form1.showDialog()

#Sorts the list and trims
foreach($install in $installlist.ToArray())
{
foreach($dontinstall in $dontinstalllist.ToArray())
{
if($install -eq $dontinstall)
{

$installlist.Remove($install)

}


}


}


#Calls the prompts function
Prompts

#creates a path
$Global:exepath = Get-PSScriptPath
$Global:exepath = $Global:exepath -replace 'AStager.exe' -replace ''
#Installs for all exceptions for Automate
Download_List | Out-Null

foreach($obje in $installlist)
{
if($obje -eq "Sleep Settings")
{
Powercfg /Change monitor-timeout-ac 0
Powercfg /Change monitor-timeout-dc 0
Powercfg /Change standby-timeout-ac 0
Powercfg /Change standby-timeout-dc 0
function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp "Sleep Settings Changed" "Sleep Settings"
}
}

foreach($obje in $installlist)
{
if($obje -eq "Enable RDP")
{
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp "RDP Enabled" "RDP"
}
}

foreach($obje in $installlist)
{
if($obje -eq "Change Name")
{
Rename-Computer $ComputerNae -Force

$comment = "Computer name changed to " + $ComputerNae

function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp $comment "Computer Name"
}
}

foreach($obje in $installlist)
{
if($obje -eq "Automate")
{
Start-Process $AutomatePath
function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp "Automate Installed" "Automate"
}
}

foreach($obje in $installlist)
{
if($obje -eq "Windows Updates")
{

$wupdate = $true

}
}

#Setup a yes or no prompt before doing this because it restarts
[void][System.Reflection.Assembly]::LoadWithPartialName(‘Microsoft.VisualBasic’) 
# [microsoft.visualbasic.interaction]::Msgbox($message,"$button,$icon",$title)
foreach($obje in $installlist)
{
if($obje -eq "Windows Updates" -and $isdomain -eq $true)
{
if([Microsoft.VisualBasic.Interaction]::MsgBox(“Do you want to install updates and join the domain. Will Restart automatically after.”, ‘YesNoCancel,Information’, “Restart Prompt”) -eq 'Yes')
{
Add-Computer -DomainName $DomainName -Credential $Cred -Force
$module = $Global:exepath + "PSWindowsUpdate"
$reset = $env:PSModulePath
$env:PSModulePath = $env:PSModulePath + ';' + $Global:exepath
Import-Module -FullyQualifiedName $module -Verbose
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
$env:PSModulePath = $reset
function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp "Windows Updates installed and Domain Joined" "Windows Updates"
Start-Process -FilePath "cmd.exe" -ArgumentList '/c shutdown /r' -WorkingDirectory 'C:\'
}
else
{
function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp "All Done!" "Done"

}
}
elseif($obje -eq "Windows Updates" -and $isdomain -eq $false)
{
if([Microsoft.VisualBasic.Interaction]::MsgBox(“Do you want to install updates. Will Restart automatically after.”, ‘YesNoCancel,Information’, “Restart Prompt”) -eq 'Yes')
{
$mody = $Global:exepath + "PSWindowsUpdate"
$reset = $env:PSModulePath
$env:PSModulePath = $env:PSModulePath + ';' + $Global:exepath
Import-Module -FullyQualifiedName $mody -Verbose
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot -Verbose
$env:PSModulePath = $reset

function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp "Windows Updates installed" "Windows Updates"
Start-Process -FilePath "cmd.exe" -ArgumentList '/c shutdown /r' -WorkingDirectory 'C:\'
}
else
{
function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp "All Done!" "Done"
}
}
elseif($obje -eq "Join Domain" -and $wupdate -eq $false)
{
if([Microsoft.VisualBasic.Interaction]::MsgBox(“Do you want to join Domain. Will Restart automatically after.”, ‘YesNoCancel,Information’, “Restart Prompt”) -eq 'Yes')
{
Add-Computer -DomainName $DomainName -Credential $Cred -Force -Restart
function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp "Domain Joined" "Domain"
Start-Process -FilePath "cmd.exe" -ArgumentList '/c shutdown /r' -WorkingDirectory 'C:\'
}
else
{
function popUp($text,$title) {
    $a = new-object -comobject wscript.shell
    $b = $a.popup($text,0,$title,0)
}

popUp "All Done!" "Done"
}
}
}
$mainpa = $Global:exepath + 'main.exe'
Set-ExecutionPolicy -ExecutionPolicy Default
}

#make it restart at the end of domain and updates


Main | Out-Null

