<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
   <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <meta charset="UTF-8">
    <title>Place Autocomplete and Directions</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?libraries=localContext,places&v=beta&weekly&key=AIzaSyDtPfXJlAmrQo3VE2gaHIkejYe0urbhoO0&callback=initMap"
      defer
    ></script>
    <style type="text/css">
      
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 700px;
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }

       .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }
        
         #origin-input,
      #destination-input,
      #waypoints-input,
      #waypoints1-input,
     #waypoints2-input,
     #waypoints3-input,
     #waypoints4-input
      {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 200px;
      }
     

      #origin-input:focus,
      #destination-input:focus,
      #waypoints-input:focus,
      #waypoints1-input:focus,
      #waypoints2-input:focus,
      #waypoints3-input:focus,
      #waypoints4-input:focus
    
       {
        border-color: #4d90fe;
      }

      #mode-selector {
        color: #fff;
        background-color: #4d90fe;
        margin-left: 0px;
        padding: 5px 11px 0px 11px;
        text-align: center;
        align-content: left;
      }

      #mode-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
     
        
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

      #right-panel {
        height: 100%;
        float: right;
        width: 400px;
        overflow: auto;
      }

      #map {
        margin-right: 400px;
      }
	
     

      @media print {
        #map {
          height: 500px;
          margin: 0;
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
       
      }
      
    </style>
     <script type="text/javascript">
 	var n=0;
     $(function(){
         $("#addBox").click(function(){
             ++n
            $('#t_space').append("<input type='text' name='waypoints-input' id='waypoints-input"+ n+"'  class='controls pac-target-input' placeholder='경유지' >");
         });
        })
