### Scraping code

This folder contains bash/shell code used to scrape the [CMIS - Committee Management Information System](https://birmingham.cmis.uk.com/birmingham/)

A detailed explanation of the scraping process is beyond the scope of this document. 

The following general steps were used:
* CMIS requires registration, therefore an account was created
* The account was used to login and a working session was established on Chrome
* The actual HTTP request, including all headers/cookies was captured using Chrome's inspect mode (debugger).
* The request was saved as a cURL request and was transformed into a wget command line script
* wget was used in recursive mode (-r) to traverse the CMIS (see [wget.sh](wget.sh))
* This process resulted in all html files, but not the data (PDF) files.
* Links to document files were identified as using urls with /Birmingham/Document.ashx in their path.
* All html files were scanned for such links and clean document urls were constracted (see [getdocurls.sh](getdocurls.sh))
* The documents where fetched by piping the list of urls into | parallel wget - thereby fetching them in parallel
* The resulting document trove was loaded into Google's Pinpoint for analysis

### Output folder inspection (after scraping)

```
$ pwd
<removed>/story-hless-2020/data/birmingham.cmis.uk.com/scrape/docs1_files
$ ls -1 | wc
    5241   29827  221460
$ du -sh .
3.1G	.
$ ls -l | head
total 6525976
-rw-r--r--  1 drorkessler  staff     213755 13 Dec 01:46 (v4)Cabinet Committee 070317Local Leadership Briefing Read-Only.pdf
-rw-r--r--  1 drorkessler  staff     212964 13 Dec 01:48 (v4)Cabinet Committee 070317Local Leadership Briefing [Read-Only].pdf
-rw-r--r--  1 drorkessler  staff     266416 13 Dec 01:42 (v4)Cabinet Committee 070317Local Leadership Briefing.pdf
-rw-r--r--  1 drorkessler  staff     228042 13 Dec 01:40 01 201920 Q3 Performance Monitoring Report to Cabinet (final).pdf
-rw-r--r--  1 drorkessler  staff     122232 13 Dec 01:56 01.10.20 LOEB DRAFT Cover Report - Engagement Plan Update (29Sep).pdf
-rw-r--r--  1 drorkessler  staff    1595680 13 Dec 01:39 010920 HOSC C19 Update Tabled by Justin Varney.pdf
-rw-r--r--  1 drorkessler  staff     134652 13 Dec 01:38 02 18102018.pdf
-rw-r--r--  1 drorkessler  staff    1350405 13 Dec 01:40 02 201920 Q3 Performance Monitoring Report_Appendix.pdf
-rw-r--r--  1 drorkessler  staff     109650 13 Dec 01:40 03 01 CABINET REPORT MONTH 4.pdf

```
