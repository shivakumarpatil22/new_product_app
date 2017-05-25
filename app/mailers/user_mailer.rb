class UserMailer < ActionMailer::Base
  default from: "from@example.com"
    def send_product_details(user,product_id)
 		@product= Product.find(product_id)
 		@user= user
 		attachments['filename.jpg'] = File.read(@product.photo.path) if @product.photo
 		mail(to: @user.email, subject: 'Product Details').deliver
  	end 

  	def post_email(user)
    	mail(:to => @user.email, :subject => "Registered")
   	end
end
