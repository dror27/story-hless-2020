### Scraping code

This folder contains bash/shell code used to scrape the [CMIS - Committee Management Information System](https://birmingham.cmis.uk.com/birmingham/)

A detailed explanation of the scraping process is beyond the scope of this document. 

The following general steps were used:
* CMIS requires registration, therefore an account was created
* The account was used to login and a working session was established on Chrome
* The actual HTTP request, including all headers/cookies was captured using Chrome's inspect mode (debugger).
* The request was saved as a cURL request and was transformed into a wget command line script
* wget was used in recursive mode (-r) to traverse the CMIS (see wget.sh)
* This process resulted in all html files, but not the data (PDF) files.
* Links to document files were identified as using urls with /Birmingham/Document.ashx in their path.
* All html files were scanned for such links and clean document urls were constracted (see getdocurls.sh)
* The documents where fetched by piping the list of urls into | parallel wget - thereby fetching them in parallel
* The resulting document trove was loaded into Google's Pinpoint for analysis

