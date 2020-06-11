#Requires -Modules @{ModuleName='InvokeBuild';ModuleVersion='3.2.1'}
#Requires -Modules @{ModuleName='ModuleBuilder';ModuleVersion='1.0.0'}

$Script:ModuleName = Get-Item -Path $BuildRoot | Select-Object -ExpandProperty Name
Get-Module -Name $ModuleName | Remove-Module -Force

task Clean {
    Remove-Item -Path ".\Bin" -Recurse -Force -ErrorAction SilentlyContinue
}

task CompilePSM {
    Write-Build Yellow "`n`n`nCompiling all code into single psm1"
    Push-Location -Path "$BuildRoot\Source" -StackName 'InvokeBuildTask'
    $Script:CompileResult = Build-Module -Passthru
    Pop-Location -StackName 'InvokeBuildTask'
}

task . Clean, CompilePSM

    