#! /bin/sh

version=$(curl -s https://api.github.com/repos/fluxcd/flux2/releases/latest | jq -r .tag_name | sed "s/v//")

mkdir "/tmp/flux-$version"
curl -sLo /tmp/flux.tar.gz "https://github.com/fluxcd/flux2/releases/latest/download/flux_${version}_linux_amd64.tar.gz"
tar -zxf /tmp/flux.tar.gz -C "/tmp/flux-$version/"
rm /tmp/flux.tar.gz
tar -czf "SOURCES/flux-$version.tar.gz" -C /tmp "flux-$version"
rm -rf "/tmp/flux-$version"

__spec="Name:           flux
Version:        $version
Release:        1%{?dist}
Summary:        Flux control application

License:        MPLv2
Source0:        flux-$version.tar.gz

%global debug_package %{nil}
%global _missing_build_ids_terminate_build 0

%description
Flux control application

%prep
%autosetup

%build

%install
install -Dpm 0755 flux %{buildroot}%{_bindir}/flux

%files
%{_bindir}/flux"

echo "$__spec" > SPECS/flux.spec
