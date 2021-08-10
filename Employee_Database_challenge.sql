-- DELIVERABLE 1

-- combining 2 tables to get emp info + their titles
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles AS t ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON(emp_no) first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--count of employees under each title 
SELECT COUNT(first_name) AS f,title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY f DESC;

--DELIVERABLE 2

--MENTORSHIP ELIGIBILITY PROGRAM
-- 
SELECT DISTINCT ON(e.emp_no) e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de ON e.emp_no = de.emp_no
LEFT JOIN titles as t ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01' AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no
