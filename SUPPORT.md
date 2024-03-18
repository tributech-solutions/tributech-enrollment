Tributech Enrollment User Support resources
==============================

See the <https://tributech.io/contact> for details on how to obtain commercial technical support.

If you have general questions about using Tributech Enrollment
-------------------------------------------------

In this case the [Tributech Node](https://docs.tributech.io) documentation is the right place for you.
The documentation describes how the Tributech Agent can be linked to a Tributech Node and what the role of the Tributech Enrollment is. Here you will most likely get the answer to your questions.

If you think you found a Bug
----------------------------
*NOTE: this section assumes that you want to report it or figure it out and
fix it.  What's written here is not to be taken as a recipe for how to get a
working production installation*

If you have any problems with Tributech Enrollment then please take the following steps
first:

- Make sure that Tributech Node is running and accessible from your environment
- Make sure that you have read and write access from the folder executing the scripts
- Download the latest version from the repository to see if the problem has already been addressed.
- Try running the scripts again with the latest version of [openssl](https://github.com/openssl/openssl)

### Open an Issue

If you wish to report a bug, please open an [issue][github-issues] on GitHub
and include the following information:

- OpenSSL version: output of `openssl version -a`
- Powershell ` $PSVersionTable.PSVersion` or Bash Version `bash --version`
- OS Name, Version
- The Script you are using
- Script output/error messages
- Problem Description (steps that will reproduce the problem, if known)

Not only errors in the software, also errors in the documentation, in
particular the manual pages, can be reported as issues.

