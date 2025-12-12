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
