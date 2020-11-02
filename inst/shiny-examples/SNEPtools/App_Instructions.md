---
title: "Instructions and Background Information"
date: "2020-11-02 17:17:43"
output:
  html_fragment:
    toc: yes
---



# Instructions

SNEPIBItools  was developed to calculate benthic macroinvertebrate metrics and the Index of Biotic Integrity (IBI) for low gradient, slow-moving, wadeable, freshwater, non-tidal streams in Rhode Island and Massachusetts. Detailed documentation of IBI development can be downloaded here. Users can run any data through the IBI calculator and get a result. However, if samples do not meet the criteria listed on the Background page, results should be interpreted with caution.

The Instructions are divided into three sections: 1) preparing the input file; 2) app operation; and 3) frequently asked questions (FAQ). Links to an example input file and a document containing more detailed information on preparing the input file are also provided.

This app was developed by Ben Block from Tetra Tech, Inc. (Ben.Block@tetratech.com), with underlying R code written by Ben Block and Erik Leppo (Erik.Leppo@tetratech.com). Please contact Ben Block should any issues or questions arise.


## Foreword
Tetra Tech, Inc. developed the SNEPIBItools shiny app for the Southeast New England Coastal Watershed Restoration Program (SNEP). The work was done in partnership with the Rhode Island Department of Environmental Management (RI DEM), Massachusetts Department of Environmental Protection (Mass DEP) and the New England Interstate Water Pollution Control Commission (NEIWPCC). This tool allows SNEP and their partners to calculate IBI scores for benthic macroinvertebrate samples, which will improve their ability to identify degradation in biological integrity and water quality in low gradient streams in the Southeast New England region. The app is streamlined and easy to operate, and only requires an input dataset to function. Shiny apps are interactive web applications that serve as graphical user interfaces. They are linked to R, which is an open source programming language and software environment for statistical computing.

## Preparing the input file
SNEPIBItools requires input files to be in a tabular format, saved as either comma-separated values (CSV) (most commonly used) or tab-separated (.txt or .tsv) files. Table 1 contains a list of required fields. Column names must be capitalized and match the spelling and symbology exactly as shown (some column headings have underscores).

