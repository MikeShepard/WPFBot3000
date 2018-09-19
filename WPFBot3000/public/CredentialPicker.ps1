<#
.SYNOPSIS
A control that allows input of credentials and encapsulates the Windows Presentation Foundation (WPF) System.Management.Automation.PsCredential.GetNetworkCredential class

.DESCRIPTION
A control that allows input of credentials

.PARAMETER Name
The name of the control.

.PARAMETER InitialValue
The credentials loaded into the control

.EXAMPLE
Dialog {
    CredentialPicker MyCreds
}

#dialog with a place to request credentials (initially blank)

.LINK
https://docs.microsoft.com/en-us/dotnet/api/system.management.automation.pscredential
#>
Function CredentialPicker {
    [CmdletBinding()]
    Param([string]$Name,
        [PSCredential]$InitialValue)
    StackPanel -Property @{ Name = $name; Orientation = 'Horizontal'} -contents {

    ($t=TextBox -Name "cred_$name" -property @{IsReadOnly = $true})
    if ($InitialValue) {
        $t.tag = $InitialValue
        $t.text = $initialvalue.GetNetworkCredential().UserName
    }
    else {
        $t.tag = $null
        $t.text = '<none>'
    }
    Button  Edit -action {
            $cred = CredentialDialog $t.tag
            $t.Tag = $cred
            $t.Text = $cred.GetNetworkCredential().Username
        }
    } 
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[0].Tag} -PassThru -Force

}