# Django-Ecommerce

![ezgif com-gif-maker](https://user-images.githubusercontent.com/49264993/140760716-f85871e9-8563-4ceb-9323-51ee81c46424.gif)

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Imports: isort](https://img.shields.io/badge/%20imports-isort-%231674b1?style=flat&labelColor=ef8336)](https://pycqa.github.io/isort/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)


## How run the project?


#### Clone the repository :
```bash
$ git clone https://github.com/erfanghorbanee/Django-Ecommerce.git
$ cd django-ecommerce
```

#### Create a virtualenv and activate it:
 ```bash
$ python3 -m venv venv
$ . venv/bin/activate
```

#### Or on Windows cmd : 
 ```bash
> py -3 -m venv venv
> venv\Scripts\activate.bat
```

#### Install the requirements :
```bash
$ pip3 install -r requirements.txt
```

#### In settings.py, set up the database :
for this project i used postgress, you can see the following settings below :
```
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

####  Run makemigrations and migrate :
```bash
python3 manage.py makemigrations
python3 manage.py migrate
```

#### Run the tests :
```bash
python3 manage.py test
```

#### Run the development server :
```bash
python3 manage.py runserver
```

Open http://127.0.0.1:8000 in your browser. 
