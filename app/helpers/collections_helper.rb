module CollectionsHelper
  def user_collections_select form_object, user
    options = options_from_collection_for_select(user.collections, :id, :title)
    options += content_tag :option, "New Collection", value: "new"
    form_object.select :collection_id, options
  end
end
