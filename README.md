# filecurly
If you want a http-based sender of log messages with only linux basic commands, this repository would help right.
This shell scripts use linux commands: tail, sed, and curl.

### Getting started
1. configure core parts
  - `LOGCOLLECTOR_ENDPOINT="http://***"`
2. set the target log file
  - change `fc.log` if necessary.
3. Run
  - `bash filecurly.sh`
