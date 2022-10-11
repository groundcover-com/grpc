# Copyright 2022 The gRPC Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Custom rules for gRPC DTrace"""

def grpc_dtrace_generate_provider():
    '''
    Generate DTrace files for gRPC provider
    '''

    PROVIDER_PATH="src/core/ext/dtrace/dtrace_provider.d"

    native.genrule(
        name = "grpc_dtrace_provider_h",
        srcs = [PROVIDER_PATH],
        outs = ["dtrace_provider.h"],
        cmd = "dtrace -h -s $< -o $@",
    )

    native.genrule(
        name = "grpc_dtrace_provider_o",
        srcs = [PROVIDER_PATH],
        outs = ["dtrace_provider.o"],
        cmd = "dtrace -G -s $< -o $@",
    )
