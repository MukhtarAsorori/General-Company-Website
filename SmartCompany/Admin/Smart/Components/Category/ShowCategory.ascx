﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShowCategory.ascx.cs" Inherits="SmartCompany.Admin.Smart.Components.Category.ShowCategory" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="AjaxControlToolkit" %>

<!-- Show Box -->
<div class="box">
<!-- Box Head -->
<div class="box-head">
	<h2 class="title"><asp:Label ID="lbBoxTitle" runat="server" 
            Text="Categories Management" meta:resourcekey="lbBoxTitleResource1" /></h2>
	<div class="search">
        <asp:TextBox ID="txtSearch" runat="server" CssClass="field small-field" 
            ToolTip="Search keyword..." meta:resourcekey="txtSearchResource1"></asp:TextBox>
        <asp:ImageButton ID="imgBtnSearch" runat="server" OnClick="imgBtnSearch_Click" 
            CssClass="nav_icon search_en" ImageUrl="~/App_Themes/Admin/Images/spacer.gif" 
            meta:resourcekey="imgBtnSearchResource1" />
        <asp:ImageButton ID="imgBtnRefresh" runat="server" 
            OnClick="imgBtnRefresh_Click" CssClass="nav_icon refresh" 
            ImageUrl="~/App_Themes/Admin/Images/spacer.gif" 
            meta:resourcekey="imgBtnRefreshResource1" />
	</div>
