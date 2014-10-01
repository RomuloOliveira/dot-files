#!/bin/bash

# Returns true (exit code 0) if a environment variable exists
# Used in many scripts
function exists_var {
    env | grep -q "^$1="
}
