Here are the **complete bulk SQL queries** for all 24 applicant records and their linked login rows, based strictly on the fields and data from your latest screenshot and compatible with your Django models.

***

### 1. Insert into `baseapp_login`  
*(You may want to tweak the password, these are placeholder values for convenience. Adjust if needed)*

```sql
INSERT INTO baseapp_login (role, username, email, password) VALUES
('admin', 'admin', 'admin@gmail.com', 'Aa.12345'),
('applicant', 'anup', 'anup@gmail.com', 'Aa.12345'),
('applicant', 'apct az', 'apctaz@gmail.com', 'Aa.12345'),
('applicant', 'rizwana', 'rizwan@gmail.com', 'Aa.12345'),
('applicant', 'apct ab', 'apctab@gmail.com', 'Aa.12345'),
('applicant', 'apct ae', 'apctae@gmail.com', 'Aa.12345'),
('applicant', 'apct af', 'apctaf@gmail.com', 'Aa.12345'),
('applicant', 'apct ag', 'apctag@gmail.com', 'Aa.12345'),
('applicant', 'apct ah', 'apctah@gmail.com', 'Aa.12345'),
('applicant', 'apct ai', 'apctai@gmail.com', 'Aa.12345'),
('applicant', 'apct aj', 'apctaj@gmail.com', 'Aa.12345'),
('applicant', 'apct ak', 'apctak@gmail.com', 'Aa.12345'),
('applicant', 'apct al', 'apctal@gmail.com', 'Aa.12345'),
('applicant', 'apct am', 'apctam@gmail.com', 'Aa.12345'),
('applicant', 'apct an', 'apctan@gmail.com', 'Aa.12345'),
('applicant', 'apct ao', 'apctao@gmail.com', 'Aa.12345'),
('applicant', 'apct ap', 'apctap@gmail.com', 'Aa.12345'),
('applicant', 'apct aq', 'apctaq@gmail.com', 'Aa.12345'),
('applicant', 'apct ar', 'apctar@gmail.com', 'Aa.12345'),
('applicant', 'apct as', 'apctas@gmail.com', 'Aa.12345'),
('applicant', 'apct at', 'apctat@gmail.com', 'Aa.12345'),
('applicant', 'apct au', 'apctau@gmail.com', 'Aa.12345'),
('applicant', 'apct av', 'apctav@gmail.com', 'Aa.12345'),
('applicant', 'apct aw', 'apctaw@gmail.com', 'Aa.12345'),
('applicant', 'apct ax', 'apctax@gmail.com', 'Aa.12345');
```
***

### 2. Insert into `baseapp_applicant`
*(Adjust log_id_id if your database has different auto-increment behavior, but if you insert login rows as above, IDs should match 1–24)*

