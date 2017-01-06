# Git Definitions

### What is version control?  Why is it useful?

**Version control** is a method for saving each significant version of a project so it's easy to go back to a previous version of a project and so multiple users can work on a single project.

Here's the Wikipedia entry on [Version Control](https://en.wikipedia.org/wiki/Version_control)

### What is a branch and why would you use one?

A **branch** is a copy of a repository that enables the user to make changes without modifying the master.  This allows a user to try things out without having to worry they're breaking the program for anyone who might be working on or running it.

Here's the Wikipedia entry on [Branching](https://en.wikipedia.org/wiki/Branching_(version_control))

### What is a commit? What makes a good commit message?

A **commit** saves the staged(added) file(s) to the active branch of the repository.  A good commit message provides a clear description of the changes made to the file(s) committed.

Here's the Wikipedia entry on [Commit](https://en.wikipedia.org/wiki/Commit_(version_control))

### What is a merge conflict?

A **merge conflict** occurs when the difference between the branch version and the version being merged into is something Git can't automatically reconcile.  ie. Git can automatically add a new line to a file, but if a new line differs from an existing line, Git asks the user what to do.  One example would be when a change is made to both the master and the branch version of a file.  Git needs the user to decide which version of conflicting lines to keep and which to discard.

An explanation of merge conflicts can be found here: [Git Conflicts](http://imagej.net/Git_Conflicts)

And [Here's](https://en.wikipedia.org/wiki/Merge_(version_control)#Manual_merging) Wikipedia's article on **manual merging** - what the user needs to do to respond to a merge conflict.
