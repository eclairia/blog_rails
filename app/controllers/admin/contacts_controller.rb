class Admin::ContactsController < AdminController
  before_action :set_admin_contact, only: [:edit, :update, :destroy]
  before_action :set_contact_paginate, only: [:index]

  def index
    @page_title = t(:admin_contact_title_page)
    @meta_descr = t(:admin_contact_descr_page)
    @contacts = Contact.all.paginate(page: params[:page], per_page: 10)
    render layout: "admin"
  end

  def show
  end

  def edit
    render layout: "admin"
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to admin_contacts_path, success: t(:admin_update_contact_sucess_message) }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, danger: t(:admin_update_contact_fail_message) }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @contact.destroy
      respond_to do |format|
        format.html { redirect_to admin_contacts_url, success: t(:admin_destroy_contact_sucess_message) }
        format.json { head :no_content }
      end
    else
      redirect_to admin_contacts_path, danger: t(:admin_destroy_contact_fail_message)
    end
  end

  private
    def set_admin_contact
      @contact = Contact.find(params[:id])
    end

    def set_contact_paginate
      @contacts = Contact.alpha.paginate(page: params[:page], per_page: 10)
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
