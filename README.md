# This RPM is obsolete and no longer updated. You should switch back to Red Hat's version of curl.

This issue was fixed upstream in
[curl-7.19.7-52.el6](https://rhn.redhat.com/errata/RHBA-2016-0915.html) (see
[RHBZ#1289205](https://bugzilla.redhat.com/show_bug.cgi?id=1289205)). To switch
back to Red Hat's RPM, run the below:

```
yum downgrade curl libcurl
rm /etc/yum.repos.d/mmckinst-curl-el6.repo
```


Background
----------

RHEL 7 had an issue where curl would use TLSv1.0 instead of TLSv1.2. Red hat
fixed that in
[RHBZ#1170339](https://bugzilla.redhat.com/show_bug.cgi?id=1170339).

RHEL 6 had the same issue but initially Red Hat was not going to fix it, see
[RHBZ#1042989](https://bugzilla.redhat.com/show_bug.cgi?id=1042989).

This bug caused lots of headaches as e-commerce sites and payment processors
turned off TLSv1.0 in anticipation of the June 30, 2016 deadline from the PCI
council (which has now been
[extended to June 30, 2018](http://blog.pcisecuritystandards.org/migrating-from-ssl-and-early-tls)). I
decided to fix the bug and planned on just applying my patch on top of whatever
RPMs for curl that Red Hat released in the future. To keep Red Hat's RPM from
'upgrading' my RPM and making the problem re-occur, I appended a '0' to my
release number so it would always be higher than Red Hat's version and I could
easily tell what release of Red Hat curl RPM mine was based on. The release
history would've looked something like this:

```
|-----------------------------------|
| Red Hat version | My version      |
|-----------------|-----------------|
| curl-7.19.7-46  | curl-7.19.7-460 |
| curl-7.19.7-50  | curl-7.19.7-500 |
| curl-7.19.7-52  | curl-7.19.7-520 |
|-----------------------------------|
```

But Red Hat decided to fix this bug in
[RHBZ#1272504](https://bugzilla.redhat.com/show_bug.cgi?id=1272504) and
[RHBZ#1289205](https://bugzilla.redhat.com/show_bug.cgi?id=1289205), rendering my RPM un-needed and obsolete.

This RPM will not be updated. If the output of `rpm -q --qf
'%{name}-%{version}-%{release}\n' curl` says you have `curl-7.19.7-460.el6` you
should switch to`'curl-7.19.7-52.el6` or whatever the latest one is from Red
Hat.
