class FindMessages
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope.order(created_at: :desc)
  end

  def call(params = {})
    return initial_scope unless params[:search].present?

    initial_scope.search(
      {
        query: {
          bool: {
            must: [
              {
                multi_match: {
                  query: params[:search],
                  fields: [:content]
                }
              },
              {
                match: {
                  chat_id: params[:chat_id].to_i
                }
              }
            ]
          }
        }
      }
    )
  end
end
