#Region '.\_PrefixCode.ps1' 0
# Code in here will be prepended to top of the psm1-file.
#EndRegion '.\_PrefixCode.ps1' 1
#Region '.\Private\AddFiveToInt.ps1' 0
function AddFiveToInt {
    param (
        $Int
    )

    $Int + 5
}
#EndRegion '.\Private\AddFiveToInt.ps1' 7
#Region '.\Private\AddFiveToString.ps1' 0
function AddFiveToString {
    param (
        $String
    )
    
    Write-Output "$String - Five"
}
#EndRegion '.\Private\AddFiveToString.ps1' 7
#Region '.\Public\Add-FiveToObject.ps1' 0
function Add-FiveToObject {
    [CmdletBinding(DefaultParameterSetName='Int')]
    param (
        [Parameter(Mandatory, ParameterSetName='Int')]
        [ValidateRange(1,100)]
        [uint]$Int,

        [Parameter(Mandatory, ParameterSetName='String')]
        [ValidateNotNullOrEmpty()]
        [string]$String
    )
    
    $Result = switch ($PSCmdlet.ParameterSetName) {
        'Int' { AddFiveToInt -Int $Int }
        'String' { AddFiveToString -String "$string" }
    }

    Write-Output $Result
}
#EndRegion '.\Public\Add-FiveToObject.ps1' 19
