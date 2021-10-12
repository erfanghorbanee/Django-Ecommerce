# django-ecommerce
An e-commerce website using the Django framework.


## How run the project?


##### Clone the repository :
```bash
$ git clone https://github.com/erfanghorbanee/django-ecommerce.git
$ cd django-ecommerce
```
##### Create a virtualenv and activate it:
 ```bash
$ python3 -m venv venv
$ . venv/bin/activate
```
##### Or on Windows cmd : 
 ```bash
> py -3 -m venv venv
> venv\Scripts\activate.bat
```
##### Install the requirements :
```bash
$ pip3 install -r requirements.txt
```

#####  Run makemigrations and migrate :
```bash
python3 manage.py makemigrations
python3 manage.py migrate
```

#####  Run the development server :
```bash
python3 manage.py runserver
```
Open http://127.0.0.1:8000 in your browser. 

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
