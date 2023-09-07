// 전역 변수로 차트 객체 선언
var myChart;

// 차트 파괴 함수 정의
function destroyChart() {
    if (myChart) {
        myChart.destroy();
    }
}

function formatDate(dateString, reportType){
	var date = new Date(dateString);
	
	if(reportType === "yearly"){
		return date.getFullYear() + "년";
	} else if(reportType === "monthly"){
		return date.getMonth() +1 + "월";
	}
	return dateString;
}

$(document).ready(function() {
    $("#queryButton").click(function() {
        var reportType = $("input[name='report_type']:checked").val();
        var content_id = $("#contentSelect").val();

        if (reportType === "yearly") {
        	
            $.ajax({
                url: "/management/yearSaleList",
                method: "GET",
                data: {
                    content_id: content_id
                },
                success: function(response) {
                    var salesData = response;
                    var table = $("#resultTable");
                    table.find("tr:gt(0)").remove();
                    
                    console.log(salesData);
                    
                    if (salesData.length === 0) {
                        var newRow = "<tr><td colspan='4'>데이터 없음</td></tr>";
                        table.append(newRow);
                    } else {
                        $.each(salesData, function(index, sale) {
                            var newRow = "<tr>" +
                                "<td>" + formatDate(sale.subscription_date,reportType) + "</td>" +
                                "<td>" + sale.sales +"원"+ "</td>" +
                                "<td>" + sale.transaction_count +"건"+ "</td>" +
                                "</tr>";
                            table.append(newRow);
                        });
                    }

                    // 그래프 파괴 함수 호출
                    destroyChart();

                    // 그래프 생성 함수 호출
                    createChart(salesData);
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
            
        }else if (reportType === "monthly") {
            var selectedYear = $("#yearSelect").val(); // 선택된 년도
            $.ajax({
                url: "/management/monthSaleList",
                method: "GET",
                data: {
                	content_id: content_id,
                    year: selectedYear
                },
                success: function(response) {
                    var salesData = response;
                    var table = $("#resultTable");
                    table.find("tr:gt(0)").remove();
                    
                    console.log(salesData);
                    
                    if (salesData.length === 0) {
                        var newRow = "<tr><td colspan='4'>데이터 없음</td></tr>";
                        table.append(newRow);
                    } else {
                        $.each(salesData, function(index, sale) {
                            var newRow = "<tr>" +
                                "<td>" + formatDate(sale.subscription_date,reportType) + "</td>" +
                                "<td>" + sale.sales +"원"+ "</td>" +
                                "<td>" + sale.transaction_count +"건"+ "</td>" +
                                "</tr>";
                            table.append(newRow);
                        });
                    }
                 // 그래프 파괴 함수 호출
                    destroyChart();

                    // 그래프 생성 함수 호출
                    createChart(salesData);
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            }); 
        }
    });
});

//차트 생성 함수 정의
function createChart(salesData, reportType) {
    // Extracting data for the chart
    var years = salesData.map(function(sale) {
        return sale.subscription_date;
    });

    var revenues = salesData.map(function(sale) {
        return sale.sales;
    });

    var counts = salesData.map(function(sale) {
        return Math.round(sale.transaction_count); // Rounding to remove decimals
    });

    var ctx = document.getElementById('salesChart').getContext('2d');
    if (myChart) {
        myChart.destroy();
    }

    // 차트 생성
    myChart = new Chart(ctx, {
        type: 'line',
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
            	
            	x: {
                    title: {
                        display: true,
                        text: '기간'
                    },
                    
                },
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
                    },
                    offset: true // 이 옵션을 사용하여 Y 축 눈금을 위로 이동
                }
            },
            plugins: {
                datalabels: {
                    rotation: 0 // Setting label rotation to 0 degrees
                }
            }
        }
    });
}

