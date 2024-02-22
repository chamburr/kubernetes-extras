Name:           helm
Version:        3.14.2
Release:        1%{?dist}
Summary:        Helm control application

License:        MPLv2
Source0:        helm-3.14.2.tar.gz

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
%{_bindir}/helm
