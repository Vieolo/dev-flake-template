{
  description = "A collection of templates for starting points of developments";

  outputs = { self }: {

    templates = {
      default = {
        path = ./default_template;
        description = "Starting point for creating a flake for general packages";
      };
      
      frontend = {
        path = ./frontend;
        description = "Starting point for creating a flake for frontend development";
      };
    };

    defaultTemplate = self.templates.default;
  };
}