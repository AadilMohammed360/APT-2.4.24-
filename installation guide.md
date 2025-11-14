## This Project requires the following
> ### Python Compilor
> Python/2.10
> ### Web server
> Apache/2.4.58 (Win64) OpenSSL/3.1.3 PHP/8.0.30
> Database client version: libmysql - mysqlnd 8.0.30
> ### phpMyAdmin
> Version information: 5.2.1, latest stable version: 5.2.3


### Commands
Microsoft Windows [Version 10.0.22621.5039]
(c) Microsoft Corporation. All rights reserved.

C:\Users\24aadil>where python
C:\Program Files\python.exe
C:\Users\24aadil\AppData\Local\Programs\Python\Python310\python.exe
C:\Users\24aadil\AppData\Local\Microsoft\WindowsApps\python.exe

C:\Users\24aadil>set py="C:\Users\24aadil\AppData\Local\Programs\Python\Python310\python.exe"

C:\Users\24aadil>cd /d "Z:\Mini Project\APT-2.4.24-\projectAPT"

Z:\Mini Project\APT-2.4.24-\projectAPT>%py% -m pip install virtualenvwrapper

Z:\Mini Project\APT-2.4.24-\projectAPT>virtualenv env

Z:\Mini Project\APT-2.4.24-\projectAPT>env\scripts\activate

(env) Z:\Mini Project\APT-2.4.24-\projectAPT>%py% -m pip install -r requirements.txt

(env) Z:\Mini Project\APT-2.4.24-\projectAPT>%py% manage.py runserver
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).
Exception in thread django-main-thread:
Traceback (most recent call last):
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\backends\base\base.py", line 275, in ensure_connection
    self.connect()
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\utils\asyncio.py", line 26, in inner
    return func(*args, **kwargs)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\backends\base\base.py", line 256, in connect
    self.connection = self.get_new_connection(conn_params)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\utils\asyncio.py", line 26, in inner
    return func(*args, **kwargs)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\backends\mysql\base.py", line 256, in get_new_connection
    connection = Database.connect(**conn_params)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\MySQLdb\__init__.py", line 121, in Connect
    return Connection(*args, **kwargs)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\MySQLdb\connections.py", line 211, in __init__
    self.set_character_set(charset, collation)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\MySQLdb\connections.py", line 305, in set_character_set
    super().set_character_set(charset)
MySQLdb.OperationalError: (1115, "Unknown character set: 'utf8mb3'")

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\threading.py", line 1009, in _bootstrap_inner
    self.run()
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\threading.py", line 946, in run
    self._target(*self._args, **self._kwargs)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\utils\autoreload.py", line 64, in wrapper
    fn(*args, **kwargs)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\core\management\commands\runserver.py", line 136, in inner_run
    self.check_migrations()
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\core\management\base.py", line 581, in check_migrations
    executor = MigrationExecutor(connections[DEFAULT_DB_ALIAS])
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\migrations\executor.py", line 18, in __init__
    self.loader = MigrationLoader(self.connection)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\migrations\loader.py", line 58, in __init__
    self.build_graph()
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\migrations\loader.py", line 235, in build_graph
    self.applied_migrations = recorder.applied_migrations()
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\migrations\recorder.py", line 89, in applied_migrations
    if self.has_table():
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\migrations\recorder.py", line 63, in has_table
    with self.connection.cursor() as cursor:
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\utils\asyncio.py", line 26, in inner
    return func(*args, **kwargs)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\backends\base\base.py", line 316, in cursor
    return self._cursor()
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\backends\base\base.py", line 292, in _cursor
    self.ensure_connection()
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\utils\asyncio.py", line 26, in inner
    return func(*args, **kwargs)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\backends\base\base.py", line 274, in ensure_connection
    with self.wrap_database_errors:
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\utils.py", line 91, in __exit__
    raise dj_exc_value.with_traceback(traceback) from exc_value
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\backends\base\base.py", line 275, in ensure_connection
    self.connect()
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\utils\asyncio.py", line 26, in inner
    return func(*args, **kwargs)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\backends\base\base.py", line 256, in connect
    self.connection = self.get_new_connection(conn_params)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\utils\asyncio.py", line 26, in inner
    return func(*args, **kwargs)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\django\db\backends\mysql\base.py", line 256, in get_new_connection
    connection = Database.connect(**conn_params)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\MySQLdb\__init__.py", line 121, in Connect
    return Connection(*args, **kwargs)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\MySQLdb\connections.py", line 211, in __init__
    self.set_character_set(charset, collation)
  File "C:\Users\24aadil\AppData\Local\Programs\Python\Python310\lib\site-packages\MySQLdb\connections.py", line 305, in set_character_set
    super().set_character_set(charset)
django.db.utils.OperationalError: (1115, "Unknown character set: 'utf8mb3'")


---












### ✅ Explanation
You should either:

**Option 1: Use `-m pip` with your variable**
```bat
set py=C:\Users\24aadil\AppData\Local\Programs\Python\Python310\python.exe
cd /d "Z:\Mini Project\APT-2.4.24-\projectAPT"
%py% -m pip install -r requirements.txt
```

**Option 2: Skip the variable and call directly**
```bat
"C:\Users\24aadil\AppData\Local\Programs\Python\Python310\python.exe" -m pip install -r requirements.txt
```

---

### 🔍 What’s happening
1. **`where python` output**  
   - Shows multiple Python executables on your system:
     - `C:\Program Files\python.exe`  
     - `C:\Users\24aadil\AppData\Local\Programs\Python\Python310\python.exe` ← this is the one you want  
     - `C:\Users\24aadil\AppData\Local\Microsoft\WindowsApps\python.exe` (this is just a launcher stub)

2. **`set py="C:\Users\24aadil\AppData\Local\Programs\Python\Python310\python.exe"`**  
   - This sets an environment variable `py` to the string **including quotes**.  
   - When you later run `%py% pip install ...`, Windows interprets it as `"C:\Users\...\python.exe" pip install ...` which may fail because the quotes are part of the variable.

3. **`cd /d "Z:\Mini Project\APT-2.4.24-\projectAPT"`**  
   - This is fine. It changes directory to your project folder.

4. **`%py% pip install -r requirements.txt`**  
   - This is intended to run Python with `pip install`.  
   - But since `pip` is not a Python argument, this will fail unless you use `-m pip`.   

---

👉 So your sequence is almost correct, but you need those two adjustments. Do you want me to explain *why* `-m pip` is recommended over calling `pip` directly?