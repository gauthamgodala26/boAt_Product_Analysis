
SELECT
    CASE
        WHEN review_text ILIKE '%good%' OR review_text ILIKE '%love%' THEN 'Positive'
        WHEN review_text ILIKE '%bad%' OR review_text ILIKE '%poor%' OR review_text ILIKE '%disappointed%' THEN 'Negative'
        ELSE 'Neutral'
    END AS sentiment,
    COUNT(*) AS review_count
FROM reviews
GROUP BY sentiment;
