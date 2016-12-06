
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication6.Page
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("a");
            dt.Columns.Add("b");

            DataRow dr = dt.NewRow();
            dr[0] = "2013/1";
            dr[1] = "50";
            dt.Rows.Add(dr);

            DataRow dr1 = dt.NewRow();
            dr1[0] = "2013/2";
            dr1[1] = "150";
            dt.Rows.Add(dr1);


            HighCharts1.Type = ChartType.Line;
            HighCharts1.Title = "いやっほい！";
            HighCharts1.DataKey = "a";
            HighCharts1.DataValue = "b";
            HighCharts1.YAxis = "降雨量(mm)";//Y轴的值;
            HighCharts1.Tooltip = "valueSuffix: 'mm'";
            HighCharts1.DataName = "検温";
            HighCharts1.DataSource = dt;
            HighCharts1.DataBind();

        }
    }
}