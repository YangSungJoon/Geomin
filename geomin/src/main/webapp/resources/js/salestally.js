$(document).ready(function() {
    $("#queryButton").click(function() {
        var reportType = $("input[name='report_type']:checked").val();
        var contentName = $("#contentSelect").val();

        if (reportType === "yearly") {
            $.ajax({
                url: "/management/yearSaleList",
                method: "GET",
                data: {
                	contentName: contentName
                },
                success: function(response) {
                    var salesData = response;
                    var table = $("#resultTable");
                    table.find("tr:gt(0)").remove();

                    if (salesData.length === 0) {
                        var newRow = "<tr><td colspan='4'>데이터 없음</td></tr>";
                        table.append(newRow);
                    } else {
                        $.each(salesData, function(index, sale) {
                            var newRow = "<tr>" +
                                "<td>" + sale.subscription_date + "</td>" +
                                "<td>" + sale.content_id + "</td>" +
                                "<td>" + sale.subscription_price + "</td>" +
                                "</tr>";
                            table.append(newRow);
                        });
                    }
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }
    });
});


$(document).ready(function() {
    $("#queryButton").click(function() {
      var reportType = $("input[name='report_type']:checked").val();
      var contentName = $("#contentSelect").val();

      if (reportType === "yearly") {
        $.ajax({
          url: "/management/yearSaleList",
          method: "GET",
          data: {
            contentName: contentName
          },
          success: function(response) {
            var salesData = response;

            // Extracting data for the chart
            var years = salesData.map(function(sale) {
              return sale.subscription_date;
            });

            var revenues = salesData.map(function(sale) {
              return sale.subscription_price;
            });

            var counts = salesData.map(function(sale) {
              return Math.round(sale.content_id); // Rounding to remove decimals
            });

            var ctx = document.getElementById('salesChart').getContext('2d');
            var chart = new Chart(ctx, {
              type: 'bar',
              data: {
                labels: years,
                datasets: [
                  {
                    label: '매출액',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                    yAxisID: 'revenues',
                    data: revenues
                  },
                  {
                    label: '건수',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
                    yAxisID: 'counts',
                    data: counts
                  }
                ]
              },
              options: {
                scales: {
                  revenues: {
                    type: 'linear',
                    position: 'left',
                    beginAtZero: true,
                    title: {
                      display: true,
                      text: '매출액'
                    }
                  },
                  counts: {
                    type: 'linear',
                    position: 'right',
                    beginAtZero: true,
                    stepSize: 1,
                    title: {
                      display: true,
                      text: '건수'
                    }
                  }
                },
                plugins: {
                  datalabels: {
                    rotation: 0 // Setting label rotation to 0 degrees
                  }
                }
              }
            });
          },
          error: function(xhr, status, error) {
            console.error(error);
          }
        });
      }
    });
  });