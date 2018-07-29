########################################################################################################################
# Script Disclaimer
########################################################################################################################
# This script is not supported under any Microsoft standard support program or service.
# This script is provided AS IS without warranty of any kind.
# Microsoft disclaims all implied warranties including, without limitation, any implied warranties of
# merchantability or of fitness for a particular purpose. The entire risk arising out of the use or
# performance of this script and documentation remains with you. In no event shall Microsoft, its authors,
# or anyone else involved in the creation, production, or delivery of this script be liable for any damages
# whatsoever (including, without limitation, damages for loss of business profits, business interruption,
# loss of business information, or other pecuniary loss) arising out of the use of or inability to use
# this script or documentation, even if Microsoft has been advised of the possibility of such damages.

<#
.Synopsis
    This script updates Tags for all Resources within a given ResourceGroup.
.DESCRIPTION
    - The script assumes that your account/the service principal has full access to perform updates against the named subscription/resourcegroup and resources.
    - The assumes that the SAP MID server has the correct/updated PowerShell modules inplace
.OUTPUTS
   <none>
.NOTES
    Version:        1.0
    Author:         Andrew Auret
    Creation Date:  2018-07-29
#>


########################################################################################################################
# Parameters
########################################################################################################################

[CmdletBinding(DefaultParametersetName="All")]

Param(
    ################################################
    # Parameter Set Default
    ################################################
    [Parameter(Mandatory = $true,
               HelpMessage="Name of the resourcegroup where the resource tags will be updated")]
    [ValidateNotNullOrEmpty()]
    [string]$resourceGroupName,

    [Parameter(Mandatory = $false,
               HelpMessage="Service Ticket Number tag value. If no value is entered - the tag will not be updated")]
    [ValidateNotNullOrEmpty()]
    [string]$ServiceTicketRequestID,

    [Parameter(Mandatory = $false,
               HelpMessage="Cost Code ID tag value. If no value is entered - the tag will not be updated")]
    [ValidateNotNullOrEmpty()]
    [string]$CostCodeID,

    [Parameter(Mandatory = $false,
               HelpMessage="Project Code tag value. If no value is entered - the tag will not be updated")]
    [ValidateNotNullOrEmpty()]
    [string]$ProjectCode,

    [Parameter(Mandatory = $false,
               HelpMessage="Project Number tag value. If no value is entered - the tag will not be updated")]
    [ValidateNotNullOrEmpty()]
    [string]$ProjectNumber,

    [Parameter(Mandatory = $false,
               HelpMessage="Project Name tag value. If no value is entered - the tag will not be updated")]
    [ValidateNotNullOrEmpty()]
    [string]$ProjectName,

    [Parameter(Mandatory = $false,
               HelpMessage="Start_date tag value. If no value is entered - the tag will not be updated")]
    [ValidateNotNullOrEmpty()]
    [string]$Start_date,

    [Parameter(Mandatory = $false,
               HelpMessage="End_date tag value. If no value is entered - the tag will not be updated")]
    [ValidateNotNullOrEmpty()]
    [string]$End_date

)

$ServiceTicketRequestID_tag = @{"Service Ticket Request ID" = "$ServiceTicketRequestID"}
#
$CostCodeID_tag = @{"Cost Code ID" = "$CostCodeID"}
#
$ProjectCode_tag = @{"Project Code" = "$ProjectCode"}
#
$ProjectNumber_tag = @{"Project Number" = "$ProjectNumber"}
#
$ProjectName_tag   = @{"Project Name" = "$ProjectName"}
#
$Start_date_tag   = @{"Start_date" = "$Start_date"}
#
$End_date_tag  = @{"End_date" = "$End_date"}
#
########################################################################################################################
# Pre-validations and Error handling
########################################################################################################################
# When running on Windows, the presence of AzureRM module is checked
if (($PSVersionTable.Platform -ne "Unix") -and ($PSVersionTable.PSEdition -ne "Core"))
{
    $AzureRMProfileVersion = (Get-Module -ListAvailable AzureRM.Profile).Version
    if (-not(($AzureRMProfileVersion.Major -ge 3 -and $AzureRMProfileVersion.Minor -ge 4) -or ($AzureRMProfileVersion.Major -gt 3))) {
        Write-Error -Message "Please install the latest Azure PowerShell and retry. Relevant doc url : https://docs.microsoft.com/powershell/azureps-cmdlets-docs/ "
        break
    }
}

