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