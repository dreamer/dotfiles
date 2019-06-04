#!/bin/env bash

set -x
gmail_filter_rules=$(find ~/.thunderbird/ -name msgFilterRules.dat | grep imap.gmail.com)
rm "$gmail_filter_rules"
ln -s "$(pwd)/thunderbird/imap.gmail.com/msgFilterRules.dat" "$gmail_filter_rules"
