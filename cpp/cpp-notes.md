### Functions in C++: Using Default Arguments & Function Overloading

* if function definition and declaration are separate then default value should be mention in the declaration

### Defensive C++: Defensive Programming & Defensive Design

* in try catch always catch exception as a reference, this is because the object will be sliced and the exception will be lost and only the base exception is caught

* in a class we can mark a function as a const, this implies that i will not change any of the member variables
    ```cpp
    class Student{
        string name;
        void getName() const {
            return name;
        }
    }
    ```

* can use condition to check pre-conditions and use assertions to check post-conditions
    * user `casset` library to assert

### Defensive C++: Writing Defensive C++ Code

* in standard library 
    * user iterators carefully, they can be moved passed the end
    * use the `.at()` to access elements instead of `[]`
    * for strings prefer the string class instead of c-style strings
* do not ignore compiler warnings
* prefer explicit casting
* use RAII
* don't user margin numbers use enums instead
* specify valid constructor
    * should leave the object in a valid state
    * in short always init all members, don't create constructors that inits only some of the member variables leaving the object in a illogical state such as a student without a name makes no sense
    * if you don't want to have the class be copied explicitly defined the copy constructor
        ```cpp
        class Employee {
            // delete the copy constructor
            Employee(Employee const& employee) =  delete;
            
            // delete the copy assignment constructor
            Employee& operator=(Employee const& employee) =  delete;
        }
        ```
        this will most like result in not being able to use this class with std library cause they make heavy use of copy and move
    
* marking functions that don't change member var to be marked as const 
    * function expecting a const pointer parameter wont be able to use the methods of the parameter that are not marked as const
        ```cpp
        void doSomething(Employee const& emp){
            return emp.calculate_salary();
        }
        ```
        the above will give error if the calculate_salary() is not marked as const
    * function to be marked const both at the definition and implementation

* while using inheritance 
    * always override virtual functions, don't override implemented functions from the base class cause it might cause inconsistent behavior
    * two class `truck` and `car` inherit the class `vehicle`, so a function that accept vehicle as an argument with take object for truck and car as well. Now when overriding non-virtual functions of vehicle, any function called on the passed argument will be the function defined in the base class ie vehicle and not the derived class. In order to not have that happen need to mark the function in the base class as virtual.

* object slicing
    * in the above case the passed argument is a const pointer  so there is no issue, but if it was not a pointer then the passed objected would have been sliced, meaning only the variables and methods defined in the base class will be available because the object was copied as the base class and all aspects of the derived class will be lost
    * this slicing is not dependent on the virtual keyword

* c-style cast vs static_cast<>
    * c-style cast converts irrespective of if its possible and forcible casts it
    * static_cast does the exactly same thing but according to the lecture it is easier to find and debug ( i don't get the point then )

* dynamic_cast
    * is safe casting 
    * if cannot cast will return a null pointer or raise an exception

* managing memory in case of exceptions
    * when object is created on the stack, when it goes out of scope the object is destroyed, when on heap (using the `new` keyword ) then will have to manually destroy it
    * in case there is an exception then the free memory statement is never reacher causing memory leak
    * one way to fix is use `try...catch` and delete the pointer in both blocks
    * better solution is to use unique_ptr, this is used to manage another heap object through stack pointer and deletes it when it goes out of scope, to use it 
        ```cpp
        std::unique_ptr<Employee> emp = std::make_unique<Employee>(id,name...); 
        ```
    * unique_ptr is one of the type of smart pointer which does not allow more than one pointer to refer to single object

* static initialization order fiasco
    * when a viable depends on a global/static variable define in another cpp file, the order in which the `.o` file are linked for the final executable is important
    * solution is to use lazy initialization #TODO: check how its done 

* Using the `at()` Method vs. the operator `[]`
    * `[]` does not do bounds check
    * `at()` is safer

### Defensive C++: Managing Memory

* resource acquisition is initialization
    * 