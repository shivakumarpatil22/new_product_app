class Product < ActiveRecord::Base
	validates :product_name, :product_price, :selling_price, :product_stock, presence: true
	validates :product_name, length: { maximum: 50 }
				{ with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  	validates :product_price, numericality: true
 

	has_attached_file :photo, :styles => { :small => "150x150>" },
    :url  => "/assets/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	after_save :send_email
	#after_create :upcase_product_name
	before_save :upcase_product_name

	def send_email
		UserMailer.send_product_details(User.first, self.id)
	end

	def upcase_product_name
		#update_attributes(product_name: product_name.upcase)
		self.product_name = product_name.upcase
    end

end
