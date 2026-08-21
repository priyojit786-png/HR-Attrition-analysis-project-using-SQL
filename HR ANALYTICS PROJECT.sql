DROP TABLE IF EXISTS hr;

CREATE TABLE hr(
SR_NO SERIAL,
Employee_ID VARCHAR(50) PRIMARY KEY,
Employee_Name VARCHAR(120),
Age INT,
Gender VARCHAR(50),
Department VARCHAR(100),
Job_Role VARCHAR(100),
Education_Level VARCHAR(120),
Monthly_Income Numeric (10,2),
Experience_Years INT,
Work_Location VARCHAR(70),
Distance_From_Home_KM INT,
Overtime VARCHAR(10),
Work_Life_Balance INT,
Job_Satisfaction NUMERIC(10,2),
Environment_Satisfaction INT,
Relationship_With_Manager INT,
Training_Hours_Last_Year INT,
Years_Since_Last_Promotion INT,
Salary_Hike_Percent Numeric (10,2),
Projects_Handled INT,
Absenteeism_Days INT,
Stress_Level INT,
Performance_Rating INT,
Attrition VARCHAR(70),
Attrition_Reason VARCHAR(70),
Joining_Date DATE,
Email VARCHAR(70),
Phone_Number NUMERIC,
Attrition_Risk_Score INT
);

SELECT*FROM hr;

SELECT DISTINCT Attrition FROM hr;

SELECT Attrition, COUNT(*)
FROM hr
GROUP BY Attrition;

--Q.What is the overall attrition rate in the company?

SELECT
COUNT(*) AS Total_employees,
SUM(CASE WHEN Attrition='Yes'THEN 1 ELSE 0 END) AS total_attrition,
ROUND(SUM(CASE WHEN Attrition='Yes'THEN 1 ELSE 0 END)::Numeric/COUNT(*)*100.0,2) AS attrition_rate
FROM hr;

--A.14.93%

--Q.Which departments have the highest attrition?

SELECT
department,
COUNT(*) AS Total_employees,
SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END) AS total_attrition,
ROUND(SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END)/COUNT(*)*100.0,2) AS attrition_rate
FROM hr
GROUP BY Department
ORDER BY attrition_rate DESC;

--A.Customer support, Marketing, Finance

--Q.Which job roles are most affected by attrition?

WITH cte AS (SELECT
Department,job_role,
COUNT(*) AS Total_employees,
SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END) AS total_attrition,
ROUND(SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END)/COUNT(*)*100.0,2) AS attrition_rate
FROM hr
WHERE Department IN('Customer Support','Marketing','Finance')
GROUP BY Department,job_role
ORDER BY Department)

SELECT Department,job_role,total_employees,total_attrition,attrition_rate
FROM cte
WHERE attrition_rate>=15 AND total_employees>100
ORDER BY attrition_rate DESC;

--A. customer success manager,marketing manager, Accountant,SEO specialist,support executive

--Q.What is the average salary_hike_percent of employees who left vs stayed?

SELECT
ROUND(AVG(Salary_Hike_Percent),2) AS avg_salary_hike_percent,
ROUND(AVG(CASE WHEN Attrition='Yes'THEN Salary_Hike_Percent END),2) AS avg_salary_hike_percent_left,
ROUND(AVG(CASE WHEN Attrition='No'THEN Salary_Hike_Percent END),2) AS avg_salary_hike_percent_stayed
FROM hr;

--A. avg_salary_hike_percent_left- 10.11%, avg_salary_hike_percent_stayed- 12.83%

--Q. Which locations have the highest employee attrition?

SELECT Work_Location,
COUNT(*) AS Total_employees,
SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END) AS total_attrition,
ROUND(SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END)/COUNT(*)*100.0,2) AS attrition_rate
FROM hr
GROUP BY Work_Location
ORDER BY attrition_rate DESC;

--A. Pune, Chennai, Noida

--Q. Which Departments Are Experiencing Overtime-Driven Attrition?

SELECT Department, Overtime,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END) AS total_attrition,
ROUND(SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END)/COUNT(*)*100.0,2) AS attrition_rate
FROM hr
GROUP BY Department,Overtime
ORDER BY Department;

