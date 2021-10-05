sudo /usr/local/bin/kubectl create deployment flightfareapp --image=gaurav2203/flight_price_prediction
sudo /usr/local/bin/kubectl expose deployment flightfareapp --port=5000 --type=LoadBalancer
