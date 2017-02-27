RELEASE 1

2. Linux OS design philosophies:

Small is Beautiful
Each Program Does One Thing Well
Prototype as Soon as Possible
Choose Portability Over Efficiency
Store Data in Flat Text Files
Use Software Leverage
Use Shell Scripts to Increase Leverage and Portability
Avoid Captive User Interfaces
Make Every Program a Filter
Open Source
Quality Assurance
Expect the program's output to be the input of another program

3. VPS (virtual private server) definition and advantages:
A VPS is an instance of an os running in part of the memory of a physical server/computer.
The main advantage of a vps is that it's disposable - though it can be rendered inoperable, accidently or maliciously broken, it's easily replaceable.  VPS hosting is also generally much cheaper than running a dedicated physical server.

4. Why executing as root is a bad idea:
Root has permission to modify all aspects of the os - so running as root, you can do real damage to the os.  running as a user limits potential damage to user files.  Probably more important - when you execute a program as root, that program has permission to modify or delete files that it probably shouldn't.  
