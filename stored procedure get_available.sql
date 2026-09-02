DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_available`(IN `p_hari` INT, IN `p_start` TIME, IN `p_end` TIME, IN `p_id` INT, IN `p_tanggal` DATE)
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
    aa.semester_id = (select semester_id from app_accompaniment b where b.accompaniment_id = p_id ) and
    
    NOT EXISTS (
        SELECT 1
        FROM app_schedule_volunteer sv1
        WHERE sv1.student_id = s.student_id
          AND sv1.day = p_hari
          AND sv1.start_at < p_end
          AND sv1.end_at > p_start
    )

    
    AND NOT EXISTS (
        SELECT 1
        FROM app_accompaniment_view a
        WHERE a.volunteer_id = s.student_id
          AND a.day = p_hari
          AND a.start_at < p_end
          AND a.end_at > p_start
        AND a.date = p_tanggal
    );
END$$
DELIMITER ;