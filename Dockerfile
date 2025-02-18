FROM python:3.10-slim-bullseye

RUN apt-get update && \
    apt-get install -y unzip curl nano && \
    apt-get install -y python3-dev libpq-dev gcc  && \
    apt-get install -y postgresql-server-dev-all postgresql-client

# Upgrade pip, setuptools, and wheel to ensure compatibility
#RUN pip install --upgrade pip setuptools wheel
RUN pip install psycopg2 gdown  # 'gdown' abale to download large files (107MB in this case) directly from shared link of google drive

#ARG GITHUB_TOKEN  # make available GITHUB_TOKEN var in Dockerfile
WORKDIR /project

ARG RE_CACHE     # used for re chaching after specefic line!

RUN curl -o repo-main.zip -L https://github.com/ahmadekhalili/Property-Management/archive/refs/heads/main.zip \
    && unzip repo-main.zip -d /tmp \
    && mv /tmp/Property-Management-main Property-Management  # copy and change folder name to "Property-Management"
COPY .env Property-Management/


RUN pip install --no-cache-dir -r Property-Management/property_management/requirements.txt

# download chrome browser
RUN mkdir -p /root/chrome
RUN gdown 1evibX5X8eyZ_VwbsUaPgfMbZu00tXMmF -O /root/chrome/chrome132_linux64.deb  # install in chrome/chrome132_linux64.deb host machine to volume it to guest machine

# setup ChromeDriver
RUN curl -o chromedriver.zip -L https://github.com/ahmadekhalili/chromedriver/archive/refs/heads/main.zip && \
    unzip chromedriver.zip -d chromedriver && \
    mv chromedriver/chromedriver-main/chromedriver-linux64 /usr/local/bin/ && \
    chmod 755 /usr/local/bin/chromedriver-linux64/chromedriver && \
	echo "export PATH=\$PATH:/usr/local/bin/chromedriver-linux64" >> ~/.bashrc
RUN mkdir -p /root/.config/google-chrome/myprofile 
