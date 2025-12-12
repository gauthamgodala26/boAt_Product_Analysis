# boAt Product Analysis – Customer Sentiment & Product Insights  
Transforming 500+ Amazon reviews of boAt Airdopes 141 into data-driven product decisions.

---

## Overview  
This project analyzes real customer feedback for the boAt Airdopes 141 to uncover sentiment patterns, product experience gaps, and actionable improvement opportunities.  
Using structured cleaning, feature tagging, and sentiment mapping, the study converts raw reviews into insights that support product, marketing, and CX strategy.

---

## Workflow  

### 1. Data Collection  
- Collected 500+ Amazon reviews across all star ratings  

### 2. Cleaning & Preprocessing  
- Removed emojis, symbols, and non-English text  
- Standardized sentiment terms  
- Removed duplicates and normalized product keywords  

### 3. Feature Tagging  
Reviews were categorized into product experience themes:  
- Battery  
- Sound Quality  
- Comfort & Fit  
- Connectivity  
- Durability  
- Gen-Z Appeal / Design  

### 4. Sentiment Analysis  
Reviews were tagged as:  
- Positive  
- Negative  
- Neutral  

### 5. Insight Derivation  
Patterns across features and sentiment categories were summarized into product recommendations.

---

## Key Findings  

### 1. Sentiment Distribution  
- Positive: **40.5%**  
- Negative: **39.8%**  

Customers are highly split — strong appreciation, but equally high frustration.

---

### 2. Major Pain Points  
| Feature       | % of Negative Mentions |
|--------------|-------------------------|
| Durability   | 25%                     |
| Battery      | 21%                     |
| Connectivity | 19%                     |

Durability is the top complaint, followed by battery backup and connectivity issues.

---

### 3. Most Loved Features  
| Feature         | Positive Mentions |
|-----------------|-------------------|
| Gen-Z Design    | 39%               |
| Sound Quality   | 32%               |
| Battery Backup  | 32%               |
| Connectivity    | 28%               |

Product resonates well with youth and sound-focused buyers.

---

### 4. Polarized Experience  
Several features (like sound and battery) have both strong praise and strong criticism.  
This suggests quality variance or inconsistency across production batches.

---

## Recommendations  

### Durability  
- Strengthen hinge and plastic components  
- Offer extended warranty to rebuild trust  

### Battery & Charging  
- Set realistic expectations for backup  
- Explore fast-charging improvements  

### Connectivity  
- Improve Bluetooth stability and latency  
- Optimize multi-device switching  

### Branding  
- Leverage youth-focused design and high appeal  
- Reinforce sound quality improvements in marketing  

---

## Tech Stack  
- **Excel** — data cleaning, tagging, sentiment categorization, visualization  
- **PowerPoint** — insight presentation  

*(SQL/Python scripts can be added for future scalability and automation.)*

---

## How to Use  

1. Open `data/reviews_analysis.xlsx`  
   - Contains raw reviews, processed data, tags, and charts  

2. Open `presentation/boAt_Airdopes_Analysis.pptx`  
   - Shows insights, trends, and product recommendations  

---

## This Project Demonstrates  
- Customer sentiment analysis  
- Feature tagging and root-cause identification  
- Ability to convert qualitative feedback into actionable product insights  
- Clear communication of insights in a structured business format  




### SQL Queries
##  1. Count positive, negative, and neutral sentiment based on keywords
```sql

SELECT
    CASE
        WHEN review_text ILIKE '%good%' OR review_text ILIKE '%love%' THEN 'Positive'
        WHEN review_text ILIKE '%bad%' OR review_text ILIKE '%poor%' OR review_text ILIKE '%disappointed%' THEN 'Negative'
        ELSE 'Neutral'
    END AS sentiment,
    COUNT(*) AS review_count
FROM reviews
GROUP BY sentiment;
```
## 2.Tag reviews by common product attributes
```sql
SELECT
    review_id,
    review_text,
    CASE
        WHEN review_text ILIKE '%battery%' THEN 'Battery'
        WHEN review_text ILIKE '%sound%'  THEN 'Sound Quality'
        WHEN review_text ILIKE '%comfort%' THEN 'Comfort'
        WHEN review_text ILIKE '%design%' THEN 'Design'
        ELSE 'Other'
    END AS feature_tag
FROM reviews;
```
## 3.Find most common negative issues
```sql
SELECT
    feature_tag,
    COUNT(*) AS issue_count
FROM feature_extracted_reviews
WHERE sentiment = 'Negative'
GROUP BY feature_tag
ORDER BY issue_count DESC;

```



## Author  
**Sai Gautham Godala**  
