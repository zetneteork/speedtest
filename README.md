# SpeedTest

Ookla Speedtest in the docker container

Default output in `json` format.

## Docker Image

<https://hub.docker.com/repository/docker/zetneteork/speedtest>

## How to run the container

```bash
docker run -it --rm zetneteork/speedtest:latest 
```

## Packages from Ookla

<https://www.speedtest.net/cs/apps/cli#ubuntu>

## speedtest --help

```
Speedtest by Ookla is the official command line client for testing the speed and performance of your internet connection.

Version: speedtest 1.2.0.84

Usage: speedtest [<options>]
  -h, --help                        Print usage information
  -V, --version                     Print version number
  -L, --servers                     List nearest servers
  -s, --server-id=#                 Specify a server from the server list using its id
  -I, --interface=ARG               Attempt to bind to the specified interface when connecting to servers
  -i, --ip=ARG                      Attempt to bind to the specified IP address when connecting to servers
  -o, --host=ARG                    Specify a server, from the server list, using its host's fully qualified domain name
  -p, --progress=yes|no             Enable or disable progress bar (Note: only available for 'human-readable'
                                    or 'json' and defaults to yes when interactive)
  -P, --precision=#                 Number of decimals to use (0-8, default=2)
  -f, --format=ARG                  Output format (see below for valid formats)
      --progress-update-interval=#  Progress update interval (100-1000 milliseconds)
  -u, --unit[=ARG]                  Output unit for displaying speeds (Note: this is only applicable
                                    for ‘human-readable’ output format and the default unit is Mbps)
  -a                                Shortcut for [-u auto-decimal-bits]
  -A                                Shortcut for [-u auto-decimal-bytes]
  -b                                Shortcut for [-u auto-binary-bits]
  -B                                Shortcut for [-u auto-binary-bytes]
      --selection-details           Show server selection details
      --ca-certificate=ARG          CA Certificate bundle path
  -v                                Logging verbosity. Specify multiple times for higher verbosity
      --output-header               Show output header for CSV and TSV formats

 Valid output formats: human-readable (default), csv, tsv, json, jsonl, json-pretty

 Machine readable formats (csv, tsv, json, jsonl, json-pretty) use bytes as the unit of measure with max precision

 Valid units for [-u] flag: 
   Decimal prefix, bits per second:  bps, kbps, Mbps, Gbps
   Decimal prefix, bytes per second: B/s, kB/s, MB/s, GB/s
   Binary prefix, bits per second:   kibps, Mibps, Gibps
   Binary prefix, bytes per second:  kiB/s, MiB/s, GiB/s
   Auto-scaled prefix: auto-binary-bits, auto-binary-bytes, auto-decimal-bits, auto-decimal-bytes
```
