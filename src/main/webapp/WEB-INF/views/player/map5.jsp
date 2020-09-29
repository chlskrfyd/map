<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <meta charset="UTF-8">
    <title>Waypoints in Directions</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDtPfXJlAmrQo3VE2gaHIkejYe0urbhoO0&callback=initMap&libraries=&v=weekly"
      defer
    ></script>
    <style type="text/css">
      #right-panel {
        font-family: "Roboto", "sans-serif";
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select,
      #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }

      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }

      #map {
        height: 100%;
        float: left;
        width: 70%;
        height: 100%;
      }

      #right-panel {
        margin: 20px;
        border-width: 2px;
        width: 20%;
        height: 400px;
        float: left;
        text-align: left;
        padding-top: 0;
      }

      #directions-panel {
        margin-top: 10px;
        background-color: #ffee77;
        padding: 10px;
        overflow: scroll;
        height: 174px;
      }
    </style>
     <script type="text/javascript">
 
     $(function(){
         $("#addBox").click(function(){
            $('#t_space').append("<input type='text' name='waypoints' >");
         });
        })
</script>
    <script>
      "use strict";

      function initMap() {
        const directionsService = new google.maps.DirectionsService();
        const directionsRenderer = new google.maps.DirectionsRenderer();
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 6,
          center: {
            lat: 41.85,
            lng: -87.65
          }
        });
        directionsRenderer.setMap(map);
        document.getElementById("submit").addEventListener("click", () => {
          calculateAndDisplayRoute(directionsService, directionsRenderer);
        });
      }

      function calculateAndDisplayRoute(directionsService, directionsRenderer) {
        const waypts = [];
        const checkboxArray = document.getElementsByName("waypoints");

        for (let i = 0; i < checkboxArray.length; i++) {
         
            waypts.push({
              location: checkboxArray[i].value,
              stopover: true
            });
            console.log(waypts);
        }

        directionsService.route(
          {
            origin: document.getElementById("start").value,
            destination: document.getElementById("end").value,
            waypoints: waypts,
            optimizeWaypoints: true,
            travelMode: google.maps.TravelMode.DRIVING
          },
          (response, status) => {
            if (status === "OK") {
              directionsRenderer.setDirections(response);
              const route = response.routes[0];
              const summaryPanel = document.getElementById("directions-panel");
              summaryPanel.innerHTML = ""; // For each route, display summary information.

              for (let i = 0; i < route.legs.length; i++) {
                const routeSegment = i + 1;
                summaryPanel.innerHTML +=
                  "<b>Route Segment: " + routeSegment + "</b><br>";
                summaryPanel.innerHTML += route.legs[i].start_address + " to ";
                summaryPanel.innerHTML += route.legs[i].end_address + "<br>";
                summaryPanel.innerHTML +=
                  route.legs[i].distance.text + "<br><br>";
              }
            } else {
              window.alert("Directions request failed due to " + status);
            }
          }
        );
      }
    </script>
  </head>
  <body>
    <div id="map"></div>
    <div id="right-panel">
      <div>
        <b>Start:</b>
        <select id="start">
          <option value="Halifax, NS">Halifax, NS</option>
          <option value="Boston, MA">Boston, MA</option>
          <option value="New York, NY">New York, NY</option>
          <option value="Miami, FL">Miami, FL</option>
        </select>
        <br />
        <b>Waypoints:</b> <br />
   
		<form action="action" method="post">
	<div id="t_space">
		<input type="button" id="addBox" value="plus" onclick="add_textbox()">
		
		<br>
	</div>
 </form>
        <br />
        <b>End:</b>
        <select id="end">
          <option value="Vancouver, BC">Vancouver, BC</option>
          <option value="Seattle, WA">Seattle, WA</option>
          <option value="San Francisco, CA">San Francisco, CA</option>
          <option value="Los Angeles, CA">Los Angeles, CA</option>
        </select>
        <br />
        <input type="submit" id="submit" />
      </div>
      <div id="directions-panel"></div>
    </div>
  </body>
</html>