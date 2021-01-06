grep -r '/Birmingham/Document.ashx' * | tr "/" "\n" | grep Document.ashx | tr " " "\n" | grep Document | sed 's/"//g' | awk '{printf("https://birmingham.cmis.uk.com/Birmingham/%s\n", $1)}'
