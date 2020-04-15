#### Integrated development environment for optimization
This project defines a IDE which is layered on top of the base image *jpmaree/optimization_engine:latest*. The resulting
image integrates the following development environments:

    1. Intellij IDEA (mainly for python and java development)
    2. Eclipse (mainly for c/c++ dev)
    3. OpenModelica (modelling and simulation)

 #####Pull latest build docker image
 To pull a pre-build image, execute:
 
    docker pull jpmaree/ide:latest
 
 #####Push latest build docker image (OPTIONAL - require privileges)
 Login to docker:
 
    docker login
    
 Push latest build image
 
    docker push jpmaree/ide:latest 
 
 #####Build docker image
 The build the image from scratch, call:
 
    ./docker_build.sh
      
 #####Run docker container
  The docker container will share the host's XServer to display GUI (ie., matplotlib.pyplot visualization) in the 
  foreground of the host pc. 
  
  To run the IDE, the following command can be executed to run the docker container:
  
    :/path_dev$ ./docker_run.sh [options] 
    
  where *path_dev$* denotes the project folder to be mounted for development. As default, the /mnt folder will be mounted if for exampled called from this directory. 
  
  NOTE:
  
  [1.] The user is adviced to call *screen* in the interactive docker terminal which will all splitting up the terminal screen
  in partitioned sections.
  
  [2.] The user is welcome to modify .screenrc (see /mnt) to customized user experience.

 
