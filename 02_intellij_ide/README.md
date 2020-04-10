#### Integrated development environment for optimization
This project defines a IDE which is layered on top of the base image *jpmaree/optimization_engine:latest*. The resulting
image is a Intellij-IDEA supported IDE where it is anticipated it is desirable to develop within a Python environment.

 #####Pull latest build docker image
 To pull a pre-build image, execute:
 
    docker pull jpmaree/optimization_ide:latest
 
 #####Push latest build docker image (require privileges)
 Login to docker:
 
    docker login
    
 Push latest build image
 
    docker push jpmaree/optimization_ide:latest 
 
 #####Build docker image
 The build the image from scratch, call:
 
    ./docker_build.sh
      
 #####Run docker container
  The docker container will share the host's XServer to display GUI (ie., matplotlib.pyplot visualization) in the 
  foreground of the host pc. The following command can be executed to run the docker container:
  
    :/path_dev$ ./docker_run.sh [options] 
    
  where *path_dev$* denotes the project folder to be mounted for development 
   
   
As default, the /mnt folder will be mounted if no options are specified 

 
