class QuestionsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
     @questions = Question.search(params[:search]).order(created_at: :desc)
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      flash[:notice] = "Pregunta creada satisfactoriamente"
      redirect_to questions_path
    else
      render :new
    end    
  end

  def edit 
     
  end

  def update    
    if @question.update(question_params)
      flash[:notice] = "Pregunta actualizada satisfactoriamente"  
      redirect_to question_path(@question)
    else
      render :edit  
    end
  end 

  def destroy
    if @question.destroy
      flash[:notice] = "Pregunta eliminada satisfactoriamente"  
  
      redirect_to questions_path
    end
  end  

  private 

  def question_params
    params.require(:question).permit(:title, :content, :rating)  
  end

  def set_params
    @question = Question.find(params[:id])  
  end

end
