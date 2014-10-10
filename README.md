# Indoctrinatr

## About

Indoctrinatr is an Open Source Software project by [dkd Internet Service GmbH](https://dkd.de/), Frankfurt (Germany), which renders [eRuby](https://en.wikipedia.org/wiki/ERuby) (more specifically: [Erubis](http://www.kuwata-lab.com/erubis/)) enriched [XeTex](http://tug.org/xetex/) templates to PDF documents.

## Setup (development environment)

1.  Install XeTex:

    Mac OS X: [MacTex](https://tug.org/mactex/)
 
    Debian/Ubuntu: `apt-get install texlive-full`

2.  Use Ruby (v2.0 or later):

    We recommend installation via [Ruby Version Manager](https://rvm.io/), [rbenv](http://rbenv.org/) or [Brightbox Ruby NG](http://brightbox.com/docs/ruby/ubuntu/).

3.  Clone this repository:

    ```Shell
    git clone blargh
    ```

4.  Run [Bundler](http://bundler.io/) inside your local repository to install project dependencies:

    ```Shell
    bundle install
    ```

5.  Setup database:

    ```Shell
    rake db:setup
    ```

6.  Start application server:

    ```Shell
    rails server
    ```

7.  Direct your preferred browser to <http://127.0.0.1:3000/>.

## Usage

__TODO__

### Indoctrinatr Template Packs

#### About

Template Packs are zipped XeTex templates with configuration and asset files (images and the like) which can be uploaded and imported into Indoctrinatr. They can be easily created with Indoctrinatr Tools (see below).

#### Configuration Syntax

##### API

The file `configuration.yaml` contains all relevant information (in [YAML](http://www.yaml.org/)) about this Template Pack.

name|validity|description
-|-|-
`template_name`|required|Short name for your template.
`fields`|optional|List of template fields you want to use with your template.

For each field you need to specify:

name|validity|description
-|-|-
`name`|required|Short name for this field.
`presentation`|required|Choose from this list of valid presentation values (with respect to their respective HTML equivalent for this field): `text`, `textarea`, `checkbox`, `radiobutton`, `dropdown`, `date`, `range`
`default_value`|optional|Default value for this field, which will be used if no value is supplied by the user. Empty string if not specified.
`available_options`|required for `presentation` of `checkbox`, `radiobutton` or `dropdown`|List of selectable text options, entries separated by commata
`start_of_range`|required for `presentation` of `range`|Value of lower bound for this range selector.
`end_of_range`|required for `presentation` of `range`|Value of upper bound for this range selector.

##### Sample

```YAML
    template_name: Hello World Template
    fields:
      -
        name: variable1
        presentation: text
        default_value: World
      -
        name: variable2
        presentation: dropdown
        default_value: not enough
        available_options: not enough, beautiful, your oyster, a template
```

### Indoctrinatr Tools

[Indoctrinatr Tools](__TODO__) is a set of command line tools to kick-start and develop Indoctrinatr Template Packs. Install via `gem install indoctrinatr-tools`. Note: You need to have XeTex installed locally to use Indoctrinatr Tools if you are running Indoctrinatr on a different machine (e.g. server setup).

Run `indoctrinatr help` to see a list of available commands. `indoctrinatr workflow` describes the general approach to developing templates. Run `indoctrinatr demo` to see a minimalistic working project sample.

Protip: Use `indoctrinatr bashcompletion` or `indoctrinatr zshcompletion` to save precious time and energy.

## Contributing

## License

Indoctrinatr is licensed under the terms and conditions of [__TODO__]().

## Credits

* Valeria Krasteva (design)
* Wilfried Irßlinger (development)
* Nicolai Reuschling (development)
* Søren Schaffstein (idea, product management)
* Stefan Sprenger (development of an earlier version)
