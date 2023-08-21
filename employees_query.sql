select em.emp_no as "employee id",
em.first_name, em.last_name, em.gender,
em.hire_date,
tl.title, sl.salary,
dp.dept_name, de.from_date as "start date", de.to_date as "to date",
mrg.first_name as "manager firstname", mrg.last_name as "manager lastname",
dm.from_date as "manager from", dm.to_date as "manager to"

from employees em

join dept_emp de on de.emp_no = em.emp_no
left join departments dp on dp.dept_no = de.dept_no
left join dept_manager dm on dm.dept_no = dp.dept_no
left join employees mrg on mrg.emp_no = dm.emp_no
left join titles tl on tl.emp_no = em.emp_no
left join salaries sl on sl.emp_no = em.emp_no;


select em.first_name, count(*) as "salary raise times" from salaries sl
inner join employees em on em.emp_no = sl.emp_no
where sl.emp_no = 10001;

SELECT em.first_name, sl.salary AS "latest salary"
FROM (
    SELECT emp_no, MAX(from_date) AS max_from_date
    FROM salaries
    WHERE emp_no = 10001
    GROUP BY emp_no
) max_sal
INNER JOIN salaries sl ON sl.emp_no = max_sal.emp_no AND sl.from_date = max_sal.max_from_date
INNER JOIN employees em ON em.emp_no = sl.emp_no;

