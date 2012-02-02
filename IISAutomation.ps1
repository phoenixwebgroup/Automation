#Set Parameters
param([string]$AppPool = "MyAppPool",[string]$Site = "MySite",[string]$App = "MyApp",[string]$path = "C:\wwwroot",[string]$port = "80",[string]$protocols = "http")

#Import the IIS Module into Powershell.
Import-Module WebAdministration

#Check if the Application Pool exists.
if(Test-Path IIS:\AppPools\$AppPool)
{	
		#The AppPool already exists, check if the Site exists.
		if(Test-Path IIS:\Sites\$Site)
		{
			#The Site exists, check if the app exists and create it if it doesn't.
			if(Test-Path IIS:\Sites\$Site\$App)
			{
			return "The Application Pool, $AppPool, the Site, $Site, and the App, $App, already exist and were not created!"
			}
			else
			{
				#If the physical path to the app exists, just create the app.
				if(Test-Path $path)
				{
					New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
				}								
				#If the physical path to the app doesn't exist, create it and the app.
				else	
				{
					New-Item $path -type directory
					New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
				}
			}
		return "The Application Pool, $AppPool, and the Site, $Site, already exist and were not created!";
		}

		#The Site doesn't exists, create it.
		else
		{
			#If the physical path to the site exists, just create the site.
			if(Test-Path C:\$Site)
			{
				New-Item iis:\Sites\$Site -physicalPath C:\$Site -bindings @{protocol="$protocols";bindingInformation=":$port:"}

				#The Site has been created, check if the app exists and create it if it doesn't.
				if(Test-Path IIS:\Sites\$Site\$App)
				{
				return "The Application Pool, $AppPool, and the App, $App, already exist and were not created!"
				}
				else
				{
					#If the physical path to the app exists, just create the app.
					if(Test-Path $path)
					{
						New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
					}								
					#If the physical path to the app doesn't exist, create it and the app.
					else	
					{
						New-Item $path -type directory
						New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
					}
				}
			}
			
			#If the physical path to the site doesn't exist, create it and the site.
			else
			{
			New-Item C:\$Site -type directory
			New-Item iis:\Sites\$Site -physicalPath C:\$Site -bindings @{protocol="$protocols";bindingInformation=":$port:"}

				#The Site has been created, check if the app exists and create it if it doesn't.
				if(Test-Path IIS:\Sites\$Site\$App)
				{
				return "The Application Pool, $AppPool, and the App, $App, already exist and were not created!"
				}
				else
				{
					#If the physical path to the app exists, just create the app.
					if(Test-Path $path)
					{
						New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
					}								
					#If the physical path to the app doesn't exist, create it and the app.
					else	
					{
						New-Item $path -type directory
						New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
					}
				}
			}
		}
		
	return "The Application Pool, $AppPool, already exists and was not created!";	
}

#The Application Pool doesn't exist, create it.
else
{
	New-Item iis:\AppPools\$AppPool
	Set-ItemProperty IIS:\AppPools\$AppPool managedRuntimeVersion v4.0

		#Now the AppPool is created, check if the Site exists.
		if(Test-Path IIS:\Sites\$Site)
		{
			#The Site exists, check if the app exists and create it if it doesn't.
				if(Test-Path IIS:\Sites\$Site\$App)
				{
				return "The Site, $Site, and the App, $App, already exist and were not created!"
				}
				else
				{
					#If the physical path to the app exists, just create the app.
					if(Test-Path $path)
					{
						New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
					}								
					#If the physical path to the app doesn't exist, create it and the app.
					else	
					{
						New-Item $path -type directory
						New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
					}
				}
		return "The Site, $Site, already exists and was not created!";
		}

		#The Site doesn't exists, create it.
		else
		{
			#If the physical path to the site exists, just create the site.
			if(Test-Path C:\$Site)
			{
				New-Item iis:\Sites\$Site -physicalPath C:\$Site -bindings @{protocol="$protocols";bindingInformation=":$port:"}

				#The Site has been created, check if the app exists and create it if it doesn't.
				if(Test-Path IIS:\Sites\$Site\$App)
				{
				return "The App, $App, already exists and was not created!"
				}
				else
				{
					#If the physical path to the app exists, just create the app.
					if(Test-Path $path)
					{
						New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
					}								
					#If the physical path to the app doesn't exist, create it and the app.
					else	
					{
						New-Item $path -type directory
						New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
					}
				}
			}
			
			#If the physical path to the site doesn't exist, create it and the site.
			else
			{
			New-Item C:\$Site -type directory
			New-Item iis:\Sites\$Site -physicalPath C:\$Site -bindings @{protocol="$protocols";bindingInformation=":$port:"}

				#The Site has been created, check if the app exists and create it if it doesn't.
				if(Test-Path IIS:\Sites\$Site\$App)
				{
				return "The App, $App, already exists and was not created!"
				}
				else
				{
					#If the physical path to the app exists, just create the app.
					if(Test-Path $path)
					{
						New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
					}								
					#If the physical path to the app doesn't exist, create it and the app.
					else	
					{
						New-Item $path -type directory
						New-Item iis:\Sites\$Site\$App -physicalPath $path -type Application
					}
				}
			}
		}
}

