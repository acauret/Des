# Azure-SAP-HANA-Pre-Prod-Deployment-Templates


<p><a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdesmcguire%2FAzure-SAP-HANA-Pre-Prod-Deployment-Templates%2Fmaster%2Fazuredeploy.sapinsurance.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" />
Deploy SAP Insurance (2xSCS, 2xApp, 2xDB)
</a>
<p><a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdesmcguire%2FAzure-SAP-HANA-Pre-Prod-Deployment-Templates%2Fmaster%2Fazuredeploy.saputilities.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" />
Deploy SAP Utilities (2xSCS, 2xApp, 2xDB)
</a>
<p><a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdesmcguire%2FAzure-SAP-HANA-Pre-Prod-Deployment-Templates%2Fmaster%2Fazuredeploy.sapnwgateway.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" />
Deploy SAP NW Gateway (2xSCS, 2xApp, 2xDB)
</a>
<p><a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdesmcguire%2FAzure-SAP-HANA-Pre-Prod-Deployment-Templates%2Fmaster%2Fazuredeploy.sapnwpo.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" />
Deploy SAP NW PO (2xSCS, 2xApp, 2xDB)
</a>
<p><a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdesmcguire%2FAzure-SAP-HANA-Pre-Prod-Deployment-Templates%2Fmaster%2Fazuredeploy.saphybris.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" />
Deploy SAP Hybris (2xSCS, 4xApp, 2xDB)
</a>
<p><a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdesmcguire%2FAzure-SAP-HANA-Pre-Prod-Deployment-Templates%2Fmaster%2Fazuredeploy.sapbw.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" />
Deploy SAP BW (2xSCS, 2xApp, 2xDB)
</a>
<p><a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdesmcguire%2FAzure-SAP-HANA-Pre-Prod-Deployment-Templates%2Fazuredeploy.sapcloudconnector.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" />
Deploy SAP Cloud Connector (2xSCS, 2xApp, 2xDB)
</a>


<p>The VMs are configured using the following sizes and data disk configurations</p>
<table>
	<tr>
		<th>VM Role</th>
		<th>VM Size</th>
		<th>VM Memory</th>
		<th>Data Disks</th>
	</tr>
	<tr>
		<td>App - SAP Insurance</td>
		<td>Standard_E8s_v3</td>
		<td>64GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>App - SAP Utilities</td>
		<td>Standard_E16s_v3</td>
		<td>128GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>App - SAP NW Gateway</td>
		<td>Standard_E4s_v3</td>
		<td>32GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>App - SAP NW PO</td>
		<td>Standard_E4s_v3</td>
		<td>32GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>App - SAP Hybris</td>
		<td>Standard_E16s_v3</td>
		<td>128GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>App - SAP BW</td>
		<td>Standard_E8s_v3</td>
		<td>64GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>App - SAP Cloud Connector</td>
		<td>Standard_E4s_v3</td>
		<td>32GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>SCS - SAP Insurance</td>
		<td>Standard_D2s_v3</td>
		<td>8GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>SCS - SAP Utilities</td>
		<td>Standard_D2s_v3</td>
		<td>8GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>SCS - SAP NW Gateway</td>
		<td>Standard_D2s_v3</td>
		<td>8GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>SCS - SAP NW PO</td>
		<td>Standard_D2s_v3</td>
		<td>8GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>SCS - SAP Hybris</td>
		<td>Standard_D8s_v3</td>
		<td>32GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>SCS - SAP BW</td>
		<td>Standard_D2s_v3</td>
		<td>8GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>SCS - SAP Cloud Connector</td>
		<td>Standard_D2s_v3</td>
		<td>8GB</td>
		<td>P10 (128GB)</td>
	</tr>
	<tr>
		<td>DB - SAP Insurance</td>
		<td>Standard_E32s_v3</td>
		<td>256GB</td>
		<td>P30 (1,024GB), P30 (1,024GB), P30 (1,024GB), 1xP20 (512GB), 1xP20 (512GB), P30 (1,024GB), 1xP6 (64GB), P40 (2,048GB), P40 (2,048GB)</td>
	</tr>
	<tr>
		<td>DB - SAP Utilities</td>
		<td>Standard_E64s_v3</td>
		<td>432GB</td>
		<td>P30 (1,024GB), P30 (1,024GB), P30 (1,024GB), 1xP20 (512GB), 1xP20 (512GB), P30 (1,024GB), 1xP6 (64GB), P40 (2,048GB), P40 (2,048GB)</td>
	</tr>
	<tr>
		<td>DB - SAP NW Gateway</td>
		<td>Standard_E32s_v3</td>
		<td>256GB</td>
		<td>P30 (1,024GB), P30 (1,024GB), P30 (1,024GB), 1xP20 (512GB), 1xP20 (512GB), P30 (1,024GB), 1xP6 (64GB), P40 (2,048GB), P40 (2,048GB)</td>
	</tr>
	<tr>
		<td>DB - SAP NW PO</td>
		<td>Standard_E16s_v3</td>
		<td>128GB</td>
		<td>P30 (1,024GB), P30 (1,024GB), P30 (1,024GB), 1xP20 (512GB), 1xP20 (512GB), P30 (1,024GB), 1xP6 (64GB), P40 (2,048GB), P40 (2,048GB)</td>
	</tr>
	<tr>
		<td>DB - SAP Hybris</td>
		<td>Standard_E64s_v3</td>
		<td>432GB</td>
		<td>P30 (1,024GB), P30 (1,024GB), P30 (1,024GB), 1xP20 (512GB), 1xP20 (512GB), P30 (1,024GB), 1xP6 (64GB), P40 (2,048GB), P40 (2,048GB)</td>
	</tr>
	<tr>
		<td>DB - SAP BW</td>
		<td>Standard_E32s_v3</td>
		<td>256GB</td>
		<td>P30 (1,024GB), P30 (1,024GB), P30 (1,024GB), 1xP20 (512GB), 1xP20 (512GB), P30 (1,024GB), 1xP6 (64GB), P40 (2,048GB), P40 (2,048GB)</td>
	</tr>
	<tr>
		<td>DB - SAP Cloud Connector</td>
		<td>Standard_E32s_v3</td>
		<td>256GB</td>
		<td>P30 (1,024GB), P30 (1,024GB), P30 (1,024GB), 1xP20 (512GB), 1xP20 (512GB), P30 (1,024GB), 1xP6 (64GB), P40 (2,048GB), P40 (2,048GB)</td>
	</tr>
</table>
