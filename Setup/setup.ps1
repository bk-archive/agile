####log-in and subscription selection####

$account = "your account here"

Add-AzureRmAccount
$sub = Get-AzureRmSubscription -SubscriptionName $account
Select-AzureRmSubscription -SubscriptionName $sub.SubscriptionName

##########################################

if (!(Test-Path dev.json)) 
{
	write-host "templete not found"  -ForegroundColor Red
}
else 
{
    #Environment
    $Env = "Dev"
    $location = "West Us"

	#Resource Group Properties
	$RG_Name = "BK-AgileDemo-" + $Env

	#App Service Plan
	$ASP_Name = "BK-AgileDemo-ASP-" + $Env 

	#Web App
	$App_Name = "BK-AgileDemo-ASP-" +  $Env
	
    ############################################################################
	#                                                                          #
    #   Provition Resources From Template                                      #
    #                                                                          #
    ############################################################################
	#                                                                          #
    #   This will create:                                                      #
	#		Resource Group,                                                    #
    #		App Service Plan and                                               #
    #		Web App                                                            #
    #                                                                          #
    #   The the application will be deployed using external git configuration. #
    #                                                                          #
	############################################################################

	Write-Host "Provisioning " + $env  + "Dev Environment" -ForegroundColor Green 
	try 
	{ 
        New-AzureRmResourceGroupDeployment -ResourceGroupName $RG_Name  `
            -TemplateFile .\dev.json `
            -App $App_Name `
            -AppServicePlan $ASP_Name

		[System.Console]::Beep(400,1500)
	}
	catch 
	{
    	Write-Host $Error[0] -ForegroundColor Red 
    	exit 1 
	} 

	pause
}