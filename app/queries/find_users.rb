class FindUsers
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
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
                  fields: [:first_name, :last_name, :nickname, :email]
                }
              }
            ]
          }
        }
      }
    )
  end
end
