On Linux with bazel 5.3.0 this repo produces following error:

```bash
$ bazel build ...
ERROR: /workspaces/bazel/sample-rule-wrong-os/BUILD:36:20: While resolving toolchains for target //:cc_toolchain_config: Unable to find an execution platform for target platform @local_config_platform//:host from available execution platforms []
ERROR: Analysis of target '//:cc_toolchain_config' failed; build aborted:
INFO: Elapsed time: 0.127s
INFO: 0 processes.
FAILED: Build did NOT complete successfully (0 packages loaded, 0 targets configured)
```
