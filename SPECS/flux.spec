Name:           flux
Version:        2.5.1
Release:        1%{?dist}
Summary:        Flux control application

License:        MPLv2
Source0:        flux-2.5.1.tar.gz

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
%{_bindir}/flux
