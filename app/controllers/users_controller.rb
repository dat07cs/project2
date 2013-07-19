class UsersController < ApplicationController
  include UsersHelper
  
  def index
    @users = Users.all(:order => "id asc");
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.csv do
        send_data generate_csv(@users, {row_sep: "\r\n"}),
                  :type => "text/csv; charset=iso-8859-1; header=present",
                  :disposition => "attachment; filename=users.csv"
      end
      # format.xls do
        # send_data generate_csv(@users, {col_sep: "\t", row_sep: "\r\n"}),
                  # :type => "application/vnd.ms-excel; charset=iso-8859-1; header=present",
                  # :disposition => "attachment; filename=users.xls"
      # end
      format.xls
    end
  end
end
