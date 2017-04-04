spacemap
================

Description
-----------

The spaceMap R package constructs *de novo* networks from heterogenous data types in a high-dimensional context by applying a novel conditional graphical model. The underlying statistical model is motivated by applications in integrative genomics, where two (or more) omic data profiles are modeled jointly to discover their interactions. spaceMap learn networks in diverse applications that exhibit hub topology. In an application to breast cancer tumor data, spaceMap learned a novel regulatory network that generated novel hypotheses of cancer drivers, while also identifying known signatures of various molecular sub-types. Additionally, spacemap has an accompanying network analysis toolkit, which helps interpret the complex biological interactions embedded in the network.

Installation
------------

The R package `spacemap` is available from GitHub. Please see the [most recent beta release](https://github.com/topherconley/spacemap/releases/tag/v0.45.0-beta) for installation.

Details
-------

### Learning robust networks

We built model selection and model aggregation tools into spaceMap for learning networks robust to the challenges of integrative genomics data. High dimensional omic profiles often have limitations in sample size and the signal-to-noise can be low. Models applied to data in this context can be prone to overfitting and high variability. By virtue of a K-fold cross validation (CV) procedure called *CV.Vote*, one can learn model tuning parameters that will help balance the tradeoff of power and FDR. *CV.Vote* reports a network where edges must be present in a majority of networks fit under the training sets. Please see [Model Tuning](https://topherconley.github.io/spacemap/articles/tune_sim1.html) section (see also navigation bar) for an example of how to sequentially tune your network with cross validation. Specific usage details of *CV.Vote* are documented in the function [crossValidation](https://topherconley.github.io/spacemap/reference/crossValidation.html).

Making your network robust to overfitting can be further enhanced through bootstrap aggregation---called *Boot.Vote*---especially when sample size relative to dimension is a real concern. This procedure learns networks on *B* bootstrap replications of data under CV-selected tuning parameters. The bootstrap replicate networks are aggregated such that only those edges with majority representation among the replicates are reported in the final network. Specific usage details and an example of *Boot.Vote* are documented in the function [reprodEdge](https://topherconley.github.io/spacemap/reference/reprodEdge.html).

#### Simulations

Several simulation studies have evaluated spaceMap's performance in learning networks that exhibit modular structure with prominent hub topology---a commonly encountered feature of biological networks. Detailed outcomes of those simulations are currently featured in the manuscript submitted to [ISMB ECMB 2017](https://www.iscb.org/ismbeccb2017). The GitHub repository [sim-spacemap](https://github.com/topherconley/sim-spacemap) contains code affiliated with those simulations featuring:

-   simulation of network topology
-   data generation according to the network topology
-   fitting of spaceMap and other graphical models to the data
-   evaluation of graphical model performance relative to true network topology

Documentation of these simulation codes will be forthcoming.

### Network analysis toolkit

Once a network has been learned, interpretation can prove quite challenging without a proper set of tools. We included a network analysis toolkit (see here for documentation) as part of the spaceMap package to facilitate network interpretation with special interest in integrative genomic applications. Our toolkit enables:

-   annotation of nodes (e.g. gene coordinates, functional description)
-   identification of cis/trans regulatory information
-   prioritization of hub nodes
-   module analysis (community detection)
-   pathway enrichment analysis (GO/KEGG)

All these features of the network analysis are reported through structured tables and are easily incorporated into technical manuscripts in a variety of formats. Perhaps more importantly, the network analysis integrates the results into a network file that can be exported (e.g. `.graphml` format) to existing tools such as the [Cytoscape ecosystem](http://www.cytoscape.org/what_is_cytoscape.html). spaceMap is not just a model; rather it is a powerful tool for deriving meaning from integrative genomics data.

This toolkit is best illustrated on a network analysis of The Breast Cancer Proteogomics Landscape Study data, which is hosted on the GitHub repository [neta-bcpls](https://topherconley.github.io/neta-bcpls/).
