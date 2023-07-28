-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) as `number_of_enrolled`, YEAR(`enrolment_date`) as `year` FROM `students` GROUP BY `year`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) as `number_of_teacher`, `office_address` FROM `teachers` GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame


-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento