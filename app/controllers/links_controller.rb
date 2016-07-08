class LinksController < ApplicationController
	before_action :find_link
	before_action :validate_link

	def download
		@link.update_downloads
		@product = @link.product
	end

	def download_attachment
	end

	private

	def find_link
		Link.find_by(custom_id:params[:id])
	end	
	def find_model
		if @link.nil? || @link.is_invalid?
			redirect_to invalid_path, notice:"El link de descargar no es valido o ha expirado"
		end
	end
end