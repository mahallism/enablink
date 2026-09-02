DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_volunteer`(IN `p_nama` VARCHAR(200), IN `p_id` INT)
BEGIN
    SELECT DISTINCT
        u.name,
        u.email,
        s.nick_name,
        s.no_hp,
        u.user_id,
        f.faculty_name,
        p_id
    FROM aplego_user u 
    JOIN app_students s ON u.user_id = s.user_id
    JOIN app_majors m ON m.majors_id = s.majors_id
    JOIN app_faculties f ON f.faculty_id = m.faculty_id
    join app_student_active aa on aa.student_id = s.student_id
    
    WHERE 
    u.capability = 'volunteer' and 
    aa.semester_id = (select semester_id from app_accompaniment w where w.accompaniment_id = p_id )and
    (
    u.name LIKE CONCAT('%', p_nama, '%')
        OR s.nick_name LIKE CONCAT('%', p_nama, '%'));
END$$
DELIMITER ;