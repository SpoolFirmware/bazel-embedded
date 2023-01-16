# MIT License
#
# Copyright (c) 2019 Nathaniel Brough
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

_WINDOWS_AMD64_12 = {
    "full_version": "12.2.rel1",
    "remote_compiler": {
    "url": "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi.zip",
    "sha256": "ad1427496cde9bbe7604bc448ec6e115c6538e04af1c8275795ebb1c2b7b2830",
        "strip_prefix": "arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi",
    },
}

_AMD64_CONFIGS_12 = {
    "linux": {
        "full_version": "12.2.rel1",
        "remote_compiler": {
        "url": "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi.tar.xz",
        "sha256": "84be93d0f9e96a15addd490b6e237f588c641c8afdf90e7610a628007fc96867",
            "strip_prefix": "arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi",
        },
    },
    "windows": _WINDOWS_AMD64_12,
    "windows server 2019": _WINDOWS_AMD64_12,
    "windows 10": _WINDOWS_AMD64_12,
    "mac os x": {
        "full_version": "12.2.rel1",
        "remote_compiler": {
        "url": "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-darwin-x86_64-arm-none-eabi.tar.xz",
        "sha256": "00c0eeb57ae92332f216151ac66df6ba17d2d3b306dac86f4006006f437b2902",
            "strip_prefix": "arm-gnu-toolchain-12.2.rel1-darwin-x86_64-arm-none-eabi",
        },
    },
}

_AARCH64_CONFIGS_12 = {
    "mac os x": {
        "full_version": "12.2.rel1",
        "remote_compiler": {
        "url": "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi.tar.xz",
        "sha256": "21a9e875250bcb0db8df4cb23dd43c94c00a1d3b98ecba9cdd6ed51586b12248",
            "strip_prefix": "arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi",
        },
    }
}

_PLATFORM_ARCH_CONFIGS_12 = {
	"aarch64": _AARCH64_CONFIGS_12,
	"amd64": _AMD64_CONFIGS_12,
}

TOOLCHAIN_VERSIONS = {
    "12": _PLATFORM_ARCH_CONFIGS_12,
}

def get_platform_specific_config(version, os_name, os_arch):
    if version not in TOOLCHAIN_VERSIONS:
        fail("Toolchain configuration not available for version: ", version)
    if os_arch not in TOOLCHAIN_VERSIONS[version].keys():
        fail("OS configuration not available for: {}".format(os_arch))
    if os_name not in TOOLCHAIN_VERSIONS[version][os_arch].keys():
        fail("OS configuration not available for: {}".format(os_name))
    return TOOLCHAIN_VERSIONS[version][os_arch][os_name]
