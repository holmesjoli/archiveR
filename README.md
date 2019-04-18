# Git Archive R

One issue that I've often faced in analytics is how to connect output (data, visualizations, and reports) with the code used to generate that output. The team will deliver output to the client/partner and then continue to develop the code base. If the client/partner has a specific question then the team has to back-track to figure out which code was used to create that particular output. A lot of teams archive their output use timestamps, e.g. data_20171019_124590. While this can be a good method for data archiving for some teams, this method doesn't easily allow an analyst to be able to backtrack and see which code created that specific output. This can also create issues if data is created and then used as an input farther downstream because it means that the filename is changing whenever the data are re-processed.

The dataArchiveR package combines several steps important to data archiving purposes into one package.

First, we commit our code and extract the branch, unique 6-character hash, and message to be used when naming the archive.

Next we run the archiving functions which create a directory structure that serves two functions a) easy access to the current data and b) an archive of data can be extracted using the unique 6-character hash.

### Example File Structure

```
Data/
    Processed/
        Current/
            data.csv
            summary_data.csv
        Archive/
            master_90r68d.zip
Deliverables/
    Current/
        fig1.png
        fig2.png
    Archive/
        master_90r68d.zip
```

The dataArchiveR automattically creates the `Current` and `Archive` folders. Then it adds the specified files to the `Current` folder and zips the files from the `Current` folder using the current code commit and add the `Archive` folder. 