createFundingDoughnutForShowPage();

function createFundingDoughnutForShowPage() {
  var campaignsShowChart = $("#campaignShowChart");

  buildFundingDoughnut("campaignShowChart",
      campaignsShowChart.data("funding-left"),
      campaignsShowChart.data("funding-current"));
}

function buildFundingDoughnut(elementId, fundingLeft, currentFunding) {
  var options = {
    animation: false,
    showScale: false,
    showTooltips: false
  },
  data = [
      {
          value: currentFunding,
          color: "green",
      },
      {
          value: fundingLeft,
          color:"silver",
      }
  ];

  var ctx = document.getElementById(elementId).getContext("2d");
  return new Chart(ctx).Doughnut(data, options);
}