</script>
    <script>
      "use strict";

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script
      // src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
     let map;
      function initMap() {
    	  const localContextMapView = new google.maps.localContext.LocalContextMapView({
    	        element: document.getElementById('map'),
    	        placeTypePreferences: ['restaurant', 'tourist_attraction','cafe','department_store','hospital'],
    	        maxPlaceCount: 20,
    	      });

    	      map = localContextMapView.map;

    	      map.setOptions({
    	    	  mapTypeControl: true,
    	          center: {
    	            lat: 35.6894875,
    	            lng: 139.6917064
    	          },
    	          zoom: 13
    	        });
        new AutocompleteDirectionsHandler(map);
  
      }

      class AutocompleteDirectionsHandler {
        constructor(map) {
          this.map = map;
          this.originPlaceId = "";
          this.destinationPlaceId = "";
          this.waypointsPlaceId = "";
          this.waypoints1PlaceId = "";
          this.waypoints2PlaceId = "";
          this.waypoints3PlaceId = "";
          this.waypoints4PlaceId = "";
        
         
          
          this.travelMode = google.maps.TravelMode.WALKING;
          this.directionsService = new google.maps.DirectionsService();
          this.directionsRenderer = new google.maps.DirectionsRenderer();

           this.directionsRenderer.setMap(map);
          this.directionsRenderer.setPanel(document.getElementById("right-panel"));
          const control = document.getElementById("mode-selector");
	
      
    
          const originInput = document.getElementById("origin-input");
          const  way1= [];
          
         
         const waypointsInput = document.getElementById("waypoints-input");
         const waypointsInput1 = document.getElementById("waypoints-input1");
         const waypointsInput2 = document.getElementById("waypoints-input2");
         const waypointsInput3 = document.getElementById("waypoints-input3");
         const waypointsInput4 = document.getElementById("waypoints-input4");
        
       
			
         
      
         const destinationInput = document.getElementById("destination-input");
          const modeSelector = document.getElementById("mode-selector");
        
          const originAutocomplete = new google.maps.places.Autocomplete(
            originInput
          ); // Specify just the place data fields that you need.

          originAutocomplete.setFields(["place_id"]);
			
        const waypointsAutocomplete = new google.maps.places.Autocomplete(
                  waypointsInput
                ); // Specify just the place data fields that you need.

                waypointsAutocomplete.setFields(["place_id"]);
        		
                const waypoints1Autocomplete = new google.maps.places.Autocomplete(
                        waypointsInput1
                      ); // Specify just the place data fields that you need.

                      waypoints1Autocomplete.setFields(["place_id"]);

                        const waypoints2Autocomplete = new google.maps.places.Autocomplete(
                              waypointsInput2
                            ); // Specify just the place data fields that you need.

                            waypoints2Autocomplete.setFields(["place_id"]);

                             const waypoints3Autocomplete = new google.maps.places.Autocomplete(
                                    waypointsInput3
                                  ); // Specify just the place data fields that you need.

                                  waypoints3Autocomplete.setFields(["place_id"]);
                                  const waypoints4Autocomplete = new google.maps.places.Autocomplete(
                                          waypointsInput4
                                        ); // Specify just the place data fields that you need.

                                        waypoints4Autocomplete.setFields(["place_id"]);

            
       
          const destinationAutocomplete = new google.maps.places.Autocomplete(
            destinationInput
          ); // Specify just the place data fields that you need.

          destinationAutocomplete.setFields(["place_id"]);
          this.setupClickListener(
            "changemode-walking",
            google.maps.TravelMode.WALKING
          );
          this.setupClickListener(
            "changemode-transit",
            google.maps.TravelMode.TRANSIT
          );
          this.setupClickListener(
            "changemode-driving",
            google.maps.TravelMode.DRIVING
          );

         
          
          this.setupPlaceChangedListener(originAutocomplete, "ORIG");
          this.setupPlaceChangedListener(waypointsAutocomplete, "WAY");
          this.setupPlaceChangedListener(waypoints1Autocomplete, "WAY1");
          this.setupPlaceChangedListener(waypoints2Autocomplete, "WAY2");
          this.setupPlaceChangedListener(waypoints3Autocomplete, "WAY3");
          this.setupPlaceChangedListener(waypoints4Autocomplete, "WAY4");
         
        this.setupPlaceChangedListener(destinationAutocomplete, "DEST");
         
        } // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.

        setupClickListener(id, mode) {
          const radioButton = document.getElementById(id);
          radioButton.addEventListener("click", () => {
            this.travelMode = mode;
            this.route();
          });
        }

        setupPlaceChangedListener(autocomplete, mode) {
          autocomplete.bindTo("bounds", this.map);
          autocomplete.addListener("place_changed", () => {
            const place = autocomplete.getPlace();

            if (!place.place_id) {
              window.alert("값을 다 입력해주세요.");
              return;
            }

            if (mode === "ORIG") {
              this.originPlaceId = place.place_id;
              this.waypointsPlaceId = place.place_id;
              this.waypoints1PlaceId = place.place_id;
              this.waypoints2PlaceId = place.place_id;
              this.waypoints3PlaceId = place.place_id;
              this.waypoints4PlaceId = place.place_id;
             
            } 
             else {
                this.destinationPlaceId = place.place_id;
            
               
               
               
               
            }

            this.route();
          });
        }
			
        route() {
          if (!this.originPlaceId || !this.destinationPlaceId  || !this.waypointsPlaceId) {
            return;
          }
          const  way= [];
         
          const checkboxArray = document.getElementsByName("waypoints-input");

          for (let i = 0; i < checkboxArray.length; i++) {
           //if문 처리
              way.push({
                location: checkboxArray[i].value,
                stopover: true
              });
             
          }
          const me = this;
          this.directionsService.route(
            {
              origin: {
                placeId: this.originPlaceId
              },
               waypoints: 
                   way,
              destination: {
                placeId:  this.destinationPlaceId
              },
              optimizeWaypoints: true,
              travelMode: this.travelMode
            },
            (response, status) => {
              if (status === "OK") {
                me.directionsRenderer.setDirections(response);
              } else {
                window.alert("모든 값을 입력해주세요." + status);
              }
            }
          );
        }
      }
    </script>
  </head>
  <body>
      
      <div id="right-panel">
      <div> <input
        id="origin-input"
        class="controls"
        type="text"
        placeholder="출발지"
      />
         <br>
      <input
       
        id="waypoints-input"
      	 name="waypoints-input"
        class="controls"
        type="text"
        placeholder="경유지"
      />
      <br>
      <input
       
        id="waypoints-input1"
      	 name="waypoints-input"
        class="controls"
        type="text"
        placeholder="경유지"
      />
        <br>
        <input
       
        id="waypoints-input2"
      	 name="waypoints-input"
        class="controls"
        type="text"
        placeholder="경유지"
      />
        <br>
        <input
       
        id="waypoints-input3"
      	 name="waypoints-input"
        class="controls"
        type="text"
        placeholder="경유지"
      />
        <br>
        <input
       
        id="waypoints-input4"
      	 name="waypoints-input"
        class="controls"
        type="text"
        placeholder="경유지"
      />
     
      
    
      <form action="action" method="post">
	<div id="t_space">
		<input type="button" id="addBox" value="경유지 추가" >
		
		<br>
	</div>
  
	 <input
        id="destination-input"
        class="controls"
        type="text"
        placeholder="목적지"
      />
      	<div id="mode-selector" class="controls">
        <input
          type="radio"
          name="type"
          id="changemode-walking"
          checked="checked"
        />
        <label for="changemode-walking">Walking</label>

        <input type="radio" name="type" id="changemode-transit" />
        <label for="changemode-transit">Transit</label>

        <input type="radio" name="type" id="changemode-driving" />
        <label for="changemode-driving">Driving</label>
    
    </div>
    </div>  
    
      
      </div>
	<div id="map" >
	
	  </div>
	
  </body>
</html>