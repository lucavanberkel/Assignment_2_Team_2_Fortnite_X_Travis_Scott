library(data.table)

dt <- fread('../../gen/data-preparation/output/dataset.csv')

dir.create('../../gen/analysis/temp/', recursive = TRUE)
dir.create('../../gen/analysis/output/', recursive = TRUE)
fwrite(dt, '../../gen/analysis/temp/preclean.csv')

Before <- fread('../../gen/data-preparation/output/dataset_before.csv')

dir.create('../../gen/analysis/temp/', recursive = TRUE)
dir.create('../../gen/analysis/output/', recursive = TRUE)
fwrite(Before, '../../gen/analysis/temp/preclean-before.csv')

During <- fread('../../gen/data-preparation/output/dataset_during.csv')

dir.create('../../gen/analysis/temp/', recursive = TRUE)
dir.create('../../gen/analysis/output/', recursive = TRUE)
fwrite(During, '../../gen/analysis/temp/preclean-during.csv')

After <- fread('../../gen/data-preparation/output/dataset_after.csv')

dir.create('../../gen/analysis/temp/', recursive = TRUE)
dir.create('../../gen/analysis/output/', recursive = TRUE)
fwrite(After, '../../gen/analysis/temp/preclean-after.csv')