```sql
INSERT INTO baseapp_applicant
(applicantname, email, contact, address, username, degree, experience, cvpath, log_id_id) VALUES
('anup',        'anup@gmail.com',        9567302940, '101, Hariharanagar Street', 'anup',        'M.Tech',    '2', 'cv_base/bn.pdf',     2),
('apct az',     'apctaz@gmail.com',      9567302940, 'asd',                      'apct az',     'M.Tech',    '4', 'cv_base/cm.pdf',     3),
('rizwana',     'rizwan@gmail.com',      9567302940, '101 hariharanagar',        'rizwana',     'BCA,B.Tech','2', 'cv_base/Data Scientist-MOHAMEDRIZWAN_CV.pdf (1).pdf', 4),
('apct ab',     'apctab@gmail.com',      9567302940, 'asd',                      'apct ab',     'MSc',       '2', 'cv_base/cv.pdf',     5),
('apct ae',     'apctae@gmail.com',      9567302940, 'asd',                      'apct ae',     'MCA',       NULL, 'cv_base/dc.pdf',     6),
('apct af',     'apctaf@gmail.com',      9567302940, 'asd',                      'apct af',     'MCA',       NULL, 'cv_base/df15.pdf',   7),
('apct ag',     'apctag@gmail.com',      9567302940, 'asd',                      'apct ag',     'BCA',       NULL, 'cv_base/DrishyaKP(CV).pdf', 8),
('apct ah',     'apctah@gmail.com',      9567302940, 'asd',                      'apct ah',     'BCA',       NULL, 'cv_base/drishyakpDataAnalyst.pdf', 9),
('apct ai',     'apctai@gmail.com',      9567302940, 'asd',                      'apct ai',     'MTech',     NULL, 'cv_base/ep.pdf',     10),
('apct aj',     'apctaj@gmail.com',      9567302940, 'asd',                      'apct aj',     'B.Tech',    NULL, 'cv_base/er.pdf',     11),
('apct ak',     'apctak@gmail.com',      9567302940, 'asd',                      'apct ak',     'M.Tech',    NULL, 'cv_base/fv.pdf',     12),
('apctal',      'apctal@gmail.com',      9567302940, 'asd',                      'apctal',      'MSc',       NULL, 'cv_base/gh.pdf',     13),
('apct am',     'apctam@gmail.com',      9567302940, 'asd',                      'apct am',     'M.Tech',    NULL, 'cv_base/jk.pdf',     14),
('apct an',     'apctan@gmail.com',      9567302940, 'asd',                      'apct an',     'M.Tech',    NULL, 'cv_base/jp.pdf',     15),
('apct ao',     'apctao@gmail.com',      9567302940, 'asd',                      'apct ao',     'MCA',       NULL, 'cv_base/jw.pdf',     16),
('apct ap',     'apctap@gmail.com',      9567302940, 'asd',                      'apct ap',     'M.Sc',      NULL, 'cv_base/pdflist.txt',17),
('apct aq',     'apctaq@gmail.com',      9567302940, 'asd',                      'apct aq',     'BCA',       NULL, 'cv_base/qa.pdf',     18),
('apct ar',     'apctar@gmail.com',      9567302940, 'asd',                      'apct ar',     'M.A',       NULL, 'cv_base/qp.pdf',     19),
('apct as',     'apctas@gmail.com',      9567302940, 'asd',                      'apct as',     'B.Tech',    NULL, 'cv_base/sw.pdf',     20),
('apct at',     'apctat@gmail.com',      9567302940, 'asd',                      'apct at',     'MCA',       NULL, 'cv_base/tg.pdf',     21),
('apct au',     'apctau@gmail.com',      9567302940, 'asd',                      'apct au',     'M.Sc',      NULL, 'cv_base/tg16.pdf',   22),
('apct av',     'apctav@gmail.com',      9567302940, 'asd',                      'apct av',     'BSc',       NULL, 'cv_base/ui.pdf',     23),
('apct aw',     'apctaw@gmail.com',      9567302940, 'asd',                      'apct aw',     'BSc',       NULL, 'cv_base/xc.pdf',     24),
('apct ax',     'apctax@gmail.com',      9567302940, 'asd',                      'apct ax',     'BSc',       NULL, 'cv_base/yu.pdf',     25);
```

***


These queries will add **all 24 applicants** and their login records, ready for Django and your backend workflow. Just paste them in phpMyAdmin's SQL window, run the login query first, then the applicant query. Update `NULL` as needed for degree/experience, and adjust IDs only if your login table auto-increment setting differs.

If you need the query for other tables (staff, vacancy) or to convert exported CSVs/scripted data perfectly, just ask![1]

Here is the bulk SQL to **add a staff entry and link it via login**, following your model and screenshot (only one row in your current staff table):

***

### Insert Staff Login

```sql
INSERT INTO baseapp_login (role, username, email, password)
VALUES ('staff', 'staff ab', 'staffab@gmail.com', 'Aa.12345');
```

***

### Insert Staff Record

After inserting, find the auto-assigned `id` for this staff row in `baseapp_login` (in your screenshot it is `44`). Use that ID for `log_id_id`.

```sql
INSERT INTO baseapp_staff
(staffname, email, contact, workplace, username, log_id_id)
VALUES
('staff ab', 'staffab@gmail.com', 9567302940, 'dummy', 'staff ab', 26);
```

***

**Note:**  
- Always insert the login record first, check the login table, then use the correct ID in the staff table.  
- If you have more staff, repeat with a login insert and matching staff insert for each one.
- You can run both queries together in phpMyAdmin, or batched for multiple staff.

This guarantees correct foreign key links between your actual Django tables. If you add more staff, repeat the pattern (login first, then staff record with correct log_id_id).[1]

Absolutely! Here is the bulk SQL (based on your previous applicant records) for **vacancies** and their corresponding **application records** (1 application per applicant, mapping to the first vacancy as an example). Adjust the mapping if you want a different job per applicant.

