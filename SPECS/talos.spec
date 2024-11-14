Name:           talos
Version:        1.8.3
Release:        1%{?dist}
Summary:        Talos Linux control application

License:        MPLv2
Source0:        talos-1.8.3.tar.gz

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
%{_bindir}/talosctl
