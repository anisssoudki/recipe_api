class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :instructions, :image ,:user_id
end
