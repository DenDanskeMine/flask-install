#!/bin/bash
# Project setup script by DenDanskeMine aka Christian Rose
# 
# This work is licensed under the terms of the MIT license.  
# For a copy, see <https://opensource.org/licenses/MIT>.
# 
# -----------------------------------------------------------
# Ask for the project name
echo "Enter the project name:"
read project_name

if ! command -v python3 &> /dev/null
then
    echo "Python 3 could not be found. Installing..."
    sudo apt-get update
    sudo apt-get install python3.12 -y
fi

# Check if pip is installed, if not, install it
if ! command -v pip3 &> /dev/null
then
    echo "pip for Python 3 could not be found. Installing..."
    sudo apt-get install python3-pip -y
fi

# Check if venv is installed, if not, install it
if ! python3 -c "import venv" &> /dev/null
then
    echo "venv could not be found. Installing..."
    sudo apt-get install python3.12-venv -y
fi
# Create a new directory with the project name
mkdir $project_name

# Navigate to the project directory
cd $project_name

# Create a new virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install Flask and Flask-Bootstrap
pip install Flask flask-bootstrap

# Create a simple Flask application file
echo "from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def home():
        return render_template('index.html')

if __name__ == '__main__':
        app.run(debug=True)" > app.py

# Create a templates directory
mkdir templates

# Create a simple index.html file with Bootstrap 5
echo "<!doctype html>
<html lang='en'>
    <head>
        <!-- Required meta tags -->
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>

        <!-- Bootstrap CSS -->
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-beta1/css/bootstrap.min.css' rel='stylesheet'>

        <title>Hello, world!</title>
    </head>
    <body>
        <h1>Hello, world!</h1>
    </body>
</html>" > templates/index.html

echo "Project setup completed."
