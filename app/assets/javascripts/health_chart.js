// VITALS
var vitals = {
    labels: [],
    datasets: [
        {
          label: "Body Temperature",
          fillColor: "rgba(118,118,118,0)",
          strokeColor: "rgba(118,118,118,1)",
          pointColor: "rgba(118,118,118,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(118,118,118,1)",
          data: []
        },
        {
          label: "Blood Pressure",
          fillColor: "rgba(5,5,5,0)",
          strokeColor: "rgba(5,5,5,1)",
          pointColor: "rgba(5,5,5,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(5,5,5,1)",
          data: []
        },
        {
          label: "Heart Rate",
          fillColor: "rgba(163,163,163,0)",
          strokeColor: "rgba(163,163,163,1)",
          pointColor: "rgba(163,163,163,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(163,163,163,1)",
          data: []
        },
        {
          label: "Respiratory Rate",

          fillColor: "rgba(67,67,67,0)",
          strokeColor: "rgba(67,67,67,1)",
          pointColor: "rgba(67,67,67,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(67,67,67,1)",
          data: []
        }
    ]
};

var mental_status = {
  labels: [],
    datasets: [
        {
          label: "Mental Status",
          fillColor: "rgba(118,118,118,0)",
          strokeColor: "rgba(118,118,118,1)",
          pointColor: "rgba(118,118,118,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(118,118,118,1)",
          data: []
        }
      ]
};

var health_status = {
  labels: [],
    datasets: [
        {
          label: "Health Status",
          fillColor: "rgba(118,118,118,0)",
          strokeColor: "rgba(118,118,118,1)",
          pointColor: "rgba(118,118,118,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(118,118,118,1)",
          data: []
        }
      ]
};

// global settings
var options = {
  tooltipFillColor: "rgba(0,0,0,0.3)",
  multiTooltipTemplate: ,
  responsive: false
};


function parsePatientData() {
  for(var i = myData.length -1; i >= 0 ; i--){
      myData[i].body_temp = parseInt(myData[i].body_temp, 10);
    myData[i].blood_pressure = parseInt(myData[i].blood_pressure, 10);
    myData[i].heart_rate = parseInt(myData[i].heart_rate, 10);
    myData[i].respiratory_rate = parseInt(myData[i].respiratory_rate, 10);
    myData[i].mental_health = parseInt(myData[i].mental_health, 10);
    myData[i].physical_health = parseInt(myData[i].physical_health, 10);

    if ( isNaN( myData[i].body_temp)
      || isNaN(myData[i].blood_pressure)
      || isNaN(myData[i].heart_rate)
      || isNaN(myData[i].respiratory_rate)
      || isNaN(myData[i].mental_health)
      || isNaN(myData[i].physical_health) ) {
      myData.splice(i, 1);
    }
  }

  // parse date
  $.each(myData, function( index, item ) {
    var date_label = $.format.date(item.date_created, "MMM d, yyyy");
    item.date_created = $.format.date(item.date_created, "MMM d, yyyy h:mm a");

    // vitals labels
    vitals.labels.push(date_label);
    vitals.datasets[0].data.push(item.body_temp);
    vitals.datasets[1].data.push(item.blood_pressure);
    vitals.datasets[2].data.push(item.heart_rate);
    vitals.datasets[3].data.push(item.respiratory_rate);

    // mental health labels
    mental_status.labels.push(date_label);
    mental_status.datasets[0].data.push(item.mental_health);

    // health status labels
    health_status.labels.push(date_label);
    health_status.datasets[0].data.push(item.physical_health);
  });
}

function updateSummary(index) {
  var item = myData[index];
  $('#details .date_created').text(item.date_created);
  $('#details .additional_info').text(item.additional_info);
  $('#details .physical_health').text(item.physical_health);
  $('#details .mental_health').text(item.mental_health);
  $('#details .blood_pressure').text(item.blood_pressure);
  $('#details .heart_rate').text(item.heart_rate);
  $('#details .respiratory_rate').text(item.respiratory_rate);
  $('#details .body_temp').text(item.body_temp);
}

function initializePage() {
  parsePatientData();
  updateSummary(0);

  // Get context with jQuery - using jQuery's .get() method.
  var ctx = $("#chart").get(0).getContext("2d");

  // This will get the first returned node in the jQuery collection.
  $('#chart').on('click', chartClickHandler);
  var myChart = new Chart(ctx).Line(vitals, options);

  $('.chart-buttons .btn').on('click', function() {
    var id = $(this).data('id');
    if (id == 'vital') {
      $('#chart-header').text('Your vitals over time');
      $('#chart').remove();
      $('#chart-header').after('<canvas id="chart" width="640" height="400"></canvas>');
      ctx = $("#chart").get(0).getContext("2d");
      $('#chart').on('click', chartClickHandler);
      myChart = new Chart(ctx).Line(vitals, options);
    } else if (id == 'health_status') {
      $('#chart-header').text('Your physical health over time');
      $('#chart').remove();
      $('#chart-header').after('<canvas id="chart" width="640" height="400"></canvas>');
      ctx = $("#chart").get(0).getContext("2d");
      $('#chart').on('click', chartClickHandler);
      myChart = new Chart(ctx).Line(health_status, options);
    } else {
      $('#chart-header').text('Your physical health over time');
      $('#chart').remove();
      $('#chart-header').after('<canvas id="chart" width="640" height="400"></canvas>');
      ctx = $("#chart").get(0).getContext("2d");
      $('#chart').on('click', chartClickHandler);
      myChart = new Chart(ctx).Line(mental_status, options);
    }
  });

  function chartClickHandler(e) {
     var activePoints = myChart.getPointsAtEvent(e);
     if ( activePoints[0] ) {
        var index = myChart.datasets[0].points.indexOf(activePoints[0]);
        updateSummary(index);
     }
  }
}

/*$(document).ready(function() {
  initializePage();
});*/