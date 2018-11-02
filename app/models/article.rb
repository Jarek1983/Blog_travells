class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
			  length: {minimum: 3}
	validates :text, presence: true,
			  length: {minimum: 2}
	# photo
	has_attached_file :photo, style: {large: "450x450", thumb: "50x50#"}
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

	#movie
	has_attached_file :movie, :style =>
	{
		:medium => {:geometry => "480x320", :format => 'mp4'},
		:thumb => {:geometry => "100x50", :format => 'jpg', :time => 10} 
	}, :processor => [:transcoder]
	validates_attachment_content_type :movie, content_type: /\Avideo\/.*\z/

	def self.search(params)
		articles = Article.where("text LIKE ? or title LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
		articles	
	end
end
