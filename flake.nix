{
  description = "A collection of templates for starting points of developments";

  outputs = { self }: {

    templates = {

      general = {
        path = ./general;
        description = "Starting point for creating a flake for general packages";
      };
      
      frontend = {
        path = ./frontend;
        description = "Starting point for creating a flake for frontend development";
      };
    };

    defaultTemplate = self.templates.general;

  };
}