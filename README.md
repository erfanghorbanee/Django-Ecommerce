# Django-Ecommerce

![ezgif com-gif-maker](https://user-images.githubusercontent.com/49264993/140760716-f85871e9-8563-4ceb-9323-51ee81c46424.gif)

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Imports: isort](https://img.shields.io/badge/%20imports-isort-%231674b1?style=flat&labelColor=ef8336)](https://pycqa.github.io/isort/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

An e-commerce website using  the following tech stacks: Python - Django - PostgreSQL - JavaScript - Bootstrap

## How run the project?

### Clone the repository

```bash
git clone https://github.com/erfanghorbanee/Django-Ecommerce.git
cd django-ecommerce
```

### Create a virtualenv and activate it

 ```bash
python3 -m venv venv
. venv/bin/activate
```

### Or on Windows cmd

 ```bash
> py -3 -m venv venv
> venv\Scripts\activate.bat
```

### Install the requirements

```bash
pip3 install -r requirements.txt
```

#### In settings.py, set up the database

for this project i used postgress, you can see the following settings below :

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'db_name',
        'USER': 'db_user',
        'PASSWORD': 'db_user_password',
        'HOST': 'localhost',
        'PORT': '',
    }
}
```

#### Run makemigrations and migrate

```bash
python3 manage.py makemigrations
python3 manage.py migrate
```

#### Run the tests

```bash
python3 manage.py test
```

#### Run the development server

```bash
python3 manage.py runserver
```

Open <http://127.0.0.1:8000> in your browser.

AKIAIOSFODNN7EXAMPLE

-----BEGIN RSA PRIVATE KEY-----
MIIBOgIBAAJBANM1ko4lv38ggh8qT0ggyy98qPVtjNo/zmVQhyTIrQtrU+qSsZAX
hDy8+JQJlR3jX5P7i1l5Bz04xqyzf5DeBkMCAwEAAQJARvoc0T5IYZd+/rJUoNeB
D+LQyvbFo4k8bEYp8b0yAUM1A6dtVsD3n3qzVkfEItqNGyj6nCTFEcYzAvepUk6j
gQIhAPZV34Msszot8gom7TviB8zLt4Q8Zgvlj2o7J9xDIelZAiEA3TW2/vgtu9A4
79xZsvtW0s1B5RHZcj5xPixGTqDrFcUCIQCiLvcFPjwdGyqHUU2HozgQQ7+9j2AP
q4e+GTvWAGzxZwIgYcGoYDHo4aZM0jG4sCZE8M+XyCtUhX9QwzjPDYEs5KkCIBEQ
jFLD1oEEGNnwMqZ/vhSCt2zX/5U9aCR9Pi8ZcWqX
-----END RSA PRIVATE KEY-----