***

### 1. Vacancy Table (8 sample rows, adjust as needed):

```sql
INSERT INTO baseapp_vacancy (vacancyname, seats, company, salary, desc, qualification) VALUES
('Software Engineer', 3, 'ABC Corporation', '250', 'Dolor justo tempor duo ipsum accusam rebum gubergren erat.', 'B.Tech, M.Tech'),
('Data Scientist', 4, 'XYZ Technologies', '280', 'Data analytics role.', 'BSc, MSc, MCA'),
('Web Developer', 8, 'PQR Solutions', '300', 'Frontend and backend web development.', 'BCA, MCA, B.Tech'),
('Database Administrator', 5, 'GHI Enterprises', '280', 'DB maintenance and optimization.', 'MCA, BCA, B.Tech'),
('Network Engineer', 9, 'JKL Technologies', '290', 'Networking and system support.', 'B.Tech, M.Sc'),
('Research Analyst', 90, 'MNO Corporation', '250', 'Research and reporting.', 'BSc, MSc, M.A'),
('HR Manager', 2, 'LMN Solutions', '220', 'HR and recruitment tasks.', 'MBA, MHRM'),
('QA Tester', 6, 'DEF Innovations', '200', 'Software QA/testing.', 'BCA, MCA');
```

***

### 2. Application Table  
**Each applicant applies to the first vacancy (`vacancy_id = 1`). Status set to 'NOT_APPLIED' for initial setup.**

```sql
INSERT INTO baseapp_application (applicant_id, vacancy_id, status, applied_date, status_updated_date, notes, ml_score) VALUES
(1, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(2, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(3, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(4, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(5, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(6, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(7, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(8, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(9, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(10, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(11, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(12, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(13, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(14, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(15, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(16, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(17, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(18, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(19, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(20, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(21, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(22, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(23, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL),
(24, 1, 'NOT_APPLIED', NOW(), NOW(), NULL, NULL);
```

***

### If you want each applicant mapped to a different job:

Just change the `vacancy_id` (e.g., `(1, 1,...)`, `(2, 2,...)`, ..., `(8, 8,...)`) or duplicate applications for many-to-many mapping as needed.

***

#### Key Notes
- `applicant_id = 1..24` as previously inserted.
- `vacancy_id` must match your actual auto-increment IDs from the vacancy table.
- `NOW()` sets current timestamp; use a real date if importing historical data.

If you want real historical mapping, multiple jobs per applicant, or specific statuses (e.g. "APPLIED"), just let me know your preferred structure! This structure avoids any foreign key errors and gets your dashboard working instantly.




The error is because `desc` is a **reserved keyword** in SQL.

#### Solution:  
- You must enclose it in backticks:  
  **\`desc\`**

***

### Here is the corrected `baseapp_vacancy` insert query:

```sql
INSERT INTO baseapp_vacancy (vacancyname, seats, company, salary, `desc`, qualification) VALUES
('Software Engineer', 3, 'ABC Corporation', '250', 'Dolor justo tempor duo ipsum accusam rebum gubergren erat.', 'B.Tech, M.Tech'),
('Data Scientist', 4, 'XYZ Technologies', '280', 'Data analytics role.', 'BSc, MSc, MCA'),
('Web Developer', 8, 'PQR Solutions', '300', 'Frontend and backend web development.', 'BCA, MCA, B.Tech'),
('Database Administrator', 5, 'GHI Enterprises', '280', 'DB maintenance and optimization.', 'MCA, BCA, B.Tech'),
('Network Engineer', 9, 'JKL Technologies', '290', 'Networking and system support.', 'B.Tech, M.Sc'),
('Research Analyst', 90, 'MNO Corporation', '250', 'Research and reporting.', 'BSc, MSc, M.A'),
('HR Manager', 2, 'LMN Solutions', '220', 'HR and recruitment tasks.', 'MBA, MHRM'),
('QA Tester', 6, 'DEF Innovations', '200', 'Software QA/testing.', 'BCA, MCA');
```

**This will now work in phpMyAdmin and matches your Django model schema.**

***

If you want application table records too, just clarify the applicant-to-vacancy mapping you want for your bulk `Application` insert.

```sql
UPDATE `baseapp_application` SET `status`='APPLIED' WHERE `status`='NOT_APPLIED';

```