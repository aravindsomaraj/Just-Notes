# Introduction [↩](../Contents/OS.md)

The operating system is the one program running at all times on the computer (usually called the kernel), with all else being application programs.

### Characteristics
- <ins>**Device Management**</ins>: The operating system keeps track of all the devices. So, it is also called the **Input/Output controller** that decides which process gets the device, when, and for how much time.
- <ins>**File Management**</ins>: It allocates and de-allocates the resources and also decides who gets the resource.
- <ins>**Job Accounting**</ins>: It keeps track of time and resources used by various jobs or users.
- <ins>**Error-detecting Aids**</ins>: These contain methods that include the production of dumps, traces, error messages, and other debugging and error-detecting methods.
- <ins>**Memory Management**</ins>: It keeps track of the primary memory, like what part of it is in use by whom, or what part is not in use, etc. and It also allocates the memory when a process or program requests it.
- <ins>**Processor Management**</ins>: It allocates the processor to a process and then de-allocates the processor when it is no longer required or the job is done.
- <ins>**Control on System Performance**</ins>: It records the delays between the request for a service and the system.
- <ins>**Security**</ins>: It prevents unauthorized access to programs and data using passwords or some kind of protection technique.

### Functionalities
- **Resource Management**: Decreases load in the system by allocating resources.
- **Process Management**: Includes various tasks like scheduling and termination of the process. Done with help of <ins>CPU Scheduling Algorithms</ins>.
- **Storage Management**: File system mechanism is used for this purpose (Hard Disk).
- **Memory Management**: OS tracks how much memory is in use and by whom. Also has to allocate and deallocate the memory space.

### Components
- **Shell**: The outermost layer of the Operating System and handles the interaction with the user. Does so by giving proper input to the user an also interprets input for the OS and handles the output.
- **Kernel**: Core component. Primary interface between OS and Hardware. Its functions:
  - Helps in controlling the System Calls.
  - Helps in I/O Management.
  - Helps in management of applications, memory, etc.