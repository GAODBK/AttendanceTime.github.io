using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class apple : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int   student_age;




        //定义三个变量，分别为苹果数量 梨子数量 二者之和
        int num_pg;
        int num_lz;
        int num_add;

        //键入textbox内的数字，并不是以Int类型来存储，而是看作字符串，被存放在TextBox.Text属性中。 要将它转换为Int类型，可以使用Int32.Parse 方法 它负责将数字的字符串表示形式转换为它的等效 32 位有符号整数。
        //int32.parse 是将文本框里的字符类型的数字转换成真正的可以运算的整数形数字
        //两种方法：  Convert.ToInt32    int.parse


        num_pg = int.Parse(TextBox1.Text);
        num_lz = int.Parse(TextBox2.Text);
        num_add = num_pg + num_lz;

        //num_add = 15369;

        Label1.Text = "你家一共有水果：" + num_add;
    }
}