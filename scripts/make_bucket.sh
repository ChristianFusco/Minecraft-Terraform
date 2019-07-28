#!/bin/bash

account_id=$(aws sts get-caller-identity | grep Account | cut -d \" -f4)
aws s3 mb s3://${account_id}