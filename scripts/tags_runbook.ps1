Param
([object]$WebhookData) #this parameter name needs to be called WebHookData otherwise the webhook does not work as expected.
$VerbosePreference = 'continue'
 
function AzureConnect()
{
    $connectionName = "AzureRunAsConnection"
    try
    {
        $servicePrincipalConnection = Get-AutomationConnection -Name $connectionName     
        Add-AzureRmAccount `
            -ServicePrincipal `
            -TenantId $servicePrincipalConnection.TenantId `
            -ApplicationId $servicePrincipalConnection.ApplicationId `
            -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 
    }
    catch {
        if (!$servicePrincipalConnection)
        {
            $ErrorMessage = "Connection $connectionName not found."
            throw $ErrorMessage
        } else {
            Write-Error -Message $_.Exception
            throw $_.Exception
        }
    }
}
 
 
# If runbook was called from Webhook, WebhookData will not be null.
if ($WebHookData){
 
    # Collect properties of WebhookData
    $WebhookName     =     $WebHookData.WebhookName
    $WebhookHeaders  =     $WebHookData.RequestHeader
    $WebhookBody     =     $WebHookData.RequestBody
 
    # Collect individual headers. Input converted from JSON.
    $From = $WebhookHeaders.From
    #$Input = (ConvertFrom-Json -InputObject $WebhookBody)
 
    $Input = $WebhookBody | ConvertFrom-Json 
 
    Write-Verbose "WebhookBody: $Input"
    
    Write-Output -InputObject ('Webhook Body in JSON : {0}' -f $WebhookBody)
    
    Write-Output -InputObject ('WebhookBody is {0}:' -f $Input)
    
    Write-Output -InputObject ('Runbook started from webhook {0} by {1}.' -f $WebhookName, $From)
   
}
else
{
   Write-Error -Message 'Runbook was not started from Webhook' -ErrorAction stop
}
#endregion
 
# connect to azure
 
AzureConnect
 
$subscription = $Input.Subscription
$rgname = $Input.ResourceGroup
$newtags = $Input.tags 
 
Write-Output -InputObject ('New Tag Values are {0}.' -f $newTags)

 
$NewTagsHash = @{}
$newTags.psobject.properties | ForEach-Object { $NewTagsHash[$_.Name] = $_.Value }
 
$NewTagsHash

foreach($tag in $NewTagsHash.GetEnumerator())
 
{
 
Write-Output -InputObject ("{0}:{1}`n" -f $tag.key,$tag.Value )
 
}
 
    
    Get-AzureRmSubscription `
                  -SubscriptionName $subscription `
                  | Select-AzureRmSubscription

# ResourceGroup Tagging
$resourcegroup= Get-AzureRmResourceGroup | Where-Object{$_.ResourceGroupName -eq $rgname} -ErrorAction SilentlyContinue

$CurrentTags = @{}
$CurrentTags = $resourcegroup.tags
 
$nullTags = $resourcegroup.tags
 
foreach($key in $CurrentTags.keys)
{
  $nullTags.Remove($key)
}
$nullTags


Set-AzureRmResourceGroup -id $resourcegroup.ResourceId -Tag $nullTags
Set-AzureRmResourceGroup -id $resourcegroup.ResourceId -Tag $NewTagsHash

#Verify that the tags have been updated at the ResourceGroup Level
$updatedRGTags = (Get-AzureRmResourceGroup -ResourceGroupName $rgname).tags
Write-Output -InputObject ("Update ResourceGroup Tags:`n {0}" -f $updatedRGTags)

#Resource tagging
$resourcevalues= Get-AzureRmResource | Where-Object{$_.ResourceGroupName -eq $rgname}
foreach($resource in $resourcevalues){
  $CurrentTags = @{}
  $nullTags = $resource.tags
  $CurrentTags = $resource.tags
  foreach($key in $CurrentTags.keys)
  {
   $nullTags.Remove($key)
  }
  $nullTags
  #
  Set-AzureRmResource -ResourceGroupName $rgname -ResourceName $($resource.Name) -ResourceType $resource.ResourceType -Tag $nullTags -Force
  Set-AzureRmResource -ResourceGroupName $rgname -ResourceName $($resource.Name) -ResourceType $resource.ResourceType -Tag $NewTagsHash -Force
  #
  #Verify that the tags have been updated at the ResourceGroup Level
  $updatedTags = (Get-AzureRmResource -Name $resource.Name).tags
  Write-Output -InputObject ("Update Resource Tags:`n {0}" -f $updatedTags)
}
 
