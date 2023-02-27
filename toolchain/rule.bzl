load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "artifact_name_pattern",
    "env_entry",
    "env_set",
    "feature",
    "flag_group",
    "flag_set",
    "variable_with_value",
)

def _impl(ctx):
    print(ctx.executable.exe)
    # USE ctx.attr.exe to generate a file.
    # we omit this step for simplicity.
    return [cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        cxx_builtin_include_directories = [],
        features = [], # in real impl it is not empty
        toolchain_identifier = "squishcoco",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "x64_windows",
        target_libc = "unknown",
        compiler = "csg++",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = [],
        action_configs = [], # also some non-empty action_configs
        artifact_name_patterns = [
            artifact_name_pattern(
                category_name = "executable",
                prefix = "",
                extension = ".exe",
            ),
            artifact_name_pattern(
                category_name = "dynamic_library",
                prefix = "",
                extension = ".dll",
            ),
            artifact_name_pattern(
                category_name = "object_file",
                prefix = "",
                extension = ".o",
            ),
            artifact_name_pattern(
                category_name = "static_library",
                prefix = "",
                extension = ".a",
            ),
        ],
    )]

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "exe": attr.label(doc = "executable", executable = True, allow_single_file = True, cfg = "host"),
    },
    exec_compatible_with = [
        "@platforms//os:windows",
        "@platforms//cpu:x86_64",
    ],
)
