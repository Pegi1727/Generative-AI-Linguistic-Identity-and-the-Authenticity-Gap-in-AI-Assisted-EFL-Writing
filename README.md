# Generative AI, Linguistic Identity, and the Authenticity Gap in AI-Assisted EFL Writing

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21821502.svg)](https://doi.org/10.5281/zenodo.21821502)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.10+](https://img.shields.io/badge/Python-3.10%2B-blue.svg)](https://www.python.org/)
[![R 4.3+](https://img.shields.io/badge/R-4.3%2B-276DC3.svg)](https://www.r-project.org/)

---

## 📌 Overview & Graphical Abstract

This repository hosts the complete empirical dataset, analytical code pipelines (R & Python), and supplementary research materials for the study:  
**"Generative AI, Linguistic Identity, and the Authenticity Gap in AI-Assisted EFL Writing"**.

Using an explanatory sequential mixed-methods design ($\text{QUAN} \rightarrow \text{QUAL}$), this study investigates the psychological and linguistic tensions experienced by EFL writers ($N=60$ quantitative, $n=15$ qualitative) using GenAI (GPT-4o) for academic essay revision.

<p align="center">
  <img src="figures/graphical_abstract.png" alt="Graphical Abstract" width="95%"/>
</p>

---

## 👤 Author & Contact Information

* **Lead Researcher:** Dr. Pegah Merrikhi
* **Role:** Independent Researcher | PhD in Applied Linguistics / TESOL
* **Email:** [Pegah.merrikhiii@gmail.com](mailto:Pegah.merrikhiii@gmail.com)
* **Permanent DOI Archive:** [10.5281/zenodo.21821502](https://doi.org/10.5281/zenodo.21821502)

---

## 🔬 Research Design & Methodology

The study implemented a rigorous multi-stage methodology capturing linguistic accuracy, stance markers, and psychometric dimensions of voice loss through the newly validated **Authenticity Gap Scale (AGS)** ($\alpha = .87$).

<p align="center">
  <img src="figures/figure1_methodology.png" alt="Figure 1: Research Methodology Pipeline" width="90%"/>
</p>

---

## 📊 Summary of Key Empirical Results

### 1. Linguistic Trade-Offs (Paired Samples T-Test, Pre vs. Post-AI Revision)
While GenAI significantly cleans surface-level grammatical and mechanical errors, it systematically strips authorial stance and self-mention markers:

| Linguistic Dimension | Pre-AI Mean (SD) | Post-AI Mean (SD) | % Change | Effect Size (*Cohen's d*) | *p*-value |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Grammar / Mechanical Errors** | 14.82 (4.15) | 2.12 (1.05) | **-85.7%** | $d = 3.82$ | $p < .001$ |
| **Hedges (Epistemic Stance)** | 11.45 (3.20) | 3.71 (1.42) | **-67.6%** | $d = 2.94$ | $p < .001$ |
| **Boosters (Certainty Markers)** | 7.30 (2.10) | 2.45 (1.18) | **-66.4%** | $d = 2.78$ | $p < .001$ |
| **Self-Mention (*I, My, We*)** | 5.85 (1.95) | 1.10 (0.82) | **-81.2%** | $d = 3.05$ | $p < .001$ |
| **Lexical Diversity (TTR)** | 0.48 (0.05) | 0.59 (0.04) | **+22.9%** | $d = 2.35$ | $p < .001$ |

<p align="center">
  <img src="figures/figure3_results_linguistic.png" alt="Figure 3: Linguistic Boxplots" width="85%"/>
</p>

---

### 2. Linear Mixed-Effects Model (LMEM) & Qualitative Joint Display

The quantitative Authenticity Gap is heavily moderated by pre-existing English proficiency ($\beta = -0.38, p < .01$), showing that intermediate writers experience the sharpest erosion of authorial control:

| Core Theme | Quantitative Finding | Exemplary Qualitative Evidence | Interpretive Synthesis |
| :--- | :--- | :--- | :--- |
| **Loss of Personal Voice** | AGS Mean = 4.88 / 7.0; Stance markers dropped 67.6%. | *"The grammar is impeccable, but it does not sound like me. My personal voice was scrubbed clean."* (P12) | **"Voice Laundering"**: Over-polishing homogenizes individual prose into standardized native-speaker norms. |
| **AI-Crutch Paradox** | Perceived Quality high (5.6/7), but Revision Ownership low (2.9/7). | *"I feel I cannot write without it anymore. It's a crutch I resent yet rely on."* (P07) | **Learner Atrophy**: Heavy dependence breeds cognitive surrender and diminishes self-efficacy. |
| **Confidence–Authenticity Tension** | Inverse correlation between perceived accuracy and self-identification ($r = -.58$). | *"I got an A on this paper, but I felt like an imposter reading it out loud."* (P29) | **The Authenticity Dilemma**: Grades rise while intrinsic pride and ownership decline. |

<p align="center">
  <img src="figures/figure5_results_lmem_qual.png" alt="Figure 5: LMEM Results and Qualitative Forest Plot" width="90%"/>
</p>

---

## 💡 Discussion & The Authenticity Gap Framework

The empirical results converge into **The Authenticity Gap Framework**, establishing how the divergence between surface fluency and communicative intentionality manifests in EFL writers:

<p align="center">
  <img src="figures/figure6_discussion.png" alt="Figure 6: The Authenticity Gap Conceptual Framework" width="85%"/>
</p>

---

## 🎯 Conclusion & Pedagogical Implications

1. **Beyond Surface Correctness:** AI literacy in writing pedagogy must transition from prompt-engineering drills to **critical voice preservation**. Students must be taught when to reject GenAI revisions that erase epistemic stance.
2. **Hybrid Pedagogical Protocols:** We propose structured multi-draft workflows where students explicitly negotiate AI edits via reflective logs (e.g., justifying why certain AI-suggested hedges were accepted or rejected).
3. **Re-evaluating Assessment Rubrics:** High academic ratings awarded to AI-flattened essays reward homogenized linguistic hegemony while penalizing authentic multilingual voices. Assessment metrics must explicitly reward authorial stance and personal positionality.

---

## 📁 Repository Structure
```text
├── Figures/                            # All publication-ready high-res charts (PNG/PDF)
│   ├── graphical_abstract.png
│   ├── figure1_methodology.png
│   ├── figure2_results_demographics_ags.png
│   ├── figure3_results_linguistic.png
│   ├── figure4_results_ags_subscales.png
│   ├── figure5_results_lmem_qual.png
│   └── figure6_discussion.png
├── Data/                               # De-identified empirical data
│   ├── participants.csv                # Demographic profiles (N=60)
│   ├── linguistic_features_120.csv     # 120 pre/post paired text analyses
│   ├── ags_survey_items.csv            # Authenticity Gap Scale responses
│   └── interview_codes_n15.csv         # Thematic qualitative coding records
├── Scripts/                            # Reproducible computational pipelines
│   ├── 01_eda_and_reliability.py       # EFA, CFA & Cronbach's Alpha
│   ├── 02_linguistic_analysis_ttests.py# Paired T-tests & Effect sizes
│   ├── 03_lmem_analysis.R              # Linear Mixed-Effects Models
│   └── master_analysis.ipynb           # Complete executable notebook
└── README.md                           # Master repository documentation