--A. All departments have a higher attrition rate for employees who worked overtime.

--Q. How Does the Combination of Overtime and Work-Life Balance Affect Attrition?

SELECT
Overtime,
CASE 
WHEN Work_Life_Balance<=2 THEN 'Poor'
WHEN Work_Life_Balance =3 THEN 'Average'
WHEN Work_Life_Balance>=4 THEN 'Good'
END AS Work_Life_Balance,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END) AS total_attrition,
ROUND(SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END)/COUNT(*)*100.0,2) AS attrition_rate
FROM hr
GROUP BY Overtime, CASE 
WHEN Work_Life_Balance<=2 THEN 'Poor'
WHEN Work_Life_Balance =3 THEN 'Average'
WHEN Work_Life_Balance>=4 THEN 'Good'
END
ORDER BY Work_Life_Balance DESC;

--A. When the employee is not doing overtime and still has a poor work_life_balance the attrition rate is 19.59% and when the employee is doing overtime and has a poor work_life_balance the attrition rate is increased to 36.54%. This shows that overtime and poor work_life_balance is a major factor for attrition.

--Q. Which Satisfaction Segments Contribute Most to Total Attrition?

SELECT
CASE
WHEN Job_Satisfaction<=2 THEN 'Low'
WHEN Job_Satisfaction=3 THEN 'Average'
WHEN Job_Satisfaction>=4 THEN 'High'
END AS Job_Satisfaction,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END) AS total_attrition,
ROUND(SUM(CASE WHEN Attrition='Yes'THEN 1.0 ELSE 0.0 END)/COUNT(*)*100.0,2) AS attrition_rate
FROM hr
GROUP BY CASE
WHEN Job_Satisfaction<=2 THEN 'Low'
WHEN Job_Satisfaction=3 THEN 'Average'
WHEN Job_Satisfaction>=4 THEN 'High'
END
ORDER BY attrition_rate DESC;

--A. Through this we can see that where job satisfaction is low the attrition rate is higher. So the employee who have job satisafction score of 1 and 2 the attrition rate there is 28.63%.

--Q. Does Delayed Promotion Increase Attrition Risk?

SELECT 
CASE
WHEN Years_Since_Last_Promotion<=3 THEN 'Recently Promoted'
WHEN Years_Since_Last_Promotion BETWEEN 4 AND 6 THEN 'Promoted'
ELSE 'Delayed Promotion'
END AS Promotion,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes'THEN 1 ELSE 0 END) AS total_attrition,
ROUND(SUM(CASE WHEN Attrition='Yes'THEN 1 ELSE 0 END)::Numeric/COUNT(*)*100,2) AS attrition_rate
FROM hr
GROUP BY CASE
WHEN Years_Since_Last_Promotion<=3 THEN 'Recently Promoted'
WHEN Years_Since_Last_Promotion BETWEEN 4 AND 6 THEN 'Promoted'
ELSE 'Delayed Promotion'
END
ORDER BY attrition_rate;

--A. As we cam see from the above query that the employees who have delayed promotion have a higher attrition rate of 20.31%. However, the employees who have been promoted recently have a lower attrition rate of 8.21%. So we can definitely conclude that delayed promotion is a factor which can affect the attrition rate.

--Q. Are Poor Manager Relationships Creating High-Stress Teams?
SELECT
relationship_with_manager,
ROUND(AVG(Stress_level),2) AS avg_stress_level,
ROUND(AVG(job_satisfaction),2) AS avg_job_satisfaction,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes'THEN 1 ELSE 0 END) AS total_attrition,
ROUND(SUM(CASE WHEN Attrition='Yes'THEN 1 ELSE 0 END)::Numeric/COUNT(*)*100,2) AS attrition_rate
FROM hr
GROUP BY relationship_with_manager
ORDER BY attrition_rate DESC;

--A. yes, poor relationship with manager such as 1 and 2 has stress level above 3 and attrition rate over 20% so we can conclude that poor manager relationship is a factor that can create high stress teams which then lead to attrition.




