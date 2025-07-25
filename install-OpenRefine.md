# Installation instructions - OpenRefine

OpenRefine needs Java to run. If you aren't sure, you can check the terminal:

```
java --version
```

You should see for example:

```
openjdk 17.0.15 2025-04-15
OpenJDK Runtime Environment (build 17.0.15+6-Ubuntu-0ubuntu124.04)
OpenJDK 64-Bit Server VM (build 17.0.15+6-Ubuntu-0ubuntu124.04, mixed mode, sharing)
```

If you don't have Java, install it. You can install only JRE (a package that contains `jre` in its name):

```
sudo apt install openjdk-17-jre
```

Download OpenRefine from [the projects' website](https://openrefine.org/download). If you download the Linux `tar.gz` version, unarchive it and run:

```
tar zxvf openrefine-linux-3.9.3.tar.gz
cd openrefine-linux-3.9.3
```


Before running OpenRefine, we need to add the extension for work with RDF - **RDF Transform**.

Download [the extension](https://github.com/AtesComp/rdf-transform/releases/download/v2.3.2/rdf-transform-2.3.2.zip) and extract its contents to the `openrefine-<version>/webapp/extensions` directory. So in our case, the `rdf-transform` directory will be added to `webapp/extensions`. 

```
cd webapp/extensions
unzip rdf-transform-2.3.2.zip 
```

Go back to the main directory of OpenRefine and run it:

```
cd ../../
./refine
```

The application will run in your browser.

**OPTIONAL** You can check other extensions at [The OpenRefine Extensions](https://openrefine.org/extensions) site.

