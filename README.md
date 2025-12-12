# boAt_Product_Analysis  

**Turning 500+ Amazon reviews of boAt Airdopes 141 into actionable insights for product & marketing.**  



## Overview  
This project analyzes **customer sentiment and product experience** for boAt Airdopes 141. Using structured data cleaning, feature tagging, and sentiment mapping, it highlights **what customers love** and **where they struggle**, translating raw reviews into **strategic recommendations**.  



## Workflow  
1. **Data Collection** → 500+ Amazon reviews (all rating levels)  
2. **Cleaning & Preprocessing** → Removed emojis, non-English text, duplicates  
3. **Feature Tagging** → Connectivity, Battery, Sound, Durability, Gen-Z appeal  
4. **Sentiment Analysis** → Classified into Positive, Neutral, Negative  
5. **Insights & Recommendations** → Derived customer pain points & product strengths  



## Key Findings  
- **Balanced Sentiment** → Positive (40.5%) vs Negative (39.8%)  
- **Pain Points** → Durability (25%), Battery (21%), Connectivity (19%)  
- **Loved Aspects** → Gen-Z appeal (39%), Sound & Battery (~32%), Connectivity (28%)  
- **Polarized Experiences** → Same features praised by some, criticized by others  



## Recommendations  
- **Durability** → Stricter QA, extended warranty for trust  
- **Battery & Charging** → Market realistic backup, explore fast charging  
- **Connectivity** → Optimize Bluetooth firmware for stable, multi-device use  
- **Branding** → Double down on youth-centric, party-vibe positioning  



## Tech Stack  
- **Excel** (data cleaning, categorization, visualization)  
- **PowerPoint** (presentation of insights & recommendations)  




## How to Use  
1. Open **`data/reviews_analysis.xlsx`** → explore sheets for raw reviews, processed data, and sentiment visuals.  
2. Open **`presentation/boAt_Airdopes_Analysis.pptx`** → view structured findings, insights, and recommendations.  


### SQL Queries
##  1. Count positive, negative, and neutral sentiment based on keywords

SELECT
    CASE
        WHEN review_text ILIKE '%good%' OR review_text ILIKE '%love%' THEN 'Positive'
        WHEN review_text ILIKE '%bad%' OR review_text ILIKE '%poor%' OR review_text ILIKE '%disappointed%' THEN 'Negative'
        ELSE 'Neutral'
    END AS sentiment,
    COUNT(*) AS review_count
FROM reviews
GROUP BY sentiment;

## 2.Tag reviews by common product attributes
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

## 3.Find most common negative issues
SELECT
    feature_tag,
    COUNT(*) AS issue_count
FROM feature_extracted_reviews
WHERE sentiment = 'Negative'
GROUP BY feature_tag
ORDER BY issue_count DESC;





## Author  
**Sai Gautham Godala**  
