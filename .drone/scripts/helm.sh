#! /bin/sh

version=$(curl -s https://api.github.com/repos/helm/helm/releases/latest | jq -r .tag_name | sed "s/v//")

mkdir "/tmp/helm-$version"
curl -sLo /tmp/helm.tar.gz "https://get.helm.sh/helm-v$version-linux-amd64.tar.gz"
tar -zxf /tmp/helm.tar.gz -C "/tmp/helm-$version/"
rm /tmp/helm.tar.gz
mv "/tmp/helm-$version/linux-amd64/helm" "/tmp/helm-$version/helm"
rm -rf "/tmp/helm-$version/linux-amd64"
tar -czf "SOURCES/helm-$version.tar.gz" -C /tmp "helm-$version"
rm -rf "/tmp/helm-$version"

__spec="Name:           helm
Version:        $version
Release:        1%{?dist}
Summary:        Helm control application

License:        MPLv2
Source0:        helm-$version.tar.gz

%global debug_package %{nil}
%global _missing_build_ids_terminate_build 0

%description
Helm control application

%prep
%autosetup

%build

%install
install -Dpm 0755 helm %{buildroot}%{_bindir}/helm

%files
%{_bindir}/helm"

echo "$__spec" > SPECS/helm.spec
