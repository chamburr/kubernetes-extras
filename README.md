# Kubernetes Extras

A Yum repository containing some extra Kubernetes utilities.

Currently, the packages included are Flux, Helm and Talos. Only Red Hat-based distributions are supported.

## Installation

You can add this repository by copying the following to `/etc/yum.repos.d/kubernetes-extras.repo`.

```ini
[kubernetes-extras]
name = Kubernetes Extras
baseurl = https://raw.githubusercontent.com/chamburr/kubernetes-extras/main
gpgcheck = 0
```

## License

This project is licensed under the [MIT License](LICENSE).
