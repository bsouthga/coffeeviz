# Yeoman Generator for Coffeescript Vizualization Projects

## Dependencies

This is a generator for [Yeoman](http://yeoman.io/) which requires [NodeJS](http://nodejs.org/). To install both, first visit [http://nodejs.org/](http://nodejs.org/) and follow installation instructions. Then, to install Yeoman, run the following

```
npm install -g yo
```


## Installation of this generator

Clone this repository and run the following...

First, change directory into the repository

```
cd coffeeviz
```

Then, link the generator with yeoman

```
npm link
```


## Usage

Once the generator is linked, simply run

```
mkdir myproject
cd myproject
yo coffeeviz
```

finally, copy dependencies by entering

```
grunt setup
```


the folder structure will look like this

```
myproject
│
├── app
│   ├── css
│   │   └── main.css
│   ├── lib
│   │   └── vendor
│   │       ├── bootstrap
│   │       ├── jquery
│   │       └── d3
│   ├── src
│   │   └── main.coffee
|   └── index.html
├── bower_components
│   ├── bootstrap
│   ├── jquery
│   └── d3
├── dist
├── node_modules
├── bower.json
├── package.json
└── Gruntfile.coffee
```

Now, to start a development server and get to work, simply run

```
grunt
```

Once your ready to deploy, enter the deploy path in `Gruntfile.coffee` and enter

```
grunt deploy
```