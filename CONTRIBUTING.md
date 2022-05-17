# Contributing Guidelines

We're delighted you want to help with this project! This guide will answer some of the most common questions you'll have during your first contribution. Following these guidelines shows that you appreciate the time and effort put in by the developers that administer and maintain this open source project.


Contributions to Twitter.jl are welcome in any form - Features, Bug fixes, and Documentation are all valid contributions.

This project is very appropriate for beginners to Julia! Currently, these are the areas that needs improvement:

- Clean up API to move away from required arguments to keyword-only.
- Clean up column types for DataFrame methods (switch `eltypes` from `Any` to `Union{T, Missing}`).
- Keyword arguments for returning DataFrame (to remove step in data retrieval process).
- Ability to save authentication keys to file, remove need for authentication each time.
- Create a detailed documentation.

If you have different idea, please open an issue (then, create a pull request).

## Making a Pull Request

The procedures for creating a pull request to contribute are straightforward.

1. Create a fork of the repository on your account.
2. Clone the forked repository and create a new branch. This would be the name of the feature/issue you are working on.
3. Make your changes in the new branch and write accompaning tests.
4. Push your changes to the repository.
5. Create a pull request on GitHub.

**Finally,**

✨ Thanks for contributing to **Twitter.jl**! ✨