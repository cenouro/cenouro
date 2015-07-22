# Performance
## Profilers
* `iozone`: benchmarks IO operations.
* `bootchart`: boot time

## Things to remember
* Configure `$XDG_CACHE_HOME` to be a ramdisk. Some programs use this variable to write their temp files.
* Install `preload` and `readahead`.
* `systemd-analyze`

## `systemctl` quick reference
```shell
systemctl is-enabled <service>
systemctl disable <service>
systemctl mask <service>
systemctl # shows all info, including description
locate <service> | grep wants # kinda shows who depends on the service
```
