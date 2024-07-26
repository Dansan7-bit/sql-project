USE proyecto;

SELECT ci.
FROM course_information AS ci
JOIN course_metrics AS cm
ON ci.course_id = cm.course_id
GROUP BY


--Hypothesis 1: Courses in the 'web development' subject are more expensive than those in other subjects.
SELECT subject, ROUND(AVG(price))
FROM course_information
GROUP BY subject
ORDER BY AVG(price) DESC

--Top 5 course subscribers.

SELECT ci.course_title, cm.num_subscribers, ci.subject
FROM course_information AS ci
JOIN course_metrics AS cm
ON ci.course_id = cm.course_id
ORDER BY num_subscribers DESC
LIMIT 5

SELECT ci.course_title, cm.num_subscribers, ci.subject
FROM course_information AS ci
JOIN course_metrics AS cm
ON ci.course_id = cm.course_id
WHERE subject = "Business Finance"
ORDER BY ci.subject, num_subscribers DESC
LIMIT 1

SELECT ci.course_title, cm.num_subscribers, ci.subject
FROM course_information AS ci
JOIN course_metrics AS cm
ON ci.course_id = cm.course_id
WHERE subject = "Graphic Design"
ORDER BY ci.subject, num_subscribers DESC
LIMIT 1


SELECT ci.course_title, cm.num_subscribers, ci.subject
FROM course_information AS ci
JOIN course_metrics AS cm
ON ci.course_id = cm.course_id
WHERE subject = "Musical Instruments"
ORDER BY ci.subject, num_subscribers DESC
LIMIT 1


--Hypothesis 2: Free courses have more subscribers than paid courses.

SELECT is_paid, COUNT(*) AS num_courses
FROM course_information
GROUP BY is_paid;


SELECT ci.is_paid, ROUND(AVG(cm.num_subscribers))
FROM course_information AS ci
JOIN course_metrics AS cm
ON ci.course_id = cm.course_id
GROUP BY is_paid


--Hypothesis 4: Courses with higher content duration have more lectures.
--Reasoning: Longer courses are likely to have more lectures.

SELECT content_duration, AVG(num_lectures) AS avg_num_lectures
FROM course_metrics
GROUP BY content_duration
ORDER BY content_duration DESC;

--Hypothesis 3: Content Duration by Difficulty
--if courses with higher difficulty levels have longer content duration.
--This could suggest that more complex topics require more extensive material.

SELECT ci.level, ROUND(AVG(cm.content_duration),1) AS avg_content_duration
FROM course_information AS ci
JOIN course_metrics AS cm
ON ci.course_id = cm.course_id
GROUP BY level


--Web development -> most expert course?

SELECT subject, level, COUNT(*) AS num_courses
FROM course_information
GROUP BY subject, level
HAVING level = "Expert Level"
ORDER BY num_courses DESC;


--Longest course
SELECT ci.course_title, ci.subject,cm.content_duration
FROM course_information AS ci
JOIN course_metrics AS cm
ON ci.course_id = cm.course_id
ORDER BY content_duration DESC
LIMIT 1;

--most num of lectures

SELECT ci.course_title, ci.subject,cm.num_lectures
FROM course_information AS ci
JOIN course_metrics AS cm
ON ci.course_id = cm.course_id
ORDER BY num_lectures DESC
LIMIT 1;



