# manufacturing-quality-analysis
End-to-end manufacturing quality analysis using Excel, SQL, and Tableau to identify operational drivers of defects and translate findings into business actions.

# Manufacturing Defect & Quality Analysis
## Google Data Analytics Professional Certificate – Capstone Project

## Project Overview
This project analyzes manufacturing operational data to identify the key drivers of product defects, quality performance, and operational inefficiencies. The goal is to understand **which production, maintenance, supply chain, energy, and workforce factors contribute most to high defect rates and reduced quality**, and to translate those findings into actionable operational insights.

The analysis mirrors a real-world manufacturing analytics workflow using **Excel for exploratory analysis**, **SQL for data validation**, and **Tableau-ready outputs for visualization**.

---

## Ask
**Business Task:**  
Identify operational conditions that contribute to high defect rates and reduced product quality in manufacturing.

**Key Questions:**
- Under what conditions do defects occur most frequently?
- Which operational factors are most associated with high defect risk?
- How do maintenance, downtime, and efficiency metrics impact quality outcomes?

**Stakeholders**
- Manufacturing Operations Managers
- Quality Assurance Teams
- Maintenance & Reliability Engineers
- Supply Chain & Inventory Managers

**Success Criteria**
- Identify operational factors most strongly associated with high defect rates
- Quantify relationships between production conditions, downtime, maintenance, and quality
- Provide actionable insights to improve manufacturing performance

---

## Prepare
**Dataset Overview**
- Source: Public manufacturing operations dataset (Kaggle)
- Rows: ~3,240 production observations
- Columns: 17 operational and quality-related variables
- Granularity: Each row represents a production observation capturing performance, quality, maintenance, and supply chain metrics

**Key Variables**
- Production Volume
- Defect Rate
- Quality Score
- Maintenance Hours
- Downtime Percentage
- Supplier Quality
- Inventory Stockouts
- Energy Efficiency
- Workforce Productivity

**Data Limitations**
- Dataset is simulated and not tied to a single real-world facility
- No machine-level or timestamp-level granularity
- Suitable for trend analysis and operational insight, not predictive modeling

---

## Process
Data preparation was performed primarily in Excel, with validation in SQL.

**Cleaning Steps**
- Standardized column names using snake_case
- Verified expected value ranges for all metrics
- Corrected percentage-based fields (e.g., downtime percentage scaling)
- Confirmed no missing values or duplicate records
- Adjusted numeric precision to prevent rounding distortions

**Featured Engineering**
- Created Categorical fields such as:
  - high_defect_flag
  - downtime_category
  - production_volume_category
  - energy_efficiency_category
  - stockout_category

These derived fields enabled segmented analysis and clearer comparisons across operational conditions.

---

## Analyze
**Tools Used**
- Excel: Pivot tables, descriptive statistics, category-based comparisons
- SQL (PostgreSQL): Query-based validation of Excel findings

**Key Analytical Focus Areas**
- Defect rates across production volume categories
- Impact of downtime and maintenance on quality outcomes
- Relationships between supplier quality, delivery delays, and defects
- Energy efficiency vs quality and downtime
- Workforce productivity vs quality and safety incidents

SQL was used to confirm and reproduce Excel insights, ensuring analytical accuracy and consistency.

---

## Share
**Summary of Key Insights**
Across all analyses, one core theme emerges:
- Defect risk in this dataset is driven far more by internal process stability than by production volume, workforce output, or supplier performance.

**Key findings include:**
- Production Volume
    - Defect rates remain consistent across low, medium, and high production levels. Output volume alone does not explain defect variation.
- Maintenance & Downtime
    - Maintenance hours are nearly identical across low, medium, and high downtime conditions. Defect rates and quality scores remain stable across downtime categories, indicating that downtime is not being reduced through increased maintenance effort, nor does it directly translate into higher defect rates.
- Supplier Quality & Delivery Delays
    - Supplier quality and delivery timing are virtually identical in both low- and high-defect environments. External supply chain factors do not meaningfully explain defect behavior in this dataset.
- Workforce Productivity & Safety
    - Worker productivity and safety incident rates show no meaningful variation between low- and high-defect conditions, suggesting defect risk is not driven by workforce output levels.
- Energy Efficiency
    - Energy efficiency exhibits only marginal differences in defect rate, quality, and downtime. It may serve as a supporting indicator of process health, but it is not a primary driver of quality outcomes.
- Inventory Stockouts (Strongest Signal)
    - Higher stockout risk is consistently associated with higher defect rates and lower quality scores. This is the clearest directional relationship in the dataset.

Together, these findings indicate that defect variation is primarily a systems and operational stability issue, not a volume, workforce, or supplier performance problem.

---

**Visualize (Tableau)**
- Interactive dashboards were created in Tableau Public to translate analytical findings into executive-friendly visuals.
    - Dashboard: Operational Drivers of Manufacturing Defects
    - LINK: https://public.tableau.com/views/OperationalDriversofManufacturingDefectsCurtisStevenson/Dashboard12?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
 
- This Dashboard includes:
    - KPI Cards
        - Average Defect Rate
        - Average Quality Score
        - Average Downtime Percentage
        - Total Production Records
    - Core Visuals
        - High vs Low Defect Conditions (bar comparison)
        - Maintenance Hours vs Downtime (scatter)
        - Energy Efficiency vs Quality Score (scatter)
        - Stockout Rate vs Defect Rate (scatter)

- These visuals allow stakeholders to:
    - Quickly identify high-risk operational conditions
    - Compare performance across defect categories
    - Explore relationships between maintenance, downtime, efficiency, and quality
    - Translate analytical results into operational decisions

---

## Act
**Operational Recommendations:**
- Shift Quality Strategy from Volume Control to Process Stability
    - Since production volume does not meaningfully impact defect rates, quality improvement efforts should focus on stabilizing operational conditions rather than limiting output.
- Re-evaluate Maintenance Strategy
    - Maintenance hours alone are not reducing downtime or defect rates.
        - Transition from “more maintenance” to targeted, root-cause-driven maintenance
        - Investigate systemic causes of downtime rather than increasing total maintenance time
- Treat Inventory Stability as a Quality Lever
    - Stockout risk is the most actionable driver identified:
        - Strengthen material planning and reorder thresholds
        - Reduce variability in material availability
        - Treat stockouts as a quality risk, not just a logistics issue
- Avoid Misattributing Defects to Workforce Performance
    - Workforce productivity and safety metrics do not explain defect variation.
        - Focus quality initiatives on system design and process control rather than individual output
- Use Energy Efficiency as a Supporting Signal
    - While not a primary driver, energy efficiency may help flag process drift and emerging instability.

These actions reposition defect reduction as a systems optimization problem, emphasizing operational stability, material flow, and process control over output restriction or labor pressure.

---

## Conclusion
This project demonstrates the full end-to-end data analysis lifecycle, from business question formulation through actionable operational insights. It showcases proficiency in Excel analysis, SQL validation, data cleaning, and stakeholder-focused communication, consistent with the expectations of the Google Data Analytics Certificate capstone project.

---

## Author
Curtis Stevenson
