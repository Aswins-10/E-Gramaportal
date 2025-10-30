# E-Gramaportal

A digital portal for a Grama Panchayat — managing applications, complaints, notices, schemes, staff assignments, and user profiles.

## Table of Contents
- [Background & Motivation](#background--motivation)  
- [Features](#features)  
- [Tech Stack](#tech-stack)  
- [Setup & Installation](#setup--installation)  
- [Usage](#usage)    
- [Contact](#contact)  

## Background & Motivation  
In order to modernise rural governance and to enable transparent, efficient service delivery at the local level, this portal helps a Grama Panchayat move its record-keeping and citizen interactions online.

## Features  
- User registration and profile management (citizens, staff, admin)  
- Application submission and status tracking  
- Complaint registration with staff assignment and status updates  
- Notice board / scheme listing module  
- Staff assignment and management  
- Admin dashboard for overview of operations  
- Static assets & UI for frontend (html/css/js + templates)  

## Tech Stack  
- Backend: Django (Python)  
- Frontend: HTML, CSS, JavaScript (within Django templates)  
- Database: (e.g., SQLite / PostgreSQL)  
- Version control: Git / GitHub  
- Deployed on: (to be filled – e.g., Heroku / AWS / DigitalOcean)  

## Setup & Installation  
1. Clone the repository  
   ```bash
   git clone https://github.com/Aswins-10/E-Gramaportal.git  
   cd E-Gramaportal  
   ```
2. Create a virtual environment and activate it
   ```bash
   python -m venv venv  
   source venv/bin/activate     # On Windows: venv\Scripts\activate
   ```
3. Install required dependencies
   ```bash
   pip install -r requirements.txt
   ```
4. Apply migrations
   ```bash
   python manage.py migrate
   ```
5. Create a superuser (admin)
   ```bash
   python manage.py createsuperuser
   ```
6. Run the development server
   ```bash
   python manage.py runserver
   ```  
Access the app in your browser at http://127.0.0.1:8000/

### Usage
Log in as admin to manage notices, staff, applications, complaints.

Citizens can register, submit applications or complaints, view statuses.

Staff can view assigned items, update statuses.

Admin sees summary dashboards and control panels.

### Contact
*Aswin* – aswinsajeesh123@gmail.com
GitHub: https://github.com/Aswins-10
