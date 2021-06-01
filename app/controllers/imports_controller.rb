class ImportsController < ApplicationController
  def new
    @import = Import.new
  end

  def create
    Import.create params.required(:import).permit(:csv_file)
    redirect_to users_path, notice: 'Imported Successfully.'
  end
end
