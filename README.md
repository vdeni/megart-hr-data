- `renv/` contains files needed for the `{renv}` package to be able to create
a virtual R environment
- `wrangling/` contains the scripts used to anonymize and clean the raw data
    - `01_src_rt-data-anonymization.R`: imports data exported from E-Prime. Each
    row is one participants reaction to the shown stimulus. Participant names
    are normalized, and then replaced with a code in the form
    `[LETTER]_[NUMBER][NUMBER]`. The letters differentiate participants from
    different runs of data collection. Participants with invalid data are
    removed (e.g. if there were technical difficulties, if it was made known
    that an important part of the instructions was misunderstood). Anonymized
    data are written to a file.
    - `02_src_rt-data-clean.R`: the anonymized data files are cleaned. E-Prime's
    ugly variable names are cleaned, variable names are translated to English,
    as are variable values. Clean data is then written to a file.
