class AnswersController < ApplicationController

    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.new(ans_params)      
  
        respond_to do |format|
          if @answer.save
            format.html {redirect_to question_path(@question), notice: 'Respuesta creada correctamente.'}
            format.js # render create.js.erb
          else
            format.html { 'questions/show' }
            flash[:error] = 'La respuesta no se ha agregado correctamente'
          end
        end
    end

    def destroy
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
        @answer.destroy
      
        respond_to do |format|
          format.html {redirect_to question_path(@question), notice: 'Respuesta eliminada correctamente.'}
          format.js 
          flash[:success] = "Respuesta eliminada correctamente.!"
        end

    end

    private

    def ans_params

        params.require(:answer).permit(:content, :rating).merge(user: current_user)

    end

      
end
