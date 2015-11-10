class DownloadController < ApplicationController
  def show
    @download = Download.find(params[:id])

    if @download.file.file.filename != "#{params[:filename]}.#{params[:format]}"
      render json: { errors: "Need a url" }, status: 400
    end

    @file = open(@download.file_url)
    send_file( @file, :filename => File.basename(@download.file.file.filename.to_s))
  end

end
