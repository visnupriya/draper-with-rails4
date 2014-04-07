# Shared Decorator Methods
### You might have several decorators that share similar needs. 
### Since decorators are just Ruby objects, you can use any normal Ruby technique for sharing functionality.

### Then modify your decorators to inherit from that "ApplicationDecorator" instead of directly from "Draper::Decorator:"

# app/decorators/application_decorator.rb
class ApplicationDecorator < Draper::Decorator



end