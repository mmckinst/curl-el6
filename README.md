This is an updated version of the CentOS 6 curl rpm that changes two things:

1. uses TLSv1.2 instead of TLSv1.0 as the highest version of TLS
2. uses TLSv1.0 instead of SSLv3 as the lowest version of SSL/TLS


Background
----------
[RHBZ#1170339](https://bugzilla.redhat.com/show_bug.cgi?id=1170339) has
discussion and background information about curl using TLSv1.0 instead of
TLSv1.2 on
RHEL 7. [RHBZ#1042989](https://bugzilla.redhat.com/show_bug.cgi?id=1042989) is
the corresponding bug report for RHEL 6 where Red Hat says they will not be
fixing the problem as they did on RHEL 7.


Copr
----
https://copr.fedoraproject.org/coprs/mmckinst/curl/


Testing
-------
```
[root@centos-6 ~]# rpm -q curl
curl-7.19.7-46.el6.x86_64
[root@centos-6 ~]# curl -s 'https://www.howsmyssl.com/a/check' | jq '.tls_version'
"TLS 1.0"
[root@centos-6 ~]#
[root@centos-6 ~]# curl -s -o /etc/yum.repos.d/mmckinst-curl-epel-6.repo https://copr.fedoraproject.org/coprs/mmckinst/curl/repo/epel-6/mmckinst-curl-epel-6.repo
[root@centos-6 ~]# yum -q -y upgrade curl
[root@centos-6 ~]# rpm -q curl
curl-7.19.7-460.el6.x86_64
[root@centos-6 ~]# curl -s 'https://www.howsmyssl.com/a/check' | jq '.tls_version'
"TLS 1.2"
[root@centos-6 ~]#
```
