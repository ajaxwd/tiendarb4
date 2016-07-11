class LinksController < ApplicationController
	before_action :find_link
	before_action :find_attachment_link, only: :download_attachment
	before_action :validate_link
	before_action :validate_attachment_link, only: :download_attachment

	def download
		@link.update_downloads
		@product = @link.product
		@link.create_attachment_links
		@link_attachment = @link.links
	end

	def download_attachment
		send_file(Rails.root.join("archivo","#{@link_attachment.attachment_id}","original",@link_attachment.attachment.archivo_file_name))
	end

	private

	def find_attachment_link
		@link_attachment = LinkAttachment.find(params[:attachment_id])
	end

	def validate_attachment_link
		if @link_attachment.is_invalid?
			redirect_to invalid_path, notice:"Expiro el tiempo para descargar este archivo"
		end
	end

	def find_link
		Link.find_by(custom_id:params[:id])
	end	
	def find_model
		if @link.nil? || @link.is_invalid?
			redirect_to invalid_path, notice:"El link de descargar no es valido o ha expirado"
		end
	end
end