﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #GridView1 {
            width: 100%;
            text-align: center;
            line-height: 70px;
        }

        .round-button {
            display: inline-block;
            padding: 8px 12px;
            border: none; /* 边框颜色 */
            background-color: #409EFF; /* 按钮背景色 */
            color: white; /* 按钮文本颜色 */
            font-size: 14px;
            border-radius: 10px; /* 圆角 */
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s, box-shadow 0.3s;
        }

        .round-button:hover {
            background-color: #66b1ff; /* 鼠标悬停时的背景颜色 */
            border-color: #66b1ff; /* 鼠标悬停时的边框颜色 */
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1); /* 鼠标悬停时的阴影效果 */
        }

        .round-button:active {
            background-color: #3a8ee6; /* 按下时的背景颜色 */
            border-color: #3a8ee6; /* 按下时的边框颜色 */
        }

        .custom-input {
            width: 80%;
            padding: 7px;
            border: 1px solid #dcdfe6;
            border-radius: 4px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s;
        }

       .custom-input:focus {
           border-color: #409eff;
       }

       .custom-input::placeholder {
           color: #c0c4cc;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <br />
            <br />

            <br />
            <br />
            <asp:TextBox ID="TextBox3" runat="server" class="custom-input"></asp:TextBox>

            <br />
            <br />

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        CellPadding="4"
                        ForeColor="#333333"
                        GridLines="None"
                        ShowFooter="True"
                        AutoGenerateColumns="False"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowEditing="GridView1_RowEditing"
                        OnRowUpdating="GridView1_RowUpdating"
                        OnRowDeleting="GridView1_RowDeleting">

                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                        <Columns>

                            <asp:TemplateField HeaderText="课程编号">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Cno") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="CnoInput" runat="server" class="custom-input"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="课程名">
                                <ItemTemplate>
                                    <asp:Label ID="Cname" runat="server" Text='<%# Eval("Cname") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="CnameInput" runat="server" Text='<%# Eval("Cname") %>' class="custom-input"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" class="custom-input"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="学分">
                                <ItemTemplate>
                                    <asp:Label ID="Credit" runat="server" Text='<%# Eval("Credit") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="CreditInput" runat="server" Text='<%# Eval("Credit") %>' class="custom-input"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" class="custom-input"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="必/专修">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Cnature") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" class="custom-input"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="教学楼">
                                <ItemTemplate>
                                    <asp:Label ID="Coid" runat="server" Text='<%# Eval("Coid") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" class="custom-input"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="所属学院">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Ccollege") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" class="custom-input"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="课本url">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Cpicture") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" class="custom-input"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="操作">
                                <EditItemTemplate>
                                    <asp:Button ID="Button5" runat="server" Text="确定" CommandName="Update" class="round-button" />
                                    <asp:Button ID="Button6" runat="server" Text="取消" CommandName="Cancel" class="round-button" />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="Button4" runat="server" Text="插入数据" class="round-button" OnClick="Button4_Click" />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button2" runat="server" Text="编辑" CommandName="Edit" class="round-button" />
                                    <asp:Button ID="Button3" runat="server" Text="删除" CommandName="Delete" class="round-button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            

                            <asp:TemplateField HeaderText="备注 1"></asp:TemplateField>

                        </Columns>

                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#f2f2f2" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

                    <br />

                    <asp:SqlDataSource
                        ID="SqlDataSource1"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:DatabaseLConnectionString %>"
                        DeleteCommand="DELETE FROM [tb_Course] WHERE [Cno] = @Cno"
                        InsertCommand="INSERT INTO [tb_Course] ([Cno], [Cname], [Credit], [Cnature], [Coid], [Ccollege], [Cpicture]) VALUES (@Cno, @Cname, @Credit, @Cnature, @Coid, @Ccollege, @Cpicture)"
                        ProviderName="<%$ ConnectionStrings:DatabaseLConnectionString.ProviderName %>"
                        SelectCommand="SELECT [Cno], [Cname], [Credit], [Cnature], [Coid], [Ccollege], [Cpicture] FROM [tb_Course]"
                        UpdateCommand="UPDATE [tb_Course] SET [Cname] = @Cname, [Credit] = @Credit, [Cnature] = @Cnature, [Coid] = @Coid, [Ccollege] = @Ccollege, [Cpicture] = @Cpicture WHERE [Cno] = @Cno">

                        <DeleteParameters>
                            <asp:Parameter Name="Cno" Type="String" />
                        </DeleteParameters>

                        <InsertParameters>
                            <asp:Parameter Name="Cno" Type="String" />
                            <asp:Parameter Name="Cname" Type="String" />
                            <asp:Parameter Name="Credit" Type="Decimal" />
                            <asp:Parameter Name="Cnature" Type="String" />
                            <asp:Parameter Name="Coid" Type="String" />
                            <asp:Parameter Name="Ccollege" Type="String" />
                            <asp:Parameter Name="Cpicture" Type="String" />
                        </InsertParameters>


                        <UpdateParameters>
                            <asp:Parameter Name="Cname" Type="String" />
                            <asp:Parameter Name="Credit" Type="Decimal" />
                            <asp:Parameter Name="Cnature" Type="String" />
                            <asp:Parameter Name="Coid" Type="String" />
                            <asp:Parameter Name="Ccollege" Type="String" />
                            <asp:Parameter Name="Cpicture" Type="String" />
                            <asp:Parameter Name="Cno" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
