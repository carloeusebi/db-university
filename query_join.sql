--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT S.`name`, S.`surname`
FROM `students` as S
JOIN `degrees` as D ON `S`.`degree_id` = `D`.`id`
WHERE `D`.`name` = 'Corso di Laurea in Economia';


--2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT DEG.`name`, DEG.`website`
FROM `degrees` AS DEG
JOIN `departments` as DEP ON `DEG`.`department_id` = `DEP`.`id`
WHERE `DEP`.`name` = 'Dipartimento di Neuroscienze';

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT C.`name`, C.`website`
FROM `courses` AS C
JOIN `course_teacher` as CT ON C.`id` = CT.`course_id`
JOIN `teachers` AS T ON CT.`teacher_id` = T.`id`
WHERE T.`name` = 'Fulvio' AND T.`surname` = 'Amato';

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT S.`surname`, S.`name`, S.`registration_number`, DEG.`name`, DEP.`name`
FROM `students` AS S
JOIN `degrees` AS DEG ON S.`degree_id` = DEG.`id`
JOIN `departments` AS DEP ON DEG.`department_id` = DEP.`id`
ORDER BY S.`surname`, S.`name`;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT D.`name` AS `degree`, C.`name` AS `course`, CONCAT(T.`surname`, ' ', T.`name`) AS `teacher`
FROM `degrees` AS D
JOIN `courses` AS C ON C.`degree_id` = D.`id`
JOIN `course_teacher` AS CT ON CT.`course_id` = C.`id`
JOIN `teachers` AS T on T.`id` = CT.`teacher_id`
ORDER BY D.`name`; -- order by to make easier to read

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT T.`surname`, T.`name`
FROM `teachers` AS T
JOIN `course_teacher` AS CT ON CT.teacher_id = T.id
JOIN `courses` AS C ON C.id = CT.course_id
JOIN `degrees` AS DEG ON DEG.id = C.degree_id
JOIN `departments` AS DEP ON DEP.id = DEG.department_id
WHERE DEP.name = 'Dipartimento di Matematica';


--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT CONCAT(S.surname, S.name) AS `student`, S.registration_number, C.name as `exam`, COUNT(*) AS `number_of_attempts`
FROM `students` AS S
JOIN `exam_student` AS ES ON ES.student_id = S.id
JOIN `exams` AS E on E.id = ES.exam_id
JOIN `courses` AS C on C.id = E.course_id
GROUP BY ES.student_id, C.id;