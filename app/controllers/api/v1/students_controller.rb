class Api::V1::StudentsController < Api::V1::UsersController
  # Guard to make sure that student users can't premote their type to
  # admin——this should go into a jsonapi-resource rule as soon as possible
  # (allow the attr incoming but dissalow outgoing). Or maybe it's something can
  # be fixed on the ember side (prevent send the attr, but always receive it)
  # which would make it possible to entirely dissalow the property.
  before_action do
    if params[:data]
      if params[:data][:attributes]
        if params[:data][:attributes][:type]
          params[:data][:attributes][:type] = nil
        end
      end
    end
  end
end
