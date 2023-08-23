#! /bin/sh

version=$(curl -s https://api.github.com/repos/siderolabs/talos/releases/latest | jq -r .tag_name | sed "s/v//")

mkdir "/tmp/talos-$version"
curl -sLo "/tmp/talos-$version/talosctl" https://github.com/siderolabs/talos/releases/latest/download/talosctl-linux-amd64
tar -czf "SOURCES/talos-$version.tar.gz" -C /tmp "talos-$version"
rm -rf "/tmp/talos-$version"

__spec="Name:           talos
Version:        $version
Release:        1%{?dist}
Summary:        Talos Linux control application

License:        MPLv2
Source0:        talos-$version.tar.gz

%global debug_package %{nil}
%global _missing_build_ids_terminate_build 0

%description
Talos Linux control application

%prep
%autosetup

%build

%install
install -Dpm 0755 talosctl %{buildroot}%{_bindir}/talosctl

%files
%{_bindir}/talosctl"

echo "$__spec" > SPECS/talos.spec
