class PagesController < ApplicationController
  # view all the pages
  def index
    @pages = Page.all
  end
 
  # showing a single page
  def show
    @page = Page.find(params[:id])
    # renders show.html.erb
  end

  # displays the form to create the new page
  def new
    @page = Page.new
    # renders new.html.erb
  end

  def edit
    @page = Page.find(params[:id])
  end
end

# Post request to create the page
def create
  @page =Page.new(pages_params)

  if @page.save
    redirect_to pages_path
  else
    render :new
  end
end

def edit
  @page = Page.find(params[:id])
end

# update of the page
@page = Page.find(params[:id])

if @page.update(pages_params)
  redirect_to pages_path
else
  render :edit
end



private 

  def pages_params
  params.require(:page).permit(:title, :author, :body)
end