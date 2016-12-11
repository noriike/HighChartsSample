<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication6.Page.WebForm1" %>

<%@ Register Assembly="WebApplication6" Namespace="WebApplication6.Page" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" type="text/javascript"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <cc1:HighCharts ID="HighCharts1" runat="server" />
            <canvas id="canvas1" width="2000" height="1000"></canvas>
        </div>
    </form>

    <script type="text/javascript">
        function initializeMap() {
            var canvas = document.getElementById("canvas1");
            var ctx = canvas.getContext("2d");

            ctx.canvas.width = window.innerWidth;
            ctx.canvas.height = window.innerHeight;

            ctx.font = "14px 'メイリオ'";
            
            var plotLeft = Highcharts.charts[0].plotLeft;
            var plotTop = Highcharts.charts[0].plotTop;
            $.each(Highcharts.charts[0].series, function (i, s) {
                $.each(s.points, function (j, p) {
                    console.log('Series: ' + i + ', Point: ' + j + ', Left: ' + (p.plotX + plotLeft) + ', Top: ' + (p.plotY + plotTop));
                    
                    ctx.textAlign = "center";
                    ctx.fillText(p.y, p.plotX+plotLeft, 30);
                });
            });
        }

        $(document).ready(function () {
            initializeMap();
        })

        var timer = false;
        $(window).resize(function () {
            if (timer !== false) {
                clearTimeout(timer);
            }
            timer = setTimeout(function () {
                // リサイズが終了した時点で行う処理または関数を記述
                initializeMap();
            }, 200);
        });

    </script>
</body>
</html>
