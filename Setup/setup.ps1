####log-in and subscription selection####

$account = "byvinyal"

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
    $Env = "dev"
    $location = "West Us"

	#Resource Group
	$RG_Name = "bk-agiledemo-rg-" + $Env

	#App Service Plan
	$ASP_Name = "bk-agiledemo-asp-" + $Env 

	#Web App
	$App_Name = "bk-agiledemo-" +  $Env
	
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
        New-AzureRmResourceGroup -Name $RG_Name -Location $location
        New-AzureRmResourceGroupDeployment  -ResourceGroupName $RG_Name `
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