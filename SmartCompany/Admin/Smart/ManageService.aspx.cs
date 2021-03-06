﻿using System;

namespace SmartCompany.Admin.Smart
{
    public partial class ManageService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = string.Format("{0} - {1}", Properties.Resources.MainTitle, Properties.Resources.ManageService);
                lbPageTitle.Text = Properties.Resources.ManageService;
                btnNew.Text = Properties.Resources.AddService;
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            this.HideMWcControls();

            if (btnNew.CommandName == "ADD")
            {
                mwcEntry.InitializeBox(true);
                mwcEntry.Visible = true;
                btnNew.CommandName = "SHOW";
                btnNew.Text = Properties.Resources.ShowData;
            }
            else
            {
                mwcShow.LinqFetchData();
                mwcShow.Visible = true;
                btnNew.CommandName = "ADD";
                btnNew.Text = Properties.Resources.AddService;
            }
        }

        // Hide all MWc
        private void HideMWcControls()
        {
            mwcShow.Visible = false;
            mwcEntry.Visible = false;
            mwcDetail.Visible = false;
        }



    }// end class
}// end NS