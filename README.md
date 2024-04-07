# hello-world
_A World of Helloz._

## Purpose
This repository has a few different purposes.
* First, it is intended to hold all `Hello World` type projects I decide to do.
* Second, and perhaps more importantly, it will be used to demonstrate the ability to implement a fully functional polyglot monorepo.
* Lastly, and probably the most ambitious goal, we want this repository to demonstrate some best practices with regards to the development and deployment of modern software. Specifically we are focused on reproducibility (infra-as-code and config-as-code), correctness, environment isolation (hermeticity), and developer experience (speed & simplicity).

## Business Requirements
The primary business requirements are as follows:
1. All of the projects must be able to be run. Which means that the repository must be configured to properly support each project's coding language.
2. Each project should be easily exportable. Which means that the projects should be callable from other projects inside and outside of the repo.
3. It should be easy, or at least there should be a clear path, to add new "Hello World" projects of various kinds to the repository.

## Technical Requirements
We use specific tooling (Nix, Bazel, direnv) and methodologies (trunk-based development, test-driven development, modular design) to help us meet the goals and business requirements stated above. 

### Get Started
To get started you'll need the following tools installed on your system:
* [Nix](https://nixos.org/): to be used as a package manager to ensure that the environment has all additional tooling required for builds. Either the NixOS linux distro or the standalone Nix package manager can be used.
* [Bazel](https://bazel.build/): to be used as the primary build tool for the repo.

Please visit the [Nix + Bazel website](https://nix-bazel.build/) to learn more about the specific rational for using these two tools as the foundation for this monorepo.


The following tool is not a hard requirment, but it is **strongly recommend**:
* [direnv](https://github.com/nix-community/nix-direnv) is used as a tool used to improve developer experience. It allows for automatically configuring a development shell upon navigation to directories that include a .envrc file.
