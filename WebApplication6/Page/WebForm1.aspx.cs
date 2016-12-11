
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace WebApplication6.Page
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();

            DataTable dt = new DataTable();
            dt.Columns.Add("a");
            dt.Columns.Add("b");

            DataRow dr = dt.NewRow();
            dr[0] = "2013/1";
            dr[1] = "50";
            dt.Rows.Add(dr);

            DataRow dr2 = dt.NewRow();
            dr2[0] = "2013/2";
            dr2[1] = "150";
            dt.Rows.Add(dr2);

            ds.Tables.Add(dt);

            DataTable dt2 = new DataTable();
            dt2.Columns.Add("a");
            dt2.Columns.Add("b");

            DataRow dr3 = dt2.NewRow();
            dr3[0] = "2013/1";
            dr3[1] = "30";
            dt2.Rows.Add(dr3);

            DataRow dr4 = dt2.NewRow();
            dr4[0] = "2013/2";
            dr4[1] = "60";
            dt2.Rows.Add(dr4);

            ds.Tables.Add(dt2);



            HighCharts1.Type = ChartType.Line;
            HighCharts1.Title = "いやっほい！";
            HighCharts1.DataKey = "a";
            HighCharts1.DataValue = "b";

            List<object> yaxis = new List<object>();
            yaxis.Add("Temperature");
            yaxis.Add("Rainfall");
            HighCharts1.YAxis = yaxis;

            HighCharts1.Tooltip = "valueSuffix: 'mm'";
            HighCharts1.DataName = "検温";
            HighCharts1.DataSource = ds;
            HighCharts1.DataBind();


        }
    }
}