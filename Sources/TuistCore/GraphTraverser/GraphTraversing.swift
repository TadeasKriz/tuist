import Foundation
import TSCBasic

public protocol GraphTraversing {
    /// Graph name
    var name: String { get }

    /// Returns true if the project has package dependencies.
    var hasPackages: Bool { get }

    /// The path to the directory from where the graph has been loaded.
    var path: AbsolutePath { get }

    /// Returns the graph's workspace.
    var workspace: Workspace { get }

    /// Returns the graph projects.
    var projects: Set<Project> { get }

    /// It returns the target with the given name in the project that is defined in the given directory path.
    /// - Parameters:
    ///   - path: Path to the directory that contains the definition of the project with the target is defined.
    ///   - name: Name of the target.
    func target(path: AbsolutePath, name: String) -> ValueGraphTarget?

    /// It returns the targets of the project defined in the directory at the given path.
    /// - Parameter path: Path to the directory that contains the definition of the project.
    func targets(at path: AbsolutePath) -> Set<ValueGraphTarget>

    /// Given a project directory and target name, it returns all its direct target dependencies.
    /// - Parameters:
    ///   - path: Path to the directory that contains the project.
    ///   - name: Target name.
    func directTargetDependencies(path: AbsolutePath, name: String) -> Set<ValueGraphTarget>

    /// Given a project directory and a target name, it returns all the dependencies that are extensions.
    /// - Parameters:
    ///   - path: Path to the directory that contains the project.
    ///   - name: Target name.
    func appExtensionDependencies(path: AbsolutePath, name: String) -> Set<ValueGraphTarget>

    /// Returns the transitive resource bundle dependencies for the given target.
    /// - Parameters:
    ///   - path: Path to the directory where the project that defines the target is located.
    ///   - name: Name of the target.
    func resourceBundleDependencies(path: AbsolutePath, name: String) -> Set<ValueGraphTarget>

    /// Returns the list of test targets that depend on the one with the given name at the given path.
    /// - Parameters:
    ///   - path: Path to the directory that contains the project definition.
    ///   - name: Name of the target whose dependant test targets will be returned.
    func testTargetsDependingOn(path: AbsolutePath, name: String) -> Set<ValueGraphTarget>

    /// Returns all non-transitive target static dependencies for the given target.
    /// - Parameters:
    ///   - path: Path to the directory where the project that defines the target is located.
    ///   - name: Name of the target.
    func directStaticDependencies(path: AbsolutePath, name: String) -> Set<GraphDependencyReference>

    /// Given a project directory and a target name, it returns an appClips dependency.
    /// - Parameters:
    ///   - path: Path to the directory that contains the project.
    ///   - name: Target name.
    func appClipsDependency(path: AbsolutePath, name: String) -> ValueGraphTarget?
}
