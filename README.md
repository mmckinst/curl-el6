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


Instructions
------------
```
curl -s -o /etc/yum.repos.d/mmckinst-curl-el6.repo https://copr.fedoraproject.org/coprs/mmckinst/curl-el6/repo/epel-6/mmckinst-curl-el6-epel-6.repo
yum upgrade curl
```

Testing
-------

### curl command line

The best way to test the TLS version you negotiate is by using [howsmyssl.com's API](https://www.howsmyssl.com/s/api.html) and [jq](https://stedolan.github.io/jq/) from EPEL.

```
curl -s 'https://www.howsmyssl.com/a/check' | jq '.tls_version'
```

Or you can test using python and grep.

```
curl -s 'https://www.howsmyssl.com/a/check' | python -mjson.tool | grep tls_version
```

### libcurl

Your programming language is going to be using the libcurl library instead of the command line version of curl.

```
<?php
$ch = curl_init();
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_URL, "https://www.howsmyssl.com/a/check");
$result = json_decode(curl_exec($ch),true);
curl_close($ch);

print $result['tls_version'] . "\n";
```

Copr
----
https://copr.fedoraproject.org/coprs/mmckinst/curl-el6/
