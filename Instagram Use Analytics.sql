-- Query to Find the 5 oldest users of the Instagram from the database provided 
-- SELECT * FROM users order by created_at limit 5;
-- Query to find the users who have never posted a single photo on Instagram
-- SELECT users.id,username,created_at FROM users left join photos on users.id=photos.user_id 
-- WHERE image_url is null;
-- QUERY to find the user who gets more number of likes for a single photo
-- SELECT B.id, B.likes_num, B.user_id, users.username
-- FROM users
-- INNER JOIN
-- (SELECT photos.id, photos.user_id, A.likes_num
-- FROM photos
-- INNER JOIN
-- (SELECT photo_id, COUNT(*) AS likes_num
-- FROM likes
-- GROUP BY photo_id
-- ORDER BY likes_num DESC
-- LIMIT 1) AS A
-- ON photos.id = A.photo_id) B
-- ON users.id = B.user_id
-- Query to Identify and suggest the top 5 most commonly used hashtags on the platform.
-- select *
-- from
-- (
-- select tags.id,tag_name,tag_id,count(tag_id)as no_of_times_tagged from tags
-- join photo_tags 
-- on tags.id=photo_tags.tag_id 
-- group by tag_id
-- order by no_of_times_tagged desc
-- )a 
-- limit 5;
-- query to select the day of the week on which most users are registering.
-- select day_of_the_week,count(day_of_the_week)as created_day
-- from
-- (
-- SELECT *,weekday(created_at)as day_of_the_week from users
-- )a
-- group by day_of_the_week
-- order by created_day desc;
-- query to select average number of posts by users on instagram
-- SELECT AVG(posts_count) AS avg_posts, ROUND(AVG(posts_count),0) AS avg_posts_roundval,
-- CEIL(AVG(posts_count)) AS avg_posts_ceilval
-- FROM
-- (SELECT user_id, count(*) AS posts_count
-- FROM photos
-- GROUP BY user_id) AS user_posts;
-- User Engagement analysis to get total number of photos on Instagram/total number of users.
-- SELECT (total_photos/total_users) AS total_photos_by_total_users
-- FROM
-- (SELECT COUNT(*) AS total_records, 
-- COUNT(DISTINCT photo_id) AS total_photos, 
-- COUNT(DISTINCT id) AS total_users
-- FROM
-- (SELECT * 
-- FROM users
-- LEFT JOIN 
-- (SELECT id AS photo_id, user_id
-- FROM photos) AS posts
-- ON users.id = posts.user_id) AS user_details) AS result
-- MoBots & Fake Accounts
SELECT id, username, num_posts_liked
FROM users
INNER JOIN
(SELECT * 
FROM
(SELECT user_id, 
COUNT(photo_id) AS num_posts_liked
FROM likes
GROUP BY user_id
ORDER BY 2 DESC) AS A
WHERE num_posts_liked=257) B
ON users.id = B.user_id;