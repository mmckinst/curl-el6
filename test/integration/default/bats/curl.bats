@test "curl uses TLSv1.0 by default before upgrading" {
  curl -s 'https://www.howsmyssl.com/a/check' | jq -r '.tls_version' | grep -q '^TLS\ 1\.0$'
}

@test "curl uses TLSv1.2 by default after upgrading" {
  curl -s -o /etc/yum.repos.d/mmckinst-curl-el6.repo https://copr.fedoraproject.org/coprs/mmckinst/curl-el6/repo/epel-6/mmckinst-curl-el6-epel-6.repo
  yum -q -y upgrade curl

  curl -s 'https://www.howsmyssl.com/a/check' | jq -r '.tls_version' | grep -q '^TLS\ 1\.2$'
}
