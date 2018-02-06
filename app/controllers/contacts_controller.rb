class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    render layout: "application"
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        ContactMailer.contact(@contact).deliver_later
        format.html { redirect_to blog_path, success: t(:admin_delivery_mail_contact_sucess_message) }
      else
        format.html { render :new, danger: t(:admin_delivery_mail_contact_fail_message) }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
      def contact_params
        params.require(:contact).permit(:name, :email, :message)
      end
end
