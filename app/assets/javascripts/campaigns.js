createFundingDoughnutForShowPage();
createFundingDoughnutForIndexPage();

function createFundingDoughnutForShowPage() {
  var campaignsShowChart = $("#campaignShowChart");

  if(campaignsShowChart.length) {
    buildFundingDoughnut("campaignShowChart",
        campaignsShowChart.data("funding-left"),
        campaignsShowChart.data("funding-current"));
  }
}

function createFundingDoughnutForIndexPage() {
  var gridItems = $(".campaign-grid-item");
  console.log(gridItems);

  gridItems.each(function(gridItem) {
    var canvas = $(this).find("canvas");
    buildFundingDoughnut("campaign-" + canvas.data("id"),
        canvas.data("funding-left"),
        canvas.data("funding-current"));
  });
}

function buildFundingDoughnut(elementId, fundingLeft, currentFunding) {
  console.log(elementId);
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


