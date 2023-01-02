WITH random_prompts_order AS (
	SELECT
		ROW_NUMBER () OVER (
		ORDER BY
		random()
		) as prompts_order_id, *
	FROM
		prompts
),
random_question_order AS (
	SELECT
	ROW_NUMBER () OVER (
		ORDER BY
		random()
	) as question_order_id,
		*
	FROM
		questions
)
SELECT
	name, question_text, text
FROM
	random_question_order rqo
	JOIN categories c ON c.id = category_id
	LEFT JOIN random_prompts_order p ON category_id = prompts_order_id
GROUP BY
	category_id
ORDER BY RANDOM()
LIMIT 3;