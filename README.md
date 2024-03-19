Tributech Node Enrollment
==============================

This repository provides command line tools to register a [Tributech Agent](https://docs.tributech.io/tributech_agent/overview) with a [Tributech Node](https://docs.tributech.io/tributech_node/overview) instance.

Table of Contents
==============================
- [Tributech Node Enrollment](#tributech-node-enrollment)
- [Table of Contents](#table-of-contents)
- [Overview](#overview)
- [Documentation](#documentation)
  - [README Files](#readme-files)
  - [Tributech Environment Documentation](#tributech-environment-documentation)
- [License](#license)
- [Support](#support)

Overview
==============================
Required Tools:
- **[openssl](https://github.com/openssl/openssl)**
    OpenSSL is a robust, commercial-grade, full-featured Open Source Toolkit
for the TLS (formerly SSL), DTLS and QUIC (currently client side only)
protocols.
- **[Powershell 5.1+](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-5.1)** for Windows
- **[Bash 5.2+](https://www.gnu.org/software/bash/manual/bash.html)** for Unix based Systems

Documentation
==============================
The scripts are used in the Enrollment Process before any data can be submitted from a [Tributech Agent](https://docs.tributech.io/tributech_agent/overview) to a [Tributech Node](https://docs.tributech.io/tributech_node/overview) instance. In Order to create a request for the registration of an [Tributech Agent](https://docs.tributech.io/tributech_agent/overview), we need to make sure [Tributech Node](https://docs.tributech.io/tributech_node/overview) is running and accessible from the environment where the script is executed. After the successful execution of the Script the [Tributech Agent](https://docs.tributech.io/tributech_agent/overview) can be approved by a [Tributech Node](https://docs.tributech.io/tributech_node/overview) User. Following the approval, the [Tributech Agent](https://docs.tributech.io/tributech_agent/overview) will be able to send data to [Tributech Node](https://docs.tributech.io/tributech_node/overview).

README Files
------------

There are some README.md files in the top level of the source distribution containing additional information on how to use the scripts on different operation systems.

 * [Information for Windows Users](./Windows/README.md)
 * [Information for for Unix Users](./Linux/README.md)

Tributech Environment Documentation
-----------
* [Tributech Node](https://docs.tributech.io/tributech_node/overview)
* [Tributech Agent](https://docs.tributech.io/tributech_agent/overview)
 
License
==============================
Tributech-Enrollment is licensed under the Apache License 2.0, which means that
you are free to get and use it for commercial and non-commercial
purposes as long as you fulfill its conditions.

See the [LICENSE.txt](LICENSE.txt) file for more details.

Support
==============================
There are various ways to get in touch. The correct channel depends on
your requirement. See the [SUPPORT](SUPPORT.md) file for more details.
