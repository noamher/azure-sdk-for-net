::
:: Microsoft Azure SDK for Net - Generate library code
:: Copyright (C) Microsoft Corporation. All Rights Reserved.
::

@echo off
setlocal
set autoRestVersion=0.14.0-Nightly20160125
set source=-Source https://www.myget.org/F/autorest/api/v2

::set resSpecFile="https://raw.githubusercontent.com/vivsriaus/azure-rest-api-specs/deploymentdebugSetting/arm-resources/resources/2016-02-01/swagger/resources.json"
set resSpecFile="https://raw.githubusercontent.com/vivsriaus/azure-rest-api-specs/AddPolicySpec/arm-resources/resources/2016-02-01/swagger/resources.json"
set lockSpecFile="https://raw.githubusercontent.com/vivsriaus/azure-rest-api-specs/AddPolicySpec/arm-resources/locks/2015-01-01/swagger/locks.json"
set featureSpecFile="https://raw.githubusercontent.com/Azure/azure-rest-api-specs/master/arm-resources/features/2015-12-01/swagger/features.json"
set subscriptionSpecFile="https://raw.githubusercontent.com/Azure/azure-rest-api-specs/master/arm-resources/subscriptions/2015-11-01/swagger/subscriptions.json"
::set policySpecFile="https://raw.githubusercontent.com/Azure/azure-rest-api-specs/master/arm-resources/policy/2015-10-01-preview/swagger/policy.json"
set policySpecFile="https://raw.githubusercontent.com/vivsriaus/azure-rest-api-specs/AddPolicySpec/arm-resources/policy/2015-10-01-preview/swagger/policy.json"

set repoRoot=%~dp0..\..\..\..
set generateFolder=%~dp0Generated

if exist %generateFolder% rd /S /Q  %generateFolder%

call "%repoRoot%\tools\autorest.gen.cmd" %resSpecFile% Microsoft.Azure.Management.Resources %autoRestVersion% %generateFolder% 
call "%repoRoot%\tools\autorest.gen.cmd" %lockSpecFile% Microsoft.Azure.Management.Resources %autoRestVersion% %generateFolder% 
call "%repoRoot%\tools\autorest.gen.cmd" %featureSpecFile% Microsoft.Azure.Management.Resources %autoRestVersion% %generateFolder% 
call "%repoRoot%\tools\autorest.gen.cmd" %subscriptionSpecFile% Microsoft.Azure.Management.Resources %autoRestVersion% %generateFolder% 
call "%repoRoot%\tools\autorest.gen.cmd" %policySpecFile% Microsoft.Azure.Management.Resources %autoRestVersion% %generateFolder% 

endlocal