#!/bin/bash

uv pip compile --no-header --quiet --generate-hashes -o requirements.lock requirements.txt
