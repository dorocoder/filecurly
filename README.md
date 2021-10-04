# filecurly
If you want a http-based sender of log messages (for plain texts not encoded texts) with only linux basic commands, this repository would help right.
This shell scripts use linux commands: tail, sed, and curl.
I hope this can work in more lightweight fashion in place of something lke filebeat, etc.

### Getting started
1. configure core parts
  - `LOGCOLLECTOR_ENDPOINT="http://***"` in `filecurly_handler.sh`
2. set the target log file
  - change `fc.log` as you wish.
3. Run
  - `bash filecurly.sh`
