class ContactsController < ApplicationController
    
    def home
        @contact = Contact.new
    end
    
    def create
      @contact = Contact.new(contact_params)
      
      if @contact.save
        name = params[:contact][:name]
        email = params[:contact][:email]
        body = params[:contact][:comments]
        
        ContactMailer.contact_email(name, email, body).deliver
        
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
    
    private
    
      def contact_params
        params.require(:contact).permit(:name, :email, :comments)
      end
    
end