class CallbackIssueService
    PAYLOAD_OBJECTS_NAME = %w[organization repository sender]
  
    def initialize(params)
      @builded_objects = []
      mapped_objects = mapper_objects_payload(params)
  
      build_all_objects(mapped_objects, params)
    end
  
    def valid?
      @event.valid?
    end
  
    def save
      ActiveRecord::Base.transaction { @event.save }
    end
  
    private
  
    def build_all_objects(mapped_objects, params)
      @event = Callback::Event::Build.call(params)
  
      mapped_objects.keys.each do |key|
        @event = "Callback::#{key.capitalize}::Build"
                     .constantize.call(@event, params[:body])
      end
    end
  
    def mapper_objects_payload(params)
      objects = {}
      PAYLOAD_OBJECTS_NAME.each do |object|
        payload_objects = params[:body][object.to_sym]
        objects[object.to_sym] = payload_objects unless payload_objects.nil?
      end
      objects
    end
  
  end