</div>
<!-- End Box Head -->	
<!-- Table -->
<div class="table">
    <asp:Repeater ID="repeaterData" runat="server" onitemdatabound="repeaterData_ItemDataBound">
    <HeaderTemplate>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th width="13"><input id="checkBxAll" onclick="return selectAllCheckBoxes(this)" type="checkbox" /></th>
				<th><asp:Label ID="lbName" runat="server" Text="Name" 
                        meta:resourcekey="lbNameResource1" /></th>
				<th><asp:Label ID="lbDescription" runat="server" Text="Description" 
                        meta:resourcekey="lbDescriptionResource2" /></th>
                <th><asp:Label ID="lbStatus" runat="server" Text="Status" 
                        meta:resourcekey="lbStatusResource1" /></th>
				<th width="110" class="ac"><asp:Label ID="lbControl" runat="server" 
                        Text="Content Control" meta:resourcekey="lbControlResource1" /></th>
			</tr>    
    </HeaderTemplate>
    <ItemTemplate>
			<tr>
				<td><asp:CheckBox ID="checkBxSelector" runat="server" 
                        meta:resourcekey="checkBxSelectorResource2" /><asp:Label ID="lbIdValue" 
                        runat="server" Text='<%# Eval("Id") %>' Visible="False" 
                        meta:resourcekey="lbIdValueResource2" /></td>
				<td>
                    <asp:LinkButton ID="lnkBtnDetails" runat="server" OnClick="lnkBtnDetails_Click" 
                        CommandArgument='<%# Eval("Id") %>' Font-Underline="False"><%# Eval("Name")%></asp:LinkButton>                
                </td>
				<td>
                    <asp:Label ID="lbDescription" runat="server" 
                        ToolTip='<%# SetAllLongText(Eval("Description").ToString()) %>'><%# SetSomeLongText(Eval("Description").ToString())%></asp:Label>
                </td>
                <td><%# SmartCompany.Admin.Shared.Code.SharedValues.ShowActiveValue(Eval("Active").ToString())%></td>
				<td>
                    <asp:LinkButton ID="lnkBtnEdit" runat="server" OnClick="lnkBtnEdit_Click" 
                        CommandArgument='<%# Eval("Id") %>' Text="Edit" CssClass="ico edit" 
                        meta:resourcekey="lnkBtnEditResource2" />
                    <asp:LinkButton ID="lnkBtnDelete" runat="server" OnClick="lnkBtnDelete_Click" 
                        CommandArgument='<%# Eval("Id") %>' Text="Delete" CssClass="ico del" 
                        meta:resourcekey="lnkBtnDeleteResource2" />
                    <AjaxControlToolkit:ConfirmButtonExtender ID="ConfirmButtonExtForDelete" 
                        runat="server" Enabled="True" 
                        TargetControlID="lnkBtnDelete" ConfirmText="">
                    </AjaxControlToolkit:ConfirmButtonExtender>
                </td>
			</tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
			<tr class="odd">
				<td><asp:CheckBox ID="checkBxSelector" runat="server" 
                        meta:resourcekey="checkBxSelectorResource1" /><asp:Label ID="lbIdValue" 
                        runat="server" Text='<%# Eval("Id") %>' Visible="False" 
                        meta:resourcekey="lbIdValueResource1" /></td>
				<td>
                    <asp:LinkButton ID="lnkBtnDetails" runat="server" OnClick="lnkBtnDetails_Click" 
                        CommandArgument='<%# Eval("Id") %>' Font-Underline="False"><%# Eval("Name")%></asp:LinkButton>                
                </td>
				<td>
                    <asp:Label ID="lbDescription" runat="server" 
                        ToolTip='<%# SetAllLongText(Eval("Description").ToString()) %>'><%# SetSomeLongText(Eval("Description").ToString())%></asp:Label>
                </td>
                <td><%# SmartCompany.Admin.Shared.Code.SharedValues.ShowActiveValue(Eval("Active").ToString())%></td>
				<td>
                    <asp:LinkButton ID="lnkBtnEdit" runat="server" OnClick="lnkBtnEdit_Click" 
                        CommandArgument='<%# Eval("Id") %>' Text="Edit" CssClass="ico edit" 
                        meta:resourcekey="lnkBtnEditResource1" />
                    <asp:LinkButton ID="lnkBtnDelete" runat="server" OnClick="lnkBtnDelete_Click" 
                        CommandArgument='<%# Eval("Id") %>' Text="Delete" CssClass="ico del" 
                        meta:resourcekey="lnkBtnDeleteResource1" />
                    <AjaxControlToolkit:ConfirmButtonExtender ID="ConfirmButtonExtForDelete" 
                        runat="server" Enabled="True" 
                        TargetControlID="lnkBtnDelete" ConfirmText="">
                    </AjaxControlToolkit:ConfirmButtonExtender>
                </td>
			</tr>
    </AlternatingItemTemplate>
    <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>
    <!-- Pagging -->
	<div class="pagging">
		<div class="info"><asp:Label ID="lbPaginationInfo" runat="server" 
                meta:resourcekey="lbPaginationInfoResource1" />&nbsp;<asp:Label 
                ID="lbMultiActMsg" runat="server" meta:resourcekey="lbMultiActMsgResource1" /></div>
		<div class="icon">
            <asp:ImageButton ID="imgBtnFirst" runat="server" 
                CssClass="nav_ImagePath first_en" 
                ImageUrl="~/App_Themes/Admin/Images/spacer.gif" 
                meta:resourcekey="imgBtnFirstResource1" />
            <asp:ImageButton ID="imgBtnPrevious" runat="server" 
                CssClass="nav_ImagePath prev_en" 
                ImageUrl="~/App_Themes/Admin/Images/spacer.gif" 
                meta:resourcekey="imgBtnPreviousResource1" />
            <asp:ImageButton ID="imgBtnNext" runat="server" 
                CssClass="nav_ImagePath next_en" 
                ImageUrl="~/App_Themes/Admin/Images/spacer.gif" 
                meta:resourcekey="imgBtnNextResource1" />
            <asp:ImageButton ID="imgBtnLast" runat="server" 
                CssClass="nav_ImagePath last_en" 
                ImageUrl="~/App_Themes/Admin/Images/spacer.gif" 
                meta:resourcekey="imgBtnLastResource1" />
		</div>
	</div>
	<!-- End Pagging -->
</div><!-- End Table -->
</div><!-- End Show Box -->

<div id="dvMultiBtn" style="display:none;">
    <table>
    <tr>
        <td>
            <asp:DropDownList ID="ddlMultiAction" runat="server" 
                meta:resourcekey="ddlMultiActionResource1">
                <asp:ListItem Text="Active" Value="Active" 
                    meta:resourcekey="ListItemResource1" />
                <asp:ListItem Text="Inactive" Value="NoActive" 
                    meta:resourcekey="ListItemResource2" />
                <asp:ListItem Text="Delete" Value="Delete" 
                    meta:resourcekey="ListItemResource3" />
            </asp:DropDownList>        
        </td>
        <td>
            <asp:ImageButton ID="btnExecuteMultiAction" runat="server" 
                onclick="btnExecuteMultiAction_Click" CssClass="nav_ImagePath action_en" 
                ImageUrl="~/App_Themes/Admin/Images/spacer.gif" ToolTip="Execute" 
                meta:resourcekey="btnExecuteMultiActionResource1" />
            <AjaxControlToolkit:ConfirmButtonExtender ID="ConfirmButtonExtForMultiActions" runat="server"
                TargetControlID="btnExecuteMultiAction" Enabled="True" ConfirmText="">
            </AjaxControlToolkit:ConfirmButtonExtender>
        </td>
    </tr>
    </table>
</div>

