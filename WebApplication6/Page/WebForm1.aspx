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

            ctx.font = "12px 'ＭＳ Ｐゴシック'";
            
            var plotLeft = Highcharts.charts[0].plotLeft;
            var plotTop = Highcharts.charts[0].plotTop;
            $.each(Highcharts.charts[0].series, function (i, s) {
                $.each(s.points, function (j, p) {
                    console.log('Series: ' + i + ', Point: ' + j + ', Left: ' + (p.plotX + plotLeft) + ', Top: ' + (p.plotY + plotTop));
                    
                    ctx.textAlign = "center";
                    ctx.fillText(p.y, p.plotX+plotLeft, 50);
                });
            });
        }

        $(document).ready(function () {
            initializeMap();
        })
    </script>
</body>
</html>
