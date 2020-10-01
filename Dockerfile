FROM mcr.microsoft.com/powershell
USER root

RUN pwsh -Command "install-module VMware.PowerCli -Scope CurrentUser -Force"
RUN pwsh -Command "Install-Module PScribo -Scope CurrentUser -Force"
#RUN pwsh -Command "install-module AsBuiltReport.Core -Scope CurrentUser -Force"
#RUN pwsh -Command "Install-Module AsBuiltReport.VMware.vSphere -Scope CurrentUser -Force"
#RUN pwsh -Command "install-module AsBuiltReport.VMware.ESXi -Scope CurrentUser -Force"

COPY ./AsBuiltReport.VMware.NSX-T/NSXT/NSXT* /root/.local/share/powershell/Modules/NSXT/
COPY ./AsBuiltReport.Core/ /root/.local/share/powershell/Modules/AsBuiltReport.Core/
COPY ./vmwarecode-hax/profile.ps1 /root/.config/powershell/profile.ps1
COPY ./vmwarecode-hax/setup.ps1 /tmp/setup.ps1

COPY ./AsBuiltReport.VMware.NSX-T/* /tmp/AsBuiltReport.VMware.NSX-T/
COPY ./vmwarecode-hax/profile.ps1 /vhax/.config/powershell/profile.ps1

RUN pwsh -Command /tmp/setup.ps1
RUN pwsh -Command /root/.config/powershell/profile.ps1
