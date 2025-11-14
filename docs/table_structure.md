Here's your complete Django database schema with descriptions added under each table name:

---

### Table: baseapp_applicant
**Description:** Stores comprehensive profile information for job applicants including personal details, educational qualifications, work experience, and CV file paths. Links to the login table for authentication and tracks applicant degree and experience fields for ML-based candidate filtering.

| Column | Type | Constraints | Links to |
|--------|------|-------------|----------|
| id | bigint(20) | primary key | |
| applicantname | varchar(20) | Not NULL | |
| email | varchar(50) | Not NULL | |
| contact | bigint(20) | Not NULL | |
| address | longtext | Not NULL | |
| username | varchar(20) | Not NULL | |
| degree | varchar(20) | NULL | |
| experience | varchar(20) | NULL | |
| cvpath | varchar(100) | NULL | |
| log_id_id | bigint(20) | foreign key | baseapp_login (id) |

***

### Table: baseapp_application
**Description:** Manages the complete application lifecycle tracking for each job application submitted by applicants. Records application dates, current status (APPLIED, SHORTLISTED, INTERVIEWED, HIRED, REJECTED), status updates, staff notes, and optional ML-generated candidate scores. Establishes many-to-one relationships with both applicants and job vacancies.

| Column | Type | Constraints | Links to |
|--------|------|-------------|----------|
| id | bigint(20) | primary key | |
| applied_date | datetime(6) | Not NULL | |
| status | varchar(30) | Not NULL | |
| status_updated_date | datetime(6) | Not NULL | |
| notes | longtext | NULL | |
| ml_score | double | NULL | |
| applicant_id | bigint(20) | foreign key | baseapp_applicant (id) |
| vacancy_id | bigint(20) | foreign key | baseapp_vacancy (id) |

---

### Table: baseapp_login
**Description:** Centralized authentication and authorization table that manages user credentials and role-based access control. Supports three user roles (admin, staff, applicant) and serves as the authentication backbone for the entire system. Each user record in applicant and staff tables references this table through a foreign key relationship.

| Column | Type | Constraints | Links to |
|--------|------|-------------|----------|
| id | bigint(20) | primary key | |
| role | varchar(15) | Not NULL | |
| username | varchar(20) | NULL | |
| email | varchar(30) | Not NULL | |
| password | varchar(20) | Not NULL | |

***

### Table: baseapp_staff
**Description:** Maintains staff member profiles including recruitment team personnel and HR staff who manage vacancies, review applications, and update applicant statuses. Each staff record is linked to the login table for authentication and tracks workplace assignment and contact information for administrative purposes.

| Column | Type | Constraints | Links to |
|--------|------|-------------|----------|
| id | bigint(20) | primary key | |
| staffname | varchar(20) | Not NULL | |
| email | varchar(50) | Not NULL | |
| contact | bigint(20) | Not NULL | |
| workplace | varchar(50) | Not NULL | |
| username | varchar(20) | Not NULL | |
| log_id_id | bigint(20) | foreign key | baseapp_login (id) |

---

### Table: baseapp_vacancy
**Description:** Stores job posting information and vacancy details including position titles, salary ranges, hiring companies, job descriptions, required qualifications, and available seats. Serves as the master table for all job openings and is referenced by the application table to track which vacancies applicants have applied for.

| Column | Type | Constraints | Links to |
|--------|------|-------------|----------|
| id | bigint(20) | primary key | |
| vacancyname | varchar(50) | Not NULL | |
| salary | varchar(30) | NULL | |
| company | varchar(30) | NULL | |
| desc | longtext | NULL | |
| qualification | longtext | NULL | |
| seats | bigint(20) | Not NULL | |

***

These descriptions provide clear context about the purpose and relationships of each data store in your Django-based Applicant Tracking System, making it easier for developers and stakeholders to understand the database architecture and data flow patterns.

[1](https://github.com/Ornstein89/DrawioDjangoModel)
[2](https://stackoverflow.com/questions/61292421/how-can-i-automate-displaying-mxgraphmodel-in-draw-io)
[3](https://www.youtube.com/watch?v=qzrE7cfc_3Q)
[4](https://www.linkedin.com/pulse/generate-database-diagramerd-django-extensions-automatically-srujan-s)
[5](https://groups.google.com/g/drawio/c/bSzneA2AzP0)
[6](https://www.drawio.com/doc/faq/configure-diagram-editor)
[7](https://www.youtube.com/watch?v=vaK9pNkc-8c)
[8](https://drawio-app.com/blog/extracting-the-xml-from-mxfiles/)
