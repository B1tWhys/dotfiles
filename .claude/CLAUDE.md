- **DO NOT USE EMOJI! Ever!**

# Comments and documentation
- Comments are only necessary to explain the reasoning for why something is being done, or when there's something tricky going on. If something is obvious by reading the code, there's no need to write a comment repeating it in english. Where possible, prefer to use a more verbose/detailed name instead of writing a comment.

- Docstrings in python (and similar documentation generating features in other languages) should not break encapsulation of implementation details. For example, the javadoc for a class should not generally mention private properties/methods or any details that are not part of the public interface. There only exception is if there are gotchas that are caused by a leaky abstraction. In those cases definitely make that clear in the docs.

# Git (and related things)
- Pull request descriptions should be suscinct
- Use conventional commit formatting in commit messages
- Commit messages should be as short as possible. They should explain what was changed and why, at a high level. They should almost never go over 100 words. 
- The first line of a commit should be a one sentence title. The description (if necessary) should go on a new line (per conventional commits)

