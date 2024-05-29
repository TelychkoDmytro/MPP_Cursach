# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel I18n.t('admin.dashboard.latest_10_post_reports') do
          table_for PostReport.where(status: 'pending').order(created_at: :desc).limit(10) do
            column :id
            column :post_id
            column :user_id
            column :reason
            column :reported_at
            column :status
            column :created_at
            column :updated_at
            column I18n.t('admin.dashboard.actions') do |report|
              link_to I18n.t('admin.dashboard.view'), admin_post_report_path(report)
            end
          end
        end
      end
    end
  end
end
