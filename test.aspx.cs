using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    String connectionString = "Data Source=JACKGREALISH;Initial Catalog=DatabaseL;User ID=LoginName;Password=123456;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
        Label1.Text = "";
        GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
        Label1.Text = "";
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label labelID = GridView1.Rows[e.RowIndex].FindControl("Label2") as Label;

        TextBox Cname = GridView1.Rows[e.RowIndex].FindControl("CnameInput") as TextBox;
        TextBox Credit = GridView1.Rows[e.RowIndex].FindControl("CreditInput") as TextBox;
        String query = "UPDATE [dbo].[tb_Course] SET Cname = '" + Cname.Text + "', Credit = '" + Credit.Text + "' where Cno = '" + labelID.Text + "'";

        try
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);

            Label1.Text += "修改成功：" + cmd.ExecuteNonQuery();

            GridView1.EditIndex = -1;
            GridView1.DataBind();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label labelID = GridView1.Rows[e.RowIndex].FindControl("Label2") as Label;
        String DeleteCommand = "DELETE FROM [tb_Course] WHERE [Cno] = " + labelID.Text;
        Label1.Text = labelID.Text;
        try
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand(DeleteCommand, con);
            Label1.Text = "删除成功" + cmd.ExecuteNonQuery();

            GridView1.EditIndex = -1;
            SqlDataSource1.DataBind();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        String query = "SELECT * FROM [dbo].[tb_Course] WHERE Cname LIKE '%' + '" + TextBox3.Text + "' + '%' OR Ccollege LIKE '%' + '物理' + '%';";
        try
        {
            SqlConnection con = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        TextBox CnoInput = GridView1.FooterRow.FindControl("CnoInput") as TextBox;
        TextBox TextBox3 = GridView1.FooterRow.FindControl("TextBox3") as TextBox;
        TextBox TextBox9 = GridView1.FooterRow.FindControl("TextBox9") as TextBox;
        TextBox TextBox2 = GridView1.FooterRow.FindControl("TextBox2") as TextBox;
        TextBox TextBox1 = GridView1.FooterRow.FindControl("TextBox1") as TextBox;
        TextBox TextBox10 = GridView1.FooterRow.FindControl("TextBox10") as TextBox;
        TextBox TextBox11 = GridView1.FooterRow.FindControl("TextBox11") as TextBox;

        Label1.Text = CnoInput.Text + TextBox3.Text + TextBox9.Text + TextBox2.Text + TextBox1.Text + TextBox10.Text + TextBox11.Text;

        string InsertCommand = "INSERT INTO [tb_Course] ([Cno], [Cname], [Credit], [Cnature], [Coid], [Ccollege], [Cpicture]) " +
                       "VALUES (@Cno, @Cname, @Credit, @Cnature, @Coid, @Ccollege, @Cpicture)";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            try
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(InsertCommand, conn))
                {
                    // 使用参数化查询避免 SQL 注入问题和字符问题
                    cmd.Parameters.AddWithValue("@Cno", CnoInput.Text);
                    cmd.Parameters.AddWithValue("@Cname", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@Credit", Convert.ToDecimal(TextBox9.Text));
                    cmd.Parameters.AddWithValue("@Cnature", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@Coid", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@Ccollege", TextBox10.Text);
                    cmd.Parameters.AddWithValue("@Cpicture", TextBox11.Text);

                    // 执行插入操作
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Label1.Text = rowsAffected.ToString();
                        CnoInput.Text = string.Empty;
                        TextBox3.Text = string.Empty;
                        TextBox9.Text = string.Empty;
                        TextBox2.Text = string.Empty;
                        TextBox1.Text = string.Empty;
                        TextBox10.Text = string.Empty;
                        TextBox11.Text = string.Empty;
                    }
                }
            }
            catch (Exception ex)
            {
                // 处理异常
                Label1.Text = ex.Message;
            }
        }

    }
}