# Check if the AzureAD module is installed
if (-not (Get-Command Connect-AzureAD -ErrorAction SilentlyContinue))
{
    Write-Error "Please install the required module to be able to run the ""Connect-AzureAD"" commandlet. The module's name varies based on the platform of your choice. It's typically one of the followings: AzureAD, AzureAD.Standard.Preview"
    break
}

# Check if the AzureRM module is installed
if (-not (Get-Command Connect-AzureRmAccount -ErrorAction SilentlyContinue))
{
    Write-Error "Please install the required module to be able to run the ""Connect-AzureRmAccount"" commandlet. The module's name varies based on the platform of your choice. It's typically one of the followings: AzureRM, AzureRM.Profile.Netcore"
    break
}
#

$resourcevalues= Get-AzureRmResource | Where-Object{$_.ResourceGroupName -eq $resourceGroupName}
foreach($resource in $resourcevalues){
    Write-Output "Current Tags for the ResourceName: $($resource.ResourceName) in ResourceGroup:$($resourceGroupName)"
    $Tags = $resource.Tags
    [System.Collections.ArrayList]$TagsArrayList = $Tags
    foreach($ResourceTag in $TagsArrayList){
        Write-Output $ResourceTag
        #
        if(($ResourceTag.Name -eq $ServiceTicketRequestID_tag.Keys)-and ($ServiceTicketRequestID_tag.Values -ne "")){
            $tags.Remove($ResourceTag.Name)
            $tags.Add($($ServiceTicketRequestID_tag.Keys),$($ServiceTicketRequestID_tag.Values))
        }
        #
        if(($ResourceTag.Name -eq $CostCodeID_tag.Keys)-and ($CostCodeID_tag.Values -ne "")){
            $tags.Remove($ResourceTag.Name)
            $tags.Add($($CostCodeID_tag.Keys),$($CostCodeID_tag.Values))
        }
        #
        if(($ResourceTag.Name -eq $ProjectCode_tag.Keys)-and ($ProjectCode_tag.Values -ne "")){
            $tags.Remove($ResourceTag.Name)
            $tags.Add($($ProjectCode_tag.Keys),$($ProjectCode_tag.Values))
        }
        #
        if(($ResourceTag.Name -eq $ProjectNumber_tag.Keys)-and ($ProjectNumber_tag.Values -ne "")){
            $tags.Remove($ResourceTag.Name)
            $tags.Add($($ProjectNumber_tag.Keys),$($ProjectNumber_tag.Values))
        }
        #
        if(($ResourceTag.Name -eq $ProjectName_tag.Keys)-and ($ProjectName_tag.Values -ne "")){
            $tags.Remove($ResourceTag.Name)
            $tags.Add($($ProjectName_tag.Keys),$($ProjectName_tag.Values))
        }
        #
        if(($ResourceTag.Name -eq $Start_date_tag.Keys)-and ($Start_date_tag.Values -ne "")){
            $tags.Remove($ResourceTag.Name)
            $tags.Add($($Start_date_tag.Keys),$($Start_date_tag.Values))
        }
        #
        if(($ResourceTag.Name -eq $End_date_tag.Keys)-and ($End_date_tag.Values -ne "")){
            $tags.Remove($ResourceTag.Name)
            $tags.Add($($End_date_tag.Keys),$($End_date_tag.Values))
        }
    }
    Write-Output ""

    Write-Output "New Tags for the ResourceName: $($resource.ResourceName) in ResourceGroup:$($resourceGroupName)"
    Write-Output $tags

    Set-AzureRmResource -ResourceGroupName $resourceGroupName -ResourceName $($resource.ResourceName) -ResourceType $resource.ResourceType -Tag $Tags -Force -verbose
}


