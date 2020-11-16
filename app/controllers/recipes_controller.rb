class RecipesController < ApplicationController

    def index 
      
        @recipes = Recipe.all

        render json: @recipes
     end

     def show
        @recipe = Recipe.find(params[:id])
        render json: @recipe
    end

    def create
        @recipe = Recipe.create(Recipe_params)
        if @recipe.valid?
            render json: @recipe
        else
            render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.valid?
          @recipe.update(recipe_params)
            render json: @recipe
        else
            render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy 
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
      if @recipe.valid? 
        render json: { errors: @recipe.errors.full_messages }
      end
    end
    

    private 

    def recipe_params
        params.require(:recipe).permit(:title,:instructions,:image,:user_id)
    end
end