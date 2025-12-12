SELECT
    feature_tag,
    COUNT(*) AS issue_count
FROM feature_extracted_reviews
WHERE sentiment = 'Negative'
GROUP BY feature_tag
ORDER BY issue_count DESC;
