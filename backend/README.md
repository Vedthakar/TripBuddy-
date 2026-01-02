# TripBuddy Django Backend

## Setup

### Windows:

```
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

### Linux/macOS:

```
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

## API

### Dummy Endpoint:

http://127.0.0.1:8000/api/trips/