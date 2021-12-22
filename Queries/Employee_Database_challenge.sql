-- MODULE 7 CHALLENGE 
-- Deliverable 1. Number of Retiring Employees by Title
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tl.title,
	tl.from_date,
	tl.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date IN ('9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC;

-- retiring_titles query
SELECT COUNT(ut.title), 
	ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT (ut.title) DESC;