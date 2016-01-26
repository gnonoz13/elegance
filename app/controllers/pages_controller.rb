class PagesController < ApplicationController
    
    def new
      @contact = Contact.new
    end
    
    def create
      @contact = Contact.new(contact_params)
      
      if @contact.save
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
