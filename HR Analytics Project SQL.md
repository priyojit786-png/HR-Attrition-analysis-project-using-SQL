HR Analytics \& Employee Attrition Analysis



**Project Overview**



This project analyzes employee data to identify patterns and potential drivers of \*\*employee attrition\*\* using PostgreSQL.



The objective was to go beyond basic descriptive analysis and use SQL to answer practical HR business questions around \*\*attrition, compensation, overtime, work-life balance, job satisfaction, promotions, management relationships, and employee stress\*\*.



The project demonstrates how raw HR data can be transformed into actionable insights that can support \*\*employee retention and workforce management decisions\*\*.



\---



**Business Problem**



Employee attrition can lead to increased recruitment costs, loss of experienced employees, reduced productivity, and operational challenges.



The analysis focuses on:



\* Which departments and job roles have the highest attrition?

\* Which locations experience higher employee turnover?

\* Is overtime associated with higher attrition?

\* Does poor work-life balance increase attrition risk?

\* Does job satisfaction influence employee retention?

\* Does delayed promotion contribute to employee turnover?

\* Does the relationship with managers affect employee stress and attrition?

\* Do employees who leave receive lower salary hikes?



\---



**SQL Skills Demonstrated**



\* PostgreSQL database and table creation

\* Primary keys and data types

\* `SELECT`, `WHERE`, `GROUP BY`, `HAVING`

\* `ORDER BY`

\* `CASE WHEN`

\* `COUNT()`, `SUM()`, `AVG()`

\* `ROUND()`

\* Conditional aggregation

\* Common Table Expressions (`CTE`)

\* Numeric calculations and type casting

\* Percentage calculations

\* Data segmentation

\* Filtering and sorting

\* Aggregate analysis

\* Business-oriented SQL problem solving





**Dataset \& Table Design**



A structured HR table was created in PostgreSQL using CREATE TABLE FUNCTION containing employee-level information including:



\* Employee demographics

\* Department and job role

\* Education

\* Monthly income

\* Experience

\* Work location

\* Overtime

\* Work-life balance

\* Job satisfaction

\* Manager relationship

\* Training

\* Promotion history

\* Salary hike

\* Projects handled

\* Absenteeism

\* Stress level

\* Performance rating

\* Attrition status

\* Attrition reason

\* Joining date





**Analysis Performed**



1\. Overall Attrition Analysis



Calculated the total number of employees, employees who left, and the overall company attrition rate.



Overall Attrition Rate: 14.93%



2\. Department-Level Attrition



Compared attrition rates across departments to identify areas with higher employee turnover.



Higher-attrition departments identified:



\* Customer Support

\* Marketing

\* Finance



3\. Job Role Analysis



Identified job roles with higher attrition rates within the departments showing elevated turnover.



Roles identified included:



\* Customer Success Manager

\* Marketing Manager

\* Accountant

\* SEO Specialist

\* Support Executive



4\. Salary Hike Analysis



Compared average salary hikes between employees who left and employees who stayed.



| Employee Group       | Average Salary Hike |

| -------------------- | ------------------: |

| Employees who left   |              10.11% |

| Employees who stayed |              12.83% |



This indicates a potential relationship between compensation growth and employee retention.



5\. Location-Based Attrition



Analyzed attrition across work locations and identified locations with comparatively higher employee turnover.



Higher-attrition locations:



\* Pune

\* Chennai

\* Noida



6\. Overtime \& Attrition



Compared attrition rates between employees who worked overtime and those who did not across departments.



The analysis showed that overtime employees generally experienced higher attrition.



7\. Overtime \& Work-Life Balance



Employees were segmented into:



\* Poor

\* Average

\* Good



work-life balance categories.



Among employees with poor work-life balance:



\*Without overtime: 19.59% attrition

\*With overtime: 36.54% attrition



This suggests that the combination of overtime and poor work-life balance may represent an important employee retention risk.



8\. Job Satisfaction \& Attrition



Employees were segmented into Low, Average, and High job satisfaction groups.



Employees with low job satisfaction had an attrition rate of approximately 28.63%, indicating a potential relationship between employee satisfaction and retention.



9\. Promotion \& Attrition



Employees were categorized based on the number of years since their last promotion.



The analysis found:



\*Recently Promoted: 8.21% attrition

\*Delayed Promotion: 20.31% attrition



This suggests that delayed career progression may be associated with increased attrition risk.



10\. Manager Relationship, Stress \& Attrition



Analyzed the relationship between manager relationship scores, employee stress, job satisfaction, and attrition.



Employees reporting poorer manager relationships showed:



\* Higher stress levels

\* Lower job satisfaction

\* Higher attrition rates



This highlights the potential importance of manager-employee relationships in employee retention.





\---



**Key Business Insights**



1\. Overtime and poor work-life balance are associated with significantly higher attrition.

2\. Low job satisfaction is associated with higher employee turnover.

3\. Delayed promotions are associated with higher attrition compared with recently promoted employees.

4\. Poor manager relationships are associated with higher stress and attrition.

5\. Employees who left received a Lower average salary hike than employees who stayed.

6\. Certain departments, job roles, and locations require greater attention from a retention perspective.



\---



**Business Recommendations**



Based on the analysis, HR teams could consider:



\* Monitoring overtime levels within high-attrition departments.

\* Introducing workload and work-life balance improvement initiatives.

\* Reviewing promotion and career progression processes.

\* Conducting regular employee satisfaction surveys.

\* Providing management and leadership training.

\* Reviewing compensation growth for high-risk employee groups.

\* Developing targeted retention strategies for departments and roles with elevated attrition.



\---



**Project Purpose**



This project was developed as part of my Data Analytics portfolio to demonstrate how SQL can be used to solve real-world HR problems.



The focus was not only on writing SQL queries, but on translating employee data into business insights and practical recommendations that can support data-driven HR decision-making.



\---

