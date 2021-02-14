module Events
  class Json
    def call(events)
      events.sort_by(&:date).reverse
    end
  end
end
