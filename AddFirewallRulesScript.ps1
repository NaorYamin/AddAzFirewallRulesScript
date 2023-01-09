Connect-AzAccount
Set-AzContext -Subscription "<Subscritpion ID>"

$policy = Get-AzFirewallPolicy -Name "<Policy Name>" -ResourceGroupName "<Resource Group Name>"
$natrulecollectiongroup = Get-AzFirewallPolicyRuleCollectionGroup -Name "<Rule Collection Group Name>" -ResourceGroupName "<Resource Group Name>" -AzureFirewallPolicyName "<Firewall Policy Name>"
$existingrulecollection = $natrulecollectiongroup.Properties.RuleCollection | where {$_.Name -eq "<rule collection name"}




$newrule1 = New-AzFirewallPolicyNetworkRule -Name "Network-rule1" -SourceAddress "<Source Address>" -Protocol "<protocol>" -DestinationPort "<Destination Port>" -DestinationAddress "<Destination>"  
$newrule2 = New-AzFirewallPolicyNetworkRule -Name "Network-rule2" -SourceAddress "<Source Address>" -Protocol "<protocol>" -DestinationPort "<Destination Port>" -DestinationAddress "<Destination>" 


$existingrulecollection.Rules.Add($newrule1)
$existingrulecollection.Rules.Add($newrule2)

Set-AzFirewallPolicyRuleCollectionGroup -Name " <Rule Collection Group Name> " -FirewallPolicyObject $policy -Priority 200 -RuleCollection $natrulecollectiongroup.Properties.rulecollection







