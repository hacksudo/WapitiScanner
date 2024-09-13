# Wapiti Domain Scanner

This repository (`wapitiScanner`) contains a simple bash script that automates the process of scanning a list of domains for web vulnerabilities using [Wapiti](https://github.com/wapiti-scanner/wapiti). Wapiti is a web application vulnerability scanner capable of performing black-box testing to detect various vulnerabilities such as SQL injections, XSS, file inclusions, and more.

## Features

- Scans multiple domains from a file list
- Customizable scan options including attack modules and scan scope
- Time-limited scanning for efficiency
- Outputs reports in multiple formats (HTML, JSON, XML, TXT)
- Stores reports in a dedicated directory for easy reference

## Requirements

Before running the script, ensure you have the following installed:

- [Wapiti](https://github.com/wapiti-scanner/wapiti): Install via `pip`:

    ```bash
    pip install wapiti3
    ```

- Bash shell (for executing the script)

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/hacksudo/wapitiScanner.git
    cd wapitiScanner
    ```

2. Install Wapiti:

    ```bash
    pip install wapiti3
    ```

3. Make the script executable:

    ```bash
    chmod +x wapiti_scan.sh
    ```

## Usage

1. Create a file named `domains.txt` in the repository root and add your list of domains to it. Each domain should be on a new line. Example:

    ```
    http://example.com
    http://testsite.com
    ```

2. Run the script to start scanning:

    ```bash
    ./wapiti_scan.sh
    ```

3. The scan results will be saved in the `wapiti_reports` directory in the format specified (HTML by default).

## Script Details

### `wapiti_scan.sh`

This script reads a list of domains from `domains.txt`, runs a Wapiti vulnerability scan on each domain, and saves the results in the specified format.

### Customization Options:

- **Scope**: Adjusts the scope of the scan (`page`, `folder`, or `domain`).
- **Attack Modules**: Specify which modules to use (e.g., `xss`, `sql`, etc.).
- **Time Limit**: Set a maximum time limit for each scan to prevent long-running scans.
- **Output Format**: Choose from `html`, `json`, `xml`, or `txt` for the report format.

### Example Command

The following command scans a domain with XSS and SQL attack modules, using a time limit of 300 seconds, and outputs the report in HTML format:

```bash
wapiti -u http://example.com --scope domain --module xss,sql --max-scan-time 300 -f html