Click here to view an [EXAMPLE INPUT FILE](https://github.com/Blocktt/SNEPtools/tree/main/inst/shiny-examples/SNEPtools/Examples).

The input data must be prepared in a way that is consistent with how the data were prepared for the calibration of the IBIs. For example, if you use a different level of taxonomic resolution (family vs. species-level) or trait assignments differ (e.g., Functional Feeding Groups do not match), this will affect the results. To ensure consistency, perform the following steps when preparing your input file:

* Check your taxa list against the ‘FinalID’ field in the [TaxaTranslator table](https://github.com/Blocktt/SNEPtools/tree/main/reports). The use of consistent nomenclature is encouraged.
* Remove any rows that have 0 individuals (e.g., Large/Rare taxa entries)
* For each taxon, there should only be one entry per sample. For example, if entries are broken out by life stage (e.g., larvae, pupae), they should be ‘collapsed’ into one row per taxon/sample (by summing the individuals and deleting the life stage field)
* Perform random subsampling if needed. For example, if you want to apply a 100-count kick IBI but have a 300-count sample, first reduce the total count of individuals to 100 (±20%)
* Use NonTarget taxa designations and trait assignments (FFG, tolerance value, life cycle) that match with those in the appropriate [TaxaAttribute tables](https://github.com/Blocktt/SNEPtools/tree/main/reports). Taxa tolerance values differ slightly in low gradient vs. higher gradient (kick net) streams; thus, we created separate attribute tables for each stream type. Note: the TaxaID field in the attribute tables matches with the ‘FinalID’ field in the [TaxaTranslator table](https://github.com/Blocktt/SNEPtools/tree/main/reports) (which is further reason to use consistent nomenclature). 
* Mark redundant (non-distinct) taxa in each sample in a way that is consistent with the criteria described in the [ExcludeDecisionCriteria](https://github.com/Blocktt/SNEPtools/tree/main/reports) document.
* Make sure you select the correct IBI for each sample (which is entered into the ‘Index_Region’ column).

You are now ready to run your file through the IBI calculator!

### Table 1. List of required fields. Column names must be capitalized and match the spelling and symbology exactly as shown.
<table class="table" style="width: auto !important; ">
 <thead>
  <tr>
   <th style="text-align:left;"> Required field (in CAPS) </th>
   <th style="text-align:left;"> Description </th>
   <th style="text-align:left;"> Acceptable entries </th>
   <th style="text-align:left;"> Notes </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> INDEX_NAME </td>
   <td style="text-align:left;"> Entity_Year_Assemblage </td>
   <td style="text-align:left;"> One option: SNEP_2020_Bugs </td>
   <td style="text-align:left;"> Must match 'Acceptable entries' options exactly </td>
  </tr>
  <tr>
   <td style="text-align:left;"> INDEX_REGION </td>
   <td style="text-align:left;"> Specifies which IBI to apply to each sample </td>
   <td style="text-align:left;"> One option (select one only): LowGradientIBI </td>
   <td style="text-align:left;"> Must match 'Acceptable entries' options exactly. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STATIONID </td>
   <td style="text-align:left;"> Unique station identifier </td>
   <td style="text-align:left;"> Letters and/or numbers. Example: B0950 </td>
   <td style="text-align:left;"> Corresponds with UniqueID in the MassDEP database </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SAMPLEID </td>
   <td style="text-align:left;"> Unique sample identifier </td>
   <td style="text-align:left;"> Letters and/or numbers. Example: 2017004 </td>
   <td style="text-align:left;"> Corresponds with BenSampID in the MassDEP database </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAT </td>
   <td style="text-align:left;"> Latitude </td>
   <td style="text-align:left;"> Number, in decimal degrees. Example: 41.1864 </td>
   <td style="text-align:left;"> NAD83 datum </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONG </td>
   <td style="text-align:left;"> Longitude </td>
   <td style="text-align:left;"> Number, in decimal degrees. Example: -73.3429 </td>
   <td style="text-align:left;"> NAD83 datum </td>
  </tr>
  <tr>
   <td style="text-align:left;"> COLLDATE </td>
   <td style="text-align:left;"> Collection date </td>
   <td style="text-align:left;"> Preferred format is Month/Day/Year (4-digit). Example: 8/10/2015 </td>
   <td style="text-align:left;"> Other date formats can be used but Month/Day/Year (4-digit) is recommended </td>
  </tr>
  <tr>
   <td style="text-align:left;"> COLLMETH </td>
   <td style="text-align:left;"> Collection method </td>
   <td style="text-align:left;"> Letters or numbers. Example: Multihab </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TAXAID </td>
   <td style="text-align:left;"> Unique taxa identifier </td>
   <td style="text-align:left;"> Letters or numbers. Example: Rhyacophila atrata </td>
   <td style="text-align:left;"> The taxa list should match with the FinalID field in the [TaxaTranslator table](https://github.com/Blocktt/SNEPtools/tree/main/reports). Taxa should be identified to the lowest practical taxonomic resolution. If not, results should be interpreted with caution </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N_TAXA </td>
   <td style="text-align:left;"> Number of individuals </td>
   <td style="text-align:left;"> Number </td>
   <td style="text-align:left;"> In some cases, random subsampling may be necessary during the data preparation step (e.g., reducing a 300-count kick sample to 100 organisms before applying a 100-count kickIBI) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EXCLUDE </td>
   <td style="text-align:left;"> Redundant taxa (also referred to as non-distinct taxa) are excluded from richness metric calculations but are counted in the other metrics </td>
   <td style="text-align:left;"> TRUE or FALSE (redundant taxa should be entered as "TRUE"). No blanks </td>
   <td style="text-align:left;"> Criteria for designating redundant taxa should be consistent with the [ExcludeDecisionCriteria document](https://github.com/Blocktt/SNEPtools/tree/main/reports). </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NONTARGET </td>
   <td style="text-align:left;"> Non-target taxa are not part of the intended capture list (e.g., Hemiptera, Decapoda, terrestrial). They are excluded from all metric calculations </td>
   <td style="text-align:left;"> TRUE or FALSE (Non-target taxa should be entered as "TRUE"). No blanks </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PHYLUM </td>
   <td style="text-align:left;"> Taxonomic hierarchy (e.g., Arthropoda) </td>
   <td style="text-align:left;"> Letters. If no entry, leave blank </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CLASS </td>
   <td style="text-align:left;"> Taxonomic hierarchy (e.g., Insecta) </td>
   <td style="text-align:left;"> Letters. If no entry, leave blank </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ORDER </td>
   <td style="text-align:left;"> Taxonomic hierarchy (e.g., Coleoptera) </td>
   <td style="text-align:left;"> Letters. If no entry, leave blank </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FAMILY </td>
   <td style="text-align:left;"> Taxonomic hierarchy (e.g., Elmidae) </td>
   <td style="text-align:left;"> Letters. If no entry, leave blank </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SUBFAMILY </td>
   <td style="text-align:left;"> Taxonomic hierarchy (e.g., Orthocladiinae) </td>
   <td style="text-align:left;"> Letters. If no entry, leave blank </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TRIBE </td>
   <td style="text-align:left;"> Taxonomic hierarchy (e.g., Chironomini) </td>
   <td style="text-align:left;"> Letters. If no entry, leave blank </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GENUS </td>
   <td style="text-align:left;"> Taxonomic hierarchy (e.g., Rhyacophila) </td>
   <td style="text-align:left;"> Letters. If no entry, leave blank </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFG </td>
   <td style="text-align:left;"> Functional Feeding Group: collector-gatherer (CG), collector-filterer (CF), predator (PR), scraper (SC), shredder (SH) </td>
   <td style="text-align:left;"> Five options (select one only): CG, CF, PR, SC, SH. If no attribute, leave blank </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TOLVAL </td>
   <td style="text-align:left;"> Values range from 0 (most intolerant) to 10 (most tolerant). Intolerant taxa 0 to 3. Tolerant taxa 7 to 10 </td>
   <td style="text-align:left;"> Number. If no attribute, leave blank </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LIFE_CYCLE </td>
   <td style="text-align:left;"> univoltine (UNI), semivoltine (SEMI), multivoltine (MULTI) </td>
   <td style="text-align:left;"> Three options (select one only): UNI, SEMI, MULTI. If no attribute, leave blank </td>
   <td style="text-align:left;"> Should match with the entries in the [Low Gradient Taxa Attribute Table](https://github.com/Blocktt/SNEPtools/tree/main/reports) </td>
  </tr>
</tbody>
</table>

## App Instructions

Once open, the user will see the IBI calculator interface. The user should follow the onscreen instructions as follows:

1. Load file
    + An example input file can be downloaded from Github [EXAMPLE LINK](https://github.com/Blocktt/SNEPtools/tree/main/inst/shiny-examples/SNEPtools/Examples)
    + Choose Separator. The separator indicates how the data is stored. Comma indicates the input file is a comma-separated file (.csv). Tab indicates the input file is a tab-separated file (.txt or .tsv). Finally, Semicolon indicates the input file is a semicolon-separated file which is uncommon in the United States but common in Western-European countries. Be certain that the designated separator is not used in any of the text fields (e.g., for multiple FFG, separate with a semicolon).
    + Choose Quote. The quote indicates how the data is stored. Double quote is the most common.
    + Choose file to upload. Hit the browse button and search for the input file. 
    + Once uploaded, make sure data is correct in the viewer. If the incorrect Separator or Quote is chosen, you may receive an error or the data may look incorrect in the viewer. 

2. Calculate IBI

3. Download results
    + Select the button to download a zip file with inputs and results.
    + Check ‘results_log.txt’ for any warnings or messages. Note, some warnings are automatically generated by R. Feel free to reach out to Ben Block (Ben.Block@tetratech.com) for any questions related to warnings.

4. Use interactive map and plots for data exploration
    + Navigate to the top of the page and click on the “Data Explorer” tab.
    + Prior to metric scores calculation, a map will not be visible.
    + Once metric scores are calculated, a map will become visible.
    + Sites are clustered when zoomed out for increased visibility - zoom for detail.
    + Sites are color coded by their Index Score value - click on a site for more info.
    + The map can be filtered based on INDEX_REGION using the checkbox group in the upper right. 

## Frequently asked questions and troubleshooting

1. Why am I getting an error saying that I am missing columns even when I am not?
    + You may have incorrectly spelled a given column. Try writing the column in all capital letters. Also, some columns (e.g., INDEX_REGION) require an underscore to separate the two words.

2. Why does my data look strange in the data viewer?
    + You likely have the incorrect Separator or Quote selected. Otherwise, there may be commas in text fields when the comma separator is selected.

3. The IBI calculation is taking forever to calculate, has the app frozen?
    + Even though R works remarkably fast, a large dataset will cause the app to slow down. The estimate is approximately 30 seconds for small datasets; however, this could extend to a few minutes for large datasets.

4. Why is there no map shown in the “Sites and Scores Map” tab?
    + The map requires the results of the IBI calculator to render.
