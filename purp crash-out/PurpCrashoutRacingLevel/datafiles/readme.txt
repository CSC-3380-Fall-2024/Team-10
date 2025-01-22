License:
All code presented in this project can be used, modified, and published for commercial or non-commerical purposes in accordance with the buyer's will.

Script Explainations:

car_init() contains all of the relevant variables for the car object to function properly. This should
be placed in the create event of all car objects and the values should be changed in the create event
of the car object.

car_add_wheel(xoff,yoff,rotatable,powered,object_index) this script adds a wheel object with the object_index
to the car. Note: car_init should have already been called. This is important because if the wheels do not
balance out the car, then the car can behave weird.

car_update(accelerate,steer_direction) this script should be called in the step event of the car object
depending on the arguments the car will be able to move and turn accordingly.