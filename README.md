# Block Countries with Windows FW Rules

In light of the recent events, I created this little script to grab a list of known russian IPs, then create windows firewall rules out of them.

It creates (as of this commit) 11 rules since windows fw rules can only support up to 1000 IP entries.
