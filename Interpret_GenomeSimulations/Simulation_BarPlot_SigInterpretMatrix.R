## Plot signature definitions in barplot style

rm(list=ls(all=TRUE))

#LIBRARIES
library(reshape2)
library(data.table)
library(ggplot2)
library(ggthemes)
library(lemon)
library(this.path)

theme_set(theme_tufte(base_size = 6, base_family = "ArialMT"))
theme_update(text = element_text(size = 6),
             axis.text = element_text(size = 6),
             axis.line = element_line(size = 0.5), 
             axis.ticks = element_line(size = 0.5),
             axis.ticks.length = unit(.1, "cm"))

## Paths
BASE <- dirname(this.path())

## Load and prepare data
# N=240 RubenParam2 - Signature Interpretation Matrix created by running "Interpretation_matrix_simulations.Rmd"
setwd(paste0(BASE, "/output"))
dfSigs = read.table("InterpretationMatrix_simulations.txt")
NAME="SuppFigure_52_SigInterpretMatrix_Simulations"


dfMelt = dfSigs[,c("component", "CNSig", "allSum")]
colnames(dfMelt)<-c("component", "sig", "weight")

# Order segments
dfMelt$component = factor(as.character(dfMelt$component), levels = c(paste0(rep("segsize", 22), 1:22), paste0(rep("changepoint", 10), 1:10), 
                                                                     paste0(rep("bp10MB", 3), 1:3), paste0(rep("bpchrarm", 5), 1:5), 
                                                                     paste0(rep("osCN", 3), 1:3)) )

# Order signatures
dfMelt$sig = factor(as.character(dfMelt$sig), levels = c("HRDLST", "ecDNA", "CHR", "WGDearly", "WGDlate"))

# For colouring thef eatures
dfMelt$feature = gsub('[0-9]+', '', dfMelt$component)
dfMelt$feature[ dfMelt$feature == "bpMB" ] = "bp10MB"
dfMelt$feature = factor(dfMelt$feature, levels = c("segsize", "changepoint",
                                                   "bp10MB", "bpchrarm",
                                                   "osCN"))

p0 = ggplot(dfMelt, aes(x = component, y = weight, fill = feature))+
    geom_bar(stat = "identity") + facet_wrap(. ~ sig, ncol = 1, scales = "free_y") + 
    coord_capped_cart(left = "both", bottom = "both") +
    labs(x = "Feature components", y = "Identified weight") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1), 
          legend.position = "none") 

ggsave(paste0(NAME, ".png"), p0, width = 12, height = 10, units = "cm", bg = "white")
