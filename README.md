## Analyses to validate the signature interpretation matrix

This repository contains all analyses perfromed to support our procedure to enable a better biological interpretation of signatures. The method for constructing the signature interpretation matrix can be found in https://github.com/macintyrelab/CINSignatureInterpretationMatrix. The central hub for the pan-cancer CIN signature study where this approach was used can be found in https://github.com/markowetzlab/Drews2022_CIN_Compendium

### SBSSigs_Simulations folder
This folder contains the simulations we performed to show that shrinkage is a common property of NMF based signature identification. 

#### Summary
1) We performed 250 simulations where we modeled 500 samples in which three SBS signatures operate
2) We deconstructed signatures from simulated input matrices using classical NMF
3) We plotted average and range of signatures deconstructed from the 250 simulated matrices, and compare with original signatures
4) We validated our observations by applying another NMF approach (SigProfilerExtractor) to 10 simulated input matrices


### Interpret_GenomeSimulations folder
This folder contains the analyses performed to validate the interpretation signature matrix. We used simulated genomes for validation (see [markowetzlab/CINGenomeSimulation](https://github.com/markowetzlab/CINGenomeSimulation) repository for more information about the procedure to simulate genomes in which a specific mutational mechanism is operating). 

The code reproduces the Supplementary Fig. 52 of Drews et al. 2020. For the published version, the gold-standard weights were added using Affinity Designer.

## Contact

If you experience any issues or have questions about the code, please open a Github issue with a minimum reproducible example. For questions around collaborations or sensitive patient data, please contact us directly at Florian Markowetz <Florian.Markowetz@cruk.cam.ac.uk> and Geoff Macintyre <gmacintyre@cnio.es>.

## Licence
The contents of this repository are copyright (c) 2022, University of Cambridge and Spanish National Cancer Research Centre (CNIO).

The contents of this repository are published and distributed under the GAP Available Source License v1.0 (ASL). 

The contents of this repository are distributed in the hope that it will be useful for non-commercial academic research, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the ASL for more details. 

The methods implemented in the code are the subject of pending patent application GB 2114203.9.

Any commercial use of this code is prohibited.
