FROM centos:latest
RUN yum install vim python3 net-tools -y
RUN pip3 install Flask Flask-Cors scikit-learn pandas
RUN mkdir /FlightFarePrediction
COPY ./FlightFarePrediction /FlightFarePrediction
EXPOSE 55
WORKDIR /FlightFarePrediction
ENTRYPOINT python3 app.py
