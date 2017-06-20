<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="signalrservice" generation="1" functional="0" release="0" Id="7dd29933-871d-4f8e-9c3b-9a6565c279e2" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="signalrserviceGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="signalrservicewebrole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/signalrservice/signalrserviceGroup/LB:signalrservicewebrole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="signalrservicewebrole:APPINSIGHTS_INSTRUMENTATIONKEY" defaultValue="">
          <maps>
            <mapMoniker name="/signalrservice/signalrserviceGroup/Mapsignalrservicewebrole:APPINSIGHTS_INSTRUMENTATIONKEY" />
          </maps>
        </aCS>
        <aCS name="signalrservicewebrole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/signalrservice/signalrserviceGroup/Mapsignalrservicewebrole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="signalrservicewebroleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/signalrservice/signalrserviceGroup/MapsignalrservicewebroleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:signalrservicewebrole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/signalrservice/signalrserviceGroup/signalrservicewebrole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="Mapsignalrservicewebrole:APPINSIGHTS_INSTRUMENTATIONKEY" kind="Identity">
          <setting>
            <aCSMoniker name="/signalrservice/signalrserviceGroup/signalrservicewebrole/APPINSIGHTS_INSTRUMENTATIONKEY" />
          </setting>
        </map>
        <map name="Mapsignalrservicewebrole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/signalrservice/signalrserviceGroup/signalrservicewebrole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapsignalrservicewebroleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/signalrservice/signalrserviceGroup/signalrservicewebroleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="signalrservicewebrole" generation="1" functional="0" release="0" software="C:\Users\mofasiul\Downloads\signalrproject\signalrservice\signalrservice\csx\Debug\roles\signalrservicewebrole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="APPINSIGHTS_INSTRUMENTATIONKEY" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;signalrservicewebrole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;signalrservicewebrole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/signalrservice/signalrserviceGroup/signalrservicewebroleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/signalrservice/signalrserviceGroup/signalrservicewebroleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/signalrservice/signalrserviceGroup/signalrservicewebroleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="signalrservicewebroleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="signalrservicewebroleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="signalrservicewebroleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="944d0686-68fa-4874-89ae-8dfd1cd5d4b2" ref="Microsoft.RedDog.Contract\ServiceContract\signalrserviceContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="e1fc4f9c-c72b-4ae1-8528-bb2b1acb60d5" ref="Microsoft.RedDog.Contract\Interface\signalrservicewebrole:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/signalrservice/signalrserviceGroup/signalrservicewebrole